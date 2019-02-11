//
//  DetailViewController.swift
//  To-Do-List
//
//  Created by Jimmy Cassidy on 2/11/19.
//  Copyright © 2019 Jimmy Cassidy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ToDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoNoteView: UITextView!
    var toDoItem: String?
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoItem = toDoItem {
            ToDoField.text = toDoItem
            self.navigationItem.title = "Edit To-Do Item"
        } else {
            self.navigationItem.title = "New To-Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSavedButton()
        ToDoField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromSave" {
            toDoItem = ToDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    func enableDisableSavedButton() {
        if ToDoField.text!.count > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSavedButton()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
