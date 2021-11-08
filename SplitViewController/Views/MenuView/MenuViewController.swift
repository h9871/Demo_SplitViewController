//
//  MenuViewController.swift
//  SplitViewController
//
//  Created by yuhyeonjae on 2021/11/08.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - 생성자 ========================================
    class func instance() -> MenuViewController {
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        return vc
    }
    // ======================================================
    
    // MARK: - 상수
    let CELL_ID = "MenuCollectionViewCell"

    /// 컬렉션 뷰
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// 메뉴 리스트
    let menuList: Array<MenuModel> = [
        MenuModel(title: "red", color: .red),
        MenuModel(title: "blue", color: .blue),
        MenuModel(title: "yellow", color: .yellow),
        MenuModel(title: "gray", color: .gray),
        MenuModel(title: "green", color: .green),
        MenuModel(title: "black", color: .black),
        MenuModel(title: "magenta", color: .magenta),
        MenuModel(title: "purple", color: .purple)
    ]
    
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
        self.initCollection()
    }
    
    /// 컬렉션 뷰 설정
    private func initCollection() {
        self.collectionView.register(UINib(nibName: self.CELL_ID, bundle: nil), forCellWithReuseIdentifier: self.CELL_ID)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.collectionViewLayout = self.createLayout()
    }
    
    @IBAction func didTappedBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - ㄴ CollectionView 관련
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.CELL_ID, for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let row = indexPath.row
        let item = self.menuList[row]
        
        // 셀 데이터 설정
        cell.configureCell(item.title, item.color)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let item = self.menuList[row]
        
        let detailVC = DetailViewController.instance(item.color)
        self.showDetailViewController(detailVC, sender: nil)
    }
}

// MARK: - ㄴ CollectionView Layout
extension MenuViewController {
    /// 박스형 레이아웃 생성
    private func createBoxLayout() -> NSCollectionLayoutSection {
        let fraction: CGFloat = 1 / 3
        
        // 아이템 사이즈
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // 아이템을 기반으로 한 그룹 크기
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    /// 레이아웃 생성
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, env -> NSCollectionLayoutSection? in
            return self.createBoxLayout()
        }
    }
}
