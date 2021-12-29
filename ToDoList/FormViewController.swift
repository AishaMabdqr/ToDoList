//
//  FormViewController.swift
//  ToDoList
//
//  Created by A Ab. on 26/05/1443 AH.
//

import UIKit

protocol FormViewDelegate{
    func cancelButtonPressed(with viewContoller: UIViewController)
    func addItemPressed(title: String, notes: String, date: String)
}

class FormViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var titleTF: UITextField!
    
    var currentDate: String?
    
    var formVCDelegate: FormViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short

        currentDate = dateFormatter.string(from: datePicker.date)
        
    }
    
    @IBAction func addBut(_ sender: UIButton) {
        
        guard let title = titleTF.text, title != "" else {
            return
        }
        guard let notes = notes.text, notes != "" else {
            return
        }
        
        if let currentDate = currentDate {
            formVCDelegate?.addItemPressed(title: title , notes: notes, date: currentDate)
            formVCDelegate?.cancelButtonPressed(with: self)
        }else{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            currentDate = dateFormatter.string(from: datePicker.date)
            
            formVCDelegate?.addItemPressed(title: title, notes: notes, date: currentDate!)
            formVCDelegate?.cancelButtonPressed(with: self)
        }
        
    }
    
    
    @IBAction func cancelBut(_ sender: UIBarButtonItem) {
        formVCDelegate?.cancelButtonPressed(with: self)
    }
    
    
}
