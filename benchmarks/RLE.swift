import Foundation
import Foundation

extension Data {
    /*
     Compresses the NSData using run-length encoding.
     */
    public func compressRLE() -> Data {
        var data = Data()
        self.withUnsafeBytes { (uPtr: UnsafePointer<UInt8>) in
            var ptr = uPtr
            let end = ptr + count
            while ptr < end {
                var count = 0
                var byte = ptr.pointee
                var next = byte

                // Is the next byte the same? Keep reading until we find a different
                // value, or we reach the end of the data, or the run is 64 bytes.
                while next == byte && ptr < end && count < 64 {
                    ptr = ptr.advanced(by: 1)
                    next = ptr.pointee
                    count += 1
                }

                if count > 1 || byte >= 192 {       // byte run of up to 64 repeats
                    var size = 191 + UInt8(count)
                    data.append(&size, count: 1)
                    data.append(&byte, count: 1)
                } else {                            // single byte between 0 and 192
                    data.append(&byte, count: 1)
                }
            }
        }
        return data
    }

    /*
     Converts a run-length encoded NSData back to the original.
     */
    public func decompressRLE() -> Data {
        var data = Data()
        self.withUnsafeBytes { (uPtr: UnsafePointer<UInt8>) in
            var ptr = uPtr
            let end = ptr + count

            while ptr < end {
                // Read the next byte. This is either a single value less than 192,
                // or the start of a byte run.
                var byte = ptr.pointee
                ptr = ptr.advanced(by: 1)

                if byte < 192 {                     // single value
                    data.append(&byte, count: 1)
                } else if ptr < end {               // byte run
                    // Read the actual data value.
                    var value = ptr.pointee
                    ptr = ptr.advanced(by: 1)

                    // And write it out repeatedly.
                    for _ in 0 ..< byte - 191 {
                        data.append(&value, count: 1)
                    }
                }
            }
        }
        return data
    }
}

let originalString = "aaaaabbbcdeeeeeeef"
let utf8 = originalString.data(using: String.Encoding.utf8)!
let compressed = utf8.compressRLE()

let decompressed = compressed.decompressRLE()
let restoredString = String(data: decompressed, encoding: String.Encoding.utf8)
originalString == restoredString

func encodeAndDecode(_ bytes: [UInt8]) -> Bool {
    var bytes = bytes

    var data1 = Data(bytes: &bytes, count: bytes.count)
    //print("data1 is \(data1.count) bytes")

    var rleData = data1.compressRLE()
    //print("encoded data is \(rleData.count) bytes")

    var data2 = rleData.decompressRLE()
    //print("data2 is \(data2.count) bytes")

    return data1 == data2
}

func testEmpty() -> Bool {
    let bytes: [UInt8] = []
    return encodeAndDecode(bytes)
}

func testOneByteWithLowValue() -> Bool {
    let bytes: [UInt8] = [0x80]
    return encodeAndDecode(bytes)
}

func testOneByteWithHighValue() -> Bool {
    let bytes: [UInt8] = [0xD0]
    return encodeAndDecode(bytes)
}

func testSimpleCases() -> Bool {
    let bytes: [UInt8] = [
        0x00,
        0x20, 0x20, 0x20, 0x20, 0x20,
        0x30,
        0x00, 0x00,
        0xC0,
        0xC1,
        0xC0, 0xC0, 0xC0,
        0xFF, 0xFF, 0xFF, 0xFF
    ]
    return encodeAndDecode(bytes)
}

func testBufferWithoutSpans() -> Bool {
    // There is nothing that can be encoded in this buffer, so the encoded
    // data ends up being longer.
    var bytes: [UInt8] = []
    for i in 0..<1024 {
        bytes.append(UInt8(i % 256))
    }
    return encodeAndDecode(bytes)
}

func testBufferWithSpans(_ spanSize: Int) -> Bool {
    //print("span size \(spanSize)")

    let length = spanSize * 32
    var bytes: [UInt8] = Array<UInt8>(repeating: 0, count: length)

    for t in stride(from: 0, to: length, by: spanSize) {
        for i in 0..<spanSize {
            bytes[t + i] = UInt8(t % 256)
        }
    }
    return encodeAndDecode(bytes)
}

func testRandomByte() -> Bool {
    let length = 1 + Int(arc4random_uniform(2048))
    var bytes: [UInt8] = []
    for _ in 0..<length {
        bytes.append(UInt8(arc4random() % 256))
    }
    return encodeAndDecode(bytes)
}

func runTests() -> Bool {
    var tests: [Bool] = [
        testEmpty(),
        testOneByteWithLowValue(),
        testOneByteWithHighValue(),
        testSimpleCases(),
        testBufferWithoutSpans(),
        testBufferWithSpans(4),
        testBufferWithSpans(63),
        testBufferWithSpans(64),
        testBufferWithSpans(65),
        testBufferWithSpans(66),
        testBufferWithSpans(80)
    ]
    for _ in 0..<10 {
        let result = testRandomByte()
        tests.append(result)
    }
    var result = true
    for bool in tests {
        result = result && bool
    }

    return result
}

for _ in 1...1000 {
runTests()
}
