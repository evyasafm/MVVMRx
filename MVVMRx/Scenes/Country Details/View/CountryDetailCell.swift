//
//  CountryDetailCell.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/10/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CountryDetailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!

    private var disposeBag = DisposeBag()
    
    private var viewModel: CountryDetailViewModeling!
    
    func configure(with viewModel: CountryDetailViewModeling) {
        self.viewModel = viewModel
        configureObservers()
    }
    
}

fileprivate extension CountryDetailCell {
    
    func configureObservers() {
        disposeBag = DisposeBag()
        
        viewModel.outputs
            .title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputs
            .detail
            .drive(detailsLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

