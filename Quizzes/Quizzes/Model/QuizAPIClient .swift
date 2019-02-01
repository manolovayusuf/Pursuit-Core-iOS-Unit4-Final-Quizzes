//
//  QuizAPIClient .swift
//  Quizzes
//
//  Created by Manny Yusuf on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizAPIClient {
    private init() {}
    static func getQuizQuestions(completionHandler: @escaping (AppError?, [Quizzes]?) -> Void) {
        let quizEndpointUrl = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
        guard let quizUrl = URL(string: quizEndpointUrl) else {
            completionHandler(AppError.badURL(quizEndpointUrl), nil)
            return
        }
        let request = URLRequest.init(url: quizUrl)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                return
            }
            if let data = data {
                do {
                    let quizInfo = try JSONDecoder().decode([Quizzes].self, from: data)
                    completionHandler(nil, quizInfo)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }.resume()
    }
}

