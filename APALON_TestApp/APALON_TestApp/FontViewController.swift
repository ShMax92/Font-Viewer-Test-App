//
//  FontViewController.swift
//  APALON_TestApp
//
//  Created by Maxim Shirko on 02.08.2018.
//  Copyright © 2018 com.MaximShirko. All rights reserved.
//

import UIKit


class FontViewController: UIViewController {

    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var sizeLable: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    
    var myFont = MyFont()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleLabel.font = myFont.font
        
        exampleLabel.font.withSize(20)
        exampleLabel.textColor = UIColor.green
        
        //setup labels
        familyNameLabel.text = "Family: " + myFont.fontName
        weightLabel.text = "Weight: " + myFont.fontDescription
        sizeLable.text = "Size: " + String(describing: myFont.font.xHeight) + " points"
        exampleLabel.text = "example"
    }
}
