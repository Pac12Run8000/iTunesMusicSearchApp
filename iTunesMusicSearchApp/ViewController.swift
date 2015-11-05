//
//  ViewController.swift
//  iTunesMusicSearchApp
//
//  Created by MIchelle Grover on 11/4/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        iTunesConnection.getAlbumForString("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

