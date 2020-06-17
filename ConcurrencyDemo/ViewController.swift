//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "https://s1.ax1x.com/2017/12/06/oaiz8.png", "https://s1.ax1x.com/2017/12/06/oakQS.jpg"]

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    var queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnStart(sender: AnyObject) {
        queue = OperationQueue()
        
        let operation1 = BlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            OperationQueue.main.addOperation {
                self.imageView1.image = img1
            }
        })
        
        operation1.completionBlock = {
            print("Operation 1 completed, cancelled:\(operation1.isCancelled)")
        }
        queue.addOperation(operation1)
        
        let operation2 = BlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            OperationQueue.main.addOperation {
                self.imageView2.image = img2
            }
        })
        operation2.addDependency(operation1)
        operation2.completionBlock = {
            print("Operation 2 completed, cancelled:\(operation2.isCancelled)")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = BlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
        })
        operation3.addDependency(operation2)
        
        operation3.completionBlock = {
            print("Operation 3 completed, cancelled:\(operation3.isCancelled)")
        }
        queue.addOperation(operation3)
        
        let operation4 = BlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation{
                self.imageView4.image = img4
            }
        })
        
        operation4.completionBlock = {
            print("Operation 4 completed, cancelled:\(operation4.isCancelled)")
        }
        queue.addOperation(operation4)
        
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
    @IBAction func didClickOnCancel(sender: AnyObject) {
        
        self.queue.cancelAllOperations()
    }
}

