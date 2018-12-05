//
//  CountryDetailsTableVC.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/5/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import MXParallaxHeader
import RxCocoa
import RxSwift

class CountryDetailsTableVC: UITableViewController {
    
    private var disposeBag = DisposeBag()
    
    private let viewModel: CountryDetailsViewModeling
    
    private lazy var parallaxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // Mark - Initializer
    
    init(viewModel: CountryDetailsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark - view controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
    }
    
}

fileprivate extension CountryDetailsTableVC {
    
    func setupViews() {
        tableView.parallaxHeader.view = parallaxImageView;
        tableView.parallaxHeader.height = 150;
        tableView.parallaxHeader.mode = MXParallaxHeaderMode.fill
        tableView.parallaxHeader.minimumHeight = 20;
    }
    
    func setupObservers() {
        viewModel.outputs
            .imageURL
            .drive(parallaxImageView.rx.imageUrl())
            .disposed(by: disposeBag)
    }
    
}
