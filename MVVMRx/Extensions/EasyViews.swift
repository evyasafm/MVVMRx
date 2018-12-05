//  
//  EasyViews.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult func wrapContent(axis: NSLayoutConstraint.Axis? = nil) -> Self {
        let both = axis == nil
        if axis == .horizontal || both {
            self.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        }
        if axis == .vertical || both {
            self.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        }
        return self
    }
    
    @discardableResult func hugContent(axis: NSLayoutConstraint.Axis? = nil) -> Self {
        let both = axis == nil
        if axis == .horizontal || both {
            self.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        }
        if axis == .vertical || both {
            self.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        }
        return self
    }
    
    @discardableResult func corner(radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = radius != 0
        
        return self
    }
    
    @discardableResult func border(width: CGFloat, color: UIColor) -> Self {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        
        return self
    }
}

extension UILabel {
    @discardableResult func font(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    @discardableResult func minimumFontSize(_ size: CGFloat) -> UILabel {
        self.minimumScaleFactor = size / self.font.pointSize
        return self
    }
    
    @discardableResult func adjustsFontSizeToFitWidth(_ adjust: Bool) -> UILabel {
        self.adjustsFontSizeToFitWidth = adjust
        return self
    }
    
    @discardableResult func textColor(_ color: UIColor) -> UILabel {
        self.textColor = color
        return self
    }
    
    @discardableResult func numberOfLines(_ number: Int) -> UILabel {
        self.numberOfLines = number
        return self
    }
    
    @discardableResult func textAlignment(_ textAlignment: NSTextAlignment) -> UILabel {
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult func lineSpacing(_ spacing: CGFloat) -> UILabel {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = spacing
        paragraph.alignment = textAlignment
        
        let text: NSMutableAttributedString
        if let attributedText = attributedText {
            text = NSMutableAttributedString(attributedString: attributedText)
        } else {
            text = NSMutableAttributedString(string: self.text ?? "")
        }
        
        text.addAttributes([NSAttributedString.Key.paragraphStyle: paragraph], range: NSRange(location: 0, length: text.length))
        self.attributedText = text
        
        return self
    }
    
    @discardableResult func letterSpacing(_ spacing: CGFloat) -> UILabel {
        let text: NSMutableAttributedString
        if let attributedText = attributedText {
            text = NSMutableAttributedString(attributedString: attributedText)
        } else {
            text = NSMutableAttributedString(string: self.text ?? "")
        }
        
        text.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text.length - 1))
        self.attributedText = text
        
        return self
    }
    
    @discardableResult func isHidden(_ hidden: Bool) -> UILabel {
        self.isHidden = hidden
        return self
    }
}

extension UIButton {
    @discardableResult func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    @discardableResult func textColor(_ color: UIColor, forState state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult func tap(target: Any?, action: Selector) -> Self {
        addTarget(target, action: action, for: .touchUpInside)
        return self
    }
    
    @discardableResult func contentEdgeInsets(_ inset: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = inset
        return self
    }
    
    @discardableResult func withPadding(_ padding: CGFloat) -> Self {
        self.contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        return self
    }
    
    @discardableResult func tintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    @discardableResult func horizontalAlignment(_ align: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = align
        return self
    }
}

extension UIImageView {
    @discardableResult func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
}

extension String {
    var label: UILabel {
        let label = UILabel()
        label.text = self
        return label
    }
    
    var button: UIButton {
        return button(withType: .system)
    }
    
    func button(withType type: UIButton.ButtonType) -> UIButton {
        let button = UIButton(type: type)
        button.setTitle(self, for: .normal)
        return button
    }
    
    var image: UIImage? {
        return UIImage(named: self)
    }
    
    var url: URL? {
        return URL(string: self)
    }
}

