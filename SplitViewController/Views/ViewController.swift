//
//  ViewController.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2021/11/08.
//

import UIKit

class ViewController: UIViewController {
    
    /// 1. 테스트 버튼
    var demoTestBtn: UIButton? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    /// 뷰 셋팅
    private func initView() {
        // 버튼 설정
        if nil == self.demoTestBtn {
            self.demoTestBtn = self.view.viewWithTag(10) as? UIButton
            self.demoTestBtn?.addTarget(self, action: #selector(self.didTappedDemoTestBtn), for: .touchUpInside)
        }
    }
    
    /// 버튼 클릭 시
    @objc private func didTappedDemoTestBtn() {
        let menuVC = MenuViewController.instance()
        let detailVC = DetailViewController.instance(.white)
        
        let splitVC = SplitViewController.instance(master: menuVC, detail: detailVC, widthFraction: 0.6)
        let panelVC = SplitPanelViewController.instance(inputSplitVC: splitVC)
        
        let naviVC = UINavigationController(rootViewController: panelVC)
        naviVC.modalPresentationStyle = .fullScreen
        self.present(naviVC, animated: true, completion: nil)
    }
}

