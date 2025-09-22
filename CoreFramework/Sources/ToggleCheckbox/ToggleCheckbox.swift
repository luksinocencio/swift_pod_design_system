import UIKit

public class ToggleCheckbox: UIButton {
    // MARK: - Public property(ies).
    public var isChecked: Bool = false
    
    // MARK: - Private property(ies).
    private let checkedImage = UIImage(named: "checkedCheckBox")
    private let uncheckedImage = UIImage(named: "uncheckedCheckBox")
    
    // MARK: - Public init(s).
    public init() {
        super.init(frame: .zero)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(toogle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public function(s).
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
    
    // MARK: - Private function(s).
    @objc
    private func toogle() {
        isChecked.toggle()
        self.setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
}
