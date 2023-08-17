//
//  ProfileInteractor.swift
//  SwiftBaseArchitectureExample
//
//  Created by Andre Elandra on 17/08/23.
//

import Foundation
import UIKit
import SwiftBaseArchitecture

protocol ProfileInteractorProtocol: AnyObject {
    func fetchProfile()
}

class ProfileInteractor: BindableInteractor, ProfileInteractorProtocol {
    
    weak var presenter: ProfilePresenterProtocol?

    func fetchProfile() {
        let profile = Profile(username: "dre")
        presenter?.profileFetched(profile)
    }
}
