//
//  ViewController.swift
//  IosMadrid
//
//  Created by CETYS on 20/02/18.
//  Copyright © 2018 CETYS. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var miMapa: MKMapView!
    
    @IBAction func Bernabeu(_ sender: UIBarButtonItem) {
        let coordenadas = CLLocationCoordinate2D(latitude: 40.453123, longitude: -3.688345)
        let miZoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let regionUFV = MKCoordinateRegion(center: coordenadas, span: miZoom)
        
        miMapa.setRegion(regionUFV, animated: true)

    }
    
    @IBAction func diEstafano(_ sender: UIBarButtonItem) {
        let coordenadas2 = CLLocationCoordinate2D(latitude: 40.4769499, longitude: -3.6178054)
        let miZoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let regionUFV2 = MKCoordinateRegion(center: coordenadas2, span: miZoom)
        
        miMapa.setRegion(regionUFV2, animated: true)

    }
    
    @IBAction func cambiaMapa(_ sender: UIBarButtonItem) {
        if(miMapa.mapType == MKMapType.standard){
            miMapa.mapType = MKMapType.satellite
            sender.title = "Normal"
        }else{
            miMapa.mapType = MKMapType.standard
            sender.title = "Satelite"
        }

    }
    
    //@IBOutlet var imagenJugador: UIImageView!
    
    //var nombreArchivoImagen : String = ""
    
    //@IBOutlet var nombreJugador: UILabel!
    
    //var nombreArchivoJugador : String = ""
    
    @IBAction func cancelar(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardar(_ sender: AnyObject) {
        let _nombrePersona = self.nombrePersona.text!
        let _apellidoPersona = self.apellidoPersona.text!
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidad = NSEntityDescription.entity(forEntityName: "Entradas", in: managedContext)
        
        let registro = NSManagedObject(entity: entidad!, insertInto: managedContext)
        
        registro.setValue(_nombrePersona, forKey: "nombre")
        registro.setValue(_apellidoPersona, forKey: "apellidos")
        do{
            try managedContext.save()
            print("nombre guardado ok")
        }   catch let error as NSError{
            print("No se ha podido escribir el nombre \(error), \(error.userInfo)")
        }
        
        self.dismiss(animated: true, completion: nil)

    }
    @IBOutlet var nombrePersona: UITextField!
    
    @IBOutlet var apellidoPersona: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //miMapa.delegate = self
        
        //let coordenadasBer = CLLocationCoordinate2D(latitude: 40.453123, longitude: -3.688345)
        //let miAnotacion = MKPointAnnotation()
        //miAnotacion.coordinate = coordenadasBer
        //miAnotacion.title = "Estadio Santiago Bernabeu"
        //miAnotacion.subtitle = "Real Madrid"
        
        //miMapa.addAnnotation(miAnotacion)
        
        
        //let coordenadasDi = CLLocationCoordinate2D(latitude: 40.4769499, longitude: -3.6178054)
        //let miAnotacion2 = MKPointAnnotation()
        //miAnotacion2.coordinate = coordenadasDi
        //miAnotacion2.title = "Estadio Di Estafano"
        //miAnotacion2.subtitle = "Real Madrid"
        
        //miMapa.addAnnotation(miAnotacion2)
        
        // Do any additional setup after loading the view, typically from a nib.
        //nombreJugador.text = nombreArchivoJugador
        //imagenJugador.image = UIImage(named: nombreArchivoImagen)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

