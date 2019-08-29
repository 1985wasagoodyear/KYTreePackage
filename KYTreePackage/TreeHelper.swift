//
//  TreeHelper.swift
//  TreeADT
//
//  Created by K Y on 8/29/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation

public enum TreeInsertResult {
    case success
    case nodeExists
    case failure(Error)
}

extension BinaryTree {
    public convenience init(_ elements: [T]) {
        self.init()
        elements.forEach {
            self.insert(val: $0)
        }
    }
}
