//
//  PostDetailViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-05-13.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var paragraphTextArea: UITextView!
    
    var postTitle = ""
    var paragraph = ""
    var postImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = postTitle
        paragraphTextArea.text = paragraph
        imageView.image = postImage
        
    }
}
