//
//  DetailViewController.swift
//  NotesApp
//
//  Created by Alexandr on 5/15/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }


    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem?.tintColor = .black
    }

    // MARK: - Navigation

 }
