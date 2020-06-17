//
//  OperationQueueViewController.swift
//  ConcurrencyDemo
//
//  Created by AmrAngry on 6/17/20.
//  Copyright © 2020 Hossam Ghareeb. All rights reserved.
//

import UIKit

class OperationQueueViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    var queue: OperationQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickOnStart(sender: AnyObject) {
        
        queue = OperationQueue()
        // addOperationWithBlock
        queue?.addOperation {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            //            DispatchQueue.main.async {
            //                self.imageView1.image = img1
            //            }
            OperationQueue.main.addOperation {
                self.imageView1.image = img1
            }
        }
        
        queue?.addOperation {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            OperationQueue.main.addOperation {
                self.imageView1.image = img1
            }
        }
        
        queue?.addOperation {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            OperationQueue.main.addOperation {
                self.imageView2.image = img2
            }
        }
        
        queue?.addOperation {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation {
                self.imageView3.image = img3
            }
        }
        
        queue?.addOperation {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation {
                self.imageView4.image = img4
            }
        }
        
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        sliderValueLabel.text = "\(sender.value * 100.0)"
    }
}
