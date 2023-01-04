//: Playground - noun: a place where people can play
// last checked with Xcode 9.0b4
#if swift(>=4.0)
print("Hello, Swift 4!")
#endif
public class Graph: CustomStringConvertible {
  public typealias Node = String

  private(set) public var adjacencyLists: [Node : [Node]]

  public init() {
    adjacencyLists = [Node: [Node]]()
  }

  public func addNode(_ value: Node) -> Node {
    adjacencyLists[value] = []
    return value
  }

  public func addEdge(fromNode from: Node, toNode to: Node) -> Bool {
    adjacencyLists[from]?.append(to)
    return adjacencyLists[from] != nil ? true : false
  }

  public var description: String {
    return adjacencyLists.description
  }

  public func adjacencyList(forNode node: Node) -> [Node]? {
    for (key, adjacencyList) in adjacencyLists {
      if key == node {
        return adjacencyList
      }
    }
    return nil
  }
}

extension Graph {
  typealias InDegree = Int

  func calculateInDegreeOfNodes() -> [Node : InDegree] {
    var inDegrees = [Node: InDegree]()

    for (node, _) in adjacencyLists {
      inDegrees[node] = 0
    }

    for (_, adjacencyList) in adjacencyLists {
      for nodeInList in adjacencyList {
        inDegrees[nodeInList] = (inDegrees[nodeInList] ?? 0) + 1
      }
    }
    return inDegrees
  }
}
extension Graph {
  private func depthFirstSearch(_ source: Node, visited: inout [Node : Bool]) -> [Node] {
    var result = [Node]()

    if let adjacencyList = adjacencyList(forNode: source) {
      for nodeInAdjacencyList in adjacencyList {
        if let seen = visited[nodeInAdjacencyList], !seen {
          result = depthFirstSearch(nodeInAdjacencyList, visited: &visited) + result
        }
      }
    }

    visited[source] = true
    return [source] + result
  }

  /* Topological sort using depth-first search. */
  public func topologicalSort() -> [Node] {

    let startNodes = calculateInDegreeOfNodes().filter({ _, indegree in
      return indegree == 0
    }).map({ node, _ in
      return node
    })

    var visited = [Node: Bool]()
    for (node, _) in adjacencyLists {
      visited[node] = false
    }

    var result = [Node]()
    for startNode in startNodes {
      result = depthFirstSearch(startNode, visited: &visited) + result
    }

    return result
  }
}

extension Graph {
  /* Topological sort using Kahn's algorithm. */
  public func topologicalSortKahn() -> [Node] {
    var nodes = calculateInDegreeOfNodes()

    // Find vertices with no predecessors and puts them into a new list.
    // These are the "leaders". The leaders array eventually becomes the
    // topologically sorted list.
    var leaders = nodes.filter({ _, indegree in
      return indegree == 0
    }).map({ node, _ in
      return node
    })

    // "Remove" each of the leaders. We do this by decrementing the in-degree
    // of the nodes they point to. As soon as such a node has itself no more
    // predecessors, it is added to the leaders array. This repeats until there
    // are no more vertices left.
    var l = 0
    while l < leaders.count {
      if let edges = adjacencyList(forNode: leaders[l]) {
        for neighbor in edges {
          if let count = nodes[neighbor] {
            nodes[neighbor] = count - 1
            if count == 1 {             // this leader was the last predecessor
              leaders.append(neighbor)  // so neighbor is now a leader itself
            }
          }
        }
      }
      l += 1
    }

    // Was there a cycle in the graph?
    if leaders.count != nodes.count {
      print("Error: graphs with cycles are not allowed")
    }

    return leaders
  }
}

/*
  An alternative implementation of topological sort using depth-first search.
  This does not start at vertices with in-degree 0 but simply at the first one
  it finds. It uses a stack to build up the sorted list, but in reverse order.
*/
extension Graph {
  public func topologicalSortAlternative() -> [Node] {
    var stack = [Node]()

    var visited = [Node: Bool]()
    for (node, _) in adjacencyLists {
      visited[node] = false
    }

    func depthFirstSearch(_ source: Node) {
      if let adjacencyList = adjacencyList(forNode: source) {
        for neighbor in adjacencyList {
          if let seen = visited[neighbor], !seen {
            depthFirstSearch(neighbor)
          }
        }
      }
      stack.append(source)
      visited[source] = true
    }

    for (node, _) in visited {
      if let seen = visited[node], !seen {
        depthFirstSearch(node)
      }
    }

    return stack.reversed()
  }
}


let graph = Graph()

let node5 = graph.addNode("5")
let node7 = graph.addNode("7")
let node3 = graph.addNode("3")
let node11 = graph.addNode("11")
let node8 = graph.addNode("8")
let node2 = graph.addNode("2")
let node9 = graph.addNode("9")
let node10 = graph.addNode("10")

graph.addEdge(fromNode: node5, toNode: node11)
graph.addEdge(fromNode: node7, toNode: node11)
graph.addEdge(fromNode: node7, toNode: node8)
graph.addEdge(fromNode: node3, toNode: node8)
graph.addEdge(fromNode: node3, toNode: node10)
graph.addEdge(fromNode: node11, toNode: node2)
graph.addEdge(fromNode: node11, toNode: node9)
graph.addEdge(fromNode: node11, toNode: node10)
graph.addEdge(fromNode: node8, toNode: node9)

for _ in 1...500000 {
// using depth-first search
graph.topologicalSort()

// also using depth-first search
graph.topologicalSortAlternative()

// Kahn's algorithm
graph.topologicalSortKahn()
}
