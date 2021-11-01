//
//  ListTableViewCell.swift
//  RedditApi
//
//  Created by Pierre ILYAMUKURU on 10/23/21.
//

import UIKit
import SDWebImage

class ListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        containerView.addSubview(titleLabel)
        containerView.addSubview(redditImageView)
        stackView.addArrangedSubview(commentNumberLabel)
        stackView.addArrangedSubview(scoreApiLabel)
        
        containerView.addSubview(stackView)
        self.contentView.addSubview(containerView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let redditImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    let commentNumberLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let scoreApiLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    func loadDataOnCell(thumbnailUrl: String, title: String, commentNumber: Int, scoreApi: Int) {
        titleLabel.text = title
        commentNumberLabel.text = "Comments: " + String(commentNumber)
        scoreApiLabel.text = "Score: " + String(scoreApi)
        redditImageView.sd_setImage(with: URL(string: thumbnailUrl), placeholderImage: UIImage(named: "reddits"))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -18),
            
            redditImageView.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant: 15),
            redditImageView.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            redditImageView.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -10),
            redditImageView.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo:self.redditImageView.bottomAnchor, constant:15),
            stackView.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            stackView.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 40.0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10)
        ])
    }
    
    
}
