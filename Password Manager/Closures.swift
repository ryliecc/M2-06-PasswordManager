//
//  Closures.swift
//  Password Manager
//
//  Created by Rylie Castell on 09.04.25.
//

// Aufgabe 3.1 Vorbereitung: Closure-Datei

import Foundation

// Aufgabe 3.2 Starke Passwörter

let isStrongPassword: (Entry) -> Bool = { $0.password.count >= 8 }

// Aufgabe 3.3 Usernamen, die Emailadressen sind

let isEmail: (Entry) -> Bool = { entry in entry.userName.contains("@") }

// Aufgabe 3.4 Websites, die nicht auf .com enden

let isNotComDomain: (Entry) -> Bool = { entry in !entry.website.hasSuffix(".com") }

// Aufgabe 3.5 Mehrere Higher Order Functions verketten

let userNameDescending: (Entry, Entry) -> Bool = { $0.userName > $1.userName }

let unevenIds: (Entry) -> Bool = { $0.id % 2 != 0 }
