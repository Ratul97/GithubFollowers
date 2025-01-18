//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Kazi Shakawat Hossain Ratul on 26/10/24.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let followersButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImage()
        configureUsernameTextField()
        configureGetFollowersButton()
        createTapGestureHandler()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func pushFollowersListVC() {
        let vc = FollowersListVC()
        vc.username = usernameTextField.text
        vc.title = usernameTextField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createTapGestureHandler() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func configureLogoImage() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureUsernameTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureGetFollowersButton() {
        view.addSubview(followersButton)
        followersButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        followersButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            followersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            followersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            followersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            followersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
