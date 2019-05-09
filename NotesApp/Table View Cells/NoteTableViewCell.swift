//
//  NoteTableViewCell.swift
//  NotesApp
//
//  Created by Alexandr on 5/6/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var dateOfNoteLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel! {
        didSet {
            let notes = noteLabel.text?.trunc(length: 100)
            noteLabel.text = notes
            noteLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var timeOfNoteLabel: UILabel!

    var cellModel: Note? {
        didSet {
            guard let cellModel = cellModel else { return }
            setupUI(cellModel: cellModel)
        }
    }

    private func setupUI(cellModel: Note) {
        dateOfNoteLabel.text = cellModel.time.timeFormatter(time: cellModel.time, dateFormat: "dd.MM.yyyy")
        timeOfNoteLabel.text = cellModel.time.timeFormatter(time: cellModel.time, dateFormat: "HH:mm")
        noteLabel.text = cellModel.noteText
        accessoryType = .disclosureIndicator
    }

}
