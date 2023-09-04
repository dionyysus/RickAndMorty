//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    private var viewModel: CharacterViewModel?
    var isSearch : Bool = false
    
    private let charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let charactersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return charactersCollectionView
    }()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CharacterViewModel(apiManager: APIManager.shared)
        view.addSubview(charactersCollectionView)
        
        setupConstraints()
        
        charactersCollectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        viewModel?.fetchCharacters { [weak self] in
            self?.charactersCollectionView.reloadData()
        }
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    @objc func handleShowSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
        searchBar.placeholder = "Search"
        
    }
    
    func setupConstraints() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        showSearchBarButton(shouldShow: true)
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func gotoViewControllerButton() {
        let goToViewController = DetailViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
}

//MARK: Collection View Data Source
extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isSearch{
            return viewModel?.filteredCharacters.count ?? 0
        } else{
            return viewModel?.characters.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let characterFeatures = isSearch ? viewModel?.filteredCharacters[indexPath.row] : viewModel?.characters[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.nameLabel.text = characterFeatures.name
        if let posterPath = characterFeatures.image,
           let imgUrl = URL(string: "\(posterPath)") {
            cell.characterImageView.loadImg(url: imgUrl)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailViewController = DetailViewController()
        if let character = isSearch ? viewModel?.filteredCharacters[indexPath.row] : viewModel?.characters[indexPath.row] {
            detailViewController.prepare(character: character)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

//MARK: Collection View Delegate
extension CharactersViewController: UICollectionViewDelegate {
}

extension CharactersViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 15.0, bottom: 5.0, right: 15.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

extension CharactersViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        search(shouldShow: false)
        isSearch = false
        charactersCollectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty {
            isSearch = false
        } else {
            isSearch = true
            viewModel?.search(for: searchText)
            charactersCollectionView.reloadData()
        }
        
        charactersCollectionView.reloadData()
    }
}

