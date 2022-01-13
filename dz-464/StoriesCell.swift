import Foundation
import UIKit
import SnapKit


class StoriesCell: UICollectionViewCell {
    
    lazy var cellStories: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(cellStories)
        cellStories.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
