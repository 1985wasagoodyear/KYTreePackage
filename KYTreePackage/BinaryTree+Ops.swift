//
//  BinaryTree+Ops.swift
//  KYTreePackage
//
//  Created by K Y on 8/29/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation

// MARK: - Search, Insert, Delete

extension BinaryTree {
    
    public class func search(val: T, _ node: BinaryTreeNode<T>?) -> BinaryTreeNode<T>? {
        guard let n = node else { return nil }
        if n.val == val {
            return node
        }
        else if val < n.val {
            return search(val: val, n.left)
        }
        else {
            return search(val: val, n.right)
        }
    }
    
    @discardableResult
    public func insert(val: T) -> TreeInsertResult {
        let newNode = BinaryTreeNode(val: val)
        if head == nil {
            head = newNode
            return .success
        }
        var curr: BinaryTreeNode<T>! = head
        while (true) {
            if val == curr.val {
                return .nodeExists
            }
            else if val < curr.val {
                if curr.left == nil {
                    curr.left = newNode
                }
                else {
                    curr = curr.left
                }
            }
            else {
                if curr.right == nil {
                    curr.right = newNode
                }
                else {
                    curr = curr.right
                }
            }
        }
    }
    
    public class func findLowestCommonAncestor(_ nodeA: BinaryTreeNode<T>,
                                         nodeB: BinaryTreeNode<T>) -> Node<T>? {
        var seenA: [Node<T>] = []
        var seenB: [Node<T>] = []
        var nodeA: Node<T>? = nodeA
        var nodeB: Node<T>? = nodeB
        while nodeA?.parent != nil && nodeB?.parent != nil {
            if let ancestor = seenB.first(where: { $0.val == nodeA?.parent!.val }) {
                return ancestor
            }
            seenA.append(nodeA!.parent!)
            nodeA = nodeA!.parent
            
            if let ancestor = seenA.first(where: { $0.val == nodeB?.parent!.val }) {
                return ancestor
            }
            seenB.append(nodeB!.parent!)
            nodeB = nodeB!.parent
        }
        while nodeA?.parent != nil {
            if let ancestor = seenB.first(where: { $0.val == nodeA?.parent!.val }) {
                return ancestor
            }
            seenA.append(nodeA!.parent!)
            nodeA = nodeA!.parent
        }
        while nodeB?.parent != nil {
            if let ancestor = seenA.first(where: { $0.val == nodeB?.parent!.val }) {
                return ancestor
            }
            nodeB = nodeB!.parent
        }
        
        return nil
    }
    
}

extension BinaryTree: BinaryTreeProtocolDel {
    
    @discardableResult
    public func delete(val: T) -> BinaryTreeNode<T>? {
        // empty tree
        guard let head = head else { return nil }
        // delete head
        // but now need to connect in a leaf for the head, if any
        if head.val == val {
            if head.left == nil && head.right == nil {
                self.head = nil
                return nil
            }
            else if head.left == nil {
                self.head = head.right
                return BinaryTreeNode(val: val)
            }
            else if head.right == nil {
                self.head = head.left
                return BinaryTreeNode(val: val)
            }
        }
        return BinaryTree.delete(val: val, parent: head)
        
    }
    
    @discardableResult
    public static func delete(val: T, parent: BinaryTreeNode<T>?) -> BinaryTreeNode<T>? {
        // val does not exist in tree
        guard let curr = parent else { return nil }
        
        // recur down the tree
        if val < curr.val {
            curr.left = BinaryTree.delete(val: val, parent: curr.left)
        }
        else if val > curr.val {
            curr.right = BinaryTree.delete(val: val, parent: curr.right)
        }
        else {
            // node with only one child or no child
            if curr.left == nil {
                return curr.right
            }
            else if curr.right == nil {
                return curr.left
            }
            
            // node with two children: Get the inorder successor (smallest
            // in the right subtree)
            var currLeft: BinaryTreeNode<T>! = curr
            while currLeft.left != nil {
                curr.val = currLeft.left!.val
                currLeft = currLeft.left
            }
            
            // Delete the inorder successor
            curr.right = BinaryTree.delete(val: curr.val, parent: curr.right)
        }
        return curr
    }
}

