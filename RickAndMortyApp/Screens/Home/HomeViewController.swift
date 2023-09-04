//
//  HomeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 28.08.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var charactersButton: UIButton = {
        let charactersButton = UIButton()
        charactersButton.backgroundColor = UIColor(red: 46/255, green: 56/255, blue: 61/255, alpha: 0.7)
        charactersButton.setTitle("Characters", for: .normal)
        charactersButton.layer.cornerRadius = 10.0
        charactersButton.layer.masksToBounds = true
        return charactersButton
    }()
    
    private lazy var locationsButton: UIButton = {
        let locationsButton = UIButton()
        locationsButton.backgroundColor = UIColor(red: 46/255, green: 56/255, blue: 61/255, alpha: 0.7)
        locationsButton.setTitle("Locations", for: .normal)
        locationsButton.layer.cornerRadius = 10.0
        locationsButton.layer.masksToBounds = true
        return locationsButton
    }()
    
    private lazy var episodesButton: UIButton = {
        let episodesButton = UIButton()
        episodesButton.backgroundColor = UIColor(red: 46/255, green: 56/255, blue: 61/255, alpha: 0.7)
        episodesButton.setTitle("Episodes", for: .normal)
        episodesButton.layer.cornerRadius = 10.0
        episodesButton.layer.masksToBounds = true
        return episodesButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttons = [charactersButton, locationsButton, episodesButton]
        addButtonsToStackview(buttons: buttons)
        setButtonConstraints(buttons: buttons)
        
        let backgroundImage = UIImageView(image: UIImage(named: "home.png"))
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        charactersButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let goToViewController = CharactersViewController()
        self.navigationController?.pushViewController(goToViewController, animated: true)
    }
    
    func addButtonsToStackview(buttons: [UIButton]) {
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
    }
    
    func setButtonConstraints(buttons: [UIButton]) {
        
        for button in buttons {
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 160),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
}
