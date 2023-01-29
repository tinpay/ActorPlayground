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

actor ActorScore {
    var logs: [Int] = []
    private(set) var highScore: Int = 0
    
    func update(with score: Int) {
        logs.append(score)
        if score > highScore {
            highScore = score
        }
    }
    
    nonisolated func doAction() {
        print("doAction")
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

let actorScore = ActorScore()
Task {
    await actorScore.update(with: 200)
    actorScore.doAction()
    print(await actorScore.highScore)
}

Task {
    await actorScore.update(with: 210)
    print(await actorScore.highScore)
}
