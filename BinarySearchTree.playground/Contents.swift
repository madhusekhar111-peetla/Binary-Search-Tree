//: Playground - noun: a place where people can play
/*public enum BinarySearchTree<T: Comparable> {
  case empty
  case leaf(T)
  indirect case node(BinarySearchTree, T, BinarySearchTree)

  /* How many nodes are in this subtree. Performance: O(n). */
  public var count: Int {
    switch self {
    case .empty: return 0
    case .leaf: return 1
    case let .node(left, _, right): return left.count + 1 + right.count
    }
  }

  /* Distance of this node to its lowest leaf. Performance: O(n). */
  public var height: Int {
    switch self {
    case .empty: return -1
    case .leaf: return 0
    case let .node(left, _, right): return 1 + max(left.height, right.height)
    }
  }

  /*
    Inserts a new element into the tree.
    Performance: runs in O(h) time, where h is the height of the tree.
  */
  public func insert(newValue: T) -> BinarySearchTree {
    switch self {
    case .empty:
      return .leaf(newValue)

    case .leaf(let value):
      if newValue < value {
        return .node(.leaf(newValue), value, .empty)
      } else {
        return .node(.empty, value, .leaf(newValue))
      }

    case .node(let left, let value, let right):
      if newValue < value {
        return .node(left.insert(newValue: newValue), value, right)
      } else {
        return .node(left, value, right.insert(newValue: newValue))
      }
    }
  }

  /*
    Finds the "highest" node with the specified value.
    Performance: runs in O(h) time, where h is the height of the tree.
  */
  public func search(x: T) -> BinarySearchTree? {
    switch self {
    case .empty:
      return nil
    case .leaf(let y):
      return (x == y) ? self : nil
    case let .node(left, y, right):
      if x < y {
        return left.search(x: x)
      } else if y < x {
        return right.search(x: x)
      } else {
        return self
      }
    }
  }

  public func contains(x: T) -> Bool {
    return search(x: x) != nil
  }

  /*
    Returns the leftmost descendent. O(h) time.
  */
  public func minimum() -> BinarySearchTree {
    var node = self
    var prev = node
    while case let .node(next, _, _) = node {
      prev = node
      node = next
    }
    if case .leaf = node {
      return node
    }
    return prev
  }

  /*
    Returns the rightmost descendent. O(h) time.
  */
  public func maximum() -> BinarySearchTree {
    var node = self
    var prev = node
    while case let .node(_, _, next) = node {
      prev = node
      node = next
    }
    if case .leaf = node {
      return node
    }
    return prev
  }
}

extension BinarySearchTree: CustomDebugStringConvertible {
  public var debugDescription: String {
    switch self {
    case .empty: return "."
    case .leaf(let value): return "\(value)"
    case .node(let left, let value, let right):
      return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
    }
  }
}
*/

let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)

let toDelete = tree.search(value: 1)
toDelete?.remove()
tree

let tree2 = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])

tree.search(value: 5)
tree.search(value: 2)
tree.search(value: 7)
tree.search(value: 6)

tree.traverseInOrder { value in print(value) }

tree.toArray()

tree.minimum()
tree.maximum()

if let node2 = tree.search(value: 2) {
  node2.remove()
  node2
  print(tree)
}

tree.height()
tree.predecessor()
tree.successor()

if let node10 = tree.search(value: 10) {
  node10.depth()        // 1
  node10.height()       // 1
  node10.predecessor()
  node10.successor()    // nil
}

if let node9 = tree.search(value: 9) {
  node9.depth()        // 2
  node9.height()       // 0
  node9.predecessor()
  node9.successor()
}

if let node1 = tree.search(value: 1) {
  // This makes it an invalid binary search tree because 100 is greater
  // than the root, 7, and so must be in the right branch not in the left.
  tree.isBST(minValue: Int.min, maxValue: Int.max)  // true
  node1.insert(value: 100)
  tree.search(value: 100)                                  // nil
  tree.isBST(minValue: Int.min, maxValue: Int.max)  // false
}
