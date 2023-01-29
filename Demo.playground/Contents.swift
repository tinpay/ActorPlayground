import UIKit

class Score {
    var logs: [Int] = []
    private(set) var highScore: Int = 0
    
    func update(with score: Int) {
        logs.append(score)
        if score > highScore {
            highScore = score
        }
    }
}

let score = Score()
DispatchQueue.global(qos: .default).async {
    score.update(with: 100)
    print(score.highScore)
}

DispatchQueue.global(qos: .default).async {
    score.update(with: 110)
    print(score.highScore)
}
