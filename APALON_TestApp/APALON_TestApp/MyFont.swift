//
//  MyFont.swift
//  APALON_TestApp
//
//  Created by Maxim Shirko on 02.08.2018.
//  Copyright © 2018 com.MaximShirko. All rights reserved.
//

import UIKit


struct MyFont{
    let font: UIFont
    let fontName: String
    let fontDescription: String
    
    init() {
        self.font = UIFont(name: "Arial", size: 20)!
        self.fontName = ""
        self.fontDescription = ""
    }
    
    init(font: UIFont, fontName: String, fontDescription: String) {
        self.font = font
        self.fontName = fontName
        self.fontDescription = fontDescription
    }
    
    static func getAllFonts() -> [MyFont]{
        var allFonts = [MyFont]()
        let attributeName = UIFontDescriptor.AttributeName.face
        
        let familyNames = UIFont.familyNames
        for familyName in familyNames{
            for name in UIFont.fontNames(forFamilyName: familyName){
                
                let myFont = UIFont(name: name, size: 20)
                let attribute = UIFontDescriptor.object((myFont?.fontDescriptor)!)
                let fontDescription = attribute(attributeName) as! String
                
                let font = MyFont(font: myFont!, fontName: familyName, fontDescription: fontDescription)
                allFonts.append(font)
            }
        }
        return allFonts
    }
}
