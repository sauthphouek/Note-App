//
//  CreateNoteViewController.swift
//  Note
//
//  Created by Sauth.P on 19/5/24.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"

        // pading left and right
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 46))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 46))
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.autoresizingMask = .flexibleRightMargin
        
        
        return textField
    }()
    
    let textAread: UITextField = {
        let textView = UITextField()
        textView.placeholder = "Note"
        textView.translatesAutoresizingMaskIntoConstraints = false
        // padding left and right
        textView.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 46))
        textView.leftViewMode = .always
        textView.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 46))
        textView.rightViewMode = .always
        textView.autocorrectionType = .no
        textView.autoresizingMask = .flexibleRightMargin
        return textView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        // app bar right button
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        navigationItem.rightBarButtonItem = saveButton
        
        title = "Create Note"
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        
        view.addSubview(containerView)
        
        containerView.addSubview(titleTextField)
        containerView.addSubview(textAread)
        setUpLayout()
        

    }
    
    @objc func saveNote() {
        print("Save")
    }


}

extension CreateNoteViewController {

    
    func setUpLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: textAread.bottomAnchor, constant: 16),
            
            titleTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 46),
            
            textAread.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            textAread.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textAread.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textAread.heightAnchor.constraint(equalToConstant: 46),
            
        ])
    }
}
