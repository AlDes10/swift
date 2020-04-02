
// Действия с автомобилями
enum enginState {
        case started, off
    }
enum windowState {
        case open, close;
    }
enum loadBody{
        case full,half,empty;
}
enum hatchState{
    case open,close
}

// Супер класс car
class car{
    let relese: Int;
    let model: String;
    var engine: enginState;
    var window: windowState;
    var color: String;
    init(relese: Int, model: String, engine: enginState, window: windowState, color: String){
        self.relese = relese;
        self.model = model;
        self.color = color
        self.engine = engine
        self.window = window
    }
}

// Наследник trunkCar
class trunkCar: car{
    var bodyVolume: Double;
    var loadBodyVolume: Double;
    init(relese: Int, model: String, engine: enginState, window: windowState, color: String, bodyVolume: Double, loadBodyVolume: Double){
        self.bodyVolume = bodyVolume;
        self.loadBodyVolume = loadBodyVolume;
        super.init(relese: relese, model: model, engine: engine, window: window, color:color)
    }
// Функция загрузки кузова
    func bodyState(status: loadBody){
        switch status {
        case .full:
            loadBodyVolume = bodyVolume;
        case .half:
            loadBodyVolume = bodyVolume/2;
        default:
            loadBodyVolume = 0;
        }
    }
    func InfoCar (car: trunkCar){
        print("Год выпуска - ",car.relese,"Марка автомобиля - ",car.model,"Статус двигателя - ",car.engine, "Статус окон -",car.window, "Цвет -",car.color, "Объем кузова -",car.bodyVolume, "Загруженый объем кузова -",car.loadBodyVolume)
    }
}

// Наследник sportCar
class sportCar: car{
    var hatch: hatchState
    init(relese: Int, model: String, engine: enginState, window: windowState, color: String, hatch: hatchState){
    self.hatch = hatch;
    super.init(relese: relese, model: model, engine: engine, window: window, color:color)
    }
    
// функция открытия, закрытия люка
    func hatchStatus(status: hatchState){
        switch status {
             case .open:
                hatch = .open
             case .close:
                hatch = .close
            }
    }
    func InfoCar (car: sportCar){
        print("Год выпуска - ",car.relese,"Марка автомобиля - ",car.model,"Статус двигателя - ",car.engine, "Статус окон -",car.window, "Цвет -",car.color, "Статус люка -",car.hatch)
}
}

var car1 = trunkCar(relese: 2010, model: "Opel", engine: .off, window: .close, color: "Черный", bodyVolume: 1000, loadBodyVolume: 0);

car1.InfoCar(car: car1);
car1.bodyState(status: .full);
car1.engine = .started;
car1.InfoCar(car: car1);

var car2 = sportCar(relese: 2020, model: "BMW", engine: .off, window: .close, color: "Красный", hatch:.close);

car2.InfoCar(car: car2);
car2.color = "Желтый";
car2.window = .open;
car2.hatchStatus(status: .open)
car2.InfoCar(car: car2)
