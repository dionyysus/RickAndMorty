//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

final class Layout: UICollectionViewFlowLayout {
//    override func prepare() {
//        super.prepare()
//        itemSize = CGSize(width: 300, height: 150)
//        minimumInteritemSpacing = 10 // Yatay boşluk
//           minimumLineSpacing = 10 // Dikey boşluk
//    }
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        guard let collectionView = collectionView else { return false }
//        return !newBounds.size.equalTo(collectionView.bounds.size)
//    }
}

final class CharactersViewController: UIViewController {
    
    private let charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let charactersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return charactersCollectionView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(charactersCollectionView)
        charactersCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.frame = view.bounds
          
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
    }
}

//MARK: Collection View Data Source
extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }

    //TODO: update it with programmatic ui
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let gotoDetailController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(gotoDetailController, animated: true)
        return
    }
}

//MARK: Collection View Delegate
extension CharactersViewController: UICollectionViewDelegate {

}

extension CharactersViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 250)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}



