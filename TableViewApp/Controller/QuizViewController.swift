//
//  QuizViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/11.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedStartButton(_ sender: Any) {
        let vc = FirstQuestionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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
