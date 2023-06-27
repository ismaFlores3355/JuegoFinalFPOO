public abstract class GameObject {
  private PVector position; // Variable para almacenar la posición del objeto

  public GameObject(float x, float y) {
    position = new PVector(x, y); // Crea un nuevo objeto PVector con las coordenadas proporcionadas y lo asigna a la variable "position"
  }

  public abstract void display(PApplet sketch); // Método abstracto para mostrar el objeto (debe ser implementado en las clases derivadas)

  public PVector getPosition() {
    return position; // Devuelve la posición actual del objeto
  }

  public void setPosition(float x, float y) {
    position.set(x, y); // Establece la posición del objeto con las coordenadas proporcionadas
  }
}
