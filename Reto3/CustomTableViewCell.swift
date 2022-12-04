//
//  CustomTableViewCell.swift
//  Reto3
//
//  Created by Luis Miguel Morante Santander on 3/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    func setup(homework: Homework){
        titleLabel.text = homework.title
        descriptionTextView.text = homework.description
        descriptionTextView.isEditable = false
        priorityLabel.text = homework.priority
    }

}
