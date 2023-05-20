import UIKit
import Then
import SnapKit

class SignupVC: UIViewController {
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.font = UIFont.boldSystemFont(ofSize: 60)
    }
    private lazy var nameTextField = UITextField().then {
        $0.placeholder = "닉네임을 입력해주세요."
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요."
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    private lazy var emailVerifyTextField = UITextField().then {
        $0.placeholder = "인증번호을 입력해주세요."
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    private lazy var emailVerifyButton = UIButton(type: .system).then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("전송", for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
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
    private lazy var passwordCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호를 다시 입력해주세요."
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }

    private lazy var signupButton = UIButton(type: .system).then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("회원가입", for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
    }

    private lazy var popNavigateButton = UIButton(type: .system).then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("로그인하러가기", for: .normal)
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
            nameTextField,
            emailTextField,
            emailVerifyTextField,
            emailVerifyButton,
            passwordTextField,
            passwordCheckTextField,
            signupButton,
            popNavigateButton
        ].forEach { view.addSubview($0) }
    }
    
    func layout() {
        titleLabel.snp.makeConstraints {
            $0.topMargin.equalTo(50)
            $0.leftMargin.equalTo(16)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        emailVerifyTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalTo(emailVerifyButton.snp.left).offset(-10)
            $0.height.equalTo(45)
        }
        emailVerifyButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
            $0.width.equalTo(100)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailVerifyTextField.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(45)
        }
        signupButton.snp.makeConstraints {
            $0.bottomMargin.equalTo(-50)
            $0.height.equalTo(60)
            $0.left.right.equalToSuperview().inset(16)
        }
        popNavigateButton.snp.makeConstraints {
            $0.centerX.equalTo(signupButton)
            $0.top.equalTo(signupButton.snp.bottom).offset(5)
        }
    }
    func setupAddTarget() {
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        popNavigateButton.addTarget(self, action: #selector(popNavigate), for: .touchUpInside)
    }
    
    @objc func signupButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        print("회원가입 넘어가기")
        
    }
    @objc func popNavigate() {
        navigationController?.popViewController(animated: true)
    }
}
