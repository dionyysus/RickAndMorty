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
        detailImageView.layer.cornerRadius = 15.0
        detailImageView.layer.masksToBounds = true
        return detailImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Rick Sanchez"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var detailView: UIView = {
        let detailView = UIView()
        detailView.layer.cornerRadius = 20.0
        detailView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.9)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let statusImageView: UIImageView = {
        let statusImageView = UIImageView()
        statusImageView.image = UIImage(named: "LaunchPhoto.png")
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.contentMode = .scaleAspectFill
        statusImageView.layer.cornerRadius = 15.0
        statusImageView.layer.masksToBounds = true
        return statusImageView
    }()
    
    private lazy var featureLabel1: UILabel = {
        let featureLabel1 = UILabel()
        featureLabel1.text = "Alive"
        featureLabel1.textColor = .black
        featureLabel1.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel1
    }()
    
    private lazy var featureLabel2: UILabel = {
        let featureLabel2 = UILabel()
        featureLabel2.text = "Human"
        featureLabel2.textColor = .black
        featureLabel2.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel2
    }()

    private lazy var featureLabel3: UILabel = {
        let featureLabel3 = UILabel()
        featureLabel3.text = "Male"
        featureLabel3.textColor = .black
        featureLabel3.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel3
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(detailImageView)
        view.addSubview(titleLabel)
        view.addSubview(detailView)
        view.addSubview(stackView)
        view.addSubview(featureLabel1)
        view.addSubview(featureLabel2)
        view.addSubview(featureLabel3)

        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: view.topAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 400),
            
            titleLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            detailView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    
    
}
