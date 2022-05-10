//
//  ViewController.swift
//  Today
//
//  Created by user on 10/05/22.
//

import UIKit

class ReminderListViewController: UICollectionViewController
{
    typealias DataSource = UICollectionViewDiffableDataSource< Int, String >
    
    var dataSource = DataSource!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration // specifies how to configure the content and the appearence of the cell
        { ( cell: UICollectionViewListCell
            , indexPath: IndexPath
            , itemIdentifier: String ) in
            
            let reminder = Reminder.sampleData[ indexPath.item ]
            
            var contentConfiguration = cell.defaultContentConfiguration() // creates a content configuration with the predefined system style
            contentConfiguration.text = reminder.title // the list displays the configuration text as the primary text of a cell
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(
            collectionView: collectionView )
        { ( collectionView: UICollectionView
            , indexPath: IndexPath
            , itemIdentifier: String ) in // configure and returns a cell for a collection view
            
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration
                , for: indexPath
                , item: itemIdentifier )
        }
    }

    private func listLayout() -> UICollectionViewCompositionalLayout
    {
        var listConfiguration = UICollectionLayoutListConfiguration( // creates a section in a list layout
            appearance: .grouped )
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(
            using: listConfiguration )
    }

}

