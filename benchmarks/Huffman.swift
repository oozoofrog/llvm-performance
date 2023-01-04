import Foundation
//
//  Heap.swift
//  Written for the Swift Algorithm Club by Kevin Randrup and Matthijs Hollemans
//
public struct Heap<T> {
  /** The array that stores the heap's nodes. */
  var elements = [T]()

  /** Determines whether this is a max-heap (>) or min-heap (<). */
  fileprivate var isOrderedBefore: (T, T) -> Bool

  /**
   * Creates an empty heap.
   * The sort function determines whether this is a min-heap or max-heap.
   * For integers, > makes a max-heap, < makes a min-heap.
   */
  public init(sort: @escaping (T, T) -> Bool) {
    self.isOrderedBefore = sort
  }

  /**
   * Creates a heap from an array. The order of the array does not matter;
   * the elements are inserted into the heap in the order determined by the
   * sort function.
   */
  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.isOrderedBefore = sort
    buildHeap(array: array)
  }

  /*
  // This version has O(n log n) performance.
  private mutating func buildHeap(array: [T]) {
    elements.reserveCapacity(array.count)
    for value in array {
      insert(value)
    }
  }
  */

  /**
   * Converts an array to a max-heap or min-heap in a bottom-up manner.
   * Performance: This runs pretty much in O(n).
   */
  private mutating func buildHeap(array: [T]) {
    elements = array
    for i in stride(from: elements.count/2 - 1, to: 0, by: -1) {
      shiftDown(index: i, heapSize: elements.count)
    }
  }

  public var isEmpty: Bool {
    return elements.isEmpty
  }

  public var count: Int {
    return elements.count
  }

  /**
   * Returns the index of the parent of the element at index i.
   * The element at index 0 is the root of the tree and has no parent.
   */
  @inline(__always) func indexOfParent(i: Int) -> Int {
    return (i - 1) / 2
  }

  /**
   * Returns the index of the left child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no left child.
   */
  @inline(__always) func indexOfLeftChild(i: Int) -> Int {
    return 2*i + 1
  }

  /**
   * Returns the index of the right child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no right child.
   */
  @inline(__always) func indexOfRightChild(i: Int) -> Int {
    return 2*i + 2
  }

  /**
   * Returns the maximum value in the heap (for a max-heap) or the minimum
   * value (for a min-heap).
   */
  public func peek() -> T? {
    return elements.first
  }

  /**
   * Adds a new value to the heap. This reorders the heap so that the max-heap
   * or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert(_ value: T) {
    elements.append(value)
    shiftUp(index: elements.count - 1)
  }

  public mutating func insert<S: Sequence>(sequence: S) where S.Iterator.Element == T {
    for value in sequence {
      insert(value)
    }
  }

  /**
   * Allows you to change an element. In a max-heap, the new element should be
   * larger than the old one; in a min-heap it should be smaller.
   */
  public mutating func replace(index i: Int, value: T) {
    assert(isOrderedBefore(value, elements[i]))
    elements[i] = value
    shiftUp(index: i)
  }

  /**
   * Removes the root node from the heap. For a max-heap, this is the maximum
   * value; for a min-heap it is the minimum value. Performance: O(log n).
   */
  public mutating func remove() -> T? {
    if elements.isEmpty {
      return nil
    } else if elements.count == 1 {
      return elements.removeLast()
    } else {
      // Use the last node to replace the first one, then fix the heap by
      // shifting this new first node into its proper position.
      let value = elements[0]
      elements[0] = elements.removeLast()
      shiftDown()
      return value
    }
  }

  /**
   * Removes an arbitrary node from the heap. Performance: O(log n). You need
   * to know the node's index, which may actually take O(n) steps to find.
   */
  public mutating func removeAtIndex(i: Int) -> T? {
    let size = elements.count - 1
    if i != size {
      elements.swapAt(i, size)
      shiftDown(index: i, heapSize: size)
      shiftUp(index: i)
    }
    return elements.removeLast()
  }

  /**
   * Takes a child node and looks at its parents; if a parent is not larger
   * (max-heap) or not smaller (min-heap) than the child, we exchange them.
   */
  mutating func shiftUp(index: Int) {
    var childIndex = index
    let child = elements[childIndex]
    var parentIndex = indexOfParent(i: childIndex)

    while childIndex > 0 && isOrderedBefore(child, elements[parentIndex]) {
      elements[childIndex] = elements[parentIndex]
      childIndex = parentIndex
      parentIndex = indexOfParent(i: childIndex)
    }

    elements[childIndex] = child
  }

  mutating func shiftDown() {
    shiftDown(index: 0, heapSize: elements.count)
  }

  /**
   * Looks at a parent node and makes sure it is still larger (max-heap) or
   * smaller (min-heap) than its childeren.
   */
  mutating func shiftDown(index: Int, heapSize: Int) {
    var parentIndex = index

    while true {
      let leftChildIndex = indexOfLeftChild(i: parentIndex)
      let rightChildIndex = leftChildIndex + 1

      // Figure out which comes first if we order them by the sort function:
      // the parent, the left child, or the right child. If the parent comes
      // first, we're done. If not, that element is out-of-place and we make
      // it "float down" the tree until the heap property is restored.
      var first = parentIndex
      if leftChildIndex < heapSize && isOrderedBefore(elements[leftChildIndex], elements[first]) {
        first = leftChildIndex
      }
      if rightChildIndex < heapSize && isOrderedBefore(elements[rightChildIndex], elements[first]) {
        first = rightChildIndex
      }
      if first == parentIndex { return }

      elements.swapAt(parentIndex, first)
      parentIndex = first
    }
  }
}

// MARK: - Searching
extension Heap where T: Equatable {
  /**
   * Searches the heap for the given element. Performance: O(n).
   */
  public func index(of element: T) -> Int? {
    return index(of: element, 0)
  }

  private func index(of element: T, _ i: Int) -> Int? {
    if i >= count { return nil }
    if isOrderedBefore(element, elements[i]) { return nil }
    if element == elements[i] { return i }
    if let j = index(of: element, indexOfLeftChild(i: i)) { return j }
    if let j = index(of: element, indexOfRightChild(i: i)) { return j }
    return nil
  }
}

/*
  Basic implementation of Huffman encoding. It encodes bytes that occur often
  with a smaller number of bits than bytes that occur less frequently.
  Based on Al Stevens' C Programming column from Dr.Dobb's Magazine, February
  1991 and October 1992.
  Note: This code is not optimized for speed but explanation.
*/
public class Huffman {
  /* Tree nodes don't use pointers to refer to each other, but simple integer
     indices. That allows us to use structs for the nodes. */
  typealias NodeIndex = Int

  /* A node in the compression tree. Leaf nodes represent the actual bytes that
     are present in the input data. The count of an intermediary node is the sum
     of the counts of all nodes below it. The root node's count is the number of
     bytes in the original, uncompressed input data. */
  struct Node {
    var count = 0
    var index: NodeIndex = -1
    var parent: NodeIndex = -1
    var left: NodeIndex = -1
    var right: NodeIndex = -1
  }

  /* The tree structure. The first 256 entries are for the leaf nodes (not all
     of those may be used, depending on the input). We add additional nodes as
     we build the tree. */
  var tree = [Node](repeating: Node(), count: 256)

  /* This is the last node we add to the tree. */
  var root: NodeIndex = -1

  /* The frequency table describes how often a byte occurs in the input data.
     You need it to decompress the Huffman-encoded data. The frequency table
     should be serialized along with the compressed data. */
  public struct Freq {
    var byte: UInt8 = 0
    var count = 0
  }

  public init() { }
}

extension Huffman {
  /* To compress a block of data, first we need to count how often each byte
     occurs. These counts are stored in the first 256 nodes in the tree, i.e.
     the leaf nodes. The frequency table used by decompression is derived from
     this. */
  fileprivate func countByteFrequency(inData data: NSData) {
    var ptr = data.bytes.assumingMemoryBound(to: UInt8.self)
    for _ in 0..<data.length {
      let i = Int(ptr.pointee)
      tree[i].count += 1
      tree[i].index = i
      ptr = ptr.successor()
    }
  }

  /* Takes a frequency table and rebuilds the tree. This is the first step of
     decompression. */
    fileprivate func restoreTree(fromTable frequencyTable: [Freq]) {
    for freq in frequencyTable {
      let i = Int(freq.byte)
      tree[i].count = freq.count
      tree[i].index = i
    }
    buildTree()
  }

  /* Returns the frequency table. This is the first 256 nodes from the tree but
     only those that are actually used, without the parent/left/right pointers.
     You would serialize this along with the compressed file. */
  public func frequencyTable() -> [Freq] {
    var a = [Freq]()
    for i in 0..<256 where tree[i].count > 0 {
      a.append(Freq(byte: UInt8(i), count: tree[i].count))
    }
    return a
  }
}

extension Huffman {
  /* Builds a Huffman tree from a frequency table. */
  fileprivate func buildTree() {
    // Create a min-priority queue and enqueue all used nodes.
    var queue = PriorityQueue<Node>(sort: { $0.count < $1.count })
    for node in tree where node.count > 0 {
      queue.enqueue(node)
    }

    while queue.count > 1 {
      // Find the two nodes with the smallest frequencies that do not have
      // a parent node yet.
      let node1 = queue.dequeue()!
      let node2 = queue.dequeue()!

      // Create a new intermediate node.
      var parentNode = Node()
      parentNode.count = node1.count + node2.count
      parentNode.left = node1.index
      parentNode.right = node2.index
      parentNode.index = tree.count
      tree.append(parentNode)

      // Link the two nodes into their new parent node.
      tree[node1.index].parent = parentNode.index
      tree[node2.index].parent = parentNode.index

      // Put the intermediate node back into the queue.
      queue.enqueue(parentNode)
    }

    // The final remaining node in the queue becomes the root of the tree.
    let rootNode = queue.dequeue()!
    root = rootNode.index
  }
}

extension Huffman {
  /* Compresses the contents of an NSData object. */
  public func compressData(data: NSData) -> NSData {
    countByteFrequency(inData: data)
    buildTree()

    let writer = BitWriter()
    var ptr = data.bytes.assumingMemoryBound(to: UInt8.self)
    for _ in 0..<data.length {
      let c = ptr.pointee
      let i = Int(c)
      traverseTree(writer: writer, nodeIndex: i, childIndex: -1)
      ptr = ptr.successor()
    }
    writer.flush()
    return writer.data
  }

  /* Recursively walks the tree from a leaf node up to the root, and then back
     again. If a child is the right node, we emit a 0 bit; if it's the left node,
     we emit a 1 bit. */
  private func traverseTree(writer: BitWriter, nodeIndex h: Int, childIndex child: Int) {
    if tree[h].parent != -1 {
      traverseTree(writer: writer, nodeIndex: tree[h].parent, childIndex: h)
    }
    if child != -1 {
      if child == tree[h].left {
        writer.writeBit(bit: true)
      } else if child == tree[h].right {
        writer.writeBit(bit: false)
      }
    }
  }
}

extension Huffman {
  /* Takes a Huffman-compressed NSData object and outputs the uncompressed data. */
  public func decompressData(data: NSData, frequencyTable: [Freq]) -> NSData {
    restoreTree(fromTable: frequencyTable)

    let reader = BitReader(data: data)
    let outData = NSMutableData()
    let byteCount = tree[root].count

    var i = 0
    while i < byteCount {
      var b = findLeafNode(reader: reader, nodeIndex: root)
      outData.append(&b, length: 1)
      i += 1
    }
    return outData
  }

  /* Walks the tree from the root down to the leaf node. At every node, read the
     next bit and use that to determine whether to step to the left or right.
     When we get to the leaf node, we simply return its index, which is equal to
     the original byte value. */
  private func findLeafNode(reader: BitReader, nodeIndex: Int) -> UInt8 {
    var h = nodeIndex
    while tree[h].right != -1 {
      if reader.readBit() {
        h = tree[h].left
      } else {
        h = tree[h].right
      }
    }
    return UInt8(h)
  }
}

/* Helper class for writing bits to an NSData object. */
public class BitWriter {
  public var data = NSMutableData()
  var outByte: UInt8 = 0
  var outCount = 0

  public func writeBit(bit: Bool) {
    if outCount == 8 {
      data.append(&outByte, length: 1)
      outCount = 0
    }
    outByte = (outByte << 1) | (bit ? 1 : 0)
    outCount += 1
  }

  public func flush() {
    if outCount > 0 {
      if outCount < 8 {
        let diff = UInt8(8 - outCount)
        outByte <<= diff
      }
      data.append(&outByte, length: 1)
    }
  }
}

/* Helper class for reading bits from an NSData object. */
public class BitReader {
  var ptr: UnsafePointer<UInt8>
  var inByte: UInt8 = 0
  var inCount = 8

  public init(data: NSData) {
    ptr = data.bytes.assumingMemoryBound(to: UInt8.self)
  }

  public func readBit() -> Bool {
    if inCount == 8 {
      inByte = ptr.pointee    // load the next byte
      inCount = 0
      ptr = ptr.successor()
    }
    let bit = inByte & 0x80  // read the next bit
    inByte <<= 1
    inCount += 1
    return bit == 0 ? false : true
  }
}


/*
  Priority Queue, a queue where the most "important" items are at the front of
  the queue.
  The heap is a natural data structure for a priority queue, so this object
  simply wraps the Heap struct.
  All operations are O(lg n).
  Just like a heap can be a max-heap or min-heap, the queue can be a max-priority
  queue (largest element first) or a min-priority queue (smallest element first).
*/
public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  /*
    To create a max-priority queue, supply a > sort function. For a min-priority
    queue, use <.
  */
  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(_ element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }

  /*
    Allows you to change the priority of an element. In a max-priority queue,
    the new priority should be larger than the old one; in a min-priority queue
    it should be smaller.
  */
  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}

extension PriorityQueue where T: Equatable {
  public func indexOf(element: T) -> Int? {
    return heap.index(of: element)
  }
}
for _ in 1...500000 {
let s1 = "so much words wow many compression"
if let originalData = s1.data(using: .utf8) {
  //print(originalData.count)

  let huffman1 = Huffman()
  let compressedData = huffman1.compressData(data: originalData as NSData)
  //print(compressedData.length)

  let frequencyTable = huffman1.frequencyTable()
  //print(frequencyTable)
  let huffman2 = Huffman()
  let decompressedData = huffman2.decompressData(data: compressedData, frequencyTable: frequencyTable)
  //print(decompressedData.length)

  let s2 = String(data: decompressedData as Data, encoding: .utf8)!
  //print(s2)
  assert(s1 == s2)
}
}
