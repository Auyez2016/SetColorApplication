//
//  MainViewController.swift
//  SetColorApplication
//
//  Created by Auyez on 11/1/20.
//

import UIKit

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setColorVC = segue.destination as? SetColorViewController else {return}
        setColorVC.colorView = view.backgroundColor
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindMainVC(_ unwindSegue: UIStoryboardSegue) {
        let unwindSetColorVC = unwindSegue.source as? SetColorViewController
        view.backgroundColor = unwindSetColorVC?.colorSetView.backgroundColor
    }
}

