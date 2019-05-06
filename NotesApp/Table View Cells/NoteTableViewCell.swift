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

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    private func setupUI() {
        
    }

}
