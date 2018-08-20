//
//  ViewController.swift
//  UdemyElAdivino
//
//  Created by Cristian Misael Almendro Lazarte on 8/18/18.
//  Copyright © 2018 Cristian Misael Almendro Lazarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ImgRespuesta: UIImageView!
    
    let answersArray : [String] = ["Si","No","PuedeSer","PreguntaOtraVez","NoTengoIdea","Seguramente"];
    
    var randomAnswerNumber : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.generarNumeroAleatorio();
        
    }
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        self.generarNumeroAleatorio();
    }
    
    func generarNumeroAleatorio()
    {
        self.randomAnswerNumber = Int(arc4random_uniform(UInt32(answersArray.count)));
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        
                        self.ImgRespuesta.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(
                            CGAffineTransform(rotationAngle:  CGFloat.pi/2).concatenating(
                                CGAffineTransform(translationX: -100, y: 100)));
                        
                        
        }) { (completed) in
            
            self.ImgRespuesta.transform = CGAffineTransform.identity;
            
            self.ImgRespuesta.image = UIImage(named: self.answersArray[self.randomAnswerNumber]);
   
        }
        
        //self.labelAnswer.text = self.answersArray[self.randomAnswerNumber];
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == UIEvent.EventSubtype.motionShake {
            self.generarNumeroAleatorio();
        }
    }
}

