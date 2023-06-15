import UIKit

class SigninVC: UIViewController {
    private lazy var titleLabel = UILabel().then {
        $0.text = "HelpMap"
        $0.font = UIFont.boldSystemFont(ofSize: 60)
    }
    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요."
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }

    private lazy var loginButton = UIButton(type: .system).then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
    }

    private lazy var navigateSignupButton = UIButton(type: .system).then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("회원가입하러가기", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        layout()
        setupAddTarget()
    }
    
    func addSubview() {
        [
            titleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
            navigateSignupButton
        ].forEach { view.addSubview($0) }
    }
    
    func layout() {
        titleLabel.snp.makeConstraints {
            $0.topMargin.equalTo(50)
            $0.leftMargin.equalTo(16)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        loginButton.snp.makeConstraints {
            $0.bottomMargin.equalTo(-50)
            $0.height.equalTo(60)
            $0.left.right.equalToSuperview().inset(16)
        }
        navigateSignupButton.snp.makeConstraints {
            $0.centerX.equalTo(loginButton)
            $0.top.equalTo(loginButton.snp.bottom).offset(5)
        }
    }
    
    func setupAddTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        navigateSignupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        navigationController?.pushViewController(HomeVC, animated: true)
        
    }
    @objc func signupButtonTapped() {
        let signupVC = SignupVC()
        navigationController?.pushViewController(signupVC, animated: true)
        
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

