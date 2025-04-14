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
        print("Folgende\(newEntries.count > 1 ? " Einträge werden" : "r Eintrag wird") gespeichert:")
        for entry in newEntries {
            entry.run(action: printDescription)
            entries.append(entry)
            entry.run(action: printSaveInfo)
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
        // Aufgabe 2.5 Menü erweitern
        print("[3] - Lösche alte Einträge")
        // Aufgabe 3.6 Menü erweitern
        print("[4] - Entferne Einträge, deren Website keine .com Domain ist")
        // Aufgabe 4.6 Menü erweitern
        print("[5] - Filter Einträge nach verschiedenen Optionen")
        print("[6] - Sortiere Einträge nach verschiedenen Optionen")
        print("[7] - Überprüfe Passwortsicherheit")
        print("[8] - Beende das Programm")
        print("Bitte gib die Zahl des gewünschten Menüpunkts ein.")
        var input: Int = enterInteger()
        while input <= 0 || input >= 9 {
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
            deleteOldEntries()
        }
        if input == 4 {
            removeNotComDomain()
        }
        if input == 5 {
            print("Folgende Filtermöglichkeiten:")
            print("[1] - Nach Username")
            print("[2] - Nach starken Passwörtern")
            print("[3] - Email Adresse als Username")
            print("[4] - Passwörter, die Zahlen enthalten")
            print("[5] - Nach Website")
            print("[6] - ungerade ID, alphabetisch sortiert nach Username")
            print("Bitte gib die Zahl des gewünschten Filters ein.")
            var chosenFilter = enterInteger()
            while chosenFilter <= 0 && chosenFilter >= 6 {
                print("Falsche Eingabe, bitte erneut versuchen.")
                chosenFilter = enterInteger()
            }
            if chosenFilter == 1 {
                print("Nach welchem Username willst du suchen?")
                let inputUserName: String = readLine()!
                searchNames(name: inputUserName)
                filterEntriesByUser(userName: inputUserName)
            }
            if chosenFilter == 2 {
                printStrongPasswords()
            }
            if chosenFilter == 3 {
                printEmailUserNames()
            }
            if chosenFilter == 4 {
                filterEntries(filter: isPasswordNumber)
            }
            if chosenFilter == 5 {
                print("Für welche Website möchtest du den Eintrag sehen?")
                let wantedWebsite: String = readLine()!
                searchForWebsite(wantedWebsite)
            }
            if chosenFilter == 6 {
                    sortFilterPrint()
            }
        }
        if input == 6 {
            print("Folgende Sortiermöglichkeiten:")
            print("[1] - Alphabetisch nach Website")
            print("[2] - Antialphabetisch nach Username")
            print("[3] - Aufsteigend in Passwortlänge")
            print("Bitte gib die Zahl der gewünschten Sortiermöglichkeit ein.")
            var chosenFilter = enterInteger()
            while chosenFilter <= 0 && chosenFilter >= 4 {
                print("Falsche Eingabe, bitte erneut versuchen.")
                chosenFilter = enterInteger()
            }
            if chosenFilter == 1 {
                printEntriesSecurely(sortEntriesByWebsite())
            }
            if chosenFilter == 2 {
                sortEntries(filterMethod: userNameDescending)
            }
            if chosenFilter == 3 {
                sortEntries(filterMethod: passwordLengthAscending)
            }
        }
        if input == 7 {
            entries.forEach { entry in entry.passwordContainsNumber()}
        }
        if input == 8 {
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
    
    // Aufgabe 1.7 Website Suche mit Rekursion
    
    func searchForWebsite(_ website: String) {
        let foundEntry: Entry? = searchEntry(index: 0, website: website)
        if foundEntry == nil {
            print("Keinen Eintrag für die Website \(website) gefunden.")
        } else {
            print("Gefundener Eintrag:")
            print(foundEntry!)
        }
    }
    
    private func searchEntry(index: Int, website: String) -> Entry? {
        if index >= entries.count {
            return nil
        }
        if entries[index].website != website {
            return searchEntry(index: index + 1, website: website)
        } else {
            return entries[index]
        }
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
        // Aufgabe 2.4 Alte Einträge löschen - Erweiterung
        print("Folgende Einträge werden gelöscht:")
        entries.filter { $0.id < 100 }.forEach { print($0) }
        print("Bist du sicher, dass diese Einträge unwiderruflich gelöscht werden sollen?")
        if validation() {
            entries.removeAll{ $0.id < 100 }
            print("Neue Anzahl der Einträge: \(entries.count)")
        } else {
            print("Einträge wurden nicht gelöscht.")
        }
    }
    
    // Aufgabe 2.6 Einträge mit zensierten Passwörtern drucken
    
    func printEntriesSecurely(_ entries: [Entry]) {
        let secureDisplayEntries = entries.map { Entry(id: $0.id, website: $0.website, userName: $0.userName, password: "*****") }
        secureDisplayEntries.forEach { print($0) }
    }
    
    // Aufgabe 3.2 Starke Passwörter
    
    func printStrongPasswords() {
        entries.filter(isStrongPassword).forEach { print($0) }
    }
    
    // Aufgabe 3.3 Usernamen, die Emailadressen sind
    
    func printEmailUserNames() {
        entries.filter(isEmail).forEach { entry in print(entry) }
    }
    
    // Aufgabe 3.4 Websites, die nicht auf .com enden
    
    func removeNotComDomain() {
        entries.filter(isNotComDomain).forEach { entry in print(entry) }
        entries.removeAll(where: isNotComDomain)
    }
    
    // Aufgabe 3.5 Mehrere Higher Order Functions verketten
    
    func sortFilterPrint() {
        entries.sorted(by: userNameDescending).filter(unevenIds).forEach { print($0) }
    }
    
    // Aufgabe 3.7 Eigene Higher Order Function schreiben
    // Aufgabe 4.3 Mächtige Higher Order Function zum Filtern schreiben
    
    func filterEntries(filter: (Entry) -> Bool) {
        entries.filter(filter).forEach { print($0) }
    }
    
    // Aufgabe 4.2 Tresor durchsuchen
    
    func searchNames(name: String) {
        for entry in entries {
            if sameName(entry, name) {
                print("Nutzername \(name) in Eintrag Nr. \(entry.id) gefunden!")
            } else {
                print("Nicht \(name), sondern \(entry.userName) gefunden.")
            }
        }
    }
    
    // Aufgabe 4.4 Mächtige Higher Order Function zum Sortieren schreiben
    
    func sortEntries(filterMethod: (Entry, Entry) -> Bool) {
        entries.sorted(by: filterMethod).forEach { print($0) }
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
    
    private func validation() -> Bool {
            print("Bitte bestätigen Sie: (ja/nein)")
            var input: String = readLine()!
            while input.lowercased() != "nein" && input.lowercased() != "ja" {
                print("Falsche Eingabe.")
                print("Bitte bestätigen Sie: (ja/nein)")
                input = readLine()!
            }
            return input.lowercased() == "ja"
        }
}
