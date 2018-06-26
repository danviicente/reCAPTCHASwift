//
//  SecondVC.swift
//  reCAPTCHA
//
//  Created by Danton Vicente on 21/06/2018.
//  Copyright © 2018 Danton Vicente. All rights reserved.
//

import UIKit
struct TokenResults: Codable {
    
    let success: Bool
    var error_results: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case success
        case error_results = "error-codes"
    }
}
class SecondVC: UIViewController {

    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    var stringPassed = ""
    var stringSecret = "6LeKwF8UAAAAAP4yafZOissJ7WNCXkDG554Sm___"
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenLabel.text = stringPassed
        
        guard let gitUrl = URL(string: "https://www.google.com/recaptcha/api/siteverify?secret=\(stringSecret)&response=\(stringPassed)") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let tokenData = try decoder.decode(TokenResults.self, from: data)
                if(tokenData.success){
                    DispatchQueue.main.async {
                        self.resultLabel.text = "SUCESSO"
                    }
                } else {
                    var errors: String = ""
                    for erro in tokenData.error_results! {
                        errors += " \(erro)"
                    }
                    DispatchQueue.main.async {
                        self.resultLabel.text = "FALHOU"
                        self.errorLabel.text = errors
                    }
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
