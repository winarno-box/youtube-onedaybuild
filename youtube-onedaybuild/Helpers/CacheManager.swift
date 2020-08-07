//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by agus winarno on 8/7/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import Foundation


class CacheManager{
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
     
        //try get data for the spesified url
        return cache[url]
        
    }
}
