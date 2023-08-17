//
//  MenuViewController.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit
import Combine
import SwiftBaseArchitecture

protocol MenuResponder: AnyObject {
    func fetchMenus()
}

protocol MenuPublishable {
    var menusPublisher: AnyPublisher<[Menu], Never> { get }
}

class MenuViewController: BaseViewController, BindablePublisher {
    typealias Responder = MenuResponder
    typealias Publisher = MenuPublishable
    
    var responder: MenuResponder?
    
    var menus: [Menu] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDidLoad()
    }
    
    func setupDidLoad() {
        title = "MVVM + Combine Pattern"
        view.backgroundColor = .yellow
        navigationTitleSize = 28
        responder?.fetchMenus()
    }
    
    override func didTapPushButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(ViewFactory().makeProfileViewController(), animated: true)
    }
    
    func publish(_ publishable: Publisher) {
        publishable.menusPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] menus in
                guard let self = self else { return }
                self.menus = menus
                print("Menus received. \(menus)")
            }
            .store(in: &cancellables)
    }
}

