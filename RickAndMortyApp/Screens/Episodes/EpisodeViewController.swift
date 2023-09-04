//
//  EpisodeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class EpisodeViewController: UIViewController {

    private let episodeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let episodeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return episodeCollectionView
    }()
    
    private let seasonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let seasonCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        seasonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return seasonCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(seasonCollectionView)
        view.addSubview(episodeCollectionView)
        view.bringSubviewToFront(seasonCollectionView)

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
            
            seasonCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            seasonCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            seasonCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            seasonCollectionView.heightAnchor.constraint(equalToConstant: 40),

            episodeCollectionView.topAnchor.constraint(equalTo: seasonCollectionView.bottomAnchor),
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }}

//MARK: Collection View Data Source
extension EpisodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
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
        return UIEdgeInsets(top: 3.0, left: 15.0, bottom: 3.0, right: 15.0) 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == seasonCollectionView {
            return CGSize(width: 100, height: 40)
        } else {
            return CGSize(width: view.frame.width, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
}
