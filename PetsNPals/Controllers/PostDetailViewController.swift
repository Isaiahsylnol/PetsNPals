//
//  PostDetailViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-05-13.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var postTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = postTitle
        
    }
}
