//
//  EpisodeCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "EpisodeCollectionViewCell"
    
    private let contentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //    private lazy var episodeGoButton: UIButton = {
    //        let episodeGoButton = UIButton()
    //        episodeGoButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    //        episodeGoButton.translatesAutoresizingMaskIntoConstraints = false
    //        return episodeGoButton
    //    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "AA"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "AA"
        typeLabel.textColor = .black
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    
    var dimensionLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.text = "AA"
        dimensionLabel.textColor = .black
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        return dimensionLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var typeStackView: UIStackView = {
        let typeStackView = UIStackView()
        typeStackView.backgroundColor = .clear
        typeStackView.distribution = .fillProportionally
        typeStackView.axis = .horizontal
        typeStackView.spacing = 0
        typeStackView.translatesAutoresizingMaskIntoConstraints = false
        return typeStackView
    }()
    
    private lazy var dimensionStackView: UIStackView = {
        let dimensionStackView = UIStackView()
        dimensionStackView.backgroundColor = .clear
        dimensionStackView.distribution = .fillProportionally
        dimensionStackView.axis = .horizontal
        dimensionStackView.spacing = 0
        dimensionStackView.translatesAutoresizingMaskIntoConstraints = false
        return dimensionStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(contentContainerView)
        contentContainerView.addSubview(stackView)
        
        contentContainerView.layer.borderWidth = 2.0
        contentContainerView.layer.borderColor = UIColor.systemMint.cgColor
        contentContainerView.layer.cornerRadius = 10.0
        contentContainerView.layer.masksToBounds = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(dimensionLabel)
        
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contentContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contentContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            stackView.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("erroor")
    }
}
