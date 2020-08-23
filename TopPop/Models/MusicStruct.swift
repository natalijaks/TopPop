//
//  MusicStruct.swift
//  TopPop
//
//  Created by Natalija Krsnik on 20/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation

struct Root: Decodable {
    var tracks:Tracks
    var albums:Albums
    var artists:Artists
    var playlists:Playlists
    var podcasts:Podcasts
}

struct Album: Codable {
    var id: Int
    var title: String
    var cover: String
    var cover_small: String
    var cover_medium: String
    var cover_big: String
    var cover_xl: String
    var tracklist: String
    var type: String
    
    init(idAlbum: Int, titleAlbum: String, coverAlbum: String, coverSAlbum: String, coverMAlbum: String, coverBAlbum: String, coverXAlbum: String, tracklistAblum: String, typeAlbum: String){
        self.id = idAlbum
        self.title = titleAlbum
        self.cover = coverAlbum
        self.cover_small = coverSAlbum
        self.cover_medium = coverMAlbum
        self.cover_big = coverBAlbum
        self.cover_xl = coverXAlbum
        self.tracklist = tracklistAblum
        self.type = typeAlbum
    }
}

struct User: Codable {
    var id: Int
    var name: String
    var tracklist: String
    var type: String
}

struct SongInfo: Codable {
    var songTitle: String
    var position: Int
    var duration: Int
    var artistName: String
    var albumID: Int
    var albumName: String
    var coverImg: String
}

struct AlbumInfo: Codable {
    var albumName: String
    var coverImg: String
}

