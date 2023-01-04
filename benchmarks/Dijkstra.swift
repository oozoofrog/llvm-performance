import Foundation

public class Dijkstra {
    private var totalVertices: Set<Vertex>

    public init(vertices: Set<Vertex>) {
        totalVertices = vertices
    }

    private func clearCache() {
        totalVertices.forEach { $0.clearCache() }
    }

    public func findShortestPaths(from startVertex: Vertex) {
        clearCache()
        var currentVertices = self.totalVertices
        startVertex.pathLengthFromStart = 0
        startVertex.pathVerticesFromStart.append(startVertex)
        var currentVertex: Vertex? = startVertex
        while let vertex = currentVertex {
            currentVertices.remove(vertex)
            let filteredNeighbors = vertex.neighbors.filter { currentVertices.contains($0.0) }
            for neighbor in filteredNeighbors {
                let neighborVertex = neighbor.0
                let weight = neighbor.1

                let theoreticNewWeight = vertex.pathLengthFromStart + weight
                if theoreticNewWeight < neighborVertex.pathLengthFromStart {
                    neighborVertex.pathLengthFromStart = theoreticNewWeight
                    neighborVertex.pathVerticesFromStart = vertex.pathVerticesFromStart
                    neighborVertex.pathVerticesFromStart.append(neighborVertex)
                }
            }
            if currentVertices.isEmpty {
                currentVertex = nil
                break
            }
            currentVertex = currentVertices.min { $0.pathLengthFromStart < $1.pathLengthFromStart }
        }
    }
}


open class Vertex {

    open var identifier: String
    open var neighbors: [(Vertex, Double)] = []
    open var pathLengthFromStart = Double.infinity
    open var pathVerticesFromStart: [Vertex] = []

    public init(identifier: String) {
        self.identifier = identifier
    }

    open func clearCache() {
        pathLengthFromStart = Double.infinity
        pathVerticesFromStart = []
    }
}

extension Vertex: Hashable {
    open var hashValue: Int {
        return identifier.hashValue
    }
}

extension Vertex: Equatable {
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

var vertices: Set<Vertex> = Set()

func createNotConnectedVertices() {
    //change this value to increase or decrease amount of vertices in the graph
    let numberOfVerticesInGraph = 15
    for i in 0..<numberOfVerticesInGraph {
        let vertex = Vertex(identifier: "\(i)")
        vertices.insert(vertex)
    }
}

func setupConnections() {
    for vertex in vertices {
        //the amount of edges each vertex can have
        let randomEdgesCount = arc4random_uniform(4) + 1
        for _ in 0..<randomEdgesCount {
            //randomize weight value from 0 to 9
            let randomWeight = Double(arc4random_uniform(10))
            let neighborVertex = randomVertex(except: vertex)

            //we need this check to set only one connection between two equal pairs of vertices
            if vertex.neighbors.contains(where: { $0.0 == neighborVertex }) {
                continue
            }
            //creating neighbors and setting them
            let neighbor1 = (neighborVertex, randomWeight)
            let neighbor2 = (vertex, randomWeight)
            vertex.neighbors.append(neighbor1)
            neighborVertex.neighbors.append(neighbor2)
        }
    }
}

func randomVertex(except vertex: Vertex) -> Vertex {
    var newSet = vertices
    newSet.remove(vertex)
    let offset = Int(arc4random_uniform(UInt32(newSet.count)))
    let index = newSet.index(newSet.startIndex, offsetBy: offset)
    return newSet[index]
}

func randomVertex() -> Vertex {
    let offset = Int(arc4random_uniform(UInt32(vertices.count)))
    let index = vertices.index(vertices.startIndex, offsetBy: offset)
    return vertices[index]
}

for _ in 1...100000 {
//initialize random graph
createNotConnectedVertices()
setupConnections()

//initialize Dijkstra algorithm with graph vertices
let dijkstra = Dijkstra(vertices: vertices)

//decide which vertex will be the starting one
let startVertex = randomVertex()

//let startTime = Date()

//ask algorithm to find shortest paths from start vertex to all others
dijkstra.findShortestPaths(from: startVertex)

//let endTime = Date()

//print("calculation time is = \((endTime.timeIntervalSince(startTime))) sec")

//printing results
let destinationVertex = randomVertex(except: startVertex)
//print(destinationVertex.pathLengthFromStart)
var pathVerticesFromStartString: [String] = []
for vertex in destinationVertex.pathVerticesFromStart {
    pathVerticesFromStartString.append(vertex.identifier)
}

//print(pathVerticesFromStartString.joined(separator: "->"))
}
