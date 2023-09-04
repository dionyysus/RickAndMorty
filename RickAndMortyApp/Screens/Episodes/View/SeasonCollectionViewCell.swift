//
//  SeasonCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class SeasonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SeasonCollectionViewCell"
    
    private lazy var seasonButton: UIButton = {
        let seasonButton = UIButton()
        seasonButton.backgroundColor = .blue
        seasonButton.setTitle("Season 1", for: .normal)
        seasonButton.layer.cornerRadius = 10.0
        seasonButton.layer.masksToBounds = true
        seasonButton.translatesAutoresizingMaskIntoConstraints = false
        return seasonButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(seasonButton)

        NSLayoutConstraint.activate([
            seasonButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            seasonButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            seasonButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            seasonButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
