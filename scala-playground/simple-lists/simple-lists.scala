class Fruit {
  var Tastiness : Int = 0
  override def toString(): String = Tastiness.toString()
}

object HelloWorld extends App {
  def fruit = new Fruit()
  fruit.Tastiness = 6

  def list = List(fruit)

  list.foreach(println)
}