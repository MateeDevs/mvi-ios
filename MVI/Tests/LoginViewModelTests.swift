//
//  Created by Petr Chmelar on 23.03.2022
//  Copyright © 2022 Matee. All rights reserved.
//

@testable import MVI
import XCTest

class LoginViewModelTests: XCTestCase {
    
    func testLoginEmpty() {
        let vm = LoginViewModel()
        
        vm.onIntent(.changeEmail(""))
        vm.onIntent(.changePassword(""))
        vm.onIntent(.login)
        
        XCTAssertEqual(vm.state.isLogged, "❌")
    }
    
    func testLoginValid() {
        let vm = LoginViewModel()
        
        vm.onIntent(.changeEmail("abc"))
        vm.onIntent(.changePassword("bflmpsvz"))
        vm.onIntent(.login)
        
        XCTAssertEqual(vm.state.isLogged, "✅")
    }
    
    func testLoginInvalid() {
        let vm = LoginViewModel()
        
        vm.onIntent(.changeEmail("abc"))
        vm.onIntent(.changePassword("abcdefgh"))
        vm.onIntent(.login)
        
        XCTAssertEqual(vm.state.isLogged, "❌")
    }
}
