import UIKit

public class ToggleCheckbox: UIButton {
    private var isChecked: Bool = false
    private let checkedImage = UIImage(named: "checkedCheckBox")
    private let uncheckedImage = UIImage(named: "uncheckedCheckBox")
    
    public init() {
        super.init(frame: .zero)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(toogle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func toogle() {
        isChecked.toggle()
        self.setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
    
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
}
