//
//  ViewController.swift
//  TareaReproductorMusica
//
//  Created by Cesar Gonzalez on 30/10/16.
//  Copyright © 2016 Cesar Gonzalez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var portadaImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var reproductor:AVAudioPlayer!
    
    var arrayCanciones =  [
            Cancion(titulo: "Three little birds", archivoCancion: "bob marley", portadaDisco: "bob-marley-three-little-birds"),
            Cancion(titulo: "Cómo te atreves", archivoCancion: "como te atreves", portadaDisco: "morat-disco"),
            Cancion(titulo: "Pumped up kicks", archivoCancion: "FosterThePeople", portadaDisco: "PumpedUpKicks"),
            Cancion(titulo: "Tengo tu love", archivoCancion: "sie7e", portadaDisco: "tengo-tu-love"),
            Cancion(titulo: "The world we live in", archivoCancion: "the world we live in", portadaDisco: "killers"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return arrayCanciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CancionCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell...
        
        cell.imageView?.image =  UIImage(named: arrayCanciones[indexPath.row].portadaDisco+".jpg")
        cell.textLabel?.text = arrayCanciones[indexPath.row].titulo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        portadaImageView.image = UIImage(named: arrayCanciones[indexPath.row].portadaDisco+".jpg")
        tituloLabel.text = arrayCanciones[indexPath.row].titulo
        
        
        let sonidoURL = Bundle.main.url(forResource: arrayCanciones[indexPath.row].archivoCancion, withExtension: "mp3")
        
        do{
            try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
        }catch{
            print("Error al cargar el archivo de sonido")
        }
        
        
        if(!reproductor.isPlaying){
            reproductor.play()
        }
        
    }
    

    
    @IBAction func play() {
        
        if(reproductor != nil){
            if(!reproductor.isPlaying){
                reproductor.play()
            }
        }
        
    }
    
    @IBAction func stop() {
        
        if(reproductor != nil){
            if(reproductor.isPlaying){
                reproductor.stop()
                reproductor.currentTime = 0.0
            }
        }
        
    }
    
    @IBAction func pause() {
        if(reproductor != nil){
            if(reproductor.isPlaying){
                reproductor.pause()
            }
        }
    }
    
    
    @IBAction func subirVolumen() {
        if(reproductor != nil){
            reproductor.volume = reproductor.volume+1
        }
        
    }
    
    @IBAction func bajarVolumen() {
        if(reproductor != nil){
            
            if(reproductor.volume > 0){
                reproductor.volume = reproductor.volume-1
            }
            
        }
    }
    
    
    @IBAction func aleatorio() {
        
        let random = Int(arc4random_uniform(UInt32(arrayCanciones.count)))
        
        let indexPath = IndexPath(row: random, section: 0);
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        tableView(tableView, didSelectRowAt: indexPath)
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

