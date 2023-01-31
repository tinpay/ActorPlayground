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
    
    func update2(with score: Int) async {
        logs.append(score)
        if score > highScore {
            highScore = score
        }
        
        highScore = await requestHighScore(with: score)
    }
    
    nonisolated func doAction() {
        print("doAction")
        //        logs.append(100)
    }
    
    func requestHighScore(with score: Int) async -> Int {
        try? await Task.sleep(nanoseconds: 2 * NSEC_PER_SEC)
        return score
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

let actorStore2 = ActorScore()
Task {
    await actorStore2.update2(with: 300)
    print(await actorStore2.logs)
    print(await actorStore2.highScore)
}
Task {
    await actorStore2.update2(with: 310)
    print(await actorStore2.logs)
    print(await actorStore2.highScore)
}






