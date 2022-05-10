//
//  ViewController.swift
//  Today
//
//  Created by user on 10/05/22.
//

import UIKit

class ReminderListViewController: UICollectionViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
    }

    func listLayout() -> UICollectionViewCompositionalLayout
    {
        var listConfiguration = UICollectionLayoutListConfiguration(
            appearance: .grouped
        ) // creates a section in a list layout
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(
            using: listConfiguration
        )
    }

}

