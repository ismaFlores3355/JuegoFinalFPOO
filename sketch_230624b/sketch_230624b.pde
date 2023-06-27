Player player; // Declaración de variable para el jugador
Espinoso espinoso; // Declaración de variable para un objeto llamado "espinoso"
Escenario escenario; // Declaración de variable para un objeto llamado "escenario"
Suelo suelo; // Declaración de variable para un objeto llamado "suelo"
Menu menu; // Declaración de variable para un objeto llamado "menu"

void setup() {
  size(800, 600); // Establece el tamaño de la ventana del juego

  //-- Inicialización de objetos y asignación a las variables correspondientes --//
  player = new Player(width-650, height-120); // Crea un objeto Player y lo asigna a la variable "player"
  suelo = new Suelo(width-800, height-90); // Crea un objeto Suelo y lo asigna a la variable "suelo"
  espinoso = new Espinoso(width-150 - 100, height-120); // Crea un objeto Espinoso y lo asigna a la variable "espinoso"
  escenario = new Escenario(); // Crea un objeto Escenario y lo asigna a la variable "escenario"
  menu = new Menu(this); // Crea un objeto Menu y lo asigna a la variable "menu"
}

void draw() {
  if (menu.isActive()) { // Comprueba si el menú está activo
    menu.display(this); // Muestra el menú en la ventana del juego
  } else {
    escenario.display(this); // Muestra el escenario en la ventana del juego
    player.display(this); // Muestra el jugador en la ventana del juego
    suelo.display(this); // Muestra el suelo en la ventana del juego
    espinoso.display(this); // Muestra el objeto espinoso en la ventana del juego

    player.update(); // Actualiza la posición y velocidad del jugador
  }
}

void mouseClicked() {
  if (menu.isActive()) { // Comprueba si el menú está activo
    menu.mouseClick(); // Maneja el clic del mouse en el menú
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    player.moverIzquierda(); // Llama al método moverIzquierda() del jugador si se presiona la tecla de flecha izquierda
  } else if (keyCode == RIGHT) {
    player.moverDerecha(); // Llama al método moverDerecha() del jugador si se presiona la tecla de flecha derecha
  } else if (keyCode == UP) {
    player.saltoJugador(); // Llama al método saltoJugador() del jugador si se presiona la tecla de flecha hacia arriba
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    player.dejarDeMoverse(); // Llama al método dejarDeMoverse() del jugador si se suelta la tecla de flecha izquierda o derecha
  }
}
