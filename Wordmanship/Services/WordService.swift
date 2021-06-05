import Combine
import Foundation

protocol WordService {
    func getRandomWord() -> AnyPublisher<Word, Never>
}
