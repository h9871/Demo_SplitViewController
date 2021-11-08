//
//  DetailViewController.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2021/11/08.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - 생성자 ========================================
    class func instance(_ color: UIColor) -> DetailViewController {
        let vc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        vc.backViewColor = color
        return vc
    }
    // ======================================================

    /// 뷰 배경 생상
    var backViewColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    /// 뷰 셋팅
    private func initView() {
        self.view.backgroundColor = self.backViewColor
    }
}
