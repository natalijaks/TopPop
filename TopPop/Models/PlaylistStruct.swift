//
//  PlaylistStruct.swift
//  TopPop
//
//  Created by Natalija Krsnik on 22/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation

struct Playlists: Codable{
    var data: [PlaylistsData]
    var total: Int
}

struct PlaylistsData: Codable {
    var id: Int
    var title: String
    var `public`: Bool
    var nb_tracks: Int
    var link: String
    var picture: String
    var picture_small: String
    var picture_medium: String
    var picture_big: String
    var picture_xl: String
    var checksum: String
    var tracklist: String
    var creation_date: String
    var user: User
    var type: String
    
    init(idArtist: Int, title: String, `public`: Bool,nbTracks: Int,link: String, pictureArtist: String,pictureSArtist: String, pictureMArtist: String, pictureBArtist: String, pictureXLArtist: String, checksum: String, tracklistArtist: String,creationDate: String, user: User, typeArtist: String){
        self.id = idArtist
        self.title = title
        self.`public` = `public`
        self.nb_tracks = nbTracks
        self.link = link
        self.picture = pictureArtist
        self.picture_small = pictureSArtist
        self.picture_medium = pictureMArtist
        self.picture_big = pictureBArtist
        self.picture_xl = pictureXLArtist
        self.checksum = checksum
        self.tracklist = tracklistArtist
        self.creation_date = creationDate
        self.user = user
        self.type = typeArtist
    }
}
