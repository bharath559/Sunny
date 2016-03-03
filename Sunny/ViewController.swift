//
//  ViewController.swift
//  Sunny
//
//  Created by Bharath Kongara  on 3/2/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTmp: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var bgImgView: UIImageView!
    
    @IBOutlet weak var tmpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let APIKEY="https://api.forecast.io/forecast/ba6057706a1c384a1f06d036d6640b3d/37.8267,-122.423"
        let url = NSURL(string: APIKEY)
        
        let networkProcesser = NetworkProcessing(url: url!)
        
        networkProcesser.downloadJSONFromText { (jsondata) -> Void in
            
            
            
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

