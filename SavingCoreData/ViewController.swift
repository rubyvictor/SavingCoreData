//
//  ViewController.swift
//  SavingCoreData
//
//  Created by Victor Lee on 8/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var people = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .blue
    }

    @IBAction func didClickPlusButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Person", message: "message lah", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Age"
            textField.keyboardType = .numberPad // for letters only
        }
        
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            
            let name = alert.textFields?.first?.text
            let age = alert.textFields?.last?.text
            print("name\(name)", "age\(age)")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
}

