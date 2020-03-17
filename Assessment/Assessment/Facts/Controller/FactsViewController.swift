//
//  FactsViewController.swift
//  Assessment
//
//  Created by Patric Phinehas Raj on 14/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    var archiveRecords : Archives? = nil
    var tableView : UITableView? = nil
    let imageCache = NSCache<NSString, UIImage>()//url,image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        
        setupTheme()
        
        downloadContent()
    }
    
    func downloadContent() {
        FactsAPICalls.sharedInstance.getFacts { (archives, error) in
            if error != nil {
                self.presentError(errorMessage: error!)
            } else if archives != nil {
                self.bindData(archive: archives!)
            } else {
                self.presentError(errorMessage: "No Data")
            }
        }
    }
    
    func getImage(url: String, completion: @escaping (_ image: UIImage?, _ error: String? ) -> Void) {
        if !url.isEmpty {
            if let cachedImage = imageCache.object(forKey: url as NSString) {
                completion(cachedImage, nil)
            } else {
                FactsAPICalls.sharedInstance.downloadImage(for: url) { data, error in
                    if let error = error {
                        completion(nil, error)
                        
                    } else if let data = data, let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url as NSString)
                        completion(image, nil)
                    } else {
                        self.imageCache.setObject(UIImage(named: "placeholder")!, forKey: url as NSString)
                        completion(nil, "Error")
                    }
                }
            }
        } else {
            self.imageCache.setObject(UIImage(named: "placeholder")!, forKey: url as NSString)
            completion(nil, "Error")
        }
    }
}

extension FactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return archiveRecords?.rows.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factsCell = tableView.dequeueReusableCell(withIdentifier: "Facts") as? FactsTableViewCell
        
        if let factsObject = archiveRecords?.rows[indexPath.row] {
            factsCell?.titleLabel.text = factsObject.title
            factsCell?.descriptionLabel.text = factsObject.description
            
            if let cachedImage = imageCache.object(forKey: (factsObject.imageHref as? NSString) ?? "") {
                DispatchQueue.main.async {
                    factsCell?.factsImageView.image = cachedImage
                    
                    (cachedImage == UIImage(named: "placeholder")) ? (factsCell?.factsImageView.contentMode = .center) : (factsCell?.factsImageView.contentMode = .scaleToFill)
                }
                return factsCell!
            } else {
                DispatchQueue.main.async {
                    factsCell?.factsImageView.image = UIImage(named: "placeholder")
                    factsCell?.factsImageView.contentMode = .center
                }
            }
            
            if factsObject.imageHref != nil {
                DispatchQueue.global().async { [weak self] in
                    self?.getImage(url: factsObject.imageHref ?? "") { (image, error) in
                        if image != nil {
                            DispatchQueue.main.async {
                                factsCell?.factsImageView.image = image
                                factsCell?.factsImageView.contentMode = .scaleToFill
                            }
                        } else {
                            DispatchQueue.main.async {
                                factsCell?.factsImageView.image = UIImage(named: "placeholder")
                                factsCell?.factsImageView.contentMode = .center
                            }
                        }
                    }
                }
            }
        }
        return factsCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}