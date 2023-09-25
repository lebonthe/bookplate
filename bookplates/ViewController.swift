//
//  ViewController.swift
//  testCanDeleteNow
//
//  Created by Min Hu on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
  
    @IBOutlet weak var imageView: UIImageView!
    
    let images = ["bookplate00","bookplate01","bookplate02","bookplate03","bookplate04"]
    var index = 0
    
    @IBOutlet var textLabels: [UILabel]!
    
    @IBOutlet weak var enteringContentTextField: UITextField!
    
    @IBOutlet weak var wordsCountingLabel: UILabel!
    
    @IBOutlet weak var wordsSizeSlider: UISlider!
    
    @IBOutlet weak var boldButton: UIButton!
    
    @IBOutlet weak var italicButton: UIButton!
    
    // 設定所有不同粗細的字型
    let thinFont = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .thin)
    let lightFont  = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .light)
    let regularFont = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular)
    let mediumFont = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .medium)
    let semiboldFont = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .semibold)
    let boldFont = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .bold)
    let heavyFont = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .heavy)
    
    let weightFonts = ["thinFont","lightFont","regularFont","mediumFont","semiboldFont","boldFont","heavyFont"]
    
    let weightFontsNames = ["Thin","Light","Regular","Medium","Semibold","Bold","Heavy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 創建一個自定義字體，為 14 像素大小的 Bodoni 72 Oldstyle Book
        let customFont = UIFont(name: "Bodoni 72 Oldstyle Book", size: 14)
        // 將 customFont 當做 Segmented Control 普通狀態 (normal) 的字型
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: customFont!], for: .normal)
        // 因為預設 index = 0，顯示第 0 張藏書票
        imageView.image = UIImage(named: images[index])
        // 只顯示第一個 Text Label
        textLabels[0].isHidden = false
        for i in 1..<textLabels.count{
            textLabels[i].isHidden = true
        }
        // 設定 Label01 的位置
        textLabels[1].frame = CGRect(x: 142, y: 431, width: 110, height: 30)
        // 旋轉 36 度
        textLabels[1].transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 36)
        
        // 設定 Label02 的位置
        textLabels[2].frame = CGRect(x: 180, y: 310, width: 70, height: 100)
        // 設定的行數為 3
        textLabels[2].numberOfLines = 3
        // 旋轉 354 度
        textLabels[2].transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 354)
        
        // 設定 Label04 的位置
        textLabels[4].frame = CGRect(x: 108, y: 441, width: 175, height: 62)
        textLabels[4].numberOfLines = 2
        
       /* // 設定選擇粗體的 Pull Down Button
        boldButton.showsMenuAsPrimaryAction = true
        // 使選擇後的 title 同步至 button 的標題
        boldButton.changesSelectionAsPrimaryAction = true
        // 設定粗體選單內容
        boldButton.menu = UIMenu(options: .singleSelection, children: [UIAction(title: "Thin", handler: {action in print("Thin")}), UIAction(title: "Light", state: .on, handler: {action in print("Light")}), UIAction(title: "Regular", handler: {action in print("Regular")}), UIAction(title:"Medium", handler: {action in print("Medium")}), UIAction(title: "Semibold", handler: {action in print("Semibold")}), UIAction(title:"bold", handler: {action in print("bold")}), UIAction(title: "Heavy", handler: {action in print("Heavy")})])
*/
        
        
        
            }
    func changeFontBold(){
        var textIndex = 0
       // let text = textLabels[textIndex].text
        //let attributedText = NSAttributedString(string: text!)
        
        for _ in 0..<textLabels.count{
            
            textLabels[textIndex].font = UIFont.boldSystemFont(ofSize: CGFloat(wordsSizeSlider.value))
            textIndex += 1
        }
    }





        
    
    // Segmented Control 的 Action
    @IBAction func chooseBookPlates(_ sender: UISegmentedControl) {
                // index 儲存現在被點選到的 Segmented 位置
                index = sender.selectedSegmentIndex
                // 圖片換成對應 index 的藏書票
                imageView.image = UIImage(named: images[index])

                // 顯示對應 index 的 Text Label
                textLabels[index].isHidden = false
                // 使用迴圈將不在對應 index 上的 Text Label 都隱藏
                for i in 0..<textLabels.count{
                    if i != index{
                        textLabels[i].isHidden = true
                    }
                }
            
            
     
 
        
    }
    
    @IBAction func type(_ sender: UITextField) {
        // 計算文字量
        wordsCountingLabel.text = "\(enteringContentTextField.text!.count)"
        // 宣告文字 index
        var textIndex = 0
        // 用迴圈將輸入的文字放到每一個 TextLabel 中
        for _ in 0..<textLabels.count{
            textLabels[textIndex].text = enteringContentTextField.text
            textIndex += 1
        }
    }
    // 拖曳 Slider 以控制 textLabel 的文字大小
    @IBAction func adjustWordSize(_ sender: UISlider) {
        // 宣告儲存 slider 值的變數 size
        let size = sender.value
        // 因為 slider 取到的值是 Float，轉為 CGFloat 才能讓 UIFont 辨識
        let sizeCGFloat = CGFloat(size)
        
        // 設一個變數給迴圈讀取 textLabel 使用
        var textIndex = 0
        // 使用迴圈幫每一個 textLabel 改變字體大小
        for _ in 0..<textLabels.count{
            // 取得目前 textLabel 的字型
            let font = textLabels[textIndex].font!
            // 使用 withSize 生成字體大小 17 的 UIFont 物件
            let newFont = font.withSize(sizeCGFloat)
            // 將 17 大小的字體存回 textLabel
            textLabels[textIndex].font = newFont
            // 下一個 textLabel
            textIndex += 1
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
        imageView.image = UIImage(named: images[0])
        wordsSizeSlider.value = 17
    }
    
    
   /* @IBAction func changeWeight(_ sender: UIButton) {
        // 設定選擇粗體的 Pull Down Button
        boldButton.showsMenuAsPrimaryAction = true
        // 使選擇後的 title 同步至 button 的標題
        boldButton.changesSelectionAsPrimaryAction = true
        // 設定粗體選單內容
        boldButton.menu = UIMenu(options: .singleSelection, children: [UIAction(title: "Thin", handler: {action in print("Thin")}), UIAction(title: "Light", state: .on, handler: {action in print("Light")}), UIAction(title: "Regular", handler: {action in print("Regular")}), UIAction(title:"Medium", handler: {action in print("Medium")}), UIAction(title: "Semibold", handler: {action in print("Semibold")}), UIAction(title:"bold", handler: {action in print("bold")}), UIAction(title: "Heavy", handler: {action in print("Heavy")})])

        var textIndex = 0
        var weightIndex = 0
        // let text = textLabels[textIndex].text
        //let attributedText = NSAttributedString(string: text!)
        
        for _ in 0..<textLabels.count{
            for _ in 0..<weightFontsNames.count{
                if boldButton.currentTitle == weightFontsNames[weightIndex]{
                    if weightIndex == 0{
                        textLabels[textIndex].font = thinFont
                    }else if weightIndex == 1{
                        textLabels[textIndex].font = lightFont
                    }else if weightIndex == 2{
                        textLabels[textIndex].font = regularFont
                    }else if weightIndex == 3{
                        textLabels[textIndex].font = mediumFont
                    }else if weightIndex == 4{
                        textLabels[textIndex].font = semiboldFont
                    }else if weightIndex == 5{
                        textLabels[textIndex].font = boldFont
                    }else if weightIndex == 6{
                        textLabels[textIndex].font = heavyFont
                    }
                   
                }
                weightIndex += 1
                print(boldButton.currentTitle!)
                print(weightIndex)
            }
            textIndex += 1
            print(textIndex)
            
            
            
            
        }
        
    }*/
 


}
