//
//  FactsViewController.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    var tableView : UITableView? = nil
    var emptyMessage = UILabel()
    var welcomeLabel = UILabel()
    let refreshControl = UIRefreshControl()
    var factsModel = FactsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
    }
    
    func initializeView() {
        self.view.backgroundColor = .white
        
        self.initialLoad()
    }
    
    
    //MARK:- Initial Page Loading
    func initialLoad() {
        welcomeLabel = UILabel()
        view.addSubview(welcomeLabel)
        welcomeLabel.text = NSLocalizedString("LABEL_HELLO", comment: "Label for Hello")
        welcomeLabel.textAlignment = .center
        welcomeLabel.accessibilityValue = "Hi"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.view.bringSubviewToFront(welcomeLabel)
        
        addLoader()
        
        addTableView()
    }
    
    func hideInitialView() {
        DispatchQueue.main.async {
            self.welcomeLabel.isHidden = true
            self.stopLoader()
        }
    }
    
    //MARK:- Tableview controls
    func addTableView() {
        tableView = UITableView(frame: view.frame)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(FactsTableViewCell.self, forCellReuseIdentifier: "Facts")
        tableView?.showsVerticalScrollIndicator = false
        tableView?.separatorStyle = .none
        tableView?.backgroundColor = .clear
        tableView?.accessibilityValue = "Facts"
        tableView?.tableFooterView = UIView()
        
        view.addSubview(tableView!)
        
        tableView?.rowHeight = 100
        
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        addRefreshControl()
        addEmptyMessage()
        downloadArchives()
        
    }
    
    func downloadArchives() {
        factsModel.response = { [weak self] success,error in
            DispatchQueue.main.async {
                self?.perform(#selector(self?.endRefreshing), with: nil, afterDelay: 0.1)
                self?.showHideEmptyMessage()
                self?.hideInitialView()
                
                if success {
                    self?.tableView?.reloadData()
                    self?.navigationController?.navigationBar.topItem?.title = self?.factsModel.archiveName
                } else {
                    self?.presentError(errorMessage: self?.factsModel.message)
                }
            }
        }
        factsModel.downloadContent()
    }
    
    func addRefreshControl() {
        refreshControl.tintColor = UIColor.red
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        tableView?.addSubview(refreshControl)
    }
    
    @objc func endRefreshing() {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func refreshData() {
        factsModel.downloadContent()
    }
    
    //MARK:- Show messages
    func addEmptyMessage() {
        emptyMessage = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 30))
        emptyMessage.text = NSLocalizedString("MESSAGE_NO_RECORDS", comment: "Message for Empty Rows")
        self.view.addSubview(emptyMessage)
        emptyMessage.translatesAutoresizingMaskIntoConstraints = false
        emptyMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyMessage.accessibilityValue = "No Records"
        emptyMessage.isHidden = true
    }
    
    func showHideEmptyMessage() {
        DispatchQueue.main.async {
            if let _ = self.factsModel.archives?.rows {
                self.emptyMessage.isHidden = true
                self.tableView?.separatorStyle = .singleLine
            } else {
                self.emptyMessage.isHidden = false
                self.tableView?.separatorStyle = .none
            }
        }
    }
    
    func presentError(errorMessage: String?) {
        let alert = UIAlertController(title: NSLocalizedString("TITLE_ERROR", comment: "Title for Error"),message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_OK", comment: "Alert for OK Message"),style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension FactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if factsModel.archives?.rows.count == 0 { self.showHideEmptyMessage() }
        return factsModel.archives?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factsCell = tableView.dequeueReusableCell(withIdentifier: "Facts") as! FactsTableViewCell
        
        if let factsObject = factsModel.archives?.rows[indexPath.row] {
            factsCell.factItem = factsObject
            
            DispatchQueue.global().async { [weak self] in
                //Check if it already there in cache, else download the image
                DispatchQueue.main.async {
                    factsCell.imageItem = self?.factsModel.imageCache.object(forKey: (factsObject.imageHref as NSString?) ?? "")
                    factsCell.imageUrl = factsObject.imageHref
                }
            }
        }
        return factsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

