//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by user on 01/06/22.
//

import UIKit

extension ReminderListViewController
{
    
    typealias DataSource = UICollectionViewDiffableDataSource< Int, String >
    typealias Snapshot = NSDiffableDataSourceSnapshot< Int, String >
    
    func cellRegistrationHandler(
        cell: UICollectionViewListCell
        , indexPath: IndexPath
        , id: String
    ) {
        let reminder = Reminder.sampleData[ indexPath.item ]
        
        var contentConfiguration = cell.defaultContentConfiguration() // creates a content configuration with the predefined system style
        contentConfiguration.text = reminder.title // the list displays the configuration text as the primary text of a cell
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont( forTextStyle: .caption1 )
        cell.contentConfiguration = contentConfiguration
    }
}
