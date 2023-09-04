//
//  LocationViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class LocationViewController: UIViewController {

    private let locationsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let locationsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        locationsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return locationsCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(locationsCollectionView)
        setupConstraints()
        locationsCollectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
        locationsCollectionView.delegate = self
        locationsCollectionView.dataSource = self
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Locations"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            locationsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            locationsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//MARK: Collection View Data Source
extension LocationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as? LocationsCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

//MARK: Collection View Delegate
extension LocationViewController: UICollectionViewDelegate {
    
}

extension LocationViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3.0, left: 15.0, bottom: 3.0, right: 15.0) // Sağdan ve soldan 15 piksel boşluk ekler
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
