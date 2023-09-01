//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailImageView: UIImageView = {
        let detailImageView = UIImageView()
        detailImageView.image = UIImage(named: "LaunchPhoto.png")
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.layer.borderWidth = 2.0
        detailImageView.layer.cornerRadius = 20.0
        detailImageView.layer.masksToBounds = true
        detailImageView.layer.borderColor = UIColor.lightGray.cgColor
        return detailImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(detailImageView)
    
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    
}
