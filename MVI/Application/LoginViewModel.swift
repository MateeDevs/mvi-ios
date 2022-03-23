//
//  Created by Petr Chmelar on 23.03.2022
//  Copyright © 2022 Matee. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let useCase = LoginUseCase()
    
    @Published private(set) var state = State()
    
    struct State {
        var email: String = ""
        var password: String = ""
        var isLogged: Bool = false
    }
    
    enum Intent {
        case changeEmail(String)
        case changePassword(String)
        case login
    }
    
    func onIntent(_ intent: Intent) {
        switch intent {
        case .changeEmail(let email): changeEmail(email)
        case .changePassword(let password): changePassword(password)
        case .login: login()
        }
    }
    
    private func changeEmail(_ email: String) {
        state.email = email
    }
    
    private func changePassword(_ password: String) {
        state.password = password
    }
    
    private func login() {
        state.isLogged = useCase.execute(email: state.email, password: state.password)
    }
}
