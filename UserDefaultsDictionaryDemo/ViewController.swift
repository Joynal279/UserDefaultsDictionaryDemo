//
//  ViewController.swift
//  UserDefaultsDictionaryDemo
//
//  Created by Joynal Abedin on 11/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    var dictionary:[String: Data] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // data append
        dataAppendInDictionary()
        
        //Access Shared Defaults Object
        let userDefaults = UserDefaults.standard
        userDefaults.set(dictionary, forKey: "myKey")
        // Read/Get Dictionary
        let strings:[String:Data] = userDefaults.object(forKey: "myKey") as? [String:Data] ?? [:]
        
        print(strings)
        showImage(data: strings["1"]!)
    }
    
    func dataAppendInDictionary(){
        dictionary.updateValue(UIImage(named: "imageD")!.pngData()!, forKey: "1")
        dictionary.updateValue(UIImage(named: "imageD")!.pngData()!, forKey: "2")
        dictionary.updateValue(UIImage(named: "imageD")!.pngData()!, forKey: "3")
    }
    func showImage(data: Data) {
        let image = UIImageView(frame: CGRect(x: 10, y: 100, width: 100, height: 100))
        self.view.addSubview(image)
        image.image = UIImage(data: data)
    }
}
