//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailView.layer.borderWidth = 1
        detailView.layer.borderColor = UIColor.lightGray.cgColor
        detailView.layer.shadowOpacity = 1
        detailView.layer.shadowOffset = .zero
        detailView.layer.shadowRadius = 1
    }
    
}
