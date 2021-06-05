import Combine
import Foundation

class UKEnglishWordService: WordService {
    //
    func getRandomWord() -> AnyPublisher<Word, Never> {
        var request = URLRequest(url: URL(string: "https://wordsapiv1.p.mashape.com/words?random=true")!)
        request.addValue("X-Mashape-Key", forHTTPHeaderField: "---")
        request.addValue("Accept", forHTTPHeaderField: "application/json")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Word.self, decoder: JSONDecoder())
            .assertNoFailure()
            .eraseToAnyPublisher()
        
    }
}
