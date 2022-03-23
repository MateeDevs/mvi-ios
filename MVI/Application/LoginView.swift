//
//  Created by Petr Chmelar on 23.03.2022
//  Copyright © 2022 Matee. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.state.isLogged)
                .font(.largeTitle)
            TextField("Email", text: Binding<String>(
                get: { viewModel.state.email },
                set: { email in viewModel.onIntent(.changeEmail(email)) }
            ))
            SecureField("Password", text: Binding<String>(
                get: { viewModel.state.password},
                set: { password in viewModel.onIntent(.changePassword(password)) }
            ))
            Button("Login") {
                viewModel.onIntent(.login)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
