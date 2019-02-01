//
//  QuizModel.swift
//  Quizzes
//
//  Created by Manny Yusuf on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Quizzes: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}
