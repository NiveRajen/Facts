//
//  FactsCellView.swift
//  Assessment
//
//  Created by All on 17/03/20.
//  Copyright © 2020 Nivedha. All rights reserved.
//

import Foundation
import UIKit

extension FactsTableViewCell {
    func addViews() {
        imageView?.image = UIImage(named: "defaultAvatar")
        
        let titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .red
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: titleLabel.font.fontName, size: 15)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = .yellow
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .scaleAspectFill
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.clipsToBounds = false
        
        addSubview(stack)
        
        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        stack.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 5).isActive = true
        
        descriptionLabel.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -5).isActive = true

    }
    
}
