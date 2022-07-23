import UIKit
import AVFoundation // Lib/API buat mutar musik dr apple docs

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    // tampilan awal app
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Alternative cara utk mutar musik dgn func dlm func agar sender.currentTitle dpt terbaca
    //    @IBAction func keyPressed(_ sender: UIButton) {
    //        let soundName = sender.currentTitle
    //
    //        playSound()
    //
    //        func playSound() {
    //            let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
    //            player = try! AVAudioPlayer(contentsOf: url!)
    //            player.play()
    //
    //        }
    //    }
    
    // ketika UI di pencet dr user
    @IBAction func keyPressed(_ sender: UIButton) {
        
        func delayCode(timeDelay: Double){
            
            // DispatchQueue buat delay excute code
            // .now() + harus double
            DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay) {
                
                // Code you want to be delayed
                // sender.alpha = opacity dr UI
                sender.alpha = 1
                print("End")
            }
        }
        delayCode(timeDelay: 0.2)
        sender.alpha = 0.5
        print("Start")
        
        // memanggil func playSound
        // sender.currentTitle = Who.What = Value
        // sender.currentTitle = judul title yg ditekan dr user
        // sender.currentTitle! = Menghiraukan dr warning system bahwa smua UIButton memiliki title
        playSound(soundName: sender.currentTitle!)
        
    }
    
    func playSound(soundName: String) {
        // Bundle utk pengaksesan assets
        // forResource harus String jd menggunakan soundName utk sender.currentTitle dr keyPressed()
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}
