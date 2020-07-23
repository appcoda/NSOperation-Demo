//
//  SerialDispatchQueuesViewController.swift
//  ConcurrencyDemo
//
//  Created by AmrAngry on 6/17/20.
//  Copyright © 2020 Hossam Ghareeb. All rights reserved.
//

import UIKit

class SerialDispatchQueuesViewController: UIViewController {
    
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
        
        ///concurrent queue
        //        let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
        //        concurrentQueue.sync {
        //
        //        }
        
        ///Create a serial queue
        let serialQueue = DispatchQueue(label: "com.appcoda.imagesQueue")
        
        serialQueue.async {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img1
            }
        }
        
        serialQueue.async {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img2
            }
        }
        
        serialQueue.async {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img3
            }
        }
        
        serialQueue.async {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            DispatchQueue.main.async {
                self.imageView4.image = img4
            }
        }
        
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        sliderValueLabel.text = "\(sender.value * 100.0)"
    }
}
