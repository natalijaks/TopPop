//
//  SongsCell.swift
//  TopPop
//
//  Created by Natalija Krsnik on 21/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import UIKit

class SongsCell: UITableViewCell {
    
    //MARK:- Common function
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElementPositions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Elements on screen
    /** Image view that holds the image / cover  of the album*/
    let songImage: UIImageView = {
        let img = UIImage(named: "background")
        let imgView = UIImageView(image:img!)
        imgView.layer.cornerRadius = 25
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.frame = CGRect(x: 30, y: 20, width: 50, height: 50)
        return imgView
    }()
    
    /** Label that holds the name of the song*/
    let lblSongName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "Baskerville", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /**Label that holds the name of the artist*/
    let lblArtistName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "Baskerville", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /** Label that holds the duration of the song*/
    let lblDuration: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "Baskerville", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /**Label that holds the position of the song*/
    let lblPosition: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .yellow
        label.font = UIFont(name: "Baskerville", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Custom function
    /**Setting up positions of the elements on screen using VFL ( Visual format language), adding subviews, color ... */
    func setupElementPositions(){
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.2
        
        addSubview(songImage)
        addSubview(lblPosition)
        addSubview(lblSongName)
        addSubview(lblArtistName)
        addSubview(lblDuration)
        
        lblPosition.shadow(UIColor.yellow)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : lblPosition]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[v1]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1" : lblSongName]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[v2]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v2" : lblArtistName]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v3]-50-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v3" : lblDuration]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : lblPosition]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v1]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1" : lblSongName]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v2]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v2" : lblArtistName]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v3]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v3" : lblDuration]))
    }
}
