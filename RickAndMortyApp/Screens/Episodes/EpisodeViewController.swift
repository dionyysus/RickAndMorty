//
//  EpisodeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let seasonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let seasonCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        seasonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        seasonCollectionView.showsHorizontalScrollIndicator = false
        return seasonCollectionView
    }()
    
    private let episodeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let episodeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return episodeCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.addSubview(seasonCollectionView)
        containerView.addSubview(episodeCollectionView)
        view.addSubview(containerView)
        
        setupConstraints()
        
        seasonCollectionView.register(SeasonCollectionViewCell.self, forCellWithReuseIdentifier: SeasonCollectionViewCell.identifier)
        seasonCollectionView.delegate = self
        seasonCollectionView.dataSource = self
        
        episodeCollectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Episodes"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            seasonCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            seasonCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            seasonCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            seasonCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            episodeCollectionView.topAnchor.constraint(equalTo: seasonCollectionView.bottomAnchor),
            episodeCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            episodeCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            episodeCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}

//MARK: Collection View Data Source
extension EpisodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == seasonCollectionView {
            return 50
        } else {
            return 50
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == seasonCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonCollectionViewCell.identifier, for: indexPath) as? SeasonCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier, for: indexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
}

//MARK: Collection View Delegate
extension EpisodeViewController: UICollectionViewDelegate {
}

extension EpisodeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == episodeCollectionView {
            return CGSize(width: view.frame.width, height: 150)
        } else {
            return CGSize(width: 120, height: 45)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == seasonCollectionView {
            return 0.0
        }
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == seasonCollectionView {
            return 0.0
        }
        return 10.0
    }}
