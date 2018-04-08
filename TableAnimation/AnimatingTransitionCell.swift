//
//  AnimatingTransitionCell.swift
//  TableAnimation
//
//  Created by M. Zharif Hadi M. Khairuddin on 07/04/2018.
//  Copyright © 2018 M. Zharif Hadi M. Khairuddin. All rights reserved.
//

import Foundation
import UIKit

class AnimatingTransitionCell: UICollectionViewCell {
    
    var titleLabel: UILabel?
    var isBackWard: Bool?
    var iconImage: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.iconImage = UIImageView()
        self.iconImage?.backgroundColor = .black
        self.iconImage?.contentMode = .scaleAspectFill
        self.iconImage?.translatesAutoresizingMaskIntoConstraints = false
        self.iconImage?.clipsToBounds = true
        addSubview(self.iconImage!)
        
        self.titleLabel = UILabel()
        self.titleLabel?.backgroundColor = UIColor(white: 0, alpha: 0.03)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.textAlignment = .justified
        self.titleLabel?.textColor = .white
        addSubview(self.titleLabel!)
        
        self.iconImage?.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
//        self.iconImage?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
//        self.iconImage?.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
//        self.iconImage?.rightAnchor.constraint(equalTo: (self.titleLabel?.leftAnchor)!, constant: -40).isActive = true
        self.iconImage?.heightAnchor.constraint(equalToConstant: 120 * 9/16).isActive = true
        self.iconImage?.widthAnchor.constraint(equalToConstant: 40 * 16/9).isActive = true
        self.iconImage?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true;
        
        self.titleLabel?.widthAnchor.constraint(equalToConstant: 100 * 16/9).isActive = true
        self.titleLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.titleLabel?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
