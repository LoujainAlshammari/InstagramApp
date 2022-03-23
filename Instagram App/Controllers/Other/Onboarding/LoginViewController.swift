//
//  LoginViewController.swift
//  Instagram App
//
//  Created by loujain on 12/02/2022.
//
import SafariServices
import UIKit
//import SwiftUI

class LoginViewController: UIViewController {

    struct Constants {
        static let conserRadius: CGFloat = 8.0
    }
    
    public let userNameEmailField : UITextField = {
         let field = UITextField()
        field.placeholder = "Username or Email.."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.conserRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwirdField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password.."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.conserRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.conserRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Terms of servicd", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Poliy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Crete an Account", for: .normal )
        return button
    }()
    
    private let headerView : UIView = {
        let header =  UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginBitton),
                              for: .touchUpInside)
        
        createAccountButton.addTarget(self,
                                      action: #selector(didTapCreateAccountBitton),
                                      for: .touchUpInside)
        termsButton.addTarget(self,
                              action: #selector(didTapTermsBitton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                                action: #selector(didTapPrivacyBitton),
                                for: .touchUpInside)
        userNameEmailField.delegate = self
        passwirdField.delegate = self
        addSubviews()
        
        view.backgroundColor = .systemBackground
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        headerView.frame = CGRect(
            x: 0,
            y: 0.0 ,
            width: view.width,
            height: view.height / 3.0
        )
        
        userNameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40 ,
            width: view.width - 50,
            height: 52.0
        )
        
        passwirdField.frame = CGRect(
            x: 25,
            y: userNameEmailField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwirdField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 50
        )
        
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom - 50,
            width:view.width - 20,
            height: 50
        )
        
        configureHeaderView()
    }
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        // add instgram logo
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width / 2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    private func addSubviews(){
        view.addSubview(userNameEmailField)
        view.addSubview(passwirdField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginBitton(){
        
        passwirdField.resignFirstResponder()
        userNameEmailField.resignFirstResponder()
        guard let usernameEmail = userNameEmailField.text, !usernameEmail.isEmpty,
              let password = passwirdField.text, !password.isEmpty, password.count >= 8 else{
                  return
        }
        //login functionality
    }
    
    @objc private func didTapTermsBitton(){
        guard let url = URL(string: "https://help.instagram.com/478745558852511") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapPrivacyBitton(){
        guard let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapCreateAccountBitton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }


}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameEmailField{
            passwirdField.becomeFirstResponder()
        }
        else if textField == passwirdField{
            didTapLoginBitton()
        }
        return true
    }
    
}
