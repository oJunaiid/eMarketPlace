//
//  FooterSection.swift
//  eSewaMarket
//
//  Created by Omar  on 4/30/23.
//

import UIKit
class DeleteConfirmationView: UIViewController {
    
    
    // MARK: - Properties
    
    private let popUpView:UIView = {
        let deleteView = UIView ()
        deleteView.translatesAutoresizingMaskIntoConstraints = false
        deleteView.layer.cornerRadius = 16
        return deleteView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Delete from cart"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let confirmationLabel: UILabel = {
        
        let sublabel = UILabel()
        sublabel.text = "Are you sure you want to delete the item?"
        sublabel.font = UIFont.systemFont(ofSize: 14)
        sublabel.textAlignment = .center
        sublabel.translatesAutoresizingMaskIntoConstraints = false
        sublabel.numberOfLines = 0
        return sublabel
    }()
    
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var onConfirm: ((String) -> ())?
    var onCancel: (() -> ())?
    
    // MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        view.addSubview(popUpView)
        popUpView.backgroundColor = .white
        popUpView.addSubview(messageLabel)
        popUpView.addSubview(confirmationLabel)
        popUpView.addSubview(confirmButton)
        popUpView.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            
            //popUp pin
            popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popUpView.heightAnchor.constraint(equalToConstant: 220),
            
            messageLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -16),
            
            confirmationLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor),
            confirmationLabel.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor),
            
            confirmButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -20),
            confirmButton.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor, constant: 5),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            confirmButton.widthAnchor.constraint(equalToConstant: 150),
            
            cancelButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 20),
            cancelButton.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor, constant: 5),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 150),
            
        ])
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func cancelButtonTapped() {
        onCancel?()
    }
    @objc private func confirmButtonTapped() {
        onConfirm?("The selected item has been delete from the list")
    }
}

