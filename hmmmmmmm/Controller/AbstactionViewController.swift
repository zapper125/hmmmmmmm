//
//  AbstactionViewController.swift
//  hmmmmmmm
//
//  Created by Christiansen, Aaron on 12/6/18.
//  Copyright © 2018 Ctec. All rights reserved.
//

import UIKit

public class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedAbstractionViews.first
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
    
    private lazy var orderedAbstractionViews : [UIViewController] =
    {
        return [
            self.newAbstractionViewController(abstractionLevel: "Swift"),
            self.newAbstractionViewController(abstractionLevel: "Block"),
            self.newAbstractionViewController(abstractionLevel: "ByteCode"),
            self.newAbstractionViewController(abstractionLevel: "Binary"),
            self.newAbstractionViewController(abstractionLevel: "LogicalGate")
        ]
    }()
    
    private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
    }
    //left
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:
        UIViewController) -> UIViewController?
    {
        guard let  viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
        guard orderedAbstractionViews.count > previousIndex
            else
        {
            return nil
        }
        
        return orderedAbstractionViews[previousIndex]
    }
    
    //right
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController:
        UIViewController) -> UIViewController?
    {
        guard let  viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex + 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
        guard orderedAbstractionViews.count > previousIndex
            else
        {
            return nil
        }
        
        return orderedAbstractionViews[previousIndex]
    }
    
    public func presentationCount(for pageViewController:
        UIPageViewController) -> Int
    {
        return orderedAbstractionViews.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex =
            orderedAbstractionViews.index(of: firstViewController)
            else
        {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
