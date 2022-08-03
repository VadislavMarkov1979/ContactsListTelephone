//
//  Contact.swift
//  ContactsListTelephone
//
//  Created by Владимир Макаров on 12.03.2022.
//

import Foundation

struct Contact {
    let name: String
    let surName: String
    
    var fullName: String {
        "\(name) \(surName)"
    }
}
