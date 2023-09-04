//
//  CharactersCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CharactersCollectionViewCell"
    
    let characterImageView: UIImageView = {
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
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Rick Sanchez"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("erroor")
    }
}

extension UIImageView {
    func loadImg(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
