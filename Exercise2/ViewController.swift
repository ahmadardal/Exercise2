//
//  ViewController.swift
//  Exercise2
//
//  Created by Ahmad Ardal on 2022-09-02.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtAge: UITextField!
    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var imgBall: UIImageView!
    @IBOutlet var imgBox: UIImageView!
    
    @IBOutlet var horizontalBallConstraint: NSLayoutConstraint!
    @IBOutlet var verticalBallConstraint: NSLayoutConstraint!
    
    var mySegue = "mySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        if let simpleBall = sender.view {
            
//            simpleBall.center = CGPoint(x: simpleBall.center.x + translation.x, y: simpleBall.center.y + translation.y)
            
            horizontalBallConstraint.constant = horizontalBallConstraint.constant + translation.x
            
            verticalBallConstraint.constant = verticalBallConstraint.constant + translation.y
            
            if imgBox.frame.contains(simpleBall.frame) {
                print("Bingo")
                
                horizontalBallConstraint.constant = 0
                verticalBallConstraint.constant = 30
                
                sender.state = .ended
                
                performSegue(withIdentifier: mySegue, sender: self)
                
                self.view.layoutIfNeeded()
                
            }
            
            
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == mySegue {
            
            let destinationVC = segue.destination as! SecondViewController
            
            guard let name = txtName.text else {
                destinationVC.passed = false
                return
            }
            
            guard let age = Int(txtAge.text ?? "") else {
                destinationVC.passed = false
                return
            }
            
            guard let email = txtEmail.text else {
                destinationVC.passed = false
                return
            }
            
            if name != "" && age >= 18 && email != "" {
                destinationVC.passed = true
            } else {
                destinationVC.passed = false
            }
            
//            if let name = txtName.text,
//               let age = Int(txtAge.text ?? ""),
//               let email = txtEmail.text {
//
//                if name != "" && age >= 18 && email != "" {
//                    destinationVC.passed = true
//                } else {
//                    destinationVC.passed = false
//                }
//
//                return
//            }
//
//            destinationVC.passed = false
            
        }
        
    }
    


}

