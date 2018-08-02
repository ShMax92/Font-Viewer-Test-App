//
//  ViewController.swift
//  APALON_TestApp
//
//  Created by Maxim Shirko on 02.08.2018.
//  Copyright © 2018 com.MaximShirko. All rights reserved.
//

import UIKit

class FontCollectionViewController: UICollectionViewController{

    private let cellIdentifier = "Cell"
    private let segueIdentifier = "showDetailsSegue"
    private var fontToPass: MyFont!
    private let allFonts = MyFont.getAllFonts()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FontCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    // Number of items
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFonts.count
    }
    
    // Reusable Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: FontCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FontCollectionViewCell{
            
            let myFont = allFonts[indexPath.row]
            cell.titleLabel.font = myFont.font
            cell.descriptionLabel.font = UIFont.systemFont(ofSize: 15.0)
            cell.titleLabel.text = myFont.fontName
            cell.descriptionLabel.text = myFont.fontDescription
            
        return cell
        }
        return UICollectionViewCell()
    }
    
    // Item size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width / 2 - 6
        let height = self.view.bounds.height / 4 - 8
        
        
        return CGSize(width: width, height: height)
    }
    
    //minimumInteritemSpacing
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    //minimumLineSpacing
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier{
            if let indexPath = self.collectionView?.indexPathsForSelectedItems![0]{
                let controller = segue.destination as! FontViewController
                controller.myFont = allFonts[indexPath.row]
            }
        }
    }
}

