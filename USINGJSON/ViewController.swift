//
//  ViewController.swift
//  USINGJSON
//
//  Created by Rukmani on 28/07/16.
//  Copyright © 2016 Rukmani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func Submit(sender: AnyObject) {
        let url1 = "https://maps.googleapis.com/maps/api/geocode/json?&address="
        
        let url2 : String = textField.text! as String
        let url3 : String = url2.lowercaseString
        let baseurl = url1 + url3
        let url = NSURL(string: baseurl)!
        let data  : NSData? = NSData(contentsOfURL: url)
        do
        {
        if let jsonResult:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
            let dataDictionary : String = jsonResult["results"]![0]["formatted_address"] as! String
            textView.text = dataDictionary
        }
        }catch let error as NSError
        { print("Error:\n \(error)")
            return
        
        }
        
        
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

