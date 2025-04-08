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
        let password: String = enterPasswordTwice()
        let newEntry: Entry = Entry(id: id, website: website, userName: userName, password: password)
        return newEntry
    }
    
    // Aufgabe 1.5 Menü im Tresor aufsetzen
    
    func menu() {
        print("---Hauptmenü---")
        print("[1] - Erstelle neuen Eintrag")
        print("[2] - Zeige gespeicherte Einträge")
        print("[3] - Beende das Programm")
        print("Bitte gib die Zahl des gewünschten Menüpunkts ein.")
        var input: Int = enterInteger()
        while input <= 0 || input >= 4 {
            print("Falsche Eingabe, bitte erneut versuchen.")
            input = enterInteger()
        }
        if input == 1 {
            print("Wieviele neue Einträge willst du erstellen?")
            var amount: Int = enterInteger()
            while amount > 0 {
                let newEntry: Entry = createNewEntry()
                addEntry(newEntry)
                amount -= 1
            }
        }
        if input == 2 {
            printAllEntries(password: masterPassword)
        }
        if input == 3 {
            exit(0)
        }
    }
    
    // Methode um Menü immer wieder aufzurufen bis das Programm beendet wird
    
    func run() {
        var isRunning = false
        print("Willkommen zum Passwort Manager von SyntaxGuard. Bitte gib das Masterpasswort für den Manager ein um ins Hauptmenü zu gelangen.")
        let input: String = readLine()!
        if input != masterPassword {
            print("Falsches Passwort. Das Programm wird nun beendet. Wenn du es erneut probieren willst starte das Programm erneut.")
        } else {
            isRunning = true
        }
        while isRunning {
            menu()
        }
    }
    
    // Aufgabe 1.6 Passwort doppelt eingeben
    
    func enterPasswordTwice() -> String {
        var firstInput: String = readLine()!
        print("Gib das Passwort nochmal ein.")
        var secondInput: String = readLine()!
        while firstInput != secondInput {
            print("Die Eingaben stimmen nicht überein. Bitte versuche es erneut und gib das Passwort ein.")
            firstInput = readLine()!
            print("Gib das Passwort nochmal ein.")
            secondInput = readLine()!
        }
        print("Passwörter stimmen überein. Das Passwort wird gespeichert.")
        return firstInput
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
        entries.sort{ $0.website < $1.website }
        return entries
    }
    
    // Aufgabe 2.3 Alte Einträge löschen
    
    func deleteOldEntries() {
        print("Alte Anzahl der Einträge vor dem Löschen: \(entries.count)")
        print("Alte Einträge werden gelöscht...")
        entries.removeAll{ $0.id < 100 }
        print("Neue Anzahl der Einträge: \(entries.count)")
    }
    
    // Zusätzliche Hilfsmethoden
    
    private func enterInteger() -> Int {
            let input: Int? = Int(readLine()!)
            if input == nil {
                return 0
            } else {
                return input!
            }
        }
}
