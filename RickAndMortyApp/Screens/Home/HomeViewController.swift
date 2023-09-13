//
//  HomeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 28.08.2023.
//

import UIKit

final class ListViewLayout: UICollectionViewLayout {
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let customSize = CGSize(width: collectionView.bounds.width, height: 120)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
}

class HomeViewController: UIViewController {
    
    private var characterviewModel: CharacterViewModel?
    private var locationViewModel: LocationViewModel?
    private var episodeViewModel: EpisodeViewModel?
    
    private lazy var scrollView: UIScrollView = {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        return scrollView
    }()
    
    lazy var newView:UIView = {
        let newView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        newView.backgroundColor = .clear
        return newView
    }()
    
    private let episodeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 179/255, green: 211/255, blue: 232/255, alpha: 0.7)
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 0.0
        view.layer.shadowColor = UIColor.green.cgColor
        view.layer.masksToBounds = false
        return view
    }()
    
    private let locationContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 179/255, green: 211/255, blue: 232/255, alpha: 0.7)
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 0.0
        view.layer.shadowColor = UIColor.green.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let characterContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 179/255, green: 211/255, blue: 232/255, alpha: 0.7)
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 0.0
        view.layer.shadowColor = UIColor.green.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let locationDetailImageView = UIImageView()
        locationDetailImageView.image = UIImage(named: "homePage")
        locationDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        locationDetailImageView.contentMode = .scaleAspectFill
        return locationDetailImageView
    }()
    
    private let charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let charactersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        charactersCollectionView.backgroundColor = .clear
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        charactersCollectionView.showsHorizontalScrollIndicator = false
        charactersCollectionView.isScrollEnabled = false
        return charactersCollectionView
    }()
    
    private let locationsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let locationsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        locationsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        locationsCollectionView.backgroundColor = .clear
        locationsCollectionView.showsHorizontalScrollIndicator = false
        return locationsCollectionView
    }()
    
    private let episodeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let episodeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        episodeCollectionView.backgroundColor = .clear
        episodeCollectionView.showsHorizontalScrollIndicator = false
        return episodeCollectionView
    }()
    
    var characterTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Characters"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    var episodeTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Episodes"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    var locationTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Locations"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    private lazy var charactersButton: UIButton = {
        let charactersButton = UIButton()
        charactersButton.backgroundColor = UIColor(red: 46/255, green: 56/255, blue: 61/255, alpha: 0.7)
        charactersButton.setTitle("Characters", for: .normal)
        charactersButton.layer.cornerRadius = 10.0
        charactersButton.layer.masksToBounds = true
        return charactersButton
    }()
    
    private lazy var locationsButton: UIButton = {
        let locationsButton = UIButton()
        locationsButton.backgroundColor = UIColor(red: 46/255, green: 56/255, blue: 61/255, alpha: 0.7)
        locationsButton.setTitle("Locations", for: .normal)
        locationsButton.layer.cornerRadius = 10.0
        locationsButton.layer.masksToBounds = true
        return locationsButton
    }()
    
    private lazy var episodesButton: UIButton = {
        let episodesButton = UIButton()
        episodesButton.backgroundColor = UIColor(red: 46/255, green: 56/255, blue: 61/255, alpha: 0.7)
        episodesButton.setTitle("Episodes", for: .normal)
        episodesButton.layer.cornerRadius = 10.0
        episodesButton.layer.masksToBounds = true
        return episodesButton
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
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        characterviewModel = CharacterViewModel(apiManager: APIManager.shared)
        locationViewModel = LocationViewModel(apiManager: APIManager.shared)
        episodeViewModel = EpisodeViewModel(apiManager: APIManager.shared)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(backgroundImage)
        scrollView.addSubview(episodeCollectionView)
        scrollView.addSubview(locationsCollectionView)
        scrollView.addSubview(charactersCollectionView)
        scrollView.addSubview(episodeContainerView)
        scrollView.addSubview(locationContainerView)
        scrollView.addSubview(characterContainerView)
        
        episodeContainerView.addSubview(episodeTitleLabel)
        locationContainerView.addSubview(locationTitleLabel)
        characterContainerView.addSubview(characterTitleLabel)
        
        episodeCollectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        
        locationsCollectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
        locationsCollectionView.delegate = self
        locationsCollectionView.dataSource = self
        
        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        episodeViewModel?.fetchEpisodes { [weak self] in
            self?.episodeCollectionView.reloadData()
        }
        
        locationViewModel?.fetchLocations { [weak self] in
            self?.locationsCollectionView.reloadData()
        }
        
        characterviewModel?.fetchCharacters { [weak self] in
            self?.charactersCollectionView.reloadData()
        }
        
        navigationItem.title = "Rick And Morty"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        charactersButton.addTarget(self, action: #selector(didTapCharacterButton), for: .touchUpInside)
        locationsButton.addTarget(self, action: #selector(didTapLocationButton), for: .touchUpInside)
        episodesButton.addTarget(self, action: #selector(didTapEpisodeButton), for: .touchUpInside)
        
    }
    func calculateCharactersCollectionViewHeight() -> CGFloat {
        var totalHeight: CGFloat = 0.0
        let contentSize = charactersCollectionView.collectionViewLayout.collectionViewContentSize
        totalHeight = contentSize.height
        return totalHeight
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            episodeContainerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            episodeContainerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            episodeContainerView.heightAnchor.constraint(equalToConstant: 30),
            episodeContainerView.widthAnchor.constraint(equalToConstant: 150),
            
            episodeTitleLabel.topAnchor.constraint(equalTo: episodeContainerView.topAnchor),
            episodeTitleLabel.leadingAnchor.constraint(equalTo: episodeContainerView.leadingAnchor, constant: 20),
            episodeTitleLabel.trailingAnchor.constraint(equalTo: episodeContainerView.trailingAnchor, constant: -10),
            episodeTitleLabel.bottomAnchor.constraint(equalTo: episodeContainerView.bottomAnchor),
            
            episodeCollectionView.topAnchor.constraint(equalTo: episodeTitleLabel.bottomAnchor),
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            locationContainerView.topAnchor.constraint(equalTo: episodeCollectionView.bottomAnchor),
            locationContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationContainerView.heightAnchor.constraint(equalToConstant: 30),
            locationContainerView.widthAnchor.constraint(equalToConstant: 150),
            
            locationTitleLabel.topAnchor.constraint(equalTo: locationContainerView.topAnchor),
            locationTitleLabel.leadingAnchor.constraint(equalTo: locationContainerView.leadingAnchor, constant: 20),
            locationTitleLabel.trailingAnchor.constraint(equalTo: locationContainerView.trailingAnchor, constant: -10),
            locationTitleLabel.bottomAnchor.constraint(equalTo: locationContainerView.bottomAnchor),
            
            locationsCollectionView.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor),
            locationsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationsCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            characterContainerView.topAnchor.constraint(equalTo: locationsCollectionView.bottomAnchor),
            characterContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            characterContainerView.heightAnchor.constraint(equalToConstant: 30),
            characterContainerView.widthAnchor.constraint(equalToConstant: 150),
            
            characterTitleLabel.topAnchor.constraint(equalTo: characterContainerView.topAnchor),
            characterTitleLabel.leadingAnchor.constraint(equalTo: characterContainerView.leadingAnchor, constant: 20),
            characterTitleLabel.trailingAnchor.constraint(equalTo: characterContainerView.trailingAnchor, constant: -10),
            characterTitleLabel.bottomAnchor.constraint(equalTo: characterContainerView.bottomAnchor),
            
            charactersCollectionView.topAnchor.constraint(equalTo: characterTitleLabel.bottomAnchor, constant: 10),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //charactersCollectionView.heightAnchor.constraint(equalTo: charactersCollectionView.contentSize.height),
        ])
        
        episodeTitleLabel.isUserInteractionEnabled = true
        let gestureEpisodeRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapEpisodeButton))
        episodeTitleLabel.addGestureRecognizer(gestureEpisodeRecognizer)
        
        locationTitleLabel.isUserInteractionEnabled = true
        let gestureLocationRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapLocationButton))
        locationTitleLabel.addGestureRecognizer(gestureLocationRecognizer)
        
        characterTitleLabel.isUserInteractionEnabled = true
        let gestureCharacterRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCharacterButton))
        characterTitleLabel.addGestureRecognizer(gestureCharacterRecognizer)
    }
    
    
    @objc func didTapCharacterButton() {
        let goToViewController = CharactersViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
    
    @objc func didTapLocationButton() {
        let goToViewController = LocationViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
    
    @objc func didTapEpisodeButton() {
        let goToViewController = EpisodeViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
}

//MARK: Collection View Data Source
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == charactersCollectionView {
            return characterviewModel?.characters.count ?? 0
        } else if collectionView == locationsCollectionView {
            return locationViewModel?.locations.count ?? 0
        } else {
            return episodeViewModel?.episodes.count ?? 0
        }
    }
   

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == charactersCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let characterFeatures = characterviewModel?.characters[indexPath.row] else {
                return UICollectionViewCell()
            }
            
            cell.nameLabel.textColor = .white
            cell.nameLabel.text = characterFeatures.name
            if let posterPath = characterFeatures.image,
               let imgUrl = URL(string: "\(posterPath)") {
                cell.characterImageView.loadImg(url: imgUrl)
            }
            
            if let charactersLayout = charactersCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                   let charactersHeight = calculateCharactersCollectionViewHeight()
                   charactersCollectionView.frame.size.height = charactersHeight
                   scrollView.contentSize.height = charactersCollectionView.frame.origin.y + charactersHeight
               }
            return cell
        } else if collectionView == episodeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier, for: indexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.textColor = .white
            cell.dimensionLabel.textColor = .white
            cell.typeLabel.textColor = .white
            cell.layer.cornerRadius = 10
            
            guard let episodeFeatures = episodeViewModel?.episodes[indexPath.row] else {
                return UICollectionViewCell()
            }
            
            cell.nameLabel.text = episodeFeatures.name
            cell.typeLabel.text = episodeFeatures.airDate
            cell.dimensionLabel.text = episodeFeatures.episode
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as? LocationsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dimensionNameLabel.textColor = .white
            cell.nameLabel.textColor = .white
            cell.typeNameLabel.textColor = .white
            cell.layer.cornerRadius = 10
            let locationFeatures = locationViewModel?.locations[indexPath.row]
            cell.nameLabel.text = locationFeatures?.name
            cell.typeNameLabel.text = locationFeatures?.type
            cell.dimensionNameLabel.text = locationFeatures?.dimension
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == charactersCollectionView {
            let detailViewController = DetailViewController()
            if let character = characterviewModel?.characters[indexPath.row] {
                detailViewController.prepare(character: character)
                navigationController?.pushViewController(detailViewController, animated: true)
            }
        } else if collectionView == locationsCollectionView {
            let locationDetailViewController = LocationDetailViewController()
            if let location = locationViewModel?.locations[indexPath.row] {
                locationDetailViewController.prepare(location: location)
                navigationController?.pushViewController(locationDetailViewController, animated: true)
            }
        } else {
            let episodeDetailViewController = EpisodeDetailViewController()
            if let episode = episodeViewModel?.episodes[indexPath.row] {
                episodeDetailViewController.prepare(episode: episode)
                navigationController?.pushViewController(episodeDetailViewController, animated: true)
            }
        }
        
    }
}

//MARK: Collection View Delegate
extension HomeViewController: UICollectionViewDelegate {
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 15.0, bottom: 5.0, right: 15.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == episodeCollectionView {
            return CGSize(width: 200, height: 100)
        } else if collectionView == locationsCollectionView {
            return CGSize(width: 200, height: 100)
        }
        else {
            return CGSize(width: view.frame.width/2 - 20, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
}
