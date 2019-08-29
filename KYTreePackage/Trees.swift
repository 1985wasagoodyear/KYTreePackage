//
//  Trees.swift
//  TreeADT
//
//  Created by K Y on 8/29/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation

public protocol BinaryTreeProtocol {
    associatedtype T: CompNodeType
    
    var head: BinaryTreeNode<T>? { get set }
    static func inOrderTraveral(_ node: BinaryTreeNode<T>?) -> [BinaryTreeNode<T>]     // L H R
    static func preOrderTraversal(_ node: BinaryTreeNode<T>?) -> [BinaryTreeNode<T>]   // H L R
    static func postOrderTraversal(_ node: BinaryTreeNode<T>?) -> [BinaryTreeNode<T>]  // L R H
    static func search(val: T, _ node: BinaryTreeNode<T>?) -> BinaryTreeNode<T>?
    func insert(val: T) -> TreeInsertResult
    // func delete(val: T) -> BinaryTreeNode<T>?
    // class func findLowestCommonAncestor(_ nodeA: BinaryTreeNode<T>, nodeB: BinaryTreeNode<T>) -> Node<T>?
}

public protocol BinaryTreeProtocolDel {
    associatedtype T: CompNodeType
    func delete(val: T) -> BinaryTreeNode<T>?
    static func findLowestCommonAncestor(_ nodeA: BinaryTreeNode<T>,
                                        nodeB: BinaryTreeNode<T>) -> Node<T>?
}

open class BinaryTree<T: CompNodeType>: BinaryTreeProtocol {
    
    open var head: BinaryTreeNode<T>?
    
}

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
    
}
/*
extension BinaryTree: BinaryTreeProtocolDel {
    
     @discardableResult
     class func delete(val: T, parent: BinaryTreeNode<T>?) -> (node: BinaryTreeNode<T>, parent: BinaryTreeNode<T>)? {
     guard let curr = parent else {
     return nil
     }
     while (true) {
     if val < curr.val {
     BinaryTree.delete(val: val, parent: l)
     }
     else {
     if r.val == val {
     curr.right = nil
     return r
     }
     else {
     curr = r
     }
     }
     }
     
     }
     
     @discardableResult
     func delete(val: T) -> BinaryTreeNode<T>? {
     guard var curr = head else {
     // empty tree
     return nil
     }
     if curr.val == val {
     // it is the head
     head = nil
     return curr
     }
     
     // initial problem: find node to delete
     // like search, but want to keep track of parent
     guard let deleteItems = BinaryTree.delete(val: val, parent: head) else {
     // item does not exist
     return nil
     }
     
     guard let l = deleteItems.node.left, let r = deleteItems.node.right else {
     // case 1. node is leaf
     if deleteItems.node.val < deleteItems.parent.val {
     deleteItems.parent.left = nil
     }
     else {
     deleteItems.parent.right = nil
     }
     return deleteItems.node
     }
     
     // case 3. node has 2 children
     
     if deleteItems.node.val < deleteItems.parent.val {
     deleteItems.parent.left = deleteItems.node
     }
     else {
     deleteItems.parent.right = deleteItems.node
     }
     
     
     // case 2. node has 1 child
     
     // case 3. node has 2 children
     }
    
    //   static func findLowestCommonAncestor(_ nodeA: BinaryTreeNode<T>, nodeB: BinaryTreeNode<T>) -> Node<T>? {
    //      <#code#>
    //  }
}
*/
