//
//  RepositoriesViewModel.swift
//  knackVentureIOS
//
//  Created by 3991--CNM--GGN on 27/11/24.
//

import Foundation

class RepositoriesViewModel {
    private(set) var repositories: [Repository] = []
    var onUpdate: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchRepositories() {
        NetworkManager.shared.fetchRepositories { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos):
                    self?.repositories = repos
                    self?.onUpdate?()
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}

