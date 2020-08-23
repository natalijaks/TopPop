//
//  Top10VC.swift
//  TopPop
//
//  Created by Natalija Krsnik on 20/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import UIKit

class Top10VC: UIViewController, UITableViewDelegate {
    var total = 0
    var tblSongs: UITableView = UITableView()
    var safeArea: UILayoutGuide = UILayoutGuide()
    var songsArray: [SongInfo] = []
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackgroundImg()
        setNavigationController()
        
        safeArea = view.layoutMarginsGuide
        tblSongs.delegate = self
        tblSongs.dataSource = self

        setupTable()
        parseJSON()
        setupRefreshSwipe()
    }
    
    /** Setup UIRefresh controll. Adding target, text, font...*/
    func setupRefreshSwipe(){
       refreshControl.addTarget(self, action: #selector(refreshSongData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.white
        
        let quote = "Fetching new songs"
        let font = UIFont.systemFont(ofSize: 20)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
        ]
        refreshControl.attributedTitle = NSAttributedString(string: quote, attributes: attributes)
    }
    
    /** Calls function parseJSON() which gets data from Deezer API on refresh*/
    @objc private func refreshSongData(_ sender: Any) {
        DispatchQueue.main.async {
            self.parseJSON()
        }
    }
    
    /** Sets title, title font, font size, colors and right button item on navigation controller*/
    func setNavigationController(){
        navigationItem.title = "Top Pop"
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font:UIFont(name: "Baskerville", size: 20) as Any]
        navController.navigationBar.barTintColor = .purple
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "...", style: .plain, target: self, action: #selector(onMenuTapped))
    }
    
    /** Opens drop down menu with options for sorting music by lenght asc, desc or default */
    @objc func onMenuTapped(){
        
        let alert = UIAlertController(title: "", message: "Sort by song length", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ascending", style: .default, handler: { action in
            self.songsArray.sort(by: {$0.duration < $1.duration})
            self.tblSongs.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Descending", style: .default, handler: { action in
            self.songsArray.sort(by: {$0.duration > $1.duration})
            self.tblSongs.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Default", style: .default, handler: { action in
            self.songsArray.sort(by: {$0.position < $1.position })
            self.tblSongs.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    /** Sets anchors to table view*/
    func setupTable(){
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tblSongs.refreshControl = refreshControl
        } else {
            tblSongs.addSubview(refreshControl)
        }
        
        view.addSubview(tblSongs)
        tblSongs.backgroundColor = .clear
        tblSongs.translatesAutoresizingMaskIntoConstraints = false
        tblSongs.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tblSongs.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tblSongs.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tblSongs.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    /**Gets JSON from deezer api and appends values to array*/
    func parseJSON(){
        tblSongs.register(SongsCell.self, forCellReuseIdentifier: "songsCell")
        
        if let url = URL(string:"https://api.deezer.com/chart") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                       let result = try JSONDecoder().decode(Root.self, from: data)
                        
                        var songName = ""
                        var duration = 0
                        var position = 0
                        var artistName = ""
                        var albumName = ""
                        var cover = ""
                        var albumID = 0
                        
                        let tracksData = result.tracks.data
                        self.total = result.tracks.total
                            for t in tracksData {
                                songName = t.title
                                duration = t.duration
                                position = t.position
                                artistName = t.artist.name
                                albumID = t.album.id
                                albumName = t.album.title
                                cover = t.album.cover_big
                                
                                let song = SongInfo(songTitle: songName, position: position, duration: duration, artistName: artistName, albumID: albumID, albumName: albumName, coverImg: cover)
                                
                                 self.songsArray.append(song)
                            }
                         DispatchQueue.main.async {
                            self.refreshControl.endRefreshing()
                         }
                    } catch let error {
                        print(error)
                    }
                    
                    OperationQueue.main.addOperation({
                        self.tblSongs.reloadData()
                    })
                }
                
            }.resume()
        }
    }
}


extension Top10VC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songsCell", for: indexPath) as! SongsCell
        cell.lblSongName.text = self.songsArray[indexPath.item].songTitle
        cell.lblArtistName.text = self.songsArray[indexPath.item].artistName
        cell.lblPosition.text = String(self.songsArray[indexPath.item].position)
        
        let cover = self.songsArray[indexPath.item].coverImg
        
         if cover != "" {
             //create url
             let url = URL(string:(cover))
             let d = URLSession.shared.dataTask(with: url!) { [weak self] (data, _, _) in
                 if let data = data {
                     DispatchQueue.main.async {
                         cell.songImage.image = UIImage(data: data)
                     }
                 }
             }
             d.resume()
         }

        let min = timeFormater(sec: self.songsArray[indexPath.item].duration)
        
        cell.lblDuration.text = min
        
        return cell
    }
    
    /**
     If user selects a cell, data about song will be passed via pushViewController
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SongVC()
        let songName = songsArray[indexPath.item].songTitle
        let songArtist = songsArray[indexPath.item].artistName
        let albumID = songsArray[indexPath.item].albumID
        let albumName = songsArray[indexPath.item].albumName
        let cover = songsArray[indexPath.item].coverImg
        
        vc.songName = songName
        vc.songArtist = songArtist
        vc.albumName = albumName
        vc.albumID = albumID
        vc.cover = cover
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
   
    /** Function that returns min:sec for given int song length */
    func timeFormater(sec: Int) -> String {
       let seconds: Int = sec % 60
       let minutes: Int = (sec / 60) % 60
       return String(format: "%02d:%02d", minutes, seconds)
    }
}
