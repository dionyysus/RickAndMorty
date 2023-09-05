//
//  SeasonCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class SeasonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SeasonCollectionViewCell"
    
    private let contentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var seasonButton: UIButton = {
        let seasonButton = UIButton()
        seasonButton.backgroundColor = .systemCyan
        seasonButton.setTitle("Season 1", for: .normal)
        seasonButton.layer.cornerRadius = 5.0
        seasonButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        seasonButton.layer.shadowOpacity = 1.0
        seasonButton.layer.shadowRadius = 0.0
        seasonButton.layer.shadowColor = UIColor.systemCyan.cgColor
        seasonButton.layer.masksToBounds = false
        seasonButton.translatesAutoresizingMaskIntoConstraints = false
        return seasonButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentContainerView.addSubview(seasonButton)
        contentView.addSubview(contentContainerView)
        
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contentContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contentContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            contentContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            seasonButton.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            seasonButton.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor),
            seasonButton.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor),
            seasonButton.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor),
        ])
        contentView.widthAnchor.constraint(equalToConstant: 120).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
