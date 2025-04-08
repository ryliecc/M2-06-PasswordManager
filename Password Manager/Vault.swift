//
//  Vault.swift
//  Password Manager
//
//  Created by Rylie Castell on 08.04.25.
//

import Foundation

// Aufgabe 1.3 Klasse Tresor anlegen

class Vault {
    private var masterPassword: String
    var entries: [Entry] = []
    
    init(masterPassword: String) {
        self.masterPassword = masterPassword
    }
    
    func addEntry(_ newEntries: Entry...) {
        for entry in newEntries {
            entries.append(entry)
        }
    }
    
    func printAllEntries(password: String) {
        if password == masterPassword {
            for entry in entries {
                        print(entry)
                    }
        } else {
            print("Warnung! Falsches Passwort!")
        }
    }
}
