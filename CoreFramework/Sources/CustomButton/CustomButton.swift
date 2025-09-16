import UIKit

public protocol CustomButtonDelegate: AnyObject {
    func buttonAction()
}

public class CustomButton: UIButton {
    weak var delegate: CustomButtonDelegate?
    
    // MARK: - Private property(ies).
    private var iconPosition: NSLayoutConstraint.Axis?
    private var customWidth: CFloat?
    
    // MARK: - init(s).
    public init(title: String, backgroundColor: UIColor = Colors.primaryRedBase) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: nil,
            iconPosition: nil,
            backgroundColor: backgroundColor
        )
    }
    
    public init(title: String, icon: UIImage, iconPosition: NSLayoutConstraint.Axis, backgroundColor: UIColor = Colors.primaryRedBase) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: icon,
            iconPosition: iconPosition,
            backgroundColor: backgroundColor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private function(s).
    
    private func setupButton(
        title: String,
        icon: UIImage?,
        iconPosition: NSLayoutConstraint.Axis?,
        backgroundColor: UIColor
    ) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = Typography.subHeading
        self.setTitleColor(Colors.gray800, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = Metrics.medium
        self.isEnabled = true
        
        if let icon = icon, let iconPosition = iconPosition {
            self.setImage(icon, for: .normal)
            self.tintColor = Colors.gray800
            self.iconPosition = iconPosition
            adjustIconPosition()
        }
        
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func adjustIconPosition() {
        guard let iconPosition = iconPosition else { return }
        
        if iconPosition == .horizontal {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        } else {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -8)
        }
    }
    
    // MARK: - Selector(s).
    
    @objc private func buttonTapped() {
        delegate?.buttonAction()
    }
}
