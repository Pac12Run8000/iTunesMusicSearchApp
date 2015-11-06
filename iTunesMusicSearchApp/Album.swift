//
//  Album.swift
//  iTunesMusicSearchApp
//
//  Created by MIchelle Grover on 11/5/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    var title:String!
    var artist:String!
    var genre:String!
    var artworkURL:String!
    
    init(title:String, artist:String, genre:String, artworkURL:String) {
        super.init()
        self.title = title
        self.artist = artist
        self.genre = genre
        self.artworkURL = artworkURL
    }
    
    
}
