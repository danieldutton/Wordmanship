import Combine
import Foundation

class UKEnglishWordService: WordService {
    //
    func getRandomWord() -> AnyPublisher<Word, Never> {
        var request = URLRequest(url: URL(string: "https://wordsapiv1.p.mashape.com/words?random=true")!)
        request.addValue("X-Mashape-Key", forHTTPHeaderField: "7b4084b0cdmsh0c4123f9c0af4b5p13c2bajsn166bdcd748e7")
        request.addValue("Accept", forHTTPHeaderField: "application/json")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Word.self, decoder: JSONDecoder())
            .assertNoFailure()
            .eraseToAnyPublisher()
        
    }
}
