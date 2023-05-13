//
//  SignUpViewController.swift
//  helpMap
//
//  Created by 김찬교 on 2023/05/13.
//

import UIKit

class SignUpViewController: UIViewController {

    // MVC패턴을 위한 따로만든 뷰
    private let signupView = SignUpView()
    
    override func loadView() { // 중요, 디테일 뷰를 기본뷰로 사용하기 위함.
        view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        
    }

}
