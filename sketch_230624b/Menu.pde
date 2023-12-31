import processing.core.*;

public class Menu implements IVisualizable{
  private PImage fondoMenu; // Variable para almacenar la imagen de fondo del menú
  private PImage icono; // Variable para almacenar la imagen del icono
  private boolean activo; // Variable para indicar si el menú está activo o no
  private PFont fuente; // Variable para almacenar la fuente de texto

  public Menu(PApplet sketch) {
    fondoMenu = sketch.loadImage("fondomenu.png"); // Carga la imagen de fondo del menú desde un archivo
    fondoMenu.resize(800, 600); // Ajusta el tamaño de la imagen de fondo a 800x600 píxeles
    icono = sketch.loadImage("icono.png"); // Carga la imagen del icono desde un archivo
    activo = true; // Establece el menú como activo por defecto
    fuente = sketch.createFont("Arial", 32); // Crea una fuente de texto con el tipo y tamaño especificados
  }

  public void display(PApplet sketch) {
    sketch.image(fondoMenu, 0, 0); // Muestra la imagen de fondo del menú en las coordenadas (0, 0)
    sketch.image(icono, sketch.width / 2 - icono.width / 2, sketch.height / 2 - icono.height / 2); // Muestra la imagen del icono en el centro de la ventana del juego
    sketch.textFont(fuente); // Establece la fuente de texto utilizada
    sketch.fill(255); // Establece el color de relleno del texto como blanco
    sketch.textAlign(PApplet.CENTER, PApplet.CENTER); // Establece la alineación del texto al centro
    sketch.text("Click para empezar", sketch.width / 2, sketch.height / 2 + icono.height / 2 + 20); // Muestra el texto "Click para empezar" debajo del icono
  }

  public void mouseClick() {
    activo = false; // Desactiva el menú cuando se hace clic
  }

  public boolean isActive() {
    return activo; // Devuelve si el menú está activo o no
  }
}
