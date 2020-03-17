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
        factsImageView = UIImageView(image: UIImage(named: "placeholder"))
        factsImageView.contentMode = .scaleAspectFit
        addSubview(factsImageView)
        
        titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: descriptionLabel.font.fontName, size: 15)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .scaleAspectFill
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.clipsToBounds = false
        
        addSubview(stack)
        
        factsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        factsImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        factsImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        stack.leadingAnchor.constraint(equalTo: factsImageView.trailingAnchor, constant: 5).isActive = true
        
        descriptionLabel.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -5).isActive = true

    }
    
}
