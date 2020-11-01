//
//  SetColorViewController.swift
//  SetColorApplication
//
//  Created by Auyez on 11/1/20.
//

import UIKit

class SetColorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var colorSetView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redField: UITextField!
    @IBOutlet var greenField: UITextField!
    @IBOutlet var blueField: UITextField!
    
    
    var colorView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSetView.backgroundColor = colorView
        
        redSlider.value = Float(colorView.getRGB.red)
        greenSlider.value = Float(colorView.getRGB.green)
        blueSlider.value = Float(colorView.getRGB.blue)
        
        setLabelValue(labels: redLabel, greenLabel, blueLabel)
        setFieldValue(feilds: redField, greenField, blueField)
    }
  

    @IBAction func rgbSlider(_ sender: UISlider) {
        sliderActivity()
        switch sender.tag {
        case 0: setLabelValue(labels: redLabel)
            setFieldValue(feilds: redField)
        case 1: setLabelValue(labels: greenLabel)
            setFieldValue(feilds: greenField)
        case 2: setLabelValue(labels: blueLabel)
            setFieldValue(feilds: blueField)
        default: return
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setLabelValue(labels: redLabel, greenLabel, blueLabel)
    }
    
    
    
    @IBAction func rgbFeild(_ sender: UITextField) {
        sliderActivity()
        switch sender.tag {
        case 0: redSlider.value = chechValue(textValue: redField)
            setLabelValue(labels: redLabel)
        case 1: greenSlider.value = chechValue(textValue: greenField)
            setLabelValue(labels: greenLabel)
        case 2: blueSlider.value = chechValue(textValue: blueField)
            setLabelValue(labels: blueLabel)
        default: return
        }
    }
    
    private func sliderActivity() {
        colorSetView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    private func string(slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func chechValue(textValue: UITextField) -> Float {
        guard var value = Float(textValue.text ?? "0") else {return 0}
        if value < 0 {
            value = 0
        } else if value > 1 {
            value = 1
        }
        textValue.text = String(format: "%.2f", value)
        return value
    }
    
    private func setLabelValue(labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: label.text = string(slider: redSlider)
            case 1: label.text = string(slider: greenSlider)
            case 2: label.text = string(slider: blueSlider)
            default: break
            }
        }
    }
    
    private func setFieldValue(feilds: UITextField...) {
        feilds.forEach { field in
            switch field.tag {
            case 0: field.text = string(slider: redSlider)
            case 1: field.text = string(slider: greenSlider)
            case 2: field.text = string(slider: blueSlider)
            default: break
            }
        }
    }
    
}

extension UIColor {
    var getRGB: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}

extension UITextInputTraits {
    
}
