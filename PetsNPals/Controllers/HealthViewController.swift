//
//  HealthViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit

class HealthViewController: UIViewController{
    
    @IBOutlet weak var healthTableView: UITableView!
    var posts: [HealthPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = createArray()
    }
    
    func createArray() -> [HealthPost] {
        
        var tempPosts: [HealthPost] = []
        
        let post1 = HealthPost(title: "Pet Food Recall: Select Midwestern Pet Foods' for potential salmonella risk", para: "Months after Midwestern Pet Foods Inc. recalled dozens of products potentially linked to the deaths of more than 70 dogs, the company is voluntarily recalling select dog and cat food that may be contaminated with salmonella.", image: UIImage(named: "dog_food")!, date: "March 7th 2021")
        let post2 = HealthPost(title: "Reading Body Language", para: "A dog’s weight distribution can tell a lot about mood and intention. Consider a cowering dog that is hunched toward the ground. That’s a sign of fear or stress. The dog may be trying to get away from something and the posture makes the dog appear smaller. In other words, it says, “I mean no harm.” The extreme of this posture is a dog that rolls onto their back exposing the belly. This may look like a dog soliciting a belly rub, and in a relaxed dog, it often is.", image: UIImage(named: "dog_posture")!, date: "March 3rd 2021")
        let post3 = HealthPost(title: "Cleaning The Dog Bed", para: "If Rover sleeps in one of those large, comfy, fleece-covered, memory foam pillows or surround-beds, knowing how to wash that sort of dog bed is a bit trickier. You may even wonder, “can I wash my dog bed?” Dog beds can be bulky and too large for your washing machine. Don’t worry, though. ARM & HAMMER™ Plus OxiClean™ Odor Blasters can be used to hand-wash your padded dog bed.", image: UIImage(named: "dog_bed2")!, date: "March 1st 2021")
        let post4 = HealthPost(title: "Want to try running with your dog? Here are some tips and tricks.", para: "Running with your dog is a fantastic way to get back to nature, solidify the bond with your dog and to get fit. The canine sport, known as canicross is a sport rapidly growing in popularity. When you first look to start running with a dog, it can be a lot of information to take in all at once.", image: UIImage(named: "dog_running")!, date: "March 3rd 2021")
        
        tempPosts.append(post1)
        tempPosts.append(post2)
        tempPosts.append(post3)
        tempPosts.append(post4)
        return tempPosts
    }
}

extension HealthViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthPostCell") as! HealthPostCell
        cell.setPost(post: post)
        return cell
    }
}

