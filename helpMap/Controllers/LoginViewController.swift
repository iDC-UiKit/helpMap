//
//  ViewController.swift
//  helpMap
//
//  Created by 김찬교 on 2023/05/13.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    
    
    override func loadView() { // 로드뷰는 viewdidload보다 먼저 실행되는것임.
        // super.loadView() 필요없음
        view = loginView // 기본뷰를 로그인뷰로 교체해주었다.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        print("다음 화면으로 넘어가기")
        
    }
    @objc func signupButtonTapped() {
        let signupVC = SignUpViewController()
//        present(signupVC, animated: true)
        
//        show(signupVC, sender: nil) // show 자체가 pushviewcontroller를 포함하는 개념이라 아이폰인경우는 push처럼 사용하게 설계되어 있음.
        navigationController?.pushViewController(signupVC, animated: true) // 이게 더 정확
        print(#function)

        
    }
    
    // 리셋버튼이 눌리면 동작하는 함수
    @objc func resetButtonTapped() {
        //만들기
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        self.present(alert, animated: true, completion: nil)
    }
}

