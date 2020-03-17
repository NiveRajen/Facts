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
    func addViews()
    {
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont(name: descriptionLabel.font.fontName, size: 17)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .scaleAspectFill
        stack.addArrangedSubview(factsImageView)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.clipsToBounds = false
        
        addSubview(stack)
        
        factsImageView.contentMode = .center
        factsImageView.image = UIImage(named: "placeholder")
        factsImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        factsImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        factsImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        factsImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        
        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        descriptionLabel.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -5).isActive = true

    }
    
}
