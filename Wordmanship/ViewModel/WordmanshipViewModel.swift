import Combine
import Foundation

class WordmanshipViewModel: ObservableObject {
    @Published var word = Word(word: "-------", results: [Result(definition: "shazam", partOfSpeech: "", typeOf: "", derivation: [])], pronunciation: Pronunciation(all: ""))
    private var subscriptions = Set<AnyCancellable>()
    private var wordService: WordService
    
    init(wordService: WordService = UKEnglishWordService()) {
        self.wordService = wordService
    }
    
    func getRandomWord() {
        wordService.getRandomWord()
            .assign(to: \.word, on: self)
            .store(in: &subscriptions)
    }
}
