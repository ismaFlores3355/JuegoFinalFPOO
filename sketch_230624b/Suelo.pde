public class Suelo extends GameObject implements IVisualizable {
  private PImage sueloImagen; // Variable para almacenar la imagen del suelo

  private Suelo(float x, float y) {
    super(x, y); // Llama al constructor de la clase padre (GameObject) y establece las coordenadas iniciales
    sueloImagen = loadImage("suelo.png"); // Carga la imagen del suelo desde un archivo
  }

  public void display(PApplet sketch) {
    sketch.image(sueloImagen, getPosition().x, getPosition().y); // Muestra la imagen del suelo en las coordenadas (x, y)
  }
}
