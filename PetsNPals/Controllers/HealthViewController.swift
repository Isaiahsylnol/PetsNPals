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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let index = indexPath.row
        if index == 0 {

                if let postDetail = storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController{
                    postDetail.postTitle = myArray[index].title!
                    self.navigationController?.pushViewController(postDetail, animated: true)
                }
        }
        else if index == 2 {
            let videoView = self.storyboard?.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
            
            self.navigationController?.pushViewController(videoView, animated: true)
        }
        else if index == 3 {
            print("Shop")
        }
    }

}

