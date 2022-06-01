//
//  ViewController.swift
//  Today
//
//  Created by user on 10/05/22.
//

import UIKit

class ReminderListViewController: UICollectionViewController
{
    var dataSource: DataSource!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration( handler: cellRegistrationHandler ) // function as the handler parameter
        
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
        
        var snapshot = Snapshot()
        snapshot.appendSections( [0] ) // a single section
        snapshot.appendItems(
            Reminder.sampleData.map {
                $0.title } ) // .map returns a new array with only the reminder titles, which populate as items in the snapshot
        dataSource.apply( snapshot ) //reflects the changes in the user interface
        
        collectionView.dataSource = dataSource
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

