//
//  UserStatusAfterReturnView.swift
//  sofastcar
//
//  Created by 요한 on 2020/09/24.
//  Copyright © 2020 김광수. All rights reserved.
//

import UIKit
import SnapKit

protocol UserStatusAfterReturnViewDelegate: class {
    func didTapButton(_ sender: UIButton)
}

class UserStatusAfterReturnView: UIView {
  
  weak var delegate: UserStatusAfterReturnViewDelegate?
  
  let closeButton: UIButton = {
    let button = UIButton()
    let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .light, scale: .large)
    let closeSymbol = UIImage(systemName: CommonUI.SFSymbolKey.close.rawValue, withConfiguration: config)
    button.setImage(
      closeSymbol,
      for: .normal
    )
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    button.tintColor = CommonUI.mainDark
    
    return button
  }()
  
  fileprivate let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "반납되었습니다."
    label.font = UIFont.preferredFont(forTextStyle: .title1).bold()
    label.textColor = CommonUI.mainDark
    
    return label
  }()
  
  fileprivate let userStatusView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 5
    view.shadowMaker(view: view)
    
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
    self.backgroundColor = .white
    
    [closeButton, titleLabel, userStatusView].forEach {
      self.addSubview($0)
    }
    
    closeButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(10)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(closeButton.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
    }
    
    userStatusView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(30)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.height.equalTo(300)
    }
    
    userStatus()
  }
  
  fileprivate func userStatus() {
    [].forEach {
      userStatusView.addSubview($0)
    }
  }
  
  // MARK: - Action
  
  @objc fileprivate func didTapButton(_ sender: UIButton) {
    delegate?.didTapButton(sender)
  }
}
