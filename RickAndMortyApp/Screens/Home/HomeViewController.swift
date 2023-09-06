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
        locationDetailImageView.image = UIImage(named: "mortyy.jpg")
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
        return charactersCollectionView
    }()
    
    private let locationsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let locationsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        locationsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        locationsCollectionView.backgroundColor = .clear
        return locationsCollectionView
    }()
    
    private let episodeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let episodeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        episodeCollectionView.backgroundColor = .clear
        return episodeCollectionView
    }()
    
    var titleLabel: UILabel = {
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
        
        // let buttons = [charactersButton, locationsButton, episodesButton]
        //        addButtonsToStackview(buttons: buttons)
        //        setButtonConstraints(buttons: buttons)
        
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        view.addSubview(stackView)
        view.addSubview(charactersCollectionView)
        view.addSubview(episodeCollectionView)
        view.addSubview(locationTitleLabel)
        view.addSubview(locationsCollectionView)
        view.addSubview(characterContainerView)
        view.addSubview(episodeContainerView)
        view.addSubview(locationContainerView)
        
        characterContainerView.addSubview(titleLabel)
        episodeContainerView.addSubview(episodeTitleLabel)
        locationContainerView.addSubview(locationTitleLabel)
        
        locationsCollectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
        locationsCollectionView.delegate = self
        locationsCollectionView.dataSource = self
        
        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        episodeCollectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        
       // navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rick And Morty"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        charactersButton.addTarget(self, action: #selector(didTapCharacterButton), for: .touchUpInside)
        locationsButton.addTarget(self, action: #selector(didTapLocationButton), for: .touchUpInside)
        episodesButton.addTarget(self, action: #selector(didTapEpisodeButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            
            
            episodeContainerView.topAnchor.constraint(equalTo: (navigationController!.navigationBar.bottomAnchor)),
            episodeContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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

            titleLabel.topAnchor.constraint(equalTo: characterContainerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: characterContainerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: characterContainerView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: characterContainerView.bottomAnchor),
            
            charactersCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //charactersCollectionView.heightAnchor.constraint(equalToConstant: 400),
            
            //            stackView.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 10),
            //            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            //            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
        ])
        
        episodeTitleLabel.isUserInteractionEnabled = true
        let gestureEpisodeRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapEpisodeButton))
        episodeTitleLabel.addGestureRecognizer(gestureEpisodeRecognizer)
        
        locationTitleLabel.isUserInteractionEnabled = true
        let gestureLocationRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapLocationButton))
        locationTitleLabel.addGestureRecognizer(gestureLocationRecognizer)
        
        titleLabel.isUserInteractionEnabled = true
        let gestureCharacterRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCharacterButton))
        titleLabel.addGestureRecognizer(gestureCharacterRecognizer)
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
    
    //    func addButtonsToStackview(buttons: [UIButton]) {
    //        for button in buttons {
    //            stackView.addArrangedSubview(button)
    //        }
    //    }
    //
    //    func setButtonConstraints(buttons: [UIButton]) {
    //        for button in buttons {
    //            button.translatesAutoresizingMaskIntoConstraints = false
    //            NSLayoutConstraint.activate([
    //                button.widthAnchor.constraint(equalToConstant: 160),
    //                button.heightAnchor.constraint(equalToConstant: 50)
    //            ])
    //        }
    //    }
}

//MARK: Collection View Data Source
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == charactersCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.textColor = .white
            return cell
        } else if collectionView == episodeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier, for: indexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.textColor = .white
            cell.dimensionLabel.textColor = .white
            cell.typeLabel.textColor = .white
//            cell.backgroundColor = UIColor(red: 91/255, green: 196/255, blue: 189/255, alpha: 0.7)
            cell.layer.cornerRadius = 10
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as? LocationsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.dimensionNameLabel.textColor = .white
            cell.nameLabel.textColor = .white
            cell.typeNameLabel.textColor = .white
//            cell.backgroundColor = UIColor(red: 91/255, green: 196/255, blue: 189/255, alpha: 0.7)
            cell.layer.cornerRadius = 10
            return cell
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
            return CGSize(width: 180, height: 100)
        } else if collectionView == locationsCollectionView {
            return CGSize(width: 180, height: 100)
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
