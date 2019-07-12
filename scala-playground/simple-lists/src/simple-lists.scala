abstract class Fruit {
  var Tastiness : Int
  override def toString(): String = Tastiness.toString()
}

class Apple extends Fruit {
  override var Tastiness: Int = 0
}

class Banana extends Fruit{
  override var Tastiness: Int = 0
}

object HelloWorld extends App {
  val fruit: Apple = new Apple()
  fruit.Tastiness = 6

  val otherFruit: Banana = new Banana()
  otherFruit.Tastiness = 7

  val list = List(fruit, otherFruit)
  list.foreach(println)
}