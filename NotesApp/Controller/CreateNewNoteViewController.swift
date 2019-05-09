//
//  CreateNewNoteViewController.swift
//  NotesApp
//
//  Created by Alexandr on 5/6/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class CreateNewNoteViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var newNoteTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    // MARK: - Properties
    let defaults = UserDefaults.standard
    var notes: NoteString = NoteString()
    var note = Note()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newNoteTextView.becomeFirstResponder()

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        newNoteTextView.endEditing(true)
        
    }
    
    // MARK: Actions
    @IBAction func saveNote(_ sender: UIBarButtonItem) {
        let notesVC = storyboard?.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
        note.noteText = newNoteTextView.text
        note.time = Date()
        notesVC.notesData.notes.append(note)
        print(notesVC.notesData.notes)

        dismiss(animated: true, completion: nil)
//        present(notesVC, animated: true, completion: nil)

    }
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // Private Methods

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
