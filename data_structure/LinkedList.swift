//
//  LinkList.swift
//  data_structure
//
//  Created by jsw_cool on 2023/8/18.
//

import Foundation

class Node<T>{
    var value: T
    var next: Node<T>?
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<T>{
    var head:Node<T>?
    var tail:Node<T>?
    var isEmpty:Bool{
        head == nil
    }
    //我们用该值创建一个新节点，并使新节点指向原来的 head
    mutating func push(value:T){
        head = Node(value: value,next: head)
        if tail == nil{
            tail = head
        }
    }
    //我们创建了一个新节点，并将原来的尾部指向新节点。最后，我们将原来的 tail 替换为新的节点
    mutating func append(value:T){
        let node = Node(value: value,next: nil)
        tail?.next = node
        tail = node
    }
    //根据next指针遍历
    func node(at index:Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        while currentNode != nil && currentIndex<index {
            currentNode = currentNode?.next
            currentIndex = currentIndex+1
        }
        return currentNode
    }
    //插入
    func insert(value:T,after index:Int) {
        //找到要在后面插入的节点
        guard let node = node(at: index) else { return }
        //这个要插入的节点的下一个节点是插入节点的下一个节点
        node.next = Node(value: value, next: node.next)
    }
    //删除第一个
    mutating func pop(){
        head = head?.next
        if isEmpty {
            tail = nil
        }
    }
    //删除最后一个
    //但与 pop() 不同的是，去掉尾部节点有点复杂，因为尾部不知道前一个节点是谁。我们需要遍历链表以找到尾部之前的节点，并将其设置为尾部。
    mutating func removeLast(){
        var previousNode = head
        var currentNode = head
        while let next = currentNode?.next {
            previousNode = currentNode
            currentNode =  next
        }
        previousNode?.next = nil
        tail = previousNode
    }
    
    func remove(after index:Int){
        guard let node = node(at: index) else { return }
        node.next = node.next?.next
    }
}
