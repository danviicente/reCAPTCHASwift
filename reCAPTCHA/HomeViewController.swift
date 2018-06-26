//
//  HomeViewController.swift
//  reCAPTCHA
//
//  Created by Danton Vicente on 26/06/2018.
//  Copyright © 2018 Danton Vicente. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var buttonFluxoTokenDuplicado: UIButton!
    @IBOutlet weak var buttonFluxoSecretInvalida: UIButton!
    @IBOutlet weak var buttonFluxoTokenInvalido: UIButton!
    @IBOutlet weak var buttonFluxoNormal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnFluxoNormalClick(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "reCaptchaController") as! ViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    @IBAction func btnTokenInvalidoClick(_ sender: Any) {
        let token = "TokenInvalidoExemplo"
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        myVC.stringPassed = token
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    @IBAction func btnTokenDuplicadoClick(_ sender: Any) {
        let token = "03ACgFB9sAxRhFemuXSV9LrFh7WEdTiyYEr2BS8-UqyN1C2B3XllbdnDoEU2AsDera4pQ9cr1ivIba-UTMBC7mFe_JgIjeVPIjzr8mo5r_iT6uxSnrr0-KTFgppXGIqDrAe_y2-WPX5xYGx5-ILJ5xg0ZxVkcPUQ6qxtUZTJKQ0m7GlKud_RoKwsAoaDvH7MSOCpORJXlWYKyiKpvg8IbTxXw6w9QlLUZVvqd8cfRhzVn8S7A0rYS9gMj0ioSU3PF-eRQFD205MrxsryE-wEiaT0vCYWnwnGI_luNIjuT-JICPhSMEJuJY-UAolI6gmMT8R13JEGsZ6pa74STPNaJ5HKXwf2uRT-SP1A"
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        myVC.stringPassed = token
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
    @IBAction func btnSecretInvalidaClick(_ sender: Any) {
        let secret = "xxxx"
        let token = "03ACgFB9sAxRhFemuXSV9LrFh7WEdTiyYEr2BS8-UqyN1C2B3XllbdnDoEU2AsDera4pQ9cr1ivIba-UTMBC7mFe_JgIjeVPIjzr8mo5r_iT6uxSnrr0-KTFgppXGIqDrAe_y2-WPX5xYGx5-ILJ5xg0ZxVkcPUQ6qxtUZTJKQ0m7GlKud_RoKwsAoaDvH7MSOCpORJXlWYKyiKpvg8IbTxXw6w9QlLUZVvqd8cfRhzVn8S7A0rYS9gMj0ioSU3PF-eRQFD205MrxsryE-wEiaT0vCYWnwnGI_luNIjuT-JICPhSMEJuJY-UAolI6gmMT8R13JEGsZ6pa74STPNaJ5HKXwf2uRT-SP1A"
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        myVC.stringPassed = token
        myVC.stringSecret = secret
        navigationController?.pushViewController(myVC, animated: true)
        
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
