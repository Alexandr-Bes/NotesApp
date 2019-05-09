//
//  Date+Extension.swift
//  NotesApp
//
//  Created by Alexandr on 5/9/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation

extension Date {
    func timeFormatter(time: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let newDate = dateFormatter.string(from: time)
        return newDate
    }
}
