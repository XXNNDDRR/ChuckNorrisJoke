//
//  ViewController.swift
//  ChuckNorrisJoke
//
//  Created by Alexander on 30.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var jokeLabel: UILabel!

    let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.fetchData { [weak self] joke in
            DispatchQueue.main.async {
                if let joke = joke {
                    self?.categoryLabel.text = "Category: \(joke.category?.joined(separator: ", ") ?? "")"
                    self?.jokeLabel.text = "Joke: \(joke.value ?? "")"
                } else {
                    // Handle error or display a message to the user
                }
            }
        }
    }
}
