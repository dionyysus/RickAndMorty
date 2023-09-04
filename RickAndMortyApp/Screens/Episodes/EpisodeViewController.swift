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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(episodeCollectionView)
        setupConstraints()
        episodeCollectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Episodes"

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            episodeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//MARK: Collection View Data Source
extension EpisodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier, for: indexPath) as? EpisodeCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
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
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
}
