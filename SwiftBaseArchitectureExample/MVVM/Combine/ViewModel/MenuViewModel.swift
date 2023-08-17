//
//  MenuViewModel.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import Combine
import SwiftBaseArchitecture

class MenuViewModel: Portable, MenuPublishable {
    typealias Input = MenuResponder
    typealias Output = MenuPublishable
    
    private var menus: [Menu] = []
    
    private var menusSubject = PassthroughSubject<[Menu], Never>()
    
    var menusPublisher: AnyPublisher<[Menu], Never> {
        return menusSubject.eraseToAnyPublisher()
    }
}

extension MenuViewModel: MenuResponder {
    func fetchMenus() {
        menus = [
            Menu(name: "Menu 1", price: 10.0),
            Menu(name: "Item 2", price: 20.0),
            Menu(name: "Item 3", price: 30.0)
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.menusSubject.send(self.menus)
        }
    }
}
