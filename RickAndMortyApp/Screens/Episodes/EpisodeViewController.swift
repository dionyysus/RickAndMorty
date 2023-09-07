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
        viewModel = EpisodeViewModel(apiManager: APIManager.shared)
        
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
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
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
    
    @objc func gotoViewControllerButton() {
        let goToViewController = EpisodeDetailViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
}

//MARK: Collection View Data Source
extension EpisodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == seasonCollectionView {
            return 10
        } else {
            return viewModel?.episodes.count ?? 0
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
            
            let episodeFeatures = viewModel?.episodes[indexPath.row]
            cell.nameLabel.text = episodeFeatures?.name
            cell.typeLabel.text = episodeFeatures?.airDate
            cell.dimensionLabel.text = episodeFeatures?.episode
          
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let episodeDetailViewController = EpisodeDetailViewController()
        if let episode = viewModel?.episodes[indexPath.row] {
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
        if collectionView == seasonCollectionView {
            return 0.0
        }
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == seasonCollectionView {
            return 0.0
        }
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
        
//        if trimmedText.isEmpty {
//            isSearch = false
//        } else {
//            isSearch = true
//            viewModel?.search(for: searchText)
//            charactersCollectionView.reloadData()
//        }
        
        episodeCollectionView.reloadData()
    }
}
