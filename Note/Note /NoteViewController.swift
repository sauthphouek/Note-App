//
//  NoteViewController.swift
//  Exercise2
//
//  Created by Sauth.P on 18/5/24.
//

import UIKit

class NoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note"
        view.backgroundColor = .systemGray6

        // add button to the app bar
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        navigationItem.rightBarButtonItem = button
        
        
        
    }
    
    @objc func addNote() {
        let vc = CreateNoteViewController()

        navigationController?.pushViewController(vc, animated: true)
    }



}
