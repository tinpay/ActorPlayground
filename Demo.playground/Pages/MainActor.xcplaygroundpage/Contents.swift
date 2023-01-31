//: [Previous](@previous)
import Foundation

@MainActor
final class ViewModel: ObservableObject {
    @Published private(set) var text: String = ""
    
//    nonisolated func fetchUser() async {
//        text = await waitOneSecond(with: "AAA")
//    }
    
    nonisolated func fetchUser() async -> String{
        await waitOneSecond(with: "AAA")
    }
    
    func didTapButton() {
        Task {
            text = ""
            text = await fetchUser()
        }
    }
    
    private func waitOneSecond(with string: String) async -> String {
        try? await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
        return string
    }
}

//let viewModel = ViewModel()
//viewModel.didTapButton()
