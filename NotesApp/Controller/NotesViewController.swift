//
//  ViewController.swift
//  NotesApp
//
//  Created by Alexandr on 5/6/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Outlets
    @IBOutlet weak var notesTableView: UITableView!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = notesTableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        cell.dateOfNoteLabel.text = "21.02.18"
        let noteText = "Hello my name is Alexander"
        let truncText = noteText.trunc(length: 100)
        cell.noteLabel.text = truncText
        cell.timeOfNoteLabel.text = "12:12"
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    // Private Methods
    private func setupUI() {
        title = "Заметки"
        notesTableView.delegate = self
        notesTableView.dataSource = self
        // Register for NoteTableViewCell
        notesTableView.register(UINib(nibName: NoteTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NoteTableViewCell.identifier)
    }


}

