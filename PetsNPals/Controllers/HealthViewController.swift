//
//  HealthViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit

class HealthViewController: UIViewController{
    
    private var postArray = [Post]()
    @IBOutlet weak var healthTableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let anonymousFunction = { (fetchedUserList: [Post]) in
            DispatchQueue.main.async {
                self.postArray = fetchedUserList
                self.healthTableView.reloadData()
            }
        }
        PostContentAPI.shared.fetchUserList(onCompletion: anonymousFunction)
    }
}

extension HealthViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let post = postArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthPostCell") as! HealthPostCell
        
        cell.titleLabel.text = post.title
        cell.dateLabel.text = post.date
        cell.paragraphTextArea.text = post.paragraph
        cell.articleImage.image = UIImage(named: post.img!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        // MARK: - Assign the information for each post at their given index to the "PostDetailsView"
                if let postDetail = storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController{
                    postDetail.postTitle = postArray[indexPath.row].title!
                    postDetail.postImage = UIImage(named: postArray[indexPath.row].img!)!
                    postDetail.paragraph = postArray[indexPath.row].paragraph!
                    
                    self.navigationController?.pushViewController(postDetail, animated: true)
        }
    }
}

