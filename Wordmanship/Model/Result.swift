import Foundation

struct Result: Codable {
    let definition: String
    let partOfSpeech: String
    let typeOf: String
    let derivation: [String]
}
