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
            entryCounter += 1
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
    
    // Aufgabe 1.4 Methode, um neue Einträge zu erstellen
    
    var entryCounter: Int = 0
    
    func createNewEntry() -> Entry {
        print("Für welche Website soll der Eintrag erstellt werden?")
        var website: String = readLine()!
        print("Wie ist dein Benutzername?")
        var userName: String = readLine()!
        print("Wie ist dein Passwort?")
        var password: String = readLine()!
        var newEntry: Entry = Entry(id: entryCounter + 1, website: website, userName: userName, password: password)
        return newEntry
    }
}
