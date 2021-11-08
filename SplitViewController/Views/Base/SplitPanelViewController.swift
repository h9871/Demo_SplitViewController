//
//  SplitPanelViewController.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2021/11/08.
//

import UIKit

class SplitPanelViewController: UIViewController {
    
    // MARK: - 생성자 ========================================
    class func instance(inputSplitVC: SplitViewController) -> SplitPanelViewController {
        let vc = SplitPanelViewController()
        vc.splitView = inputSplitVC
        
        // 뷰 만들기
        vc.view.addSubview(inputSplitVC.view)
        vc.addChild(inputSplitVC)
        vc.didMove(toParent: inputSplitVC)
        
        return vc
    }
    // ======================================================
    
    /// 스플릿 뷰
    var splitView: SplitViewController = SplitViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 네비게이션 숨겨주기.
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 네비게이션 보여주기.
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
