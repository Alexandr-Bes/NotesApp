//
//  ViewController.swift
//  NotesApp
//
//  Created by Alexandr on 5/6/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchControllerDelegate {

    // MARK: Outlets
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var sortNotesButton: UIBarButtonItem!

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
    let test = ["Hello", "Love", "Go Ahead", "Fuck U", "Hello", "Love", "Go Ahead", "Fuck U", "Hello", "Love", "Go Ahead", "Fuck U", "Hello", "Love", "Go Ahead", "Fuck U"]
//    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear notesData: \(notesData)")
        notesTableView.reloadData()
        print(allNotes)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return notesData.notes.count
        return test.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = notesTableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
//        cell.cellModel = notesData.notes[indexPath.row]
        cell.noteLabel.text = test[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editNote", sender: nil)
        notesTableView.deselectRow(at: indexPath, animated: true)
    }

    func updateSearchResults(for searchController: UISearchController) {
        // TODO Search
    }

    // MARK: - Actions
    @IBAction func sortNotes(_ sender: Any) {

    }


    // Private Methods
    private func setupUI() {
        title = "Заметки"
        notesTableView.dataSource = self
        notesTableView.delegate = self
        // Register for NoteTableViewCell
        notesTableView.register(UINib(nibName: NoteTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NoteTableViewCell.identifier)
        notesTableView.keyboardDismissMode = .onDrag
        setupNavBar()
    }

    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.setupDefaultColor()
        navigationItem.searchController = searchController
    }

    func timeFormatter(time: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let newDate = dateFormatter.string(from: time)
        return newDate
    }

}

