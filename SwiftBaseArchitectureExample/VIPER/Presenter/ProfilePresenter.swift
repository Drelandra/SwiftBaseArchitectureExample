//
//  ProfilePresenter.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import SwiftBaseArchitecture

protocol ProfilePresenterProtocol: AnyObject {
    func viewDidLoad()
    func profileFetched(_ profile: Profile)
    func routeToMenu()
}

class ProfilePresenter: BindablePresenter, ProfilePresenterProtocol {
    
    typealias View = ProfileViewProtocol
    typealias Interactor = ProfileInteractorProtocol
    typealias Router = ProfileRouting
    
    weak var view: ProfileViewProtocol?
    var interactor: ProfileInteractorProtocol?
    var router: Router?
    
    func viewDidLoad() {
        interactor?.fetchProfile()
    }
    
    func profileFetched(_ profile: Profile) {
        view?.displayProfile(profile)
    }
    
    func routeToMenu() {
        router?.routeToMenu()
    }
}
