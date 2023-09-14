//
//  LocationViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import UIKit

final class LocationViewController: UIViewController {
    
    private var viewModel: LocationViewModel?
    
    let searchBar = UISearchBar()
    var isSearch : Bool = false

    
    private let locationsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let locationsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        locationsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return locationsCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LocationViewModel(apiManager: APIManager.shared)
        
        view.addSubview(locationsCollectionView)
        setupConstraints()
        locationsCollectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
        locationsCollectionView.delegate = self
        locationsCollectionView.dataSource = self
    
        viewModel?.fetchLocations { [weak self] in
            self?.locationsCollectionView.reloadData()
        }
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Locations"
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
            locationsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            locationsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func gotoViewControllerButton() {
        let goToViewController = LocationDetailViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
}

//MARK: Collection View Data Source
extension LocationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearch{
            return viewModel?.filteredLocations.count ?? 0
        } else{
            return viewModel?.locations.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as? LocationsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let locationFeatures = isSearch ? viewModel?.filteredLocations[indexPath.row] : viewModel?.locations[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.nameLabel.text = locationFeatures.name
        cell.typeNameLabel.text = locationFeatures.type
        cell.dimensionNameLabel.text = locationFeatures.dimension
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let locationDetailViewController = LocationDetailViewController()
        
        if let location = isSearch ? viewModel?.filteredLocations[indexPath.row] : viewModel?.locations[indexPath.row] {
            locationDetailViewController.prepare(location: location)
            navigationController?.pushViewController(locationDetailViewController, animated: true)
        }
    }
}

//MARK: Collection View Delegate
extension LocationViewController: UICollectionViewDelegate {}

extension LocationViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3.0, left: 10.0, bottom: 3.0, right: 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

extension LocationViewController: UISearchBarDelegate {
    
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
        locationsCollectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty {
            isSearch = false
        } else {
            isSearch = true
            viewModel?.search(for: searchText)
            locationsCollectionView.reloadData()
        }
        locationsCollectionView.reloadData()
    }
}
