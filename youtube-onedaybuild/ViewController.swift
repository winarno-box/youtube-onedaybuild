//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by agus winarno on 8/1/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, modelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set it self to datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
     // MARK: - model Delegate Methods
    
    func videoFetched(_ videos: [Video]) {
        
        // set the return videos to our video property
        self.videos = videos
        
        //refresh the table view
        tableView.reloadData()
    }
    
    // MARK: - Talbbe View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return videos.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        // configure the cell with the data
        //get the title for the video in question
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        //return the cell
        return cell
        
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    


}

