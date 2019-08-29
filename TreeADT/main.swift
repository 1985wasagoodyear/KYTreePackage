//
//  main.swift
//  TreeADT
//
//  Created by K Y on 8/23/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation
import KYTreePackage

/*
                        6
                    /       \
                4               7
            /       \
        1               5
            \
                2
                    \   3
 */
let vals = [6, 4, 7, 1, 2, 3, 5]

let tree = BinaryTree<Int>(vals)

let traversal = BinaryTree.inOrderTraveral(tree.head)
print(traversal)
