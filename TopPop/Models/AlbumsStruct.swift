//
//  AlbumsStruct.swift
//  TopPop
//
//  Created by Natalija Krsnik on 22/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation

struct Albums: Codable {
    var data: [AlbumsData]
    var total: Int
}

struct AlbumsData: Codable {
    var id: Int
    var title: String
    var link: String
    var cover: String
    var cover_small: String
    var cover_medium: String
    var cover_big: String
    var cover_xl: String
    var record_type: String
    var tracklist: String
    var explicit_lyrics: Bool
    var position: Int
    var artist: Artist
    var type: String
    
    init(idAlbum: Int, titleAlbum: String,link: String, coverAlbum: String, coverSAlbum: String, coverMAlbum: String, coverBAlbum: String, coverXAlbum: String,recordType: String, tracklistAblum: String,explicitLyrics: Bool, position: Int, artist: Artist, typeAlbum: String){
        self.id = idAlbum
        self.title = titleAlbum
        self.link = link
        self.cover = coverAlbum
        self.cover_small = coverSAlbum
        self.cover_medium = coverMAlbum
        self.cover_big = coverBAlbum
        self.cover_xl = coverXAlbum
        self.record_type = recordType
        self.tracklist = tracklistAblum
        self.explicit_lyrics = explicitLyrics
        self.position = position
        self.artist = artist
        self.type = typeAlbum
    }
}

struct Artist: Codable {
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
    var type: String
    
    init(idArtist: Int, nameArtist: String, linkArtist: String, pictureArtist: String,pictureSArtist: String, pictureMArtist: String, pictureBArtist: String, pictureXLArtist: String, radioArtist: Bool, tracklistArtist: String, typeArtist: String){
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
        self.type = typeArtist
    }
}

