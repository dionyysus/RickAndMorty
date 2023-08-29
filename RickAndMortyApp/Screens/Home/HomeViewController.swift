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
    }
   
    @IBAction func characterButtonTapped() {
        let story = UIStoryboard(name: "Characters", bundle: nil)
        let charactersController = story.instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
        navigationController?.pushViewController(charactersController, animated: true)
    }
    
    //TODO: will create
    @IBAction func locationButtonTapped() {
    }
    //TODO: will create
    @IBAction func episodeButtonTapped() {
    }
}

