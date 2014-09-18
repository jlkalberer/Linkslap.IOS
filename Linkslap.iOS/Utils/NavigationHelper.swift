//
//  NavigationHelper.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import UIKit;

struct NavigationHelper {
    private static var storyBoard: UIStoryboard!
    
    private static var navigationController: UINavigationController!
    
    static func setStoryBoard(storyBoard: UIStoryboard, navigationController: UINavigationController) {
        NavigationHelper.storyBoard = storyBoard
        NavigationHelper.navigationController = navigationController
    }
    
    static func navigate<TViewController:UIViewController>(parameters:AnyObject? = nil) -> TViewController {
        var viewName = genericName(TViewController.self)
        let viewController = storyBoard.instantiateViewControllerWithIdentifier(viewName) as TViewController
        navigationController.pushViewController(viewController, animated: true)
        
        return viewController
    }
    
    static func navigateRoot<TViewController:UIViewController>(parameters:AnyObject? = nil) -> TViewController {
        var viewName = genericName(TViewController.self)
        let viewController = storyBoard.instantiateViewControllerWithIdentifier(viewName) as TViewController
        // viewController.dataSource = parameters
        navigationController.popToViewController(viewController, animated: true)
        
        return viewController
    }
    
    private static func genericName(classType: AnyClass) -> String {
        let fullName: String = NSStringFromClass(classType)
        let range = fullName.rangeOfString(".", options: .BackwardsSearch)
        if let range = range {
            return fullName.substringFromIndex(range.endIndex)
        } else {
            return fullName
        }
    }
}
