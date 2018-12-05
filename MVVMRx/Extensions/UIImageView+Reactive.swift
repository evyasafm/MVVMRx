//
//  UIImageView+Reactive.swift
//  MVVMRx
//
//  Created by Evyasaf on 12/3/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

extension Reactive where Base: UIImageView {

    public func imageUrl(placeholder: UIImage? = nil) -> Binder<URL?> {
        return Binder(base) { imageView, url in
            guard let url = url else {
                imageView.image = placeholder
                return
            }
            imageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
}
