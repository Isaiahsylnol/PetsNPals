//
//  VideoPostTableViewCell.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-14.
//

import UIKit

class VideoPostTableViewCell: UITableViewCell {

    @IBOutlet weak var videoView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setVideo(vid: VideoPost) {
        videoView.loadRequest(vid.video)
        titleLabel.text = vid.title
    }
}
