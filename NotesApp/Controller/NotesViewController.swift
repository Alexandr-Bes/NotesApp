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

    // MARK: - Properties
    let defaults = UserDefaults.standard
    var allNotes = NoteString.globalNote.notes
    var notesData: NotesModel = NotesModel() {
        didSet {
            DispatchQueue.main.async {
                self.notesTableView.reloadData()
            }
        }
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        let userNotes = NoteString.globalNote.notes
        
        print("First assign: \(notesData)")
//        if !(userNotes.isEmpty) {
//            allNotes.append(userNotes)
//        }
        notesTableView.reloadData()
        print(allNotes)
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesData.notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = notesTableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
//        let time = timeFormatter(time: Date(), dateFormat: "HH:mm")
//        let date = timeFormatter(time: Date(), dateFormat: "dd.MM.yyyy")
//        cell.dateOfNoteLabel.text = date
//        cell.noteLabel.text = allNotes[indexPath.row]
//        cell.timeOfNoteLabel.text = time
//        cell.accessoryType = .disclosureIndicator
        cell.cellModel = notesData.notes[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editNote", sender: nil)
        notesTableView.deselectRow(at: indexPath, animated: true)
    }

    // Private Methods
    private func setupUI() {
        title = "Заметки"
        notesTableView.dataSource = self
        notesTableView.delegate = self
        // Register for NoteTableViewCell
        notesTableView.register(UINib(nibName: NoteTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NoteTableViewCell.identifier)
    }

    func timeFormatter(time: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let newDate = dateFormatter.string(from: time)
        return newDate
    }

}

