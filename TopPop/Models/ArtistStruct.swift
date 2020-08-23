//
//  ArtistStruct.swift
//  TopPop
//
//  Created by Natalija Krsnik on 22/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation

struct Artists: Codable {
    var data: [ArtistsData]
    var total: Int
}

struct ArtistsData: Codable {
    var id: Int
    var name: String
    var link: String
    var picture: String
    var picture_small: String
    var picture_medium: String
    var picture_big: String
    var picture_xl: String
    var radio: Bool
    var tracklist: String
    var position: Int
    var type: String
    
    init(idArtist: Int, nameArtist: String, linkArtist: String, pictureArtist: String,pictureSArtist: String, pictureMArtist: String, pictureBArtist: String, pictureXLArtist: String, radioArtist: Bool, tracklistArtist: String,position: Int, typeArtist: String){
        self.id = idArtist
        self.name = nameArtist
        self.link = linkArtist
        self.picture = pictureArtist
        self.picture_small = pictureSArtist
        self.picture_medium = pictureMArtist
        self.picture_big = pictureBArtist
        self.picture_xl = pictureXLArtist
        self.radio = radioArtist
        self.tracklist = tracklistArtist
        self.position = position
        self.type = typeArtist
    }
}
