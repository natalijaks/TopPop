//
//  TracksStruct.swift
//  TopPop
//
//  Created by Natalija Krsnik on 22/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation

struct Tracks: Codable {
    var data: [Songs]
    var total: Int
    
    init (data:[Songs], total: Int){
        self.data = data
        self.total = total
    }
}

struct Songs: Codable {
    var id: Int
    var title: String
    var title_short: String
    var title_version: String
    var link: String?
    var duration: Int
    var rank: Int
    var explicit_lyrics: Bool
    var explicit_content_lyrics: Int
    var explicit_content_cover: Int
    var preview: String?
    var position: Int
    var artist :Artist
    var album:Album
    var type: String
    
    init (id: Int, title: String, titleShort: String,titleVersion: String, link: String?, duration: Int, rank: Int, explicitLyrics: Bool,explicitContentLyrics: Int,explicitContentCover: Int,preview: String?, position: Int, artist:Artist, album: Album,type: String){
        
        self.id = id
        self.title = title
        self.title_short = titleShort
        self.title_version = titleVersion
        self.link = link
        self.duration = duration
        self.rank = rank
        self.explicit_lyrics = explicitLyrics
        self.explicit_content_lyrics = explicitContentLyrics
        self.explicit_content_cover = explicitContentCover
        self.preview = preview
        self.position = position
        self.artist = artist
        self.album = album
        self.type = type
    }
}
