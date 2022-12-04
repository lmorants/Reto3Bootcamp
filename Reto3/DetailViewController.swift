//
//  DetailViewController.swift
//  Reto3
//
//  Created by Luis Miguel Morante Santander on 3/12/22.
//

import UIKit

protocol DetailViewControllerDelegate{
    func deleteHomework(_ ViewController: DetailViewController, index: Int)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var priorityLabel: UILabel!
    
    var delegate: DetailViewControllerDelegate?
    
    var titleDetail: String?
    var descriptionDetail: String?
    var priorityDetail: String?
    var index: Int = 0
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let index = index
        delegate?.deleteHomework(self, index: index)
        dismiss(animated: true)
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        
        titleLabel.text = titleDetail
        descriptionLabel.text = descriptionDetail
        priorityLabel.text = priorityDetail
        descriptionLabel.isEditable = false
        
        super.viewDidLoad()

    }

}
