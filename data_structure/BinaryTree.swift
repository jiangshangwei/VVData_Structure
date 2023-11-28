//
//  BTree.swift
//  data_structure
//
//  Created by jsw_cool on 2023/8/18.
//

import Foundation

class BinaryTree<T:Comparable>{
    //根节点的值
    var value:T
    //父节点
    var parent:BinaryTree?
    //左子树
    var left:BinaryTree?
    //右子树
    var right:BinaryTree?
    init(value: T, parent: BinaryTree? = nil, left: BinaryTree? = nil, right: BinaryTree? = nil) {
        self.value = value
        self.parent = parent
        self.left = left
        self.right = right
    }
    //如果没有父节点那么为根节点
    var isRoot:Bool{
        return parent == nil
    }
    //没有子树则为叶子结点
    var isLeaf:Bool{
        return left==nil && right==nil
    }
    
    var isLeftChild:Bool{
        return parent?.left === self
    }
    
    var isRightChild:Bool{
        return parent?.right === self
    }
    
    var hasLeftChild: Bool {
        return left != nil
    }
       
    var hasRightChild: Bool {
        return right != nil
    }
       
    var hasBothChildren: Bool {
        return left != nil && right != nil
    }
    
    /// 树所包含元素的个数
    var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    func insert(value:T){
        if value<self.value{
            if let left = left{
                left.insert(value: value)
            }else{
                left = BinaryTree(value: value)
                left?.parent = self
            }
        }else{
            if let right = right{
                right.insert(value: value)
            }else{
                right = BinaryTree(value: value)
                right?.parent = self
            }
        }
    }
    
    //中序遍历
    func traverseInOrder(process: (T) -> Void){
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    //前序遍历
    func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    //后续遍历
    func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
}
