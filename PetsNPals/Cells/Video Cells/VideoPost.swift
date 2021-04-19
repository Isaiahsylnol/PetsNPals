//
//  VideoPost.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-04-14.
//

import Foundation
import UIKit

class VideoPost {
    var video: URLRequest
    var title: String
    
    init(vid: URLRequest, title: String) {
        self.video = vid
        self.title = title
    }
}
