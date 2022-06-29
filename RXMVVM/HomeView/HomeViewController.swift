//
//  HomeViewController.swift
//  RXMVVM
//
//  Created by Giovane Barreira on 29/06/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        viewModel.getLoggedUser()
    }
    
    private func setupBinders() {
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.welcomeLbl.text = message
        }
    }
}
