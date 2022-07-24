//
//  AddVariablesViewController.swift
//  Wolfram-Omega
//
//  Created by Ayesha Nabiha on 7/16/18.
//  Copyright © 2018 Ayesha Nabiha. All rights reserved.
//

import UIKit

class AddVariablesViewController: UIViewController {
    

    var window: UIWindow?
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var variableTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    // array of variables user has entered
    var variables = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    var formulas = [UIImage?]()
    
    
    //list of formulas
    var formulaList = ["velocity=velocity_0+acceleration_x*time",
        "position=position_0+velocity_x0*time+(1/2)acceleration_x*time^2",
        "velocity^2=velocity_0^acceleration(position-position_0)",
        "acceleration=force/mass",
        "force=position/time",
        "impulse=force*time=momentum",
        "momentum=mass*velocity",
        "force_f=coefficient of friction*force_n",
        "energy=work=Force*radius",
        "kinetic energy=(1/2)mass*velocity^2",
        "power=Energy/time",
        "power=force*velocity",
        "potential energy=mass*gravity*height",
        "acceleration=velocity^2/radius=angular speed^2*radius",
        "torque=radius*force",
        "angular acceleration=torque/rotational inertia=torque_net/rotational inertia",
        "rotational inertia=integral(radius^2*mass)=mass*radius^2",
        "position_cm = sigma(mass_i * position_i)/sigma(mass_i)",
        "velocity = radius * angular speed",
        "angular momentum = radius*momentum=rotational inertia*angular speed",
        "kinetic energy=½*rotational inertia*angular speed^2",
        "angular speed = angular speed_0 + angular acceleration*time",
        "angle=angle_0+angular speed_0*time+(1/2)angular acceleration*time^2",
        "force=-spring constant*position",
        "potential energy=(1/2)spring constant*position^2",
        "position=position_maxcos(angular speed*time+phase angle)",
        "period=2/angular speed=1/frequency",
        "period=2root(mass/spring constant)",
        "period=2root(length/gravity)",
        "force=(m1)(m2)/radius^2",
        "potential energy=-(mass1)(mass2)/radius",
        "force_f<=coefficient of friction*force_n",
        "position=mass*position/mass",
        "electric field*distance*area=charge/emf",
        "electric field=-distance*electric potential/distance*position",
         "electric potential = electric field*distance*radius",
         "electric potential = (1/(4*pi*emf))*((point charge)/radius)",
         "current=(distance*charge)/(distance*time)"

        
]
    var listOfAcceptedWordsWrittenOut = ["acceleration", "energy", "force", "frequency", "height", "rotational inertia", "impulse", "kinetic energy", "spring constant", "length", "angular momentum", "mass", "normal force", "power", "momentum", "radius", "period", "time", "potential energy", "velocity", "speed", "work done on a system", "position", "coefficient of friction", "angle", "torque", "angular speed", "angular acceleration", "phase angle", "initial velocity", "gravity","electric field", "distance", "area", "emf", "charge", "electric potential","point charge", "current"]
    
    // array holding the currently accepted input words
    var listOfAcceptedWordsSymbolic = ["a", "E", "F", "f", "h", "I", "J", "K", "k", "l", "L", "m", "N", "P", "p", "r", "T", "t", "U", "v", "v", "W", "x", "mu", "theta", "tau", "omega", "alpha", "phi", "initial velocity"]
    

    var imageDict: [String: UIImage] =  [
        "velocity=velocity_0+acceleration_x*time": #imageLiteral(resourceName: "velocity=velocity_0+acceleration_x*time"),
        "position=position_0+velocity_x0*time+(1/2)acceleration_x*time^2": #imageLiteral(resourceName: "position=position_0+velocity_x0*time+(1:2)acceleration_x*time^2"),
        "velocity^2=velocity_0^acceleration(position-position_0)": #imageLiteral(resourceName: "Third"),
        "acceleration=force/mass": #imageLiteral(resourceName: "Fourth"),
        "force=position/time": #imageLiteral(resourceName: "Fifth"),
        "impulse=force*time=momentum": #imageLiteral(resourceName: "Sixth"),
        "momentum=mass*velocity": #imageLiteral(resourceName: "Seventh"),
        "force_f=coefficient of friction*force_n": #imageLiteral(resourceName: "Eight"),
        "energy=work=Force*radius": #imageLiteral(resourceName: "Ninth"),
        "kinetic energy=(1/2)mass*velocity^2": #imageLiteral(resourceName: "Tenth"),
        "power=Energy/time": #imageLiteral(resourceName: "eleventh"),
        "power=force*velocity": #imageLiteral(resourceName: "Twelve"),
        "potential energy=mass*gravity*height": #imageLiteral(resourceName: "Thirteen"),
        "acceleration=velocity^2/radius=angular speed^2*radius": #imageLiteral(resourceName: "Fourteen"),
        "torque=radius*force":#imageLiteral(resourceName: "Fifteen"),
        "angular acceleration=torque/rotational inertia=torque_net/rotational inertia": #imageLiteral(resourceName: "Sixteen"),
        "rotational inertia=integral(radius^2*mass)=mass*radius^2": #imageLiteral(resourceName: "Seventeen"),
        "position_cm = sigma(mass_i * position_i)/sigma(mass_i)": #imageLiteral(resourceName: "Eighteen"),
        "velocity = radius * angular speed": #imageLiteral(resourceName: "Nineteen"),
        "angular momentum = radius*momentum=rotational inertia*angular speed": #imageLiteral(resourceName: "Twenty"),
        "kinetic energy=½*rotational inertia*angular speed^2": #imageLiteral(resourceName: "Twenty-One"),
        "angular speed = angular speed_0 + angular acceleration*time": #imageLiteral(resourceName: "Twenty-two"),
        "angle=angle_0+angular speed_0*time+(1/2)angular acceleration*time^2": #imageLiteral(resourceName: "Twenty-three"),
        "force=-spring constant*position": #imageLiteral(resourceName: "Twenty-four"),
        "potential energy=(1/2)spring constant*position^2": #imageLiteral(resourceName: "Twenty-five"),
        "position=position_maxcos(angular speed*time+phase angle)": #imageLiteral(resourceName: "Twenty-six"),
        "period=2/angular speed=1/frequency": #imageLiteral(resourceName: "Twenty-seven"),
        "period=2root(mass/spring constant)": #imageLiteral(resourceName: "Twenty-eight"),
        "period=2root(length/gravity)": #imageLiteral(resourceName: "Twenty-nine"),
        "force=(m1)(m2)/radius^2": #imageLiteral(resourceName: "Thirty"),
        "potential energy=-(mass1)(mass2)/radius": #imageLiteral(resourceName: "Thirty-one"),
        "force_f<=coefficient of friction*force_n": #imageLiteral(resourceName: "thirty-two"),
        "electrical field*distance*area=charge/emf": #imageLiteral(resourceName: "1stC"),
        "electric field=-distance*electric potential/distance*position": #imageLiteral(resourceName: "2ndC"),
        "electric potential = electric field*distance*radius": #imageLiteral(resourceName: "3rdC"),
        "electric potential = (1/(4*pi*emf))*((point charge)/radius)": #imageLiteral(resourceName: "4thC"),
        "current=(distance*charge)/(distance*time)": #imageLiteral(resourceName: "5thC")
        ]
 

    
   /*
    var imageDict2 = [
        "velocity=velocity_0+acceleration_x*time": #imageLiteral(resourceName: "find_velocity_with_time_and_accel"),
        "position=position_0+velocity_x0*time+(1/2)acceleration_x*time^2": #imageLiteral(resourceName: "find_position"),
        "velocity^2=velocity_0^2acceleration(position-position_0)": #imageLiteral(resourceName: "find_vel_w_accel_and_disp"),
        "acceleration=force/mass": #imageLiteral(resourceName: "accel_w_force_mass"),
        "impulse=force*time=momentum": #imageLiteral(resourceName: "impulse"),
        "momentum=mass*velocity": #imageLiteral(resourceName: "momentum w mass and vel"),
        "force_f=coefficient of friction*force_n": #imageLiteral(resourceName: "frictional force"),
        
        "kinetic energy=(1/2)mass*velocity^2": #imageLiteral(resourceName: "kinetic energy w mass and vel"),
        
        "power=force*velocity": #imageLiteral(resourceName: "power w force and vel"),
        "potential energy=mass*gravity*height": #imageLiteral(resourceName: "potential energy of grav"),
        "Angular acceleration=sigma(torque)/rotational inertia": #imageLiteral(resourceName: "angular accel"),
        "Angular acceleration=torque_net/rotational inertia": #imageLiteral(resourceName: "angular accel"),
        "Position_cm = sigma(mass_i * position_i)/sigma(mass_i)": #imageLiteral(resourceName: "position vector w sigma mass and position"),
        "Velocity = radius * angular speed": #imageLiteral(resourceName: "vel w radius and ang speed"),
        "Angular momentum = radius*momentum": #imageLiteral(resourceName: "angular momentum with radius"),
        "Angular momentum = rotational inertia*angular speed": #imageLiteral(resourceName: "rotational inertia and ang speed"),
        "Kinetic energy=1/2*rotational inertia*angular speed^2": #imageLiteral(resourceName: "kinetic energy w inertia"),
        "Angular speed = angular speed_0 + angular acceleration*time":#imageLiteral(resourceName: "ang speed w angspeed and angaccel"),
        "potential energy=-(mass1)(mass2)/radius":#imageLiteral(resourceName: "potential energy of grav"),
        "force=(m1)(m2)/radius^2":#imageLiteral(resourceName: "force of gravity"),
        "force=(m1)(m2)/distance^2": #imageLiteral(resourceName: "force of gravity"),
        "period=2root(length/gravity)": #imageLiteral(resourceName: "period of pendulum"),
        "period=2root(mass/spring constant)": #imageLiteral(resourceName: "period of spring"),
        "period=2/angular speed=1/frequency": #imageLiteral(resourceName: "period w angspeed and freq"),
        "position=position_maxcos(angular speed*time+phase angle)":#imageLiteral(resourceName: "position w max position, angspeed and phase angle"),
        "potential energy=(1/2)spring constant*position^2": #imageLiteral(resourceName: "potential energy of spring"),
        "force=-spring constant*position": #imageLiteral(resourceName: "force of spring"),
        "angle=angle_0+angular speed_0*time+(1/2)angular acceleration*time^2":#imageLiteral(resourceName: "angle w angspeed and angaccel")
    ]
 
*/
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("inside add variables view controller")
        tableView.delegate = self
        tableView.dataSource = self
        
        //this set of code makes the add button, help button, clear button and the calculate button look nicer
        addButton.layer.cornerRadius = 15
        addButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        addButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        addButton.layer.shadowOpacity = 1.0
        addButton.layer.shadowRadius = 0.0
        addButton.layer.masksToBounds = false
        
        helpButton.layer.cornerRadius = 15
        helpButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        helpButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        helpButton.layer.shadowOpacity = 1.0
        helpButton.layer.shadowRadius = 0.0
        helpButton.layer.masksToBounds = false
        
        clearButton.layer.cornerRadius = 15
        clearButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        clearButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        clearButton.layer.shadowOpacity = 1.0
        clearButton.layer.shadowRadius = 0.0
        clearButton.layer.masksToBounds = false
        
        calculateButton.layer.cornerRadius = 15
        calculateButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        calculateButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        calculateButton.layer.shadowOpacity = 1.0
        calculateButton.layer.shadowRadius = 0.0
        calculateButton.layer.masksToBounds = false
        
        //this set of code allows the user to dismiss the keyboard when they are done typing so that it does not hinder them from accessing other parts of the view
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    //this method should populate the table view with the variable the user entered
    @IBAction func addButtonPressed(_ sender: Any) {
        if var currentText = variableTextField.text {
            //if the user puts a space before, after, or both, disregard
            if(currentText.hasPrefix("") || currentText.hasSuffix("") || (currentText.hasPrefix("") && currentText.hasSuffix("") )) {
                currentText = currentText.trimmingCharacters(in: .whitespacesAndNewlines)
            }
                let varName = currentText.lowercased()
            //accounts for user trying to put variables in the list more than once
            
            if(variables.contains(varName)){
                let alert = UIAlertController(title: "Repeated Variable", message: "You have already included this variable in your list.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                    }}))
                self.present(alert, animated: true, completion: nil)
            } else {
                if listOfAcceptedWordsSymbolic.contains(currentText) {
                    let writtenOutArrayIndex = listOfAcceptedWordsSymbolic.index(of: currentText)
                    currentText = listOfAcceptedWordsWrittenOut[writtenOutArrayIndex!]
                    if(variables.contains(currentText)) {
                        let alert = UIAlertController(title: "Repeated Variable", message: "You have already included this variable in your list.", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                            switch action.style{
                            case .default:
                                print("default")
                                
                            case .cancel:
                                print("cancel")
                                
                            case .destructive:
                                print("destructive")
                            }}))
                        self.present(alert, animated: true, completion: nil)
                        
                    } else {
                    variables.append(currentText)
                    print(variables)
                    variableTextField.text = ""
                    }
                } else if listOfAcceptedWordsWrittenOut.contains(varName) {
                    variables.append(varName)
                    print(variables)
                    variableTextField.text = ""
            } else { //if they mispelled the variable
                let alert = UIAlertController(title: "Mispelled Variable Name", message: "Oops, it seems like you meant to type something else. Try typing the variable name again.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                    }}))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
    
        

    
    //this method should take the user to the next page and display the formulas the user should use based on the variables they gave
    @IBAction func calculateButtonPressed(_ sender: Any) {
        var tempCounter=0
        // get the formula
        formulas = []
        for word in formulaList{
            // get a variable from the list of variables
            for name in variables{
                // check if the formula has the variable
                if word.contains(name){
                    // increment the number of times the variables showed up in the formula
                    tempCounter = tempCounter+1
                }
            }
            // if the formula has all of the varibles, print it
            if tempCounter == variables.count {
                print(word)
                
                //Shreejas 
                let temp = imageDict[word]
                formulas.append(temp)

            }
            tempCounter=0
        }
        
    }
    //method call

    
    //clears the screen
    @IBAction func clearButtonPressed(_ sender: Any) {
        variables.removeAll()
    }
    
    //goes back to the tab view if help button is pressed
    @IBAction func helpButtonPressed(_ sender: Any) {
        print("Help button was pressed!")
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PageViewController")
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
//        let pg: PageViewController = PageViewController()
//        pg.viewDidLoad()
//        pg.configurePageControl()
        
        let pg: ViewController = ViewController()
        pg.viewDidLoad()
    }
    
    
    func addNewVariable() {
        print("hello")
        let indexPath = IndexPath(row: variables.count-1, section: 0)
        print ("destroyed here")
        tableView.insertRows(at: [indexPath], with: .automatic)
        print("hi")
        // destoryed on the line below
        tableView.reloadData()
        tableView.dequeueReusableCell(withIdentifier: "Variable", for: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FormulaViewController
        destination.formulas = formulas
    }

    
}



extension AddVariablesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "variableCell", for: indexPath) as! VariableTableViewCell
        print(variables.count)
        
        
        let variable = variables[indexPath.row]
        //display a cell with the variable that the user typed after they click add
        cell.variableLabel.text = variable
        
        //makes the cell look nicer
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowRadius = 0.0
        cell.layer.masksToBounds = false
        
        
        return cell
    }
    
    //deletes a particular variable, in case the user made a mistake or something
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
                variables.remove(at: indexPath.row)
            }
        }
    
    //sets the height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50.0;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return variables.count
    }
}

