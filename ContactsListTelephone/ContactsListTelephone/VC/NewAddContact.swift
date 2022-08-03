//
//  NewAddContact.swift
//  ContactsListTelephone
//
//  Created by Владимир Макаров on 12.03.2022.
//

import UIKit

class NewAddContact: UIViewController {
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var firstNamwTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    var delegate: NewAddContactDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNamwTF.addTarget(
            self,
            action: #selector(firstNamwTFDidChenged),
            for: .editingChanged)
    }
    
    @IBAction func pressedDone(_ sender: Any) {
        saveAndExit()
    }
    
    @IBAction func pressedCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc private func firstNamwTFDidChenged() {
        guard let firstName = firstNamwTF.text else { return }
        doneButton.isEnabled = !firstName.isEmpty ? true : false
    }
    
    private func saveAndExit() {
        guard let firstName = firstNamwTF.text else { return }
        guard let lastName = lastNameTF.text else { return }
        
        let contact = Contact(name: firstName, surName: lastName)
//        UserDefaults.standard.set(fullName, forKey: "ContactName")
        
        delegate.saveContact(contact)
        dismiss(animated: true)
    }
    
}
