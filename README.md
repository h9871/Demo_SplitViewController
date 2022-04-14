# Demo_SplitViewController

- [Swift] 스플릿 뷰 컨트롤러 데모
- 프로젝트에서 스플릿 뷰를 적용할 시 활용 가능
- 중앙 버튼 클릭 시 테스트 시작

## ProjectMain

- 프로젝트 메인 관련 그룹

## ProjectUtil

- 프로젝트 설정 및 파일 관련 그룹

## Views

### Base
- 스플릿 뷰의 베이스 적인 요소들
- 스플릿 뷰와 스플릿 뷰를 띄우는 패널 뷰 

### MenuView
- [Model] 디테일 뷰에서 활용하는 데이터 모델
- 메인 화면에 표시된 셀을 터치 시 해당 색상 정보를 상세 화면에 전달하여 표시하는 방식
- [UICollectionView]를 활용 레이아웃은 [UICollectionViewCompositionalLayout] 활용

### DetailView
- 메인화면에서 전달받은 색상 정보로 배경색을 띄움
- [SubView] 그룹에서 디테일 뷰의 서브 뷰를 사용하여 뷰 이동 처리 진행

## Version

- Xcode 13.1
- 빌드 iOS15 이상
- Swift 5
