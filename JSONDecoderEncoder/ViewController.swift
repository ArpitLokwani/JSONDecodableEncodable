//
//  ViewController.swift
//  JSONDecoderEncoder
//
//  Created by Arpit Lokwani on 26/02/20.
//  Copyright © 2020 Arpit Lokwani. All rights reserved.
//

import UIKit

struct jsonstruct:Decodable{
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
}

class ViewController: UIViewController {
    var arrdata = [jsonstruct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for mainarr in self.arrdata{
                    print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                   
                    
                }
                }
                
            }catch{
                print("Error in get json data")
            }
            
            }.resume()
    }
    
}

