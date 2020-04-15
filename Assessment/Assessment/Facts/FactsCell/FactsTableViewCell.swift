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
        }
    }
    
    var imageItem: UIImage? {
        didSet {
            if Reachability.isConnectedToNetwork() {
                if imageItem != nil {
                    factsImageView.image = imageItem
                    
                    (imageItem == UIImage(named: "placeholder")) ? (factsImageView.contentMode = .center) :
                        (factsImageView.contentMode = .scaleToFill)
                } else {
                    factsImageView.image = UIImage(named: "placeholder")
                    factsImageView.contentMode = .center
                }
            }
        }
    }
    
    var imageUrl: String? {
        didSet {
        if imageUrl != nil {
            FactsViewModel().getImage(url: imageUrl ?? "") { (image, error) in
                DispatchQueue.main.async {
                    self.imageItem = image
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
