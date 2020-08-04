//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by agus winarno on 8/1/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

