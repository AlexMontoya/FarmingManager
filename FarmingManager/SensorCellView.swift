//
//  ImageSensorCellView.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 04/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        }
    
    func setupViews() {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

    class ImageSensorCell: BaseCell {
    
    var image: Image? {
        didSet {
            
            thumbnailImageView.image = UIImage(named: (image?.thumbnailImageName)!)
        }
    }
        
    
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2:06-perpendiculaire")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humiditySubLabel: UITextView = {
        let textView = UITextView()
        textView.text = "31 %"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let windSubLabel: UITextView = {
        let textView = UITextView()
        textView.text = "31 km/h"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Temperature"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempSubLabel: UITextView = {
        let textView = UITextView()
        textView.text = "31 °C"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func setupViews() {
        
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(humidityLabel)
        addSubview(humiditySubLabel)
        addSubview(windLabel)
        addSubview(windSubLabel)
        addSubview(tempLabel)
        addSubview(tempSubLabel)
        
        //horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(90)]|", views: humidityLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0(90)]|", views: humiditySubLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //vertical constraints
        
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(20)]-4-[v2(20)]-16-[v3(1)]|", views: thumbnailImageView, humidityLabel, humiditySubLabel, separatorView)
        
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: windLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: windLabel, attribute: .left, relatedBy: .equal, toItem: humidityLabel, attribute: .right, multiplier: 1, constant: 8))
        //height constraint
        addConstraint(NSLayoutConstraint(item: windLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraintsWithFormat(format: "H:[v0(90)]", views: windLabel)
        
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: windSubLabel, attribute: .top, relatedBy: .equal, toItem: windLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: windSubLabel, attribute: .left, relatedBy: .equal, toItem: humidityLabel, attribute: .right, multiplier: 1, constant: 8))
        //height constraint
        addConstraint(NSLayoutConstraint(item: windSubLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraintsWithFormat(format: "H:[v0(90)]", views: windSubLabel)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: tempLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: tempLabel, attribute: .left, relatedBy: .equal, toItem: windLabel, attribute: .right, multiplier: 1, constant: 8))
        //height constraint
        addConstraint(NSLayoutConstraint(item: tempLabel, attribute: .height, relatedBy: .equal, toItem: tempLabel, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraintsWithFormat(format: "H:[v0(90)]", views: tempLabel)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: tempSubLabel, attribute: .top, relatedBy: .equal, toItem: tempLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: tempSubLabel, attribute: .left, relatedBy: .equal, toItem: windLabel, attribute: .right, multiplier: 1, constant: 8))
        //height constraint
        addConstraint(NSLayoutConstraint(item: tempSubLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraintsWithFormat(format: "H:[v0(90)]", views: tempSubLabel)
        
        
    }

}


