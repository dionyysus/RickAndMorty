//
//  HomeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 28.08.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let charactersButton: UIButton = {
        let charactersButton = UIButton()
        charactersButton.backgroundColor = .systemBlue
        charactersButton.setTitle("My Button", for: .normal)
        return charactersButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(charactersButton)
        charactersButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            charactersButton.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            charactersButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            charactersButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            charactersButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
        ])
        
        if let backgroundImage = UIImage(named: "home.png") {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = UIColor(patternImage: backgroundImage)
            view.addSubview(background)
            
            let imageSize = backgroundImage.size
            background.frame = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
            
            background.center = view.center
        }
    }
}
