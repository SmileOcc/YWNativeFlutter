//
//  YWTabBarCtrl.swift
//  YWNativeDemo
//
//  Created by odd on 4/21/24.
//

import UIKit

let navColor = UIColor(red: 41/255, green: 160/255, blue: 230/255, alpha: 1)

@objc public enum YWTabIndex: Int {
    case home           = 0         // 首页
    case category       = 1         // 分类
    case news           = 2         // 新闻
    case mine           = 3         // 我的
    
    var title: String {
        switch self {
        case .home:
            return "tab_home"
        case .category:
            return "tab_category"
        case .news:
            return "tab_news"
        case .mine:
            return "tab_mine"
        }
    }
    
    var img: String {
        switch self {
        case .home:
            return "tab_home"
        case .category:
            return "tab_categories"
        case .news:
            return "tab_new"
        case .mine:
            return "tab_me"
        }
    }
    
    var selectImg: String {
        switch self {
        case .home:
            return "tab_home_selected"
        case .category:
            return "tab_categories_selected"
        case .news:
            return "tab_new_select"
        case .mine:
            return "tab_me_selected"
        }
    }
}

class YWTabBarCtrl: UITabBarController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //在这里处理deeplink跳转
        //AppsFlyerService.shared.jumpDeepLink()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light;
        }
   
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = UIColor.black
        
        self.configureRootVCS()

        
    }
    
    func configureNave(_ nav:YWNavigationCtrl, _ index: YWTabIndex) {
        nav.tabBarItem.title = index.title
        nav.tabBarItem.image = UIImage(named: index.img)
        nav.tabBarItem.selectedImage = UIImage(named: index.selectImg)
    }
    
    func configureRootVCS() {
        
        let homeNav = YWNavigationCtrl(rootViewController: YWHomeCtrl())
        self.configureNave(homeNav, YWTabIndex.home)
        
        let categoryNav = YWNavigationCtrl(rootViewController: YWCategoryCtrl())
        self.configureNave(categoryNav, YWTabIndex.category)
        
        let newsNav = YWNavigationCtrl(rootViewController: YWNewsCtrl())
        self.configureNave(newsNav, YWTabIndex.news)
        
        let accountNav = YWNavigationCtrl(rootViewController: YWAccountCtrl())
        self.configureNave(accountNav, YWTabIndex.mine)

        
        self.viewControllers = [homeNav,accountNav]
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
