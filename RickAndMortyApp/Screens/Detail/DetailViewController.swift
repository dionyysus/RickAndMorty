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
        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.borderWidth = 2.0
        detailView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 0.9)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .vertical // Yatay düzlemde sıralama
        stackView.alignment = .leading // İçerikleri merkeze hizala
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var speciesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal // Yatay düzlemde sıralama
        stackView.alignment = .center // İçerikleri merkeze hizala
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var genderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal // Yatay düzlemde sıralama
        stackView.alignment = .center // İçerikleri merkeze hizala
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var origineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal // Yatay düzlemde sıralama
        stackView.alignment = .center // İçerikleri merkeze hizala
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal // Yatay düzlemde sıralama
        stackView.alignment = .center // İçerikleri merkeze hizala
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewImageAndLabel: UIStackView = {
        let stackViewImageAndLabel = UIStackView()
        stackViewImageAndLabel.distribution = .equalSpacing
        stackViewImageAndLabel.backgroundColor = .clear
        stackViewImageAndLabel.axis = .horizontal
        stackViewImageAndLabel.alignment = .center // İçerikleri merkeze hizala
        stackViewImageAndLabel.spacing = 3
        stackViewImageAndLabel.translatesAutoresizingMaskIntoConstraints = false
        return stackViewImageAndLabel
    }()
    
    private let statusImageView: UIImageView = {
        let statusImageView = UIImageView()
        statusImageView.image = UIImage(named: "greenCircle.png")
        statusImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        statusImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        return statusImageView
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Staus: "
        statusLabel.textColor = .orange
        statusLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var spesiecLabel: UILabel = {
        let spesiecLabel = UILabel()
        spesiecLabel.text = "Species: "
        spesiecLabel.textColor = .orange
        spesiecLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        spesiecLabel.translatesAutoresizingMaskIntoConstraints = false
        return spesiecLabel
    }()
    
    private lazy var genderLabel: UILabel = {
        let spesiecLabel = UILabel()
        spesiecLabel.text = "Gender: "
        spesiecLabel.textColor = .orange
        spesiecLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        spesiecLabel.translatesAutoresizingMaskIntoConstraints = false
        return spesiecLabel
    }()
    
    private lazy var origineLabel: UILabel = {
        let spesiecLabel = UILabel()
        spesiecLabel.text = "Origine: "
        spesiecLabel.textColor = .orange
        spesiecLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        spesiecLabel.translatesAutoresizingMaskIntoConstraints = false
        return spesiecLabel
    }()
    
    private lazy var locationLabel: UILabel = {
        let spesiecLabel = UILabel()
        spesiecLabel.text = "Location: "
        spesiecLabel.textColor = .orange
        spesiecLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        spesiecLabel.translatesAutoresizingMaskIntoConstraints = false
        return spesiecLabel
    }()
    
    private lazy var featureLabel1: UILabel = {
        let featureLabel1 = UILabel()
        featureLabel1.text = "Alive"
        featureLabel1.textColor = .black
        featureLabel1.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel1.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel1
    }()
    
    private lazy var featureLabel2: UILabel = {
        let featureLabel2 = UILabel()
        featureLabel2.text = "Human"
        featureLabel2.textColor = .black
        featureLabel2.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel2.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel2
    }()

    private lazy var featureLabel3: UILabel = {
        let featureLabel3 = UILabel()
        featureLabel3.text = "Male"
        featureLabel3.textColor = .black
        featureLabel3.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel3.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel3
    }()
    
    private lazy var featureLabel4: UILabel = {
        let featureLabel3 = UILabel()
        featureLabel3.text = "Earth"
        featureLabel3.textColor = .black
        featureLabel3.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel3.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel3
    }()
    
    private lazy var featureLabel5: UILabel = {
        let featureLabel3 = UILabel()
        featureLabel3.text = "Earth"
        featureLabel3.textColor = .black
        featureLabel3.font = UIFont.systemFont(ofSize: 20.0)
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

        stackViewImageAndLabel.addArrangedSubview(statusLabel)
        stackViewImageAndLabel.addArrangedSubview(statusImageView)
        stackViewImageAndLabel.addArrangedSubview(featureLabel1)

        speciesStackView.addArrangedSubview(spesiecLabel)
        speciesStackView.addArrangedSubview(featureLabel2)

        genderStackView.addArrangedSubview(genderLabel)
        genderStackView.addArrangedSubview(featureLabel3)
        
        origineStackView.addArrangedSubview(origineLabel)
        origineStackView.addArrangedSubview(featureLabel4)
        
        locationStackView.addArrangedSubview(locationLabel)
        locationStackView.addArrangedSubview(featureLabel5)
        
        stackView.addArrangedSubview(stackViewImageAndLabel)
        stackView.addArrangedSubview(speciesStackView)
        stackView.addArrangedSubview(genderStackView)
        stackView.addArrangedSubview(origineStackView)
        stackView.addArrangedSubview(locationStackView)

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
            detailView.heightAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -16),
        ])
    }
    
    
    
}
