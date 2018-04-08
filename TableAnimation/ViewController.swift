//
//  ViewController.swift
//  TableAnimation
//
//  Created by M. Zharif Hadi M. Khairuddin on 07/04/2018.
//  Copyright © 2018 M. Zharif Hadi M. Khairuddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentSelection: Int?
    var collectionView: UICollectionView?
    var currentSelectedIndexPath: IndexPath?
    var cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        if let collectionView = self.collectionView {
            collectionView.backgroundColor = .white
            collectionView.showsVerticalScrollIndicator = false
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.delegate = self
            collectionView.dataSource = self
            view.addSubview(collectionView)
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            collectionView.register(AnimatingTransitionCell.self, forCellWithReuseIdentifier: cellId)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animationToOrigin()
    }
    
    
    func animationToOrigin() {
        // Remove the selection items
        guard let selection = self.collectionView?.indexPathsForSelectedItems?.first else { return }
        self.collectionView?.deselectItem(at: selection, animated: true)
        // Animate to the default height
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
//            cell.iconImage?.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.collectionView?.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
            self.collectionView?.performBatchUpdates(nil, completion: nil)
        }, completion: nil)
    }
    
    func transitionBetweenControllers(_ indexPath: IndexPath)
    {
        var indexPath = indexPath
        if indexPath.row == 0 {
            let viewController = SeconViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            present(navigationController, animated: true, completion: nil)
        }
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AnimatingTransitionCell
        cell.backgroundColor = UIColor.clear
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.1;
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        
        cell.titleLabel?.text = "here"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
//        let cell = AnimatingTransitionCell()
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//            cell.iconImage?.transform = CGAffineTransform(scaleX: 2, y: 2)
            collectionView.performBatchUpdates(nil, completion: nil)
        }, completion: { (finished) in
            let delayInSeconds: NSInteger = 1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(delayInSeconds), execute: {
                self.transitionBetweenControllers(indexPath)
            })
        })
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.indexPathsForSelectedItems?.first {
            case .some(indexPath):
                return CGSize(width: view.frame.width, height: view.frame.height) // your selected height
            default:
                let height = (view.frame.width) * 9 / 16
                return CGSize(width: view.frame.width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}


