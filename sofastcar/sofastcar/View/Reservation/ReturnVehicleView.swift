//
//  ReturnVehicleView.swift
//  sofastcar
//
//  Created by 요한 on 2020/09/22.
//  Copyright © 2020 김광수. All rights reserved.
//

import UIKit
import SnapKit

protocol ReturnVehicleViewDelegate: class {
    func didTapButton(_ sender: UIButton)
}

class ReturnVehicleView: UIView {
  
  weak var delegate: ReturnVehicleViewDelegate?
  
  fileprivate let returnPlaceCheckView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    
    return view
  }()
  
  fileprivate let returnPlaceDescriptionTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "송파동 공영주차장 에 반납하셨나요?"
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.textColor = CommonUI.mainDark
    
    return label
  }()
  
  fileprivate let returnPlaceCheckTrueButtonView: CheckButtonView = {
    let view = CheckButtonView()
    view.toggle = false
    view.buttonTypeLabel = "네"
    
    return view
  }()
  
  fileprivate let returnPlaceCheckFalseButtonView: CheckButtonView = {
    let view = CheckButtonView()
    view.toggle = false
    view.buttonTypeLabel = "아니요"

    return view
  }()
  
  fileprivate let returnFinalCheckView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    
    return view
  }()
  
  fileprivate let returnRuleGuideView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
      
    return view
  }()
  
  // MARK: - LifeCycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - UI
  
  fileprivate func setUI() {
    let guid = self.safeAreaLayoutGuide
    self.backgroundColor = .cyan
    
    [returnPlaceCheckView, returnFinalCheckView, returnRuleGuideView].forEach {
      self.addSubview($0)
    }
    
    returnPlaceCheckView.snp.makeConstraints {
      $0.top.equalTo(guid)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(150)
    }
    
    returnFinalCheckView.snp.makeConstraints {
      $0.top.equalTo(returnPlaceCheckView.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(250)
    }
    
    returnRuleGuideView.snp.makeConstraints {
      $0.top.equalTo(returnFinalCheckView.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(100)
    }
    
    returnPlaceCheck()
    returnFinalCheck()
    returnRuleGuide()
  }
  
  fileprivate func returnPlaceCheck() {
    
    [returnPlaceDescriptionTitleLabel, returnPlaceCheckTrueButtonView, returnPlaceCheckFalseButtonView].forEach {
      returnPlaceCheckView.addSubview($0)
    }
    
    returnPlaceDescriptionTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(20)
    }
    
    returnPlaceCheckTrueButtonView.snp.makeConstraints {
      $0.top.equalTo(returnPlaceDescriptionTitleLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(150)
      $0.width.equalTo(50)
      $0.height.equalTo(20)
    }
    
    returnPlaceCheckFalseButtonView.snp.makeConstraints {
      $0.top.equalTo(returnPlaceDescriptionTitleLabel.snp.bottom).offset(20)
      $0.leading.equalTo(returnPlaceCheckTrueButtonView.snp.trailing).offset(40)
      $0.width.equalTo(50)
      $0.height.equalTo(20)
    }
  }
  fileprivate func returnFinalCheck() { }
  fileprivate func returnRuleGuide() { }
  
  // MARK: - Action
  
  @objc func didTapButton(_ sender: UIButton) {
    delegate?.didTapButton(sender)
  }
}
