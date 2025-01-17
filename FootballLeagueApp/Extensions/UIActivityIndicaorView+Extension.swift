//
//  UIActivityIndicaorView+Extension.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 19/11/2024.
//

import Foundation
import UIKit
extension UIActivityIndicatorView {

    // Set up the activity indicator
    func setupActivityIndicator(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.color = .magenta
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.isHidden = true
    }

    // Show the activity indicator with animation
    func showActivityIndicator() {
            self.isHidden = false
            self.startAnimating()
    }

    // Hide the activity indicator with animation
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.stopAnimating()
                self.isHidden = true
            }

        }
            }
}
