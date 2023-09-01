//
//  CharactersCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CharactersCollectionViewCell"
    
    private let characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.image = UIImage(named: "LaunchPhoto.png")
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.borderWidth = 2.0
        characterImageView.layer.cornerRadius = 20.0
        characterImageView.layer.masksToBounds = true
        characterImageView.layer.borderColor = UIColor.lightGray.cgColor
        return characterImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Rick Sanchez"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
    
        NSLayoutConstraint.activate([
            
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("erroor")
    }
}
