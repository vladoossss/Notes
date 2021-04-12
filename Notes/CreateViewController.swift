//
//  EntryViewController.swift
//  Notes
//
//  Created by user193665 on 3/2/21.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!

    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save note", style: .done, target: self, action: #selector(tapSave))
        // Do any additional setup after loading the view.
    }
    @objc func tapSave() {
           if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
               completion?(text, noteField.text)
           }
       }


}

