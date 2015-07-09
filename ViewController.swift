//
//  ViewController.swift
//  JSON Demo
//
//  Created by todd d Halkowski on 7/8/15.
//  Copyright (c) 2015 Geneva. All rights reserved.
//
// this code pulls json data from an external website and prints an item from the data after translating it to dictionary           
// format using the serialization method

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.telize.com/geoip")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                
                println(error)
                
            } else {
                
                var err: NSError?
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
                
                if err != nil {
                    
                    println(err)
                    
                } else {
                    
                    println(jsonResult["city"])
                    
                }
                
            }
            
        })
        
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
