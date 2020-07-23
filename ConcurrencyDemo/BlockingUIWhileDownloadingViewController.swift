//
//  BlockingUIWhileDownloadingViewController.swift
//  ConcurrencyDemo
//
//  Created by AmrAngry on 6/17/20.
//  Copyright © 2020 Hossam Ghareeb. All rights reserved.
//

import UIKit

class BlockingUIWhileDownloadingViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickOnStart(sender: AnyObject) {
        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
        imageView1.image = img1
        
        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
        imageView2.image = img2
        
        let img3 = Downloader.downloadImageWithURL(imageURLs[2])
        imageView3.image = img3
        
        let img4 = Downloader.downloadImageWithURL(imageURLs[3])
        imageView4.image = img4
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        sliderValueLabel.text = "\(sender.value * 100.0)"
    }

}
