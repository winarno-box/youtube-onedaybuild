//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by agus winarno on 8/3/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import Foundation


struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
}
