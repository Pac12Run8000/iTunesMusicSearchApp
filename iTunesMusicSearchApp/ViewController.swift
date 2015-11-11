//
//  ViewController.swift
//  iTunesMusicSearchApp
//
//  Created by MIchelle Grover on 11/4/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var scrollResults: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var numberOfItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageIndicator.numberOfPages = 0
        self.scrollResults.delegate = self
        
        
    }

    @IBAction func btnSearchForMusic(sender: AnyObject) {
        self.txtSearch.resignFirstResponder()
        iTunesConnection.getAlbumForString(self.txtSearch.text!) { (album:Album) -> () in
            
            self.numberOfItems++
            self.pageIndicator.numberOfPages = self.numberOfItems
            
            self.scrollResults.contentSize = CGSizeMake(CGFloat(self.numberOfItems) * self.scrollResults.frame.size.width, self.scrollResults.frame.size.height)
            
        let musicView = NSBundle.mainBundle().loadNibNamed("MusicView", owner: self, options: nil).last as! MusicView
            musicView.frame = CGRectMake(CGFloat(self.numberOfItems - 1) * self.scrollResults.frame.size.width, 0, self.scrollResults.frame.size.width, self.scrollResults.frame.size.height)
            musicView.updateConstraints()
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                musicView.addDataToMusicView(album)
                self.scrollResults.addSubview(musicView)
                
                self.scrollResults.scrollRectToVisible(musicView.frame, animated: true)
            })
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = Int(self.scrollResults.contentOffset.x/self.scrollResults.frame.size.width)
        pageIndicator.currentPage = page
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

