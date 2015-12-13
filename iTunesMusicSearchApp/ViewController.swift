//
//  ViewController.swift
//  iTunesMusicSearchApp
//
//  Created by MIchelle Grover on 11/4/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var lblMusicSearchTitle: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var scrollResults: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var btnSearchOutPut: UIButton!
    
    var numberOfItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageIndicator.numberOfPages = 0
        self.scrollResults.delegate = self
        
        self.lblMusicSearchTitle.layer.backgroundColor = UIColor(red: 0.24, green: 0.91, blue: 0.30, alpha: 1.0).CGColor
        self.lblMusicSearchTitle.textColor = UIColor.whiteColor()
        self.view.backgroundColor = UIColor(red: 0.60, green: 1.00, blue: 0.26, alpha: 1.0)
        self.btnSearchOutPut.layer.backgroundColor = UIColor(red: 0.16, green: 0.61, blue: 1.00, alpha: 1.0).CGColor
        self.txtSearch.backgroundColor = UIColor(red: 0.31, green: 1.00, blue: 0.70, alpha: 1.0)
        self.txtSearch.layer.borderWidth = 3
        self.txtSearch.layer.borderColor = UIColor.blackColor().CGColor
        self.txtSearch.layer.cornerRadius = 5
        self.scrollResults.backgroundColor = UIColor(red: 0.31, green: 1.00, blue: 0.70, alpha: 1.0)
        self.btnSearchOutPut.layer.cornerRadius = 5
        self.scrollResults.layer.cornerRadius = 10
        
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

