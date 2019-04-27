//
//  HeroHelper.swift
//  MVVMRx
//
//  Created by Evyasaf on 1/12/19.
//  Copyright © 2019 evya. All rights reserved.
//

import Foundation
import UIKit
import Hero

class HeroHelper: NSObject {
    
    private weak var navigationController: UINavigationController?
    
    func configureHero(in navigationController: UINavigationController) {
        guard let topViewController = navigationController.topViewController else {
            return
        }
        self.navigationController = navigationController
        topViewController.hero.isEnabled = true
        navigationController.hero.navigationAnimationType = .fade
        navigationController.hero.isEnabled = true
        navigationController.delegate = self
    }
}

//Navigation Popping
private extension HeroHelper {
    private func addEdgePanGesture(to view: UIView) {
        let pan = UIScreenEdgePanGestureRecognizer(target: self, action:#selector(popViewController(_:)))
        pan.edges = .left
        view.addGestureRecognizer(pan)
    }
    
    @objc private func popViewController(_ gesture: UIScreenEdgePanGestureRecognizer) {
        guard let view = gesture.view else { return }
        let translation = gesture.translation(in: nil)
        let progress = translation.x / 2 / view.bounds.width
        
        switch gesture.state {
        case .began:
            navigationController?.topViewController?.hero.dismissViewController()
        case .changed:
            Hero.shared.update(progress)
        default:
            if progress + gesture.velocity(in: nil).x / view.bounds.width > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
}


//Navigation Controller Delegate
extension HeroHelper: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return Hero.shared.navigationController(navigationController, interactionControllerFor: animationController)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            addEdgePanGesture(to: toVC.view)
        }
        return Hero.shared.navigationController(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
    }
}
