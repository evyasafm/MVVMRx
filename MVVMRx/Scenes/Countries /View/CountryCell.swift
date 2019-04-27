//
//  CountryCell.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/4/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import RxSwift
import Hero

class CountryCell: UITableViewCell {
    
    // Mark - Internal Properties
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    // Mark - Private Properties
    
    private var disposeBag = DisposeBag()
    private var viewModel: CountryViewModeling!
    
    // Mark - Internal Methods
    
    func configure(with viewModel: CountryViewModeling) {
        self.viewModel = viewModel
        configureObservers()
    }

}

fileprivate extension CountryCell {
    
    func configureObservers() {
        disposeBag = DisposeBag()
        
        viewModel.outputs.imageURL
            .bind(to: iconImageView.rx.imageUrl())
            .disposed(by: disposeBag)
        
        viewModel.outputs.name
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputs.nativeName
            .bind(to: nativeNameLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

