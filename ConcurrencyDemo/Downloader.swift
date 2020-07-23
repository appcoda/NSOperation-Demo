//
//  Downloader.swift
//  ConcurrencyDemo
//
//  Created by AmrAngry on 6/17/20.
//  Copyright © 2020 Hossam Ghareeb. All rights reserved.
//

import UIKit

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}
