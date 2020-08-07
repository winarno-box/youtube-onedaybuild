//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by agus winarno on 8/7/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        guard self.video != nil else {
            return
        }
        // set title
        self.titleLabel.text = video?.title
        
        // set date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //set thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //check cache before downloding data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            //set thumbnail image view
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //download the tumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // get the shared url
        let session = URLSession.shared
        
        // creted data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil || data != nil {
                
                
                ///save data on video caache
                CacheManager.setVideoCache(url!.absoluteString, data)
                // check the download url match with video url thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail{
                    
                    // video cell has been rycle for another video and no longer matches the thumbnail that was download
                    return
                }
                
                // cretaed the image object
                let image = UIImage(data: data!)
                
                // set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        //start data task
        dataTask.resume()
    }

}
