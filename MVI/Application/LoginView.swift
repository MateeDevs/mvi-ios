//
//  Created by Petr Chmelar on 23.03.2022
//  Copyright © 2022 Matee. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    let useCase = LoginUseCase()
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isLogged: Bool = false
    
    var body: some View {
        VStack {
            Text(isLogged ? "✅" : "❌")
                .font(.largeTitle)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Login") {
                isLogged = useCase.execute(email: email, password: password)
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
