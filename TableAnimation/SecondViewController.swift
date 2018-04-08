//
//  SecondViewController.swift
//  TableAnimation
//
//  Created by M. Zharif Hadi M. Khairuddin on 08/04/2018.
//  Copyright © 2018 M. Zharif Hadi M. Khairuddin. All rights reserved.
//

import Foundation
import UIKit

class SeconViewController: UIViewController {
    
    var useAr = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        self.useAr.backgroundColor = .white
        self.useAr.setTitle("Back", for: .normal)
        self.useAr.setTitleColor(.black, for: .normal)
        self.useAr.translatesAutoresizingMaskIntoConstraints = false
        self.useAr.layer.cornerRadius = 5
        self.useAr.layer.borderWidth = 0.3
        self.useAr.addTarget(self, action: #selector(arbutton), for: .touchUpInside)
        self.view.addSubview(self.useAr)
        
        
        self.useAr.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.useAr.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.useAr.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.useAr.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    @objc func arbutton() {
        self.dismiss(animated: true, completion: nil)
    }
}
