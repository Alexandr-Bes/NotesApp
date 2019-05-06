//
//  StringTruncate+Extension.swift
//  NotesApp
//
//  Created by Alexandr on 5/6/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation

extension String {
    func trunc(length: Int) -> String {
        return (self.count > length) ? self.prefix(length) + "..." : self
    }
}
