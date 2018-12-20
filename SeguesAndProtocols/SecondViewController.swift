//
//  SecondViewController.swift
//  SeguesAndProtocols
//
//  Created by Алесь Шеншин on 20/12/2018.
//  Copyright © 2018 Shenshin. All rights reserved.
//

import UIKit

//создание протокола, которому должен соответствовать класс, являющийся делегатом другого класса, в данном случае, класса SecondViewController
protocol SecondVCDelegate {
    func dataReceived(data: String?)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textInputField: UITextField!
    
    //Свойство, которое позже примет данные из объекта, создавшего экземпляр данного класса
    var data: String?
    
    //Свойство, которое позже примет ссылку на вызывающий класс
    var myDelegate : SecondVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //вывод на экран переменной, полученной из вызывающего класса
        textLabel.text = data
    }
    
    @IBAction func sendBackButtonPressed(_ sender: Any) {
        myDelegate?.dataReceived(data: self.textInputField.text)
        self.dismiss(animated: false) {
            print("Dismissed")
        }
    }
    @IBAction func changeBackgroundColor(_ sender: Any) {
        view.backgroundColor = UIColor.blue
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
