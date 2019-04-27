//
//  UICollectionView+extension.swift
//  MVVMRx
//
//  Created by Evyasaf on 1/9/19.
//  Copyright © 2019 evya. All rights reserved.
//

import UIKit

extension UICollectionViewCell: Reusable { }

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellClass: T.Type = T.self) {
        let bundle = Bundle(for: cellClass.self)
        if bundle.path(forResource: cellClass.reuseID, ofType: "nib") != nil {
            let nib = UINib(nibName: cellClass.reuseID, bundle: bundle)
            register(nib, forCellWithReuseIdentifier: cellClass.reuseID)
        } else {
            register(cellClass.self, forCellWithReuseIdentifier: cellClass.reuseID)
        }
    }
    
}
