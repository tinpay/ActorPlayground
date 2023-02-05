//: [Previous](@previous)

import Foundation

//apple
//boy
//cat
//dog
//curry
//rice
//delicious
var text: String = ""
func readText() {
    Task {
        text = ""
        guard let url = Bundle.main.url(forResource: "text", withExtension: "txt") else { return }
        
        do {
            for try await line in url.lines {
                if line == "boy" {
                    continue
                }
                if line == "curry" {
                    break
                }
                text += "\(line)\n"
                print(text)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
readText()
print("END")
print(text)

