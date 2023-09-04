//
//  LocationsCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LocationCollectionViewCell"
    
    private let contentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationImageView: UIImageView = {
        let characterImageView = UIImageView()
        characterImageView.image = UIImage(named: "LaunchPhoto.png")
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = 10.0
        characterImageView.layer.masksToBounds = true
        return characterImageView
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Earth"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Type: "
        typeLabel.textColor = .systemPink
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    
    var typeNameLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Planet"
        typeLabel.textColor = .black
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    
    var dimensionLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.text = "Dimension: "
        dimensionLabel.textColor = .systemPink
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        return dimensionLabel
    }()
    
    var dimensionNameLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.text = "Cronenberg Dimension"
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
        typeStackView.alignment = .leading
        typeStackView.spacing = 0
        typeStackView.translatesAutoresizingMaskIntoConstraints = false
        return typeStackView
    }()
    
    private lazy var dimensionStackView: UIStackView = {
        let dimensionStackView = UIStackView()
        dimensionStackView.backgroundColor = .clear
        dimensionStackView.distribution = .equalSpacing
        dimensionStackView.axis = .horizontal
        dimensionStackView.alignment = .leading
        dimensionStackView.spacing = 0
        dimensionStackView.translatesAutoresizingMaskIntoConstraints = false
        return dimensionStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(contentContainerView)
        contentContainerView.addSubview(locationImageView)
        contentContainerView.addSubview(stackView)
        
        contentContainerView.layer.borderWidth = 2.0
        contentContainerView.layer.borderColor = UIColor.lightGray.cgColor
        contentContainerView.layer.cornerRadius = 10.0
        contentContainerView.layer.masksToBounds = true
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(typeStackView)
        stackView.addArrangedSubview(dimensionStackView)
        
        
        typeStackView.addArrangedSubview(typeLabel)
        typeStackView.addArrangedSubview(typeNameLabel)
        
        dimensionStackView.addArrangedSubview(dimensionLabel)
        dimensionStackView.addArrangedSubview(dimensionNameLabel)
        
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contentContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            locationImageView.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 10),
            locationImageView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 10),
            locationImageView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -10),
            locationImageView.widthAnchor.constraint(equalTo: contentContainerView.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("erroor")
    }
}
