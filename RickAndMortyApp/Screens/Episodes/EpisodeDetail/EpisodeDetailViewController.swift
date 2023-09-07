//
//  EpisodeDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 5.09.2023.
//


import UIKit

class EpisodeDetailViewController: UIViewController {
    
    private var viewModel: EpisodeDetailViewModel?
    
    private lazy var episodeDetailImageView: UIImageView = {
        let locationDetailImageView = UIImageView()
        locationDetailImageView.image = UIImage(named: "location")
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
        charactersCollectionView.showsHorizontalScrollIndicator = false
        return charactersCollectionView
    }()
    
    private lazy var titleLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.text = "Title: "
        dimensionLabel.textColor = .orange
        dimensionLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        return dimensionLabel
    }()
    
    private lazy var titleNameabel: UILabel = {
        let featureLabel1 = UILabel()
        featureLabel1.text = ""
        featureLabel1.textColor = .black
        featureLabel1.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel1.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel1
    }()
    
    
    private lazy var residentsLabel: UILabel = {
        let residentsLabel = UILabel()
        residentsLabel.text = "Characters"
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
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
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
    
    private lazy var typeStackView: UIStackView = {
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
    
//    private lazy var dimensionStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.distribution = .fillProportionally
//        stackView.backgroundColor = .clear
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    private lazy var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Air Date: "
        typeLabel.textColor = .orange
        typeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    
    private lazy var dimensionLabel: UILabel = {
        let dimensionLabel = UILabel()
        dimensionLabel.text = "Episode: "
        dimensionLabel.textColor = .orange
        dimensionLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        dimensionLabel.translatesAutoresizingMaskIntoConstraints = false
        return dimensionLabel
    }()
    
    private lazy var featureLabel1: UILabel = {
        let featureLabel1 = UILabel()
        featureLabel1.text = ""
        featureLabel1.textColor = .black
        featureLabel1.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel1.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel1
    }()
    
    private lazy var featureLabel2: UILabel = {
        let featureLabel2 = UILabel()
        featureLabel2.text = ""
        featureLabel2.textColor = .black
        featureLabel2.font = UIFont.systemFont(ofSize: 20.0)
        featureLabel2.translatesAutoresizingMaskIntoConstraints = false
        return featureLabel2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(episodeDetailImageView)
        view.addSubview(detailView)
        view.addSubview(stackView)
        view.addSubview(charactersCollectionView)
        view.addSubview(residentsLabel)
        
        titleLabekStackView.addArrangedSubview(titleLabel)
        titleLabekStackView.addArrangedSubview(titleNameabel)
        
        typeStackView.addArrangedSubview(typeLabel)
        typeStackView.addArrangedSubview(featureLabel1)

        dimensionStackView.addArrangedSubview(dimensionLabel)
        dimensionStackView.addArrangedSubview(featureLabel2)
        
        stackView.addArrangedSubview(titleLabekStackView)
        stackView.addArrangedSubview(typeStackView)
        stackView.addArrangedSubview(dimensionStackView)
        
        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        titleNameabel.text = viewModel?.episodes?.name
        featureLabel1.text = viewModel?.episodes?.airDate
        featureLabel2.text = viewModel?.episodes?.episode
        
        NSLayoutConstraint.activate([
            episodeDetailImageView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeDetailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeDetailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeDetailImageView.heightAnchor.constraint(equalToConstant: 400),
            
            detailView.topAnchor.constraint(equalTo: episodeDetailImageView.bottomAnchor, constant: 10),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            detailView.heightAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -20),
            
            residentsLabel.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 10),
            residentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            residentsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            charactersCollectionView.topAnchor.constraint(equalTo: residentsLabel.bottomAnchor, constant: 10),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            charactersCollectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func prepare(episode: Episodes) {
        viewModel = EpisodeDetailViewModel(episodes: episode)
    }
}


//MARK: Collection View Data Source
extension EpisodeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.episodes?.characters?.count ?? 0
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
extension EpisodeDetailViewController: UICollectionViewDelegate {
}

extension EpisodeDetailViewController: UICollectionViewDelegateFlowLayout{
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 15.0, bottom: 5.0, right: 15.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == charactersCollectionView {
            return CGSize(width: 100, height: 100)
            
        } else {
            return CGSize(width: 120, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
