//
//  NoteViewController.swift
//  Exercise2
//
//  Created by Sauth.P on 18/5/24.
//

import UIKit

class NoteViewController: UIViewController {
    
    let noteList: [NoteModel] = [
        NoteModel(title: "Note 1", description: "This is note 1", createdAt: Date()),
        NoteModel(title: "Note 2", description: "This is note 2", createdAt: Date()),
        NoteModel(title: "Note 3", description: "This is note 3", createdAt: Date()),
        NoteModel(title: "Note 4", description: "This is note 4", createdAt: Date()),
    ]
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note"
        view.backgroundColor = .clear

        // add button to the app bar
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        navigationItem.rightBarButtonItem = button

        
        setupCollectionView()
    
    }
    
    @objc func addNote() {
        let vc = CreateNoteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NoteCellCollectionViewCell.self, forCellWithReuseIdentifier: NoteCellCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0)
        ])
    }

}

extension NoteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCellCollectionViewCell.identifier, for: indexPath) as! NoteCellCollectionViewCell
        cell.configure(with: noteList[indexPath.row])
        return cell
    }
}

extension NoteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = NoteDetailViewController()
//        vc.note = noteList[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NoteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfRow: CGFloat = 4
        
        let widthFrame = collectionView.frame.width
        let widthCell = (widthFrame  - 20) / numberOfRow - 10
        
        return CGSize(width: widthFrame , height: widthCell)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}
