//
//  ContactsVC.swift
//  ContactsListTelephone
//
//  Created by Владимир Макаров on 12.03.2022.
//

import UIKit

protocol NewAddContactDelegate {
    func saveContact(_ contact: Contact)
}

class ContactsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = []
                   
                   
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = UserDefaults.standard.string(forKey: "ContactName") {
            contacts.append(contact)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewAddContact
        newContactVC.delegate = self
    }
    
}

extension ContactsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        cell.contentConfiguration = content
        return cell
    }
}

extension ContactsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        contacts.remove(at: indexPath.row)
        UserDefaults.standard.removeObject(forKey: "ContactName")
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
}

extension ContactsVC: NewAddContactDelegate {
    func saveContact(_ contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
