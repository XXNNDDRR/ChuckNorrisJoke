//
//  APIService.swift
//  ChuckNorrisJoke
//
//  Created by Alexander on 30.01.2024.
//

import Foundation

class APIService {
    func fetchData(completion: @escaping (JokeModel?) -> Void) {
        let headers = [
            "accept": "application/json",
            "X-RapidAPI-Key": "9f220e20b0msh47719f1712e4369p1df991jsnacf7de5c7fe1",
            "X-RapidAPI-Host": "matchilling-chuck-norris-jokes-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print("Error: \(error)")
            } else {
                do {
                    if let data = data {
                        let joke = try JSONDecoder().decode(JokeModel.self, from: data)
                        print("Category: \(joke.category ?? [])")
                        print("Joke: \(joke.value ?? "")")
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        })

        dataTask.resume()
    }
}
