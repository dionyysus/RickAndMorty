//
//  EpisodeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    private var viewModel: EpisodeViewModel?
    
    let searchBar = UISearchBar()
    var isSearch : Bool = false
    
    private let episodeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let episodeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        episodeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return episodeCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = EpisodeViewModel(apiManager: APIManager.shared)
        
        view.addSubview(episodeCollectionView)
        
        setupConstraints()
        
        episodeCollectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        
        viewModel?.fetchEpisodes { [weak self] in
            self?.episodeCollectionView.reloadData()
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Episodes"
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
            episodeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func gotoViewControllerButton() {
        let goToViewController = EpisodeDetailViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
}

//MARK: Collection View Data Source
extension EpisodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearch{
            return viewModel?.filteredEpisodes.count ?? 0
        } else{
            return viewModel?.episodes.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier, for: indexPath) as? EpisodeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let episodeFeatures = isSearch ? viewModel?.filteredEpisodes[indexPath.row] : viewModel?.episodes[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.nameLabel.text = episodeFeatures.name
        cell.typeLabel.text = episodeFeatures.airDate
        cell.dimensionLabel.text = episodeFeatures.episode
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let episodeDetailViewController = EpisodeDetailViewController()
        
        if let episode = isSearch ? viewModel?.filteredEpisodes[indexPath.row] : viewModel?.episodes[indexPath.row] {
            episodeDetailViewController.prepare(episode: episode)
            navigationController?.pushViewController(episodeDetailViewController, animated: true)
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
            return CGSize(width: view.frame.width, height: 120)
        } else {
            return CGSize(width: 120, height: 45)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

extension EpisodeViewController: UISearchBarDelegate {
    
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
        episodeCollectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty {
            isSearch = false
        } else {
            isSearch = true
            viewModel?.search(for: searchText)
            episodeCollectionView.reloadData()
        }
        episodeCollectionView.reloadData()
    }
}
