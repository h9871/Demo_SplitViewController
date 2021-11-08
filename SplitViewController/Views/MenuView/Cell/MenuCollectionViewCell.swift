//
//  MenuCollectionViewCell.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2021/11/08.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    /// 배경색 뷰
    @IBOutlet weak var backgroundColorView: UIView!
    /// 색상 타이틀
    @IBOutlet weak var colorTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initView()
    }
    
    /// 하이라이트 액션 처리
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
                    self.backgroundColorView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                })
            }
            else {
                UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
                    self.backgroundColorView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            }
        }
    }
    
    /// 뷰 셋팅
    private func initView() {
        self.colorTitle.text = "Color"
        self.backgroundColorView.backgroundColor = .white
    }
}

// MARK: - ㄴ 뷰 셋팅
extension MenuCollectionViewCell {
    /// 뷰 설정
    func configureCell(_ title: String, _ color: UIColor) {
        self.colorTitle.text = title
        self.backgroundColorView.backgroundColor = color
    }
}
