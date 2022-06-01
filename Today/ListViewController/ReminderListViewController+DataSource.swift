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
        
        var doneButtonConfiguration = doneButtonConfiguration( for: reminder )
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        
        cell.accessories =
        [
            .customView( configuration: doneButtonConfiguration )
            , .disclosureIndicator( displayed: .always )
        ]

        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    private func doneButtonConfiguration(
        for reminder: Reminder
    ) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "clock.badge.checkmark.fill" : "clock.badge.exclamationmark"
        let symbolConfiguration = UIImage.SymbolConfiguration.preferringMulticolor() // Although symbols are images, they support many traits, such as font style, that you associate with text
        let image = UIImage(
            systemName: symbolName
            , withConfiguration: symbolConfiguration
        )
        let button = UIButton()
        button.setImage(
            image
            , for: .normal
        )
        
        return UICellAccessory.CustomViewConfiguration(
            customView: button
            , placement: .leading( displayed: .always )
        )
    }
}
