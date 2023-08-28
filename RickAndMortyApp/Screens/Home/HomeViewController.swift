//
//  HomeViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 28.08.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var charactersButton: UIButton!
    @IBOutlet weak var locationsButton: UIButton!
    @IBOutlet weak var episodesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersButton.addTarget(self, action: #selector(characterButtonTapped), for: .touchUpInside)
    }
   
    @IBAction func characterButtonTapped() {
        let story = UIStoryboard(name: "Characters", bundle: nil)
        let charactersController = story.instantiateViewController(identifier: "CharactersViewController") as! CharactersViewController
        self.present(charactersController, animated: true, completion: nil)
    }
    
    //TODO: will create
    @IBAction func locationButtonTapped() {
    }
    //TODO: will create
    @IBAction func episodeButtonTapped() {
    }
}

