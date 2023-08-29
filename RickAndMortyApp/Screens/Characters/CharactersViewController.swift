//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

class CharactersViewController: UIViewController {

    @IBOutlet weak var charactersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: CharactersCollectionViewCell.identifier, bundle: nil)
        charactersCollectionView.register(nib, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
    }
    
}

//MARK: Collection View Data Source
extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCollectionViewCell", for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

//MARK: Collection View Delegate
extension CharactersViewController: UICollectionViewDelegate {
    
}
