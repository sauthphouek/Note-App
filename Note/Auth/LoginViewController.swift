//
//  LoginViewController.swift
//  Exercise2
//
//  Created by Sauth.P on 18/5/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sticker")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let welcomTex: UILabel = {
        let label = UILabel()
        label.text = "Login to your account"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 6
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return tf
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 6
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: 46).isActive = true
        tf.isSecureTextEntry = true

        return tf
    }()
    let btnLogin:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 6
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 46).isActive = true

        return btn
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        btnLogin.addTarget(self, action: #selector(submitLogin), for: .touchUpInside)
        setUpKeyBoardEvent()
        addSubViewToScrollView()
        setUpConstraint()
    }
    
    @objc func submitLogin() {
        let name = "Aditi"
        let pass = "2024"
        if userNameTF.text == name || userNameTF.text == "Admin" && passwordTF.text == pass {
           // push to view controller
            let vc = TabbarViewController()
            vc.view.backgroundColor = .red
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            // push to story board main
            let alert = UIAlertController(title: "Error", message: "Invalid Username or Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
//     setUpKeyBoardEvent
    func setUpKeyBoardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // click on the view to dismiss the keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardFrame = keyboardSize.cgRectValue
        let keyboardHeight = keyboardFrame.height
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInset
        view.layoutIfNeeded()
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
        view.layoutIfNeeded()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addSubViewToScrollView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(welcomTex)
        containerView.addSubview(userNameTF)
        containerView.addSubview(passwordTF)
        containerView.addSubview(btnLogin)
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            welcomTex.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            welcomTex.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            welcomTex.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            userNameTF.topAnchor.constraint(equalTo: welcomTex.bottomAnchor, constant: 20),
            userNameTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            userNameTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 20),
            passwordTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            btnLogin.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            btnLogin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            btnLogin.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            btnLogin.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    

}
