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
    
    // Aufgabe 1.4 Methode, um neue Einträge zu erstellen
    
    func createNewEntry() -> Entry {
        let existingIds = Set(entries.map {$0.id})
        var id: Int
        repeat {
            id = Int.random(in: 1...999999)
        } while existingIds.contains(id)
        print("Für welche Website soll der Eintrag erstellt werden?")
        let website: String = readLine()!
        print("Wie ist dein Benutzername?")
        let userName: String = readLine()!
        print("Wie ist dein Passwort?")
        let password: String = readLine()!
        let newEntry: Entry = Entry(id: id, website: website, userName: userName, password: password)
        return newEntry
    }
    
    // Aufgabe 2.1 Einträge nach Username filtern
    
    func filterEntriesByUser(userName: String) {
        let filteredEntries: [Entry] = entries.filter{ $0.userName == userName}
        print("Username: \(userName)\nGenutzt auf den folgenden Websites:")
        for entry in filteredEntries {
            print(entry.website)
        }
    }
    
    // Aufgabe 2.2 Einträge alphabetisch nach Website sortieren
    
    func sortEntriesByWebsite() -> [Entry] {
        entries.sort{ $0.website < $1.website}
        return entries
    }
    
    // Aufgabe 2.3 Alte Einträge löschen
    
    func deleteOldEntries() {
        print("Alte Anzahl der Einträge vor dem Löschen: \(entries.count)")
        print("Alte Einträge werden gelöscht...")
        entries.removeAll{ $0.id < 100 }
        print("Neue Anzahl der Einträge: \(entries.count)")
    }
}
