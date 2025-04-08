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
            entryCounter += 1
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
        let website: String = readLine()!
        print("Wie ist dein Benutzername?")
        let userName: String = readLine()!
        print("Wie ist dein Passwort?")
        let password: String = readLine()!
        let newEntry: Entry = Entry(id: entryCounter + 1, website: website, userName: userName, password: password)
        return newEntry
    }
    
    // 2.1 Einträge nach Username filtern
    
    func filterEntriesByUser(userName: String) {
        let filteredEntries: [Entry] = entries.filter{ $0.userName == userName}
        print("Username: \(userName)\nGenutzt auf den folgenden Websites:")
        for entry in filteredEntries {
            print(entry.website)
        }
    }
}
