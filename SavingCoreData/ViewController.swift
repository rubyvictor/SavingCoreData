//
//  ViewController.swift
//  SavingCoreData
//
//  Created by Victor Lee on 8/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let persons = try PersistenceService.context.fetch(fetchRequest)
            self.people = persons
            self.tableView.reloadData()
        } catch let fetchErr {
            print("Failed to fetch request\(fetchErr)")
        }
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
            
            let person = Person(context: PersistenceService.context)
            person.name = name
            
            guard let unwrappedAge = Int16(age ?? "") else { return }
            person.age = unwrappedAge
            
            PersistenceService.saveContext()
            
            self.people.append(person)
            self.tableView.reloadData()
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
        
        cell.textLabel?.text = people[indexPath.row].name
        cell.detailTextLabel?.text = String(people[indexPath.row].age)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
}

