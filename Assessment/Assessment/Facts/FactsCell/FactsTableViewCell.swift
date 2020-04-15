//
//  FactsTableViewCell.swift
//  Assessment
//
//  Created by All on 17/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var factsImageView = UIImageView()
    
    var factItem: Rows? {
        didSet {
            titleLabel.text = factItem?.title
            descriptionLabel.text = factItem?.description
            factsImageView.contentMode = .scaleToFill
            
            DispatchQueue.global().async { [weak self] in
                //Check image is already there in cache, else download the image
                DispatchQueue.main.async {
                    if self?.factItem?.imageHref != nil {
                        FactsAPICalls.sharedInstance.getImage(for: (self?.factItem?.imageHref)!) { (image, error) in
                        DispatchQueue.main.async {
                            if error == nil {
                                self?.factsImageView.image = image
                            } else {
                                self?.factsImageView.image = UIImage(named: "placeholder")
                            }
                        }
                      }
                    }
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addViews()
    }
    
    override func prepareForReuse() {
        factsImageView.image = UIImage(named: "placeholder")
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
