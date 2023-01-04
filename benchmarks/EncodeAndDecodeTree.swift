import Foundation

protocol BinaryNodeEncoder {
  func encode<T>(_ node: BinaryNode<T>?) throws -> String
}

protocol BinaryNodeDecoder {
  func decode<T>(from string: String) -> BinaryNode<T>?
}

public class BinaryNodeCoder<T: Comparable>: BinaryNodeEncoder, BinaryNodeDecoder {

  // MARK: Private
  private let separator: Character = ","
  private let nilNode = "X"

  private func decode<T>(from array: inout [String]) -> BinaryNode<T>? {
    guard !array.isEmpty else {
      return nil
    }

    let value = array.removeLast()

    guard value != nilNode, let val = value as? T else {
      return nil
    }

    let node = BinaryNode<T>(val)
    node.left = decode(from: &array)
    node.right = decode(from: &array)

    return node
  }

  // MARK: Public
  public init() {}

  public func encode<T>(_ node: BinaryNode<T>?) throws -> String {
    var str = ""
    node?.preOrderTraversal { data in
      if let data = data {
        let string = String(describing: data)
        str.append(string)
      } else {
        str.append(nilNode)
      }
      str.append(separator)
    }

    return str
  }

  public func decode<T>(from string: String) -> BinaryNode<T>? {
    var components = string.split(separator: separator).reversed().map(String.init)
    return decode(from: &components)
  }
}

public class BinaryNode<Element: Comparable> {
  public var val: Element
  public var left: BinaryNode?
  public var right: BinaryNode?

  public init(_ val: Element, left: BinaryNode? = nil, right: BinaryNode? = nil) {
    self.val = val
    self.left = left
    self.right = right
  }

  public func preOrderTraversal(visit: (Element?) throws -> ()) rethrows {
    try visit(val)

    if let left = left {
      try left.preOrderTraversal(visit: visit)
    } else {
      try visit(nil)
    }

    if let right = right {
      try right.preOrderTraversal(visit: visit)
    } else {
      try visit(nil)
    }
  }
}

func printTree(_ root: BinaryNode<String>?) {
    guard let root = root else {
        return
    }

    let leftVal = root.left == nil ? "nil" : root.left!.val
    let rightVal = root.right == nil ? "nil" : root.right!.val

    print("val: \(root.val) left: \(leftVal) right: \(rightVal)")

    printTree(root.left)
    printTree(root.right)
}

for _ in 1...1000000{
let coder = BinaryNodeCoder<String>()

let node1 = BinaryNode("a")
let node2 = BinaryNode("b")
let node3 = BinaryNode("c")
let node4 = BinaryNode("d")
let node5 = BinaryNode("e")

node1.left = node2
node1.right = node3
node3.left = node4
node3.right = node5

let encodeStr = try coder.encode(node1)
//print(encodeStr)
// "a b # # c d # # e # #"

let root: BinaryNode<String> = coder.decode(from: encodeStr)!

//print("Tree:")
//printTree(root)
/*
 Tree:
 val: a left: b right: c
 val: b left: nil right: nil
 val: c left: d right: e
 val: d left: nil right: nil
 val: e left: nil right: nil
 */
}
