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
        titleLabel.accessibilityValue = "Title"
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont(name: descriptionLabel.font.fontName, size: 17)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.accessibilityValue = "Description"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.contentMode = .scaleAspectFill
        stackView.addArrangedSubview(factsImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.clipsToBounds = false
        
        addSubview(stackView)
        
        factsImageView.contentMode = .center
        factsImageView.image = UIImage(named: "placeholder")
        factsImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        factsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        factsImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        factsImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        factsImageView.accessibilityValue = "Image"

        
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        descriptionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -5).isActive = true

    }
    
}
