//
//  LocationDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 5.09.2023.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    private lazy var locationDetailImageView: UIImageView = {
        let locationDetailImageView = UIImageView()
        locationDetailImageView.image = UIImage(named: "LaunchPhoto.png")
        locationDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        locationDetailImageView.contentMode = .scaleAspectFill
        locationDetailImageView.layer.cornerRadius = 15.0
        locationDetailImageView.layer.masksToBounds = true
        return locationDetailImageView
    }()
    
    private let charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let charactersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return charactersCollectionView
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Earth"
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var residentsLabel: UILabel = {
        let residentsLabel = UILabel()
        residentsLabel.text = "Residents"
        residentsLabel.textColor = .black
        residentsLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        residentsLabel.translatesAutoresizingMaskIntoConstraints = false
        return residentsLabel
    }()
    
    private lazy var detailView: UIView = {
        let detailView = UIView()
        detailView.layer.cornerRadius = 20.0
        detailView.layer.borderColor = UIColor.systemMint.cgColor
        detailView.layer.borderWidth = 2.0
        detailView.backgroundColor = .white
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 13
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleAndDetailViewtackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firstEpisodeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dimensionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Type: "
        typeLabel.textColor = .orange
        typeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    
    private lazy var firstEpisodeLabel: UILabel = {
        let firstEpisodeLabel = UILabel()
        firstEpisodeLabel.text = "First Episode: "
        firstEpisodeLabel.textColor = .orange
        firstEpisodeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        firstEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstEpisodeLabel
    }()
    
    private lazy var dimensionLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.text = "Dimension: "
        dimensionLabel.textColor = .orange
        dimensionLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        return dimensionLabel
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(locationDetailImageView)
        view.addSubview(titleAndDetailViewtackView)
        view.addSubview(stackView)
        view.addSubview(charactersCollectionView)
        view.addSubview(residentsLabel)
        
        titleStackView.addArrangedSubview(typeLabel)
        titleStackView.addArrangedSubview(featureLabel1)
        
        firstEpisodeStackView.addArrangedSubview(firstEpisodeLabel)
        firstEpisodeStackView.addArrangedSubview(featureLabel2)
        
        dimensionStackView.addArrangedSubview(dimensionLabel)
        dimensionStackView.addArrangedSubview(featureLabel3)
        
        stackView.addArrangedSubview(titleStackView)
        stackView.addArrangedSubview(firstEpisodeStackView)
        stackView.addArrangedSubview(dimensionStackView)
        
        titleAndDetailViewtackView.addArrangedSubview(titleLabel)
        titleAndDetailViewtackView.addArrangedSubview(detailView)
        
        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            locationDetailImageView.topAnchor.constraint(equalTo: view.topAnchor),
            locationDetailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationDetailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationDetailImageView.heightAnchor.constraint(equalToConstant: 400),
            
            titleLabel.topAnchor.constraint(equalTo: locationDetailImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            detailView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            detailView.heightAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -20),
            
            residentsLabel.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 10),
            residentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            residentsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            charactersCollectionView.topAnchor.constraint(equalTo: residentsLabel.bottomAnchor, constant: 10),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            charactersCollectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


//MARK: Collection View Data Source
extension LocationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.nameLabel.isHidden = true
        return cell
    }
}

//MARK: Collection View Delegate
extension LocationDetailViewController: UICollectionViewDelegate {
}

extension LocationDetailViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 15.0, bottom: 5.0, right: 15.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == charactersCollectionView {
            return CGSize(width: 90, height: 90)
            
        } else {
            return CGSize(width: view.frame.width, height: 120)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
