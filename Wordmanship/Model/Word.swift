import Foundation

struct Word: Codable {
    let word: String
    let results: [Result]
    let pronunciation: Pronunciation
}
