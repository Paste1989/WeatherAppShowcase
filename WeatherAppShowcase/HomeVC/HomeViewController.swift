//
//  HomeViewController.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
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
