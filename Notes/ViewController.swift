//
//  ViewController.swift
//  Notes
//
//  Created by user193665 on 3/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var turple: [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
        // Do any additional setup after loading the view.
    }
    
    // Create note
    @IBAction func didTapNewNote(){
        guard let vc = storyboard?.instantiateViewController(identifier: "create") as? CreateViewController else {
                    return
                }
                vc.title = "New Note"
                vc.navigationItem.largeTitleDisplayMode = .never
                vc.completion = { noteTitle, note in
                    self.navigationController?.popToRootViewController(animated: true)
                    self.turple.append((title: noteTitle, note: note))
                    self.label.isHidden = true
                    self.table.isHidden = false

                    self.table.reloadData()
                }
                navigationController?.pushViewController(vc, animated: true)
    }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return turple.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = turple[indexPath.row].title
            cell.detailTextLabel?.text = turple[indexPath.row].note
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

            let notes = turple[indexPath.row]

            // Show note controller
            guard let vc = storyboard?.instantiateViewController(identifier: "show") as? ShowViewController else {
                return
            }
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.title = "Your Note"
            vc.my_title = notes.title
            vc.my_note = notes.note
            navigationController?.pushViewController(vc, animated: true)
        }

}

