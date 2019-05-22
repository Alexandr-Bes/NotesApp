//
//  ViewController.swift
//  NotesApp
//
//  Created by Alexandr on 5/6/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchControllerDelegate, NoteDelegate {

    // MARK: Outlets
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var sortNotesButton: UIBarButtonItem!

    // MARK: - Properties
    let defaults = UserDefaults.standard
    var notesData: NotesModel = NotesModel()
//    {
//        didSet {
//            DispatchQueue.main.async {
//                self.notesTableView.reloadData()
//            }
//        }
//    }
    var test = ["Hello", "Love", "Go Ahead", "Fuck U", "Hello", "Love", "Go Ahead", "Fuck U", "Hello", "Love", "Go Ahead", "Fuck U", "Hello", "Love", "Go Ahead", "Fuck U"]

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesData.notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = notesTableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        cell.cellModel = notesData.notes[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, nil) in
            print("Edit")
        }
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            print("Delete")
        }
        return UISwipeActionsConfiguration(actions: [delete, edit])
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
        // TODO sort
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editNote":
            let detailVC = segue.destination as! DetailViewController
            var indexPath: IndexPath = self.notesTableView.indexPathForSelectedRow!
            detailVC.noteText = notesData.notes[indexPath.row].noteText
        case "createNewNote":
            let detailVC = segue.destination as! DetailViewController
            detailVC.allData.notes += notesData.notes
            detailVC.delegate = self
        default:
            break
        }
    }

    // MARK: - Private Methods
    private func setupUI() {
        title = "Заметки"
        notesTableView.dataSource = self
        notesTableView.delegate = self
        // Register for NoteTableViewCell
        notesTableView.register(UINib(nibName: NoteTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: "noteCell")
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

    func newNote(note: String) {
        print("New note is: \(note)")
    }

    func addNewNote(note: Note) {
        notesData.notes.append(note)
    }


}

