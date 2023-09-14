//
//  EpisodeDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 5.09.2023.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    private var viewModel: EpisodeDetailViewModel?
    private var characterviewModel: CharacterViewModel?
    
    
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
        layout.scrollDirection = .vertical
        let charactersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        charactersCollectionView.showsHorizontalScrollIndicator = false
        charactersCollectionView.isScrollEnabled = false
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
        
        characterviewModel = CharacterViewModel(apiManager: APIManager.shared)
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.addSubview(episodeDetailImageView)
        scrollView.addSubview(detailView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(charactersCollectionView)
        scrollView.addSubview(residentsLabel)
        
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
        
        fetchCharacters()
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            episodeDetailImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            episodeDetailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeDetailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeDetailImageView.heightAnchor.constraint(equalToConstant: 400),
            
            detailView.topAnchor.constraint(equalTo: episodeDetailImageView.bottomAnchor, constant: 16),
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
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: view.frame.height)
        
    }
    
    func prepare(episode: Episodes) {
        viewModel = EpisodeDetailViewModel(episodes: episode)
    }
    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func calculateCharactersCollectionViewHeight() -> CGFloat {
        var totalHeight: CGFloat = 0.0
        let contentSize = charactersCollectionView.collectionViewLayout.collectionViewContentSize
        totalHeight = contentSize.height
        return totalHeight
    }
    
    func fetchCharacters() {
        guard let characters = viewModel?.episodes?.characters else { return }
        
        for characterURL in characters {
            guard let characterID = characterURL.split(separator: "/").last else {
                continue
            }
            let characterIDString = String(characterID)
            let characterAPIURL = "https://rickandmortyapi.com/api/character/\(characterIDString)"
            
            APIManager.shared.execute(url: characterAPIURL) { (character: Characters?) in
                if let character = character {
                    print(character)
                    
                    if let characterImageURLString = character.image, let characterImageURL = URL(string: characterImageURLString) {
                        self.fetchImage(from: characterImageURL) { image in
                            if (image != nil) {
                                DispatchQueue.main.async {
                                    self.characterviewModel?.characters.append(character)
                                    self.charactersCollectionView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


//MARK: Collection View Data Source
extension EpisodeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterviewModel?.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.nameLabel.text = characterviewModel?.characters[indexPath.row].name
        if let posterPath = characterviewModel?.characters[indexPath.row].image,
           let imgUrl = URL(string: "\(posterPath)") {
            cell.characterImageView.loadImg(url: imgUrl)
        }
        
        if let charactersLayout = charactersCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               let charactersHeight = calculateCharactersCollectionViewHeight()
               charactersCollectionView.frame.size.height = charactersHeight
               scrollView.contentSize.height = charactersCollectionView.frame.origin.y + charactersHeight
           }
        
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
            return CGSize(width: 150, height: 150)
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
