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
    @IBOutlet weak var saveNote: UIBarButtonItem!

    // MARK: - Properties
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

    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem?.tintColor = .black
        let saveButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(DetailViewController.saveButton(_:)))
        navigationItem.rightBarButtonItem = saveButton
        noteTextView.becomeFirstResponder()
        noteTextView.text = noteText
    }

    @objc func saveButton(_ sender: UIBarButtonItem) {
        let notesVC = storyboard?.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
//        notesVC.test.append(noteTextView.text)
        print(noteTextView.text!)
//        present(NotesViewController(), animated: true, completion: nil)

        navigationController?.popToRootViewController(animated: true)
    }
    // MARK: - Navigation

 }
