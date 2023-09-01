//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

final class CharactersViewController: UIViewController {

    private let searchBar = UISearchBar()

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
        
        setupConstraints()

        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
    }
    
    @objc func handleShowSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search"
    }
    
    func setupConstraints() {
        searchBar.sizeToFit()
    
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
        return UIEdgeInsets(top: 5.0, left: 12.0, bottom: 5.0, right: 12.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}



