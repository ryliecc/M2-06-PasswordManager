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
