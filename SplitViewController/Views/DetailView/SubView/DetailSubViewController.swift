//
//  DetailSubViewController.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2022/04/14.
//

import UIKit

class DetailSubViewController: UIViewController {
    /// 생성자
    /// - Parameter color: 색상
    /// - Returns: 생성된 뷰
    class func instance(_ color: UIColor) -> DetailSubViewController {
        let vc = DetailSubViewController()
        vc.color = color
        return vc
    }
    
    /// 색상 라벨
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = self.color
        label.text = "상세 텍스트 입니다."
        return label
    }()
    
    /// 색상
    private lazy var color: UIColor = .clear

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    /// 뷰 셋팅
    private func initView () {
        // 배경색 설정
        self.view.backgroundColor = .white
        // 색상 라벨 생성
        self.view.addSubview(self.colorLabel)
        // 레이아웃 업데이트
        self.updateViewLayout()
    }
    
    /// 뷰 레이아웃 설정
    private func updateViewLayout() {
        self.colorLabel.translatesAutoresizingMaskIntoConstraints = false
        self.colorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.colorLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
