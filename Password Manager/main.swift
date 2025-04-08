import Foundation

// Aufgabe 1.3 Klasse Tresor anlegen

var vault1: Vault = Vault(masterPassword: "password123")

var entry1: Entry = Entry(id: 1, website: "youtube.com", userName: "jryliec", password: "youtubePassword!")
var entry2: Entry = Entry(id: 2, website: "soundcloud.com", userName: "rylesmukke", password: "music4life")
var entry3: Entry = Entry(id: 3, website: "github.com", userName: "ryliecc", password: "codeEatSleepRepeat")

vault1.addEntry(entry1, entry2, entry3)

vault1.printAllEntries(password: "wrongPassword")
vault1.printAllEntries(password: "password123")

// Aufgabe 1.4 Methode, um neue Einträge zu erstellen

vault1.addEntry(vault1.createNewEntry())

// Aufgabe 2.1 Einträge nach Username filtern

vault1.filterEntriesByUser(userName: "jryliec")

// Aufgabe 2.2 Einträge alphabetisch nach Website sortieren

print(vault1.sortEntriesByWebsite())
