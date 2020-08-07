//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by agus winarno on 8/3/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import Foundation


protocol modelDelegate{
    func videoFetched(_ videos:[Video])
    
}


class Model {
    
    var delegate:modelDelegate?
    
    func getVideos(){
        
        // created url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get url sessions object
        let session = URLSession.shared
        
        //get a data task from the url session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there were error
            if error != nil || data == nil {
                return
            }
            
            do{
                
                // parsing data in the videos
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        // call the "videosFetched" method to delegate
                        self.delegate?.videoFetched(response.items!)
                    }
                    
                }
                
                //dump(response)
                
            }catch{
                
            }
            
        }
        
        //kick of the task
        dataTask.resume()
        
    }
}
