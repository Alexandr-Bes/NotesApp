//
//  SearchBar+Extension.swift
//  NotesApp
//
//  Created by Alexandr on 5/15/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    public func setupDefaultColor(){
        barTintColor = UIColor.white
        tintColor = UIColor.black
        if let textfield = self.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
    }
}
