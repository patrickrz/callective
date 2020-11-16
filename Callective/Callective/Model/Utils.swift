//
//  Utils.swift
//  Callective
//
//  Created by Abhishek Kattuparambil on 11/15/20.
//
import UIKit

class Utils{
    enum AppStoryboard : String {
        case Main = "Main"
        case Authentication = "Authentication"
        case LaunchScreen = "LauchScreen"
        var instance : UIStoryboard {
          return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
        }
    }
    // USAGE :

    let storyboard = AppStoryboard.Main.instance
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
