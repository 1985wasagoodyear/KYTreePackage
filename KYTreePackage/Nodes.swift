//
//  Nodes.swift
//  TreeADT
//
//  Created by K Y on 8/29/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation

public typealias NodeType = CustomStringConvertible
public typealias CompNodeType = CustomStringConvertible & Comparable

open class Node<T: NodeType> {
    open var val: T
    open weak var parent: Node<T>?
    public init(val: T) { self.val = val }
}

open class BinaryTreeNode<T: NodeType>: Node<T> {
    open var left: BinaryTreeNode? {
        didSet { left?.parent = self }
    }
    open var right: BinaryTreeNode? {
        didSet { right?.parent = self }
    }
}

extension Node: NodeType {
    public var description: String {
        return val.description
    }
}

