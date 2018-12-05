//
//  CountryCell.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/4/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import RxSwift

class CountryCell: UITableViewCell {
    
    // Mark - Private Properties
    
    private var disposeBag = DisposeBag()
    private var viewModel: CountryViewModeling!
    
    // Mark - Internal Properties
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    // Mark - Internal Methods
    
    func configure(with viewModel: CountryViewModeling) {
        self.viewModel = viewModel
        configureViews()
    }

}

extension CountryCell {
    
    func configureViews() {
        disposeBag = DisposeBag()
        
        viewModel.outputs
            .imageURL
            .drive(iconImageView.rx.imageUrl())
            .disposed(by: disposeBag)
        
        viewModel.outputs
            .name
            .drive(nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputs
            .nativeName
            .drive(nativeNameLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

