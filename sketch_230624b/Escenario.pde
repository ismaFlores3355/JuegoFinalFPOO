public class Escenario implements IVisualizable{
  private PImage fondo; // Imagen de fondo del escenario
  private PFont fuente; // Fuente utilizada para el texto
  private int vidas; // Cantidad de vidas del jugador
  private float fondoX; // Posición en el eje X del fondo

  public Escenario() {
    fondo = loadImage("fondo.png"); // Carga la imagen de fondo desde un archivo
    fondo.resize(800, 600); // Ajusta el tamaño del fondo a 800x600 píxeles
    fuente = createFont("Arial", 16); // Crea la fuente utilizando Arial de tamaño 16
    vidas = 3; // Inicializa la cantidad de vidas en 3
    fondoX = 0; // Inicializa la posición del fondo en el eje X en 0
  }

  public void display(PApplet sketch) {
    fondoX += 1; // Incrementa la posición del fondo en el eje X

    sketch.image(fondo, -fondoX, 0); // Muestra la imagen de fondo en la posición (-fondoX, 0)
    sketch.image(fondo, sketch.width - fondoX, 0); // Muestra la imagen de fondo en la posición (anchoDeLaVentana - fondoX, 0)

    sketch.textFont(fuente); // Establece la fuente utilizada para el texto
    sketch.fill(255); // Establece el color de relleno del texto como blanco
    sketch.textAlign(PApplet.LEFT, PApplet.TOP); // Establece la alineación del texto como izquierda-arriba
    sketch.text("Puntaje", 10, 10); // Muestra el texto "Puntaje" en la posición (10, 10)
    sketch.textAlign(PApplet.RIGHT, PApplet.TOP); // Establece la alineación del texto como derecha-arriba
    sketch.text("VIDAS " + vidas, sketch.width - 20 , 10); // Muestra el texto "VIDAS" seguido de la cantidad de vidas en la posición (anchoDeLaVentana - 20, 10)

    if (fondoX >= sketch.width) {
      fondoX = 0; // Reinicia la posición del fondo en el eje X si ha alcanzado o superado el ancho de la ventana
    }
  }

  public void setVidas(int vidas) {
    this.vidas = vidas; // Establece la cantidad de vidas del jugador
  }
}
