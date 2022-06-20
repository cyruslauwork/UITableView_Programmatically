//
//  ContactsViewController.swift
//  UITableView_Programmatically
//
//  Created by Cyrus on 18/6/2022.
//

// * 1.4

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let contacts = ContactAPI.getContacts() // model
    let contactsTableView = UITableView() // view

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: - UIViewController
        
        view.backgroundColor = .red
        
        // UITableView
        view.addSubview(contactsTableView)
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
//        contactsTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
//        contactsTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
//        contactsTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
//        contactsTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        func setUpNavigation() {
            navigationItem.title = "Contacts"
            self.navigationController?.navigationBar.barTintColor = UIColor.black
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        }
        
        // MARK: - UITableViewDataSource
        
        contactsTableView.dataSource = self
//        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        // MARK: - UITableViewDelegate
        
        contactsTableView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UITableViewDataSource 2
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
//        cell.textLabel?.text = contacts[indexPath.row].name
        cell.contact = contacts[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate 2
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
