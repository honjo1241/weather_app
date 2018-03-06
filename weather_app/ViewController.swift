//
//  ViewController.swift
//  weather_app
//
//  Created by 山田恭輔 on 2018/03/03.
//  Copyright © 2018年 山田恭輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var info: String?
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoLabel?.text = self.info
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

