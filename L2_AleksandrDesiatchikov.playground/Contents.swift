
// Проверить четное число или нет
func evenNunber(number:Int) {
    number%2 == 0 ? print("четное") : print("нечетное");
}
evenNunber(number: 3);

// Проверить делится число без остатка на 3
func div3(number: Int) {
    number%3 == 0 ? print("делится") : print("не делится");
}
div3(number: 4);

// Возрастающий массив из 100 чисел
var array = [Int]();
var i = 0;
    while i<100 {
        array.append(i+1);
        i += 1;
}
print (array);

// удалить из массива все четные числа и все числа которые не делятся на 3

for number in array where (number%2 == 0) || (number%3 == 0) {
    array.remove(at : (array.firstIndex(of: number)!));
}
print (array);


// заполнить массив из 100 элементов различными простыми числами
func prime (number: Int) -> Bool {
    if number < 2 {
        return false;
    }
    for i in 2..<number {
        if number % i == 0 {
            return false;
        }
    }
    return true;
}
func primeArray () -> [Int] {
    var results = [Int]();
    var i = 2;
    while results.count < 100 {
        if prime(number: i) {
            results.append(i);
        }
        i += 1
    }
    
    return results
}
print (primeArray())


