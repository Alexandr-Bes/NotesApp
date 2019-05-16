//
//  DetailViewController.swift
//  NotesApp
//
//  Created by Alexandr on 5/15/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var noteTextView: UITextView!

    // MARK: - Properties
    var allData = NotesModel()
    private var note = Note()
    var noteText = String()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        noteTextView.endEditing(true)
    }

    // MARK: - Action
    @objc func saveButton(_ sender: UIBarButtonItem) {
//        let notesVC = storyboard?.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
        note.noteText = noteTextView.text
        note.time = Date()
//        notesVC.notesData.notes.append(note)
        performSegue(withIdentifier: "notesSegue", sender: nil)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue" {
            let navContr = segue.destination as! UINavigationController
            let notesVC = navContr.topViewController as! NotesViewController
            allData.notes.append(note)
            notesVC.notesData = allData
        }
    }

    // MARK: - Private methods
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem?.tintColor = .black
        let saveButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(DetailViewController.saveButton(_:)))
        navigationItem.rightBarButtonItem = saveButton
        noteTextView.becomeFirstResponder()
        noteTextView.text = noteText
    }



 }
