//
//  BinaryTree+Traversal.swift
//  KYTreePackage
//
//  Created by K Y on 8/29/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation

// MARK: - Traveral

extension BinaryTree {
    
    public class func inOrderTraveral(_ node: BinaryTreeNode<T>?) -> [BinaryTreeNode<T>] {
        guard let n = node else { return [] }
        return inOrderTraveral(n.left) + [n] + inOrderTraveral(n.right)
    }
    
    public class func preOrderTraversal(_ node: BinaryTreeNode<T>?) -> [BinaryTreeNode<T>] {
        guard let n = node else { return [] }
        return [n] + preOrderTraversal(n.left) + preOrderTraversal(n.right)
    }
    
    public class func postOrderTraversal(_ node: BinaryTreeNode<T>?) -> [BinaryTreeNode<T>] {
        guard let n = node else { return [] }
        return preOrderTraversal(n.left) + preOrderTraversal(n.right) + [n]
    }
    
}
