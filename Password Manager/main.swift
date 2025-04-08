import Foundation

// Ablage für erstellte Instanzen

var vault1: Vault = Vault(masterPassword: "password123")

var entry1: Entry = Entry(id: 1, website: "youtube.com", userName: "jryliec", password: "youtubePassword!")
var entry2: Entry = Entry(id: 2, website: "soundcloud.com", userName: "rylesmukke", password: "music4life")
var entry3: Entry = Entry(id: 3, website: "github.com", userName: "ryliecc", password: "codeEatSleepRepeat")
var entry4: Entry = Entry(id: 101, website: "netflix.com", userName: "rylie.castell@examplemail.com", password: "netflixPw1")

// Aufgabe 1.3 Klasse Tresor anlegen
// Instanzen verschoben

vault1.addEntry(entry1, entry2, entry3)

//vault1.printAllEntries(password: "wrongPassword")
//vault1.printAllEntries(password: "password123")
// Test erfolgreich, in menu() integriert

// Aufgabe 1.4 Methode, um neue Einträge zu erstellen

//vault1.addEntry(vault1.createNewEntry())
// Test erfolgreich, in menu() integriert

// Aufgabe 1.5 Menü im Tresor aufsetzen

//vault1.menu()
// Test erfolgreich, in run() integriert

// Aufgabe 2.1 Einträge nach Username filtern

//vault1.filterEntriesByUser(userName: "jryliec")
// Test erfolgreich, in menu() integriert

// Aufgabe 2.2 Einträge alphabetisch nach Website sortieren

//print(vault1.sortEntriesByWebsite())
// Test erfolgreich, in menu() integriert

// Aufgabe 2.3 Alte Einträge löschen
// Instanz verschoben

vault1.addEntry(entry4)
//vault1.deleteOldEntries()
// Test erfolgreich, in menu() integriert

// Run Methode für das gesamte Programm
print()
print()
print("-----Start des tatsächlichen Programms-----")
vault1.run()
