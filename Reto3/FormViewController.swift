//
//  FormViewController.swift
//  Reto3
//
//  Created by Luis Miguel Morante Santander on 3/12/22.
//

import UIKit

protocol FormViewControllerDelegate{
    func FormViewController(_ ViewController: FormViewController, didCreateTarea newHomework: Homework)
}

class FormViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priorityTextField: UITextField!
    
    var delegate: FormViewControllerDelegate?
    
    @IBAction func saveButton(_ sender: Any) {
        
        let titleTextField = titleTextField.text
        let descriptionTextField = descriptionTextField.text
        let priorityTextField = priorityTextField.text
      
        
        guard let title = titleTextField, !title.isEmpty else {return}
        guard let description = descriptionTextField, !description.isEmpty else {return}
        guard let priority = priorityTextField, !priority.isEmpty else {return}
        
        let newHomework = Homework(title: title, description: description, priority: priority)
        
        delegate?.FormViewController(self, didCreateTarea: newHomework)
        
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
