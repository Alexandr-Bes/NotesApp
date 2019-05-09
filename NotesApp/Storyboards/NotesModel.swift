//
//  NotesModel.swift
//  NotesApp
//
//  Created by Alexandr on 5/8/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation

struct NotesModel {
    var notes: [Note]

    init() {
        notes = [Note]()
    }
}

struct Note {
    var noteText: String
    var time: Date

    init() {
        self.noteText = ""
        self.time = Date()
    }
}

class NoteString {
    struct globalNote {
        static var notes = [String]()
    }
}
