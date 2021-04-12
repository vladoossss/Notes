//
//  NoteViewController.swift
//  Notes
//
//  Created by user193665 on 3/2/21.
//

import UIKit

class ShowViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!

    public var my_title: String = ""
    public var my_note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = my_title
        noteLabel.text = my_note

    }
    

}

