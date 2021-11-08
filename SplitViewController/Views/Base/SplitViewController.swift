//
//  SplitViewController.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2021/11/08.
//

import UIKit

class SplitViewController: UISplitViewController {

    // MARK: - 생성자 ========================================
    class func instance(master: UIViewController, detail: UIViewController, widthFraction: CGFloat = 0.6) -> SplitViewController {
        let vc = SplitViewController()
        
        // 1. 마스터 뷰 및 디테일 뷰 설정
        vc.master = master
        vc.detail = detail
        
        // 2. 각각 네비게이션 뷰 할당
        vc.masterNavigation = UINavigationController(rootViewController: master)
        vc.detailNavigation = UINavigationController(rootViewController: detail)
        
        // 3. 마스터 뷰 비율 설정
        vc.preferredPrimaryColumnWidthFraction = 0.6
        vc.maximumPrimaryColumnWidth = vc.view.bounds.size.width
        
        // 4. 스플릿 뷰 설정
        vc.viewControllers = [vc.masterNavigation, vc.detailNavigation]
        
        return vc
    }
    // ======================================================
    
    /// 1. 메인 뷰
    var masterNavigation: UINavigationController = UINavigationController()
    var master: UIViewController = UIViewController()
    /// 2. 상세 뷰
    var detailNavigation: UINavigationController = UINavigationController()
    var detail: UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
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
    
    /// 뷰 셋팅
    private func initView() {
        /// 배경색 설정
        self.view.backgroundColor = .white
        /// 델리게이트 설정
        self.delegate = self
        self.preferredDisplayMode = .oneBesideSecondary
    }
}

extension SplitViewController: UISplitViewControllerDelegate {
    /// master, detail 구조에서 master 우선 표시
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
