public class Espinoso extends GameObject implements IVisualizable{
  private PImage espinosoUnoImage; // Variable para almacenar el primer sprite del objeto Espinoso
  private PImage espinosoDosImage; // Variable para almacenar el segundo sprite del objeto Espinoso
  private float speed = -3.0f; // Velocidad de movimiento negativa del objeto Espinoso
  private int fase = 1; // Fase actual: 1, 2 o 3

  public Espinoso(float x, float y) {
    super(x, y);
  }

  public void display(PApplet sketch) {
    if (espinosoUnoImage == null) {
      espinosoUnoImage = sketch.loadImage("espinosoUno.png");
    }
    if (espinosoDosImage == null) {
      espinosoDosImage = sketch.loadImage("espinosoDos.png");
    }

    int cantidad = 0;

    switch (fase) {
      case 1:
        cantidad = 1;
        break;
      case 2:
        cantidad = 3;
        break;
      case 3:
        cantidad = 2;
        break;
    }

    int separacionEnemigo = 100; // Separación entre los objetos Espinosos

    int totalAncho = cantidad * espinosoUnoImage.width + (cantidad - 1) * separacionEnemigo;
    float startX = getPosition().x - totalAncho / 2;

    for (int i = 0; i < cantidad; i++) {
      float offsetX = i * (espinosoUnoImage.width + separacionEnemigo); // Espacio adicional entre los objetos Espinosos
      PImage spriteActual = (i % 2 == 0) ? espinosoUnoImage : espinosoDosImage;
      sketch.image(spriteActual, startX + offsetX, getPosition().y);
    }

    // Mueve los objetos Espinosos hacia atrás
    getPosition().x += speed;

    // Comprueba si los objetos Espinosos han salido de la pantalla
    if (getPosition().x + totalAncho < 0) {
      // Vuelve a colocar los objetos Espinosos fuera de la pantalla en la posición inicial
      getPosition().x = sketch.width;
      fase = (fase % 3) + 1; // Cambia a la siguiente fase (1, 2, o 3)
    }
  }
}
