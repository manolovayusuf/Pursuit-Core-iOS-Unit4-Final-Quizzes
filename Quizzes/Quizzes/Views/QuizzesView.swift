//
//  QuizzesView.swift
//  Quizzes
//
//  Created by Manny Yusuf on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesView: UIView {

    public lazy var quizzesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.scrollDirection = .vertical

        
        var cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "QuizzesCell")
        cv.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(quizzesCollection)
        quizzesCollection.translatesAutoresizingMaskIntoConstraints = false
        quizzesCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        quizzesCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        quizzesCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        quizzesCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}


