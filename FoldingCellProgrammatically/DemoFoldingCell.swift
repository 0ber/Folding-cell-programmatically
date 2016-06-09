//
//  DemoFoldingCell.swift
//  FoldingCellProgrammatically
//
//  Created by Alex K. on 09/06/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit
import FoldingCell
import EasyPeasy

class DemoFoldingCell: FoldingCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    containerView = createContainerView()
    foregroundView = createForegroundView()
    
    // super class method configure views
    commonInit()
 }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func animationDuration(itemIndex: NSInteger, type: AnimationType) -> NSTimeInterval {
  
    // durations count equal it itemCount
    let durations = [0.33, 0.26, 0.26] // timing animation for each view
    return durations[itemIndex]
  }
}

// MARK: Configure

extension DemoFoldingCell {
  
  private func createForegroundView() -> RotatedView {
    let foregroundView = Init(RotatedView(frame: .zero)) {
      $0.backgroundColor = .redColor()
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    contentView.addSubview(foregroundView)
    
    // add constraints 
    foregroundView <- [
      Height(75),
      Left(8),
      Right(8),
    ]
    
    // add identifier
    let top = (foregroundView <- [Top(8)]).first
    top?.identifier = "ForegroundViewTop"
    
    foregroundView.layoutIfNeeded()
    
    return foregroundView
  }
  
  private func createContainerView() -> UIView {
    let containerView = Init(UIView(frame: .zero)) {
      $0.backgroundColor = .greenColor()
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    contentView.addSubview(containerView)
    
    // add constraints
    containerView <- [
      Height(CGFloat(75 * itemCount)),
      Left(8),
      Right(8),
    ]
    
    // add identifier
    let top = (containerView <- [Top(8)]).first
    top?.identifier = "ContainerViewTop"
    
    containerView.layoutIfNeeded()
    
    return containerView
  }
}