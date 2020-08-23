//
//  SongVC.swift
//  TopPop
//
//  Created by Natalija Krsnik on 21/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import UIKit

class SongVC: UIViewController {
    var safeArea: UILayoutGuide = UILayoutGuide()
    var masterView = UIView()
    var songName:String = ""
    var songArtist:String = ""
    var albumName:String = ""
    var albumID:Int = 0
    var cover:String = ""
    var albumsSongs: [String] = []
    lazy var contentView = CGSize(width: view.frame.width, height: view.frame.height + 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        view.addBackgroundImg()
        fillData()
        
        setElementsOnScreen()
        parseJSON()
    }
   
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame:.zero)
        view.backgroundColor = .clear
        view.contentSize = contentView
        view.frame = self.view.bounds
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        return view
    }()
    
    let coverImage: UIImageView = {
        let img = UIImage(named: "background")
        let imgView = UIImageView(image:img!)
        imgView.layer.cornerRadius = 40
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.frame = CGRect(x: 10, y: 300, width: 100, height: 100)
        return imgView
    }()
    
    let lblSongName: UILabel = {
           let label = UILabel()
           label.textColor = .white
           label.font = UIFont(name: "Baskerville", size: 25)
           label.translatesAutoresizingMaskIntoConstraints = false
           
           return label
       }()
    let lblArtistName: UILabel = {
           let label = UILabel()
           label.textColor = .white
           label.font = UIFont(name: "Baskerville", size: 20)
           label.translatesAutoresizingMaskIntoConstraints = false
           
           return label
       }()
    let lblAlbumName: UILabel = {
           let label = UILabel()
           label.textColor = .white
           label.font = UIFont(name: "Baskerville", size: 20)
           label.translatesAutoresizingMaskIntoConstraints = false
           
           return label
       }()
    let lblAlbumSongs: UILabel = {
           let label = UILabel()
           label.textColor = .white
           label.font = UIFont(name: "Baskerville", size: 20)
           label.translatesAutoresizingMaskIntoConstraints = false
           
           return label
       }()
    
    func setElementsOnScreen(){
        
        scrollView.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height + 10)
        
        view.addSubview(scrollView)
        scrollView.addSubview(masterView)
      
        masterView.frame.size = contentView
        masterView.addSubview(coverImage)
        masterView.addSubview(lblSongName)
        masterView.addSubview(lblArtistName)
        masterView.addSubview(lblAlbumName)
        masterView.addSubview(lblAlbumSongs)
        
        lblSongName.shadow(UIColor.lightGray)
       
        masterView.translatesAutoresizingMaskIntoConstraints = false
       
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        coverImage.centerXAnchor.constraint(lessThanOrEqualTo: self.view.centerXAnchor).isActive = true
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : lblSongName]))
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v1]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1" : lblArtistName]))
    
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v2]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v2" : lblAlbumSongs]))
        
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v3]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v3" : lblAlbumName]))
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-310-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : lblSongName]))
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-340-[v1]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1" : lblArtistName]))
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-420-[v2]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v2" : lblAlbumSongs]))
        
    masterView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-380-[v3]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v3" : lblAlbumName]))
       
    }
    
    func fillData(){
        lblSongName.text = "Song name: " + songName
        lblArtistName.text = "Artist: " + songArtist
        lblAlbumName.text = "Album name: " + albumName
        
        //image
        if cover != "" {
            //create url
            let url = URL(string:(cover))
            let d = URLSession.shared.dataTask(with: url!) { [weak self] (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.coverImage.image = UIImage(data: data)
                    }
                }
            }
            d.resume()
        }
    }

    func parseJSON(){
        if let url = URL(string:"https://api.deezer.com/album/" + String(albumID)) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                       let result = try JSONDecoder().decode(AlbumSongs.self, from: data)
                        let tracks = result.tracks.data
                        
                        for t in tracks {
                            if t.title != "" {
                                self.albumsSongs.append(t.title)
                            }
                        }
                        
                        if self.albumsSongs.count > 0 {
                            let songsJoined = self.albumsSongs.joined(separator:"\n")
                            
                            OperationQueue.main.addOperation({
                                self.lblAlbumSongs.numberOfLines = 0
                                self.lblAlbumSongs.text = "Album songs:\n" + songsJoined
                            })
                        }
                    } catch let error {
                        print(error)
                    }
                }
                
            }.resume()
        }
    }
}
