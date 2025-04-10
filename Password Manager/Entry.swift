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
    
    // Aufgabe 4.5 Passwort überprüfen
    
    func passwordContainsNumber() {
        if isPasswordNumber(self) {
            print("Das Passwort \(password) enthält eine Zahl.")
        } else {
            print("Das Passwort \(password) enthält keine Zahl. Es wird empfohlen das Passwort sicherer zu machen indem eine Zahl hinzugefügt wird.")
        }
    }
}
