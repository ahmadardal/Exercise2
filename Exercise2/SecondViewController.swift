//
//  SecondViewController.swift
//  Exercise2
//
//  Created by Ahmad Ardal on 2022-09-02.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet var imgResult: UIImageView!
    
    
    @IBOutlet var lblResult: UILabel!
    
    var passed: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch passed {
        case true:
            imgResult.image = UIImage(named: "success")
            lblResult.text = "You have passed the test!"
            break
        case false:
            imgResult.image = UIImage(named: "failed")
            lblResult.text = "You have failed the test!"
            break
        default:
            lblResult.text = "No data"
            break
        }
        
        
//        if let passed = passed {
//            if passed == true {

//            } else {
//                imgResult.image = UIImage(named: "failed")
//                lblResult.text = "You have failed the test!"
//            }
//        }
        
        // Do any additional setup after loading the view.
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
