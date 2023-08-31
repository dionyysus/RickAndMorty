//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

class CharactersViewController: UIViewController {

    var charactersCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: CharactersCollectionViewCell.identifier, bundle: nil)
        charactersCollectionView?.register(nib, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView?.delegate = self
        charactersCollectionView?.dataSource = self

        if let collectionView = charactersCollectionView {
            view.addSubview(collectionView)
        }
        
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        charactersCollectionView?.setCollectionViewLayout(layout, animated: true)

    }
}

//MARK: Collection View Data Source
extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }

        return cell
    }


//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
//        let gotoDetailController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        navigationController?.pushViewController(gotoDetailController, animated: true)
//        return
//    }
}

//MARK: Collection View Delegate
extension CharactersViewController: UICollectionViewDelegate {

}

extension CharactersViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 1 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:130)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}


