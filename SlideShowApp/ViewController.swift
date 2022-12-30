//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 牧野達也 on 2022/12/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dispImage: UIImageView!
    @IBOutlet weak var bth_next: UIButton!
    @IBOutlet weak var bth_back: UIButton!
    
    let imageFiles = ["picture01","picture02","picture03"]
    var image: UIImage!
    var orderNo:Int = 0
    
    var timer:Timer!
    var switchFlg:Bool = false //true:再生 false:停止
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 初期表示
        dispImage.image = UIImage(named: self.imageFiles[self.orderNo])
    }

    @IBAction func moveNext(_ sender: Any) {
        //orderNoが2未満であればカウントアップ
        if self.orderNo < 2 {
            self.orderNo += 1
        //orderNoが2以上であればカウントリセット
        } else {
            self.orderNo = 0
        }
        dispImage.image = UIImage(named: self.imageFiles[self.orderNo])

    }
    
    @IBAction func moveBack(_ sender: Any) {
        //orderNoが1以上であればカウントダウン
        if self.orderNo > 0 {
            self.orderNo -= 1
        //orderNoが0であればカウントリセット(最後尾番号セット）
        } else {
            self.orderNo = 2
        }
        dispImage.image = UIImage(named: self.imageFiles[self.orderNo])
    }
    
    @IBAction func play_stop(_ sender: Any) {
        if self.switchFlg == true {
            self.switchFlg = false
            self.timer.invalidate()
            self.timer = nil
            self.bth_next.isEnabled = true
            self.bth_back.isEnabled = true
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showSlide(_:)), userInfo: nil, repeats: true)
            self.bth_next.isEnabled = false
            self.bth_back.isEnabled = false
            self.switchFlg = true
        }
    }
    @objc func showSlide(_ timer:Timer){
        //orderNoが2未満であればカウントアップ
        if self.orderNo < 2 {
            self.orderNo += 1
        //orderNoが2以上であればカウントリセット
        } else {
            self.orderNo = 0
        }
        dispImage.image = UIImage(named: self.imageFiles[self.orderNo])
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rstViewController:ResultViewController = segue.destination as! ResultViewController
        rstViewController.resultView = self.imageFiles[self.orderNo]
    }
}

