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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // confirm that video was selected
        guard tableView.indexPathForSelectedRow != nil else {
           
            return
        }
        
        // get reference  to the video was tapped on
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // get a reference to detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // set video property to dteail view controller
        detailVC.video = selectedVideo
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        // configure the cell with the data
        //get the title for the video in question
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //return the cell
        return cell
        
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    


}

