//
//  ViewController.swift
//  Messengre
//
//  Created by Timothy Myers on 10/30/16.
//  Copyright © 2016 okayestprogrammer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func CreateAccount(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: EmailField.text!, password: PassField.text!, completion: {
            user, error in
            
            if error != nil {
                print("error")
            } else {
                print("User is Created")
                self.Login()
            }
        })
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
        
    }
    
    func Login() {
        FIRAuth.auth()?.signIn(withEmail: EmailField.text!, password: PassField.text!, completion: {
            user, error in
            
            if error != nil {
                print("error")
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profiles")
                self.present(vc!, animated: true, completion: nil)
            }
            
        })
    }
    


}

