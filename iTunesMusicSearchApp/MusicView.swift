//
//  MusicView.swift
//  iTunesMusicSearchApp
//
//  Created by MIchelle Grover on 11/6/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class MusicView: UIView {

    @IBOutlet weak var imgArtwork: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    
    func addDataToMusicView(album:Album) {
        self.imgArtwork.image = UIImage(data: NSData(contentsOfURL: NSURL(string: album.artworkURL)!)!) 
        self.lblTitle.text = album.title
        self.lblArtist.text = album.artist
        self.lblGenre.text = album.genre
        self.backgroundColor = UIColor(red: 0.31, green: 1.00, blue: 0.70, alpha: 1.0)
        self.imgArtwork.layer.cornerRadius = 10
        
       
    }

}
