//
//  ResultViewController.swift
//  SlideShowApp
//
//  Created by η§ιιδΉ on 2022/12/30.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    var resultView:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.resultImage.image = UIImage(named: resultView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
