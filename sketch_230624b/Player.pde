public class Player extends GameObject {
  private PImage pasoUno; // Variable para almacenar el primer sprite del jugador
  private PImage pasoDos; // Variable para almacenar el segundo sprite del jugador
  private int frameActual; // Variable para almacenar el número de frame actual de la animación del jugador
  private float velocidadX; // Variable para la velocidad horizontal del jugador
  private float velocidadY; // Variable para la velocidad vertical del jugador
  private float gravedad; // Variable para la gravedad aplicada al jugador
  private boolean saltando; // Variable para indicar si el jugador está saltando

  public Player(float x, float y) {
    super(x, y); // Llama al constructor de la clase padre (GameObject) y establece las coordenadas iniciales
    velocidadX = 0; // Inicializa la velocidad horizontal en 0
    velocidadY = 0; // Inicializa la velocidad vertical en 0
    gravedad = 0.5f; // Establece la gravedad del jugador
    saltando = false; // Establece el estado de salto del jugador como falso
    frameActual = 0; // Inicializa el número de frame actual en 0
  }

  public void display(PApplet sketch) {
    pasoUno = sketch.loadImage("pasoUno.png"); // Carga el primer sprite del jugador desde un archivo
    pasoDos = sketch.loadImage("pasoDos.png"); // Carga el segundo sprite del jugador desde un archivo

    // Determina qué sprite mostrar según el número de frame actual
    PImage spriteActual = (frameActual % 2 == 0) ? pasoUno : pasoDos;

    sketch.image(spriteActual, getPosition().x, getPosition().y); // Muestra el sprite del jugador en las coordenadas (x, y)
  }

  public void moverIzquierda() {
    velocidadX = -3; // Establece la velocidad hacia la izquierda
    frameActual = 0; // Reinicia el número de frame actual para reiniciar la animación
  }

  public void moverDerecha() {
    velocidadX = 3; // Establece la velocidad hacia la derecha
    frameActual = 0; // Reinicia el número de frame actual para reiniciar la animación
  }

  public void dejarDeMoverse() {
    velocidadX = 0; // Detiene el movimiento horizontal estableciendo la velocidad en 0
    frameActual = 0; // Reinicia el número de frame actual para reiniciar la animación
  }

  public void saltoJugador() {
    if (!saltando) {
      velocidadY = -12; // Establece la velocidad vertical hacia arriba para el salto
      saltando = true; // Establece el estado de salto como verdadero
      frameActual = 0; // Reinicia el número de frame actual para reiniciar la animación
    }
  }

  public void update() {
    // Aplica la gravedad al jugador
    velocidadY += gravedad;

    // Limita la velocidad horizontal del jugador
    velocidadX = PApplet.constrain(velocidadX, -5, 5);

    // Actualiza las coordenadas del jugador según las velocidades horizontal y vertical
    setPosition(getPosition().x + velocidadX, getPosition().y + velocidadY);

    // Verifica si el jugador ha tocado el suelo
    if (getPosition().y >= height - 120) {
      velocidadY = 0; // Detiene la velocidad vertical del jugador
      saltando = false; // Establece el estado de salto como falso
      setPosition(getPosition().x, height - 120); // Ajusta la posición del jugador al suelo
    }

    // Incrementa el número de frame actual para la animación del jugador
    frameActual++;
  }

  public void keyTyped() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        moverIzquierda(); // Llama al método moverIzquierda() si se presiona la tecla de flecha izquierda
      } else if (keyCode == RIGHT) {
        moverDerecha(); // Llama al método moverDerecha() si se presiona la tecla de flecha derecha
      } else if (keyCode == UP) {
        saltoJugador(); // Llama al método saltoJugador() si se presiona la tecla de flecha hacia arriba
      }
    }
  }

  public void keyReleased() {
    if (key == CODED) {
      if (keyCode == LEFT || keyCode == RIGHT) {
        dejarDeMoverse(); // Llama al método dejarDeMoverse() si se suelta la tecla de flecha izquierda o derecha
      }
    }
  }
}
