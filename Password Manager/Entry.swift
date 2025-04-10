//
//  Entry.swift
//  Password Manager
//
//  Created by Rylie Castell on 08.04.25.
//

import Foundation

// Aufgabe 1.2 Struct namens Eintrag modellieren

struct Entry: CustomStringConvertible {
    var id: Int
    var website: String
    var userName: String
    var password: String
    
    var description: String {
        "\(id). Website: \(website) - Username: \(userName) - Passwort: \(password)"
    }
    
    // Aufgabe 4.1 Eintrag erweitern
    
    func run(action: () -> ()) {
        action()
    }
}
