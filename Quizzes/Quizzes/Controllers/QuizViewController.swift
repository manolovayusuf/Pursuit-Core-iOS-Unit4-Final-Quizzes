//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    private var quizData = [Quizzes]() {
        didSet {
            DispatchQueue.main.async {
                self.quizView.quizzesCollection.reloadData()
            }
        }
    }
    
    var quizView = QuizzesView()
    var cellID = "QuizzesCell"
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(quizView)
    retrieveQuizData()
    quizView.quizzesCollection.dataSource = self
    quizView.quizzesCollection.delegate = self
    self.tabBarController?.tabBar.items?[0].image = UIImage(named: "help")
    self.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    title = "My Quizzes"
    
  }
    
    public func retrieveQuizData() {
        QuizAPIClient.getQuizQuestions { (appError, quizzes) in
            if let appError = appError {
                print("App error is \(appError)")
            } else if let quizzes = quizzes {
                self.quizData = quizzes
                dump(self.quizData)
            }
        }
    }


}

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = quizView.quizzesCollection.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! QuizCollectionViewCell
        cell.titleLabel.text = "Overlord Manny"
        return cell
}

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let quizCell = collectionView.cellForItem(at: indexPath) as? QuizDetailCollectionViewCell else { return }
//        let quiz = quizData[indexPath.row]
//        let quizDetailVC = QuizDetailViewController()
//        //quizDetailVC.quizDetailData = quiz.quizTitle[0]
//    }
}


