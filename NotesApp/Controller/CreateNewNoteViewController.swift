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
