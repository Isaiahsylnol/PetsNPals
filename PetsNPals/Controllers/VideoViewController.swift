//
//  VideoViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-14.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var videoTableView: UITableView!
 
    var posts: [VideoPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = createArray()
    }
    
    func createArray() -> [VideoPost] {
        
        var tempPosts: [VideoPost] = []
        
        let post1 = VideoPost(vid: URLRequest(url: URL(string: "https://www.youtube.com/embed/N2iDeGiY9Xw")!), title: "New Puppy Tips - Surviving the First Week")
        let post2 = VideoPost(vid: URLRequest(url: URL(string: "https://www.youtube.com/embed/ZipzqCphi8s")!), title: "The Science of Dogs")
 
        tempPosts.append(post1)
        tempPosts.append(post2)
        return tempPosts
    }
}

extension VideoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoPostTableViewCell") as! VideoPostTableViewCell
        cell.setVideo(vid: video)
        return cell
    }
}

