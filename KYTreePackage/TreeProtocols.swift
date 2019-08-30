//
//  TreeProtocols.swift
//  KYTreePackage
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
    static func findLowestCommonAncestor(_ nodeA: BinaryTreeNode<T>,
                                         nodeB: BinaryTreeNode<T>) -> Node<T>?
}

public protocol BinaryTreeProtocolDel {
    associatedtype T: CompNodeType
    // func delete(val: T) -> BinaryTreeNode<T>?
    static func delete(val: T, parent: BinaryTreeNode<T>?) -> BinaryTreeNode<T>?
}
