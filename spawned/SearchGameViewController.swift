//
//  SearchGameViewController.swift
//  spawned
//
//  Created by MachuPichu on 13/12/2016.
//  Copyright © 2016 untstudio. All rights reserved.
//

import UIKit

class SearchGameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let segue_identifier = "searchGame_viewcontroller_identifier"
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Class variables
    
    var arrayOfGames = [Game]()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData()

        setupCollectionView()
    }
    
    // MARK: Setup View
    
    func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        
    }

    // MARK: API HAndler
    
    private func getData() {
        
        let defaults =  UserDefaults.standard
        let userToken: String!
        userToken = defaults.string(forKey: "access_token")
            
        APIHandler.searchGames(
            userToken: userToken,
            success: { (response) in
                
                print(response)
            },
            failure: { (error) in
                
                print(error)
        })
    }
    

    // MARK: - UICollectionView DataSrouce
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchGameHeaderTitle", for: indexPath)
        return headerView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchGameCell.cellIdentifier, for: indexPath) as! SearchGameCell
        cell.backgroundColor = .red
    
        return cell
        
    }
    
    // MARK: - UICollectionView FlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 20, height: 386/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 20, 10)
    }
    
    // MARK: - UICollectionView Delegate


}
