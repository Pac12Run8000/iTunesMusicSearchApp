//
//  iTunesConnection.swift
//  iTunesMusicSearchApp
//
//  Created by MIchelle Grover on 11/4/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class iTunesConnection: NSObject {
    class func getAlbumForString(searchString:String) {
        
    let url = NSURL(string: "https://itunes.apple.com/search?term=frozen&media=music")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            do {  let itunesDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                print(itunesDict)
            } catch {
                
            }
        }
        task.resume()
    }
}
