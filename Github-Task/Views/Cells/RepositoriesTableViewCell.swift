//
//  RepositoriesTableViewCell.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 12/04/2022.
//

import UIKit
import Kingfisher

class RepositoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    @IBOutlet weak var timeByOwnerNameLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    let todayDate = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell (repoName: String , repoDesc: String , repoStars: Int , repoIssues: Int , repoLastUpdateDate: String , repoOwnerName: String , ownerAvatar: URL){
        
        repositoryNameLabel.text = repoName
        repositoryDescriptionLabel.text = repoDesc
        starsLabel.text = "Stars: \(repoStars)" + " ⭐️"
        issuesLabel.text = "Issues: \(repoIssues)" + " 💡"
        
        self.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let updateDate = dateFormatter.date(from: repoLastUpdateDate)
        
        
        print(updateDate!)
        print(todayDate)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: updateDate!, to: todayDate)
        print(components.day!)
        timeByOwnerNameLabel.text = "Updated \(components.day!) days ago by \(repoOwnerName)"
        
        userAvatarImageView.layer.cornerRadius = 30
        userAvatarImageView.layer.cornerCurve = .continuous
        userAvatarImageView.layer.masksToBounds = true
        
        let url = ownerAvatar
        let processor = DownsamplingImageProcessor(size: self.userAvatarImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 8)
        self.userAvatarImageView.kf.indicatorType = .activity
        self.userAvatarImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "github"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }

}
