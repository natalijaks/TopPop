//
//  AlbumStruct.swift
//  TopPop
//
//  Created by Natalija Krsnik on 22/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation

struct Genres: Codable {
    var data: [GenresData]
}

struct GenresData: Codable {
    var id: Int
    var name: String
    var picture: String
    var type: String
}

struct Contributors: Codable {
    var id: Int
    var name: String
    var link: String
    var share: String
    var picture: String
    var picture_small: String
    var picture_medium: String
    var picture_big: String
    var picture_xl: String
    var radio: Bool
    var tracklist: String
    var type: String
    var role: String
}

struct AlbumArtist: Codable {
    var id: Int
    var name: String
    var picture: String
    var picture_small: String
    var picture_medium: String
    var picture_big: String
    var picture_xl: String
    var tracklist: String
    var type: String
    
    init(idAlbum: Int, name: String, picture: String, pictureS: String, pictureM: String, pictureB: String, pictureXL: String, tracklist: String, type: String, role: String) {
        self.id = idAlbum
        self.name = name
        self.picture = picture
        self.picture_small = pictureS
        self.picture_medium = pictureM
        self.picture_big = pictureB
        self.picture_xl = pictureXL
        self.tracklist = tracklist
        self.type = type
    }
    
}

struct AlbumTracks: Codable {
    var data: [AlbumTrack]
}

struct AlbumTrack: Codable {
    var id: Int
    var readable: Bool
    var title: String
    var title_short: String
    var title_version: String
    var link: String
    var duration: Int
    var rank: Int
    var explicit_lyrics: Bool
    var explicit_content_lyrics: Int
    var explicit_content_cover: Int
    var preview: String
    var artist: TrackArtist
    var type: String
    
    init(idAlbum: Int, readable: Bool, title: String, titleShort: String, titleVersion: String, link: String, duration: Int, rank: Int, explLyrics: Bool, explContentLyrics: Int, explContentCover: Int, preview: String, artist: TrackArtist, type: String) {
    
        self.id = idAlbum
        self.readable = readable
        self.title = title
        self.title_short = titleShort
        self.title_version = titleVersion
        self.link = link
        self.duration = duration
        self.rank = rank
        self.explicit_lyrics = explLyrics
        self.explicit_content_lyrics = explContentLyrics
        self.explicit_content_cover = explContentCover
        self.preview = preview
        self.artist = artist
        self.type = type
    }
}

struct TrackArtist: Codable {
    var id: Int
    var name: String
    var tracklist: String
    var type: String
}

struct AlbumSongs: Codable {
    var id: Int
    var title: String
    var upc: String
    var link: String?
    var share: String
    var cover: String
    var cover_small: String
    var cover_medium: String
    var cover_big: String
    var cover_xl: String
    var genre_id: Int
    var genres: Genres
    var label: String
    var nb_tracks: Int
    var duration: Int
    var fans: Int
    var rating: Int
    var release_date: String
    var record_type: String
    var available: Bool
    var tracklist: String
    var explicit_lyrics: Bool
    var explicit_content_lyrics: Int
    var explicit_content_cover: Int
    var contributors: [Contributors]
    var artist: AlbumArtist
    var type: String
    var tracks:AlbumTracks
    
    
    init(idAlbum: Int, titleAlbum: String, upc: String, link: String?,share: String, cover: String,coverSmall: String, coverMedium: String,coverBig: String,coverXL: String,genreId: Int, genres: Genres, label: String, nbTracks: Int, duration: Int, fans: Int, rating: Int,releaseDate: String, recordType: String, available: Bool, tracklist: String,explicitLyrics: Bool,explicitContentLyrics: Int, explicitContentCover: Int, contributors: [Contributors],artist: AlbumArtist, type: String, tracks:AlbumTracks){
        self.id = idAlbum
        self.title = titleAlbum
        self.upc = upc
        self.link = link
        self.share = share
        self.cover = cover
        self.cover_small = coverSmall
        self.cover_medium = coverMedium
        self.cover_big = coverBig
        self.cover_xl = coverXL
        self.genre_id = genreId
        self.genres = genres
        self.label = label
        self.nb_tracks = nbTracks
        self.duration = duration
        self.fans = fans
        self.rating = rating
        self.release_date = releaseDate
        self.record_type = recordType
        self.available = available
        self.tracklist = tracklist
        self.explicit_lyrics = explicitLyrics
        self.explicit_content_lyrics = explicitContentLyrics
        self.explicit_content_cover = explicitContentCover
        self.contributors = contributors
        self.artist = artist
        self.type = type
        self.tracks = tracks
    }
}
