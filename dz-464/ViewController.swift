import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    private var stories = ["000", "001", "002", "003", "004", "005", "006", "007", "007", "009", "010", "011"]
    
    private lazy var collectionStories: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(StoriesCell.self, forCellWithReuseIdentifier: "StoriesCell")
        return view
    }()
    
    private lazy var upLabel: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2222")
        return view
    }()
    
    private lazy var lenta: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "03")
        return view
    }()
    
    private lazy var downLabel: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1111")
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        
        view.backgroundColor = .white
        
        view.addSubview(upLabel)
        upLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height * 0.04)
            make.height.equalTo(view.frame.height * 0.06)
        }
        
        view.addSubview(collectionStories)
        collectionStories.snp.makeConstraints { make in
            make.top.equalTo(upLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.11)
        }
        
        view.addSubview(lenta)
        lenta.snp.makeConstraints { make in
            make.top.equalTo(collectionStories.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        view.addSubview(downLabel)
        downLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(view.frame.height * (-0.02))
            make.top.equalTo(lenta.snp.bottom)
            make.height.equalTo(view.frame.height * 0.07)
        }
    }
    
    func collectionView(_ collectionStories: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: view.frame.width * 0.21,
            height: view.frame.height * 0.11)
    }
    
    func collectionView(_ collectionStories: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionStories: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionStories: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row
        let cell = collectionStories.dequeueReusableCell(withReuseIdentifier: "StoriesCell", for: indexPath) as! StoriesCell
        cell.cellStories.image = UIImage(named: String(stories[index]))
        return cell
    }
}
