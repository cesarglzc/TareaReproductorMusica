//
//  Cancion.swift
//  TareaReproductorMusica
//
//  Created by Cesar Gonzalez on 30/10/16.
//  Copyright © 2016 Cesar Gonzalez. All rights reserved.
//

import UIKit


class Cancion {
    
    // MARK: Properties
    var titulo: String
    var archivoCancion: String
    var portadaDisco: String
    

    // MARK: Initialization
    init(titulo: String, archivoCancion: String, portadaDisco: String) {
        
        // Initialize stored properties.
        self.titulo = titulo
        self.archivoCancion = archivoCancion
        self.portadaDisco = portadaDisco
        
    }



}
