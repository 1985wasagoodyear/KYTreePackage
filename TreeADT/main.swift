//
//  main.swift
//  TreeADT
//
//  Created by K Y on 8/23/19.
//  Copyright © 2019 K Y. All rights reserved.
//

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
print(tree)

let traversal = BinaryTree.inOrderTraveral(tree.head)
print(traversal)

print("--- Now deleting 5 ---")
tree.delete(val: 5)
print(BinaryTree.inOrderTraveral(tree.head))

print("--- Now deleting 1 ---")
tree.delete(val: 1)
print(BinaryTree.inOrderTraveral(tree.head))
