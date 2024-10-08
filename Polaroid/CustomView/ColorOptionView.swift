//
//  ColorOptionView.swift
//  Polaroid
//
//  Created by 홍정민 on 7/28/24.
//

import UIKit
import SnapKit

final class ColorOptionView: UIView {
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let blackButton = ColorOptionButton(condition: ColorCondition.black)
    private let whiteButton = ColorOptionButton(condition: ColorCondition.white)
    private let yelloButton = ColorOptionButton(condition: ColorCondition.yellow)
    private let redButton = ColorOptionButton(condition: ColorCondition.red)
    private let purpleButton = ColorOptionButton(condition: ColorCondition.purple)
    private let greenButton = ColorOptionButton(condition: ColorCondition.green)
    private let blueButton = ColorOptionButton(condition: ColorCondition.blue)
    
    lazy var colorButtonList = [blackButton, whiteButton, yelloButton, redButton, purpleButton, greenButton, blueButton]

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy(){
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(blackButton)
        stackView.addArrangedSubview(whiteButton)
        stackView.addArrangedSubview(yelloButton)
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(purpleButton)
        stackView.addArrangedSubview(greenButton)
        stackView.addArrangedSubview(blueButton)
    }
    
    private func configureLayout(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(35)
        }
        
        stackView.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.edges.equalToSuperview()
        }

    }
    
    private func configureUI(){
        scrollView.showsHorizontalScrollIndicator = false
        stackView.axis = .horizontal
        stackView.spacing = 4
    }
}


