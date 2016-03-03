//
//  NetworkProcessing.swift
//  Sunny
//
//  Created by Bharath Kongara  on 3/2/16.
//

import Foundation

class NetworkProcessing{
    
    
   lazy var configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
   lazy var session:NSURLSession = NSURLSession(configuration: self.configuration)
    
    let url:NSURL
    
    init(url:NSURL){
        
        self.url = url
        
    }
    
    typealias jsonHandler = ([String:AnyObject]?-> Void)
    
    func downloadJSONFromText(completion:jsonHandler){
    
    
        let request = NSURLRequest(URL:self.url)
        let datatask = session.dataTaskWithRequest(request){(data,response, error) -> Void in
            
        // 1. check the error stuff
            if error == nil{
                
                if let httpResponse = response as? NSHTTPURLResponse{
                    
                    switch(httpResponse.statusCode){
                        
                    case 200:
                        
                        if let data = data{
                          
                            
                            do{
                                
                                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                                print("data",jsonDictionary)
                                
                            } catch let error as NSError{
                                
                                print("Error processing json data:",(error.localizedDescription))
                                
                            }
                            
        
                            
                        }
                            
                            
                        
                    default: break
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }else {
                
                
                print("Error:",(error?.localizedDescription))
            }
            
            
            
        }
    
        datatask.resume()
    }
    
    
}


// main queue : execute only UI code ( Handling animations, updating labels)
// other queues: download stuff, drawing and painting
//