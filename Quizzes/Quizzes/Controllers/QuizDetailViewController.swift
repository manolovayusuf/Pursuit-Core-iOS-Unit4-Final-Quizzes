//
//  QuizDetailViewController.swift
//  Quizzes
//
//  Created by Manny Yusuf on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailViewController: UIViewController {

    public var quizDetailData: Quizzes?
    
    public var quizDetailView = QuizzesDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(quizDetailView)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
