//
//  YWBaseCtrl.swift
//  YWNativeDemo
//
//  Created by odd on 4/21/24.
//

import UIKit

class YWBaseCtrl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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


extension UIColor {
    
    convenience init(r:UInt32 ,g:UInt32 , b:UInt32 , a:CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0,
                  alpha: a)
    }
    //生成随机色
    class var random: UIColor {
        return UIColor(r: arc4random_uniform(256),g: arc4random_uniform(256),b: arc4random_uniform(256))
    }
}
