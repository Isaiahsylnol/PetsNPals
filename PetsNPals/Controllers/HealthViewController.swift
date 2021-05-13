//
//  HealthViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit

class HealthViewController: UIViewController{
    private var myArray = [Post]()
    @IBOutlet weak var healthTableView: UITableView!
    var posts: [HealthPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let anonymousFunction = { (fetchedUserList: [Post]) in
            DispatchQueue.main.async {
                self.myArray = fetchedUserList
                self.healthTableView.reloadData()
            }
        }
        
        PostContentAPI.shared.fetchUserList(onCompletion: anonymousFunction)
    }
}

extension HealthViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let user = myArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthPostCell") as! HealthPostCell
        cell.titleLabel.text = user.title
        cell.dateLabel.text = user.date
        cell.paragraphTextArea.text = user.paragraph
        
        cell.articleImage.image = UIImage(named: user.img!)
        return cell
    }
}

