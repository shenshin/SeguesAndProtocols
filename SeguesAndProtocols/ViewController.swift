//
//  ViewController.swift
//  SeguesAndProtocols
//
//  Created by Алесь Шеншин on 20/12/2018.
//  Copyright © 2018 Shenshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondVCDelegate {
    
    @IBOutlet weak var textInputField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    func dataReceived(data: String?) {
        textLabel.text = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segue1", sender: self)
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            //именно здесь происходит создание экземпляра SecondViewController , который будет отображён после перехода с уже установленными переменными (data:String?)
            let secondVC = segue.destination as! SecondViewController
            //Установка текущего объекта делегатом вновь созданного (передача ему ссылки на себя - присвоение его свойству myDelegate значения ссылки на вызывающий объект)
            secondVC.myDelegate = self
            //Передача необходимых данных второму контроллеру, который был только что создан
            secondVC.data = textInputField.text
        }
    }
}

