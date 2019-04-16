Member admin;
Member senpai;
Member tejon;
Member sergay;
Member niggo;
Member wol;

// Declaración y Preinicialización de Variables
    public static int year = 2018; // Año a Evaluar
    int alto = 1560 - 27; // Alto Original
    int ancho = 2773 + 15; // Ancho Original
    int screenC = 0; // Control de Pantalla
    int memberC = 0; // Control de Miembro
    PImage fondo; // Fondo del Sketch
    PImage B0; // Flecha de Vuelta (OFF)
    PImage B1; // Flecha de Vuelta (ON)
    PImage PP0; // Fondo de la Pantalla Principal
    PImage PP1; //            .
    PImage PP2; //            .
    PImage PP3; //            .
    PImage PP4; //            .
    PImage PP5; //            .
    PImage PP6; // Y sus distintas variantes

void setup(){
    // Configuración del Sketch
        fullScreen();
        shapeMode(CORNER);
        noStroke();
        fondo = loadImage("/Graphic/Stats/Fondo.png");
        fondo.resize(width,height);
        B0 = loadImage("/Graphic/Stats/B0.png");
        B0.resize(width/21,height/10);
        B1 = loadImage("/Graphic/Stats/B1.png");
        B1.resize(width/21,height/10);
        PP0 = loadImage("/Graphic/PP/PP0.png");
        PP0.resize(width,height);
        PP1 = loadImage("/Graphic/PP/PP1.png");
        PP1.resize(width,height);
        PP2 = loadImage("/Graphic/PP/PP2.png");
        PP2.resize(width,height);
        PP3 = loadImage("/Graphic/PP/PP3.png");
        PP3.resize(width,height);
        PP4 = loadImage("/Graphic/PP/PP4.png");
        PP4.resize(width,height);
        PP5 = loadImage("/Graphic/PP/PP5.png");
        PP5.resize(width,height);
        PP6 = loadImage("/Graphic/PP/PP6.png");
        PP6.resize(width,height);
    // Inicialización de Objetos (Miembros)
        loadMembers(year);
    // Carga de Datos al Arreglo de la Gráfica
        loadGraphs();
}

public void loadMembers (int y) {
    admin = new Member("Admin", y);
    senpai = new Member("Senpai", y);
    tejon = new Member("Tejon", y);
    sergay = new Member("Sergay", y);
    niggo = new Member("Niggo", y);
    wol = new Member("WoL!", y);
}

public void loadGraphs() {
    admin.graphLoad();
    senpai.graphLoad();
    tejon.graphLoad();
    sergay.graphLoad();
    niggo.graphLoad();
    wol.graphLoad();
}

void draw(){
    // Dibujo del Fondo
        switch (screenC){
            case 0: // Pantalla Principal
                image(PP0,0,0);
            break;
            case 1: // Estadísticas
                image(fondo,0,0);
                image(B0, X(20), Y(20));
            break;
        }
    // Pantalla Interactiva
        select();
        memberDisplay();
}

private void select () { // Highlight (Rollover) + Click
    switch (screenC) {
        case 0: // Pantalla Principal
            if (mouseY > 20+height/10 && mouseY < height){
                if (mouseX > 0 && mouseX < width/6){
                    image(PP1,0,0);
                    click(1,1);
                }else
                if (mouseX > width/6 && mouseX < width*2/6){
                    image(PP2,0,0);
                    click(1,2);
                }else
                if (mouseX > width*2/6 && mouseX < width*3/6){
                    image(PP3,0,0);
                    click(1,3);
                }else
                if (mouseX > width*3/6 && mouseX < width*4/6){
                    image(PP4,0,0);
                    click(1,4);
                }else
                if (mouseX > width*4/6 && mouseX < width*5/6){
                    image(PP5,0,0);
                    click(1,5);
                }else
                if (mouseX > width*5/6 && mouseX < width){
                    image(PP6,0,0);
                    click(1,6);
                }
            }
        break;
        case 1: // Estadísticas
            if (mouseX > X(20) && mouseX < X(20)+width/21 && mouseY > Y(20) && mouseY < Y(20)+height/10){
                image(B1, X(20), Y(20));
                click(0,0);
            }
        break;
    }
}

private void click (int s, int m) { // Monitor de Clicks - Controlador de Pantallas
    if (mousePressed /*&& mouseButton == LEFT*/){
        memberC = m;
        screenC = s;
    }
}

public void memberDisplay() {
    switch (memberC) {
        case 1: // Admin
            admin.stats();
        break;
        case 2: // Senpai
            senpai.stats();
        break;
        case 3: // Tejón
            tejon.stats();
        break;
        case 4: // Sergäy
            sergay.stats();
        break;
        case 5: // Niggo
            niggo.stats();
        break;
        case 6: // WoL! (Totales)
            wol.stats();
        break;
    }
}

public void keyReleased() {
    if(screenC == 1 && key == CODED) {
        // Año++
            if (keyCode == RIGHT && this.year < 2019){
                this.year++;
                loadMembers(this.year);
                loadGraphs();
            }
        // Año--
            if (keyCode == LEFT && this.year > 2018){
                this.year--;
                loadMembers(this.year);
                loadGraphs();
            }
    }
}

// Ajustes de Coordenadas (Illustrator --> Sketch Dinámico)
    public int X (int x) {
        return width*x/this.ancho;
    }

    public int Y (int y) {
        return height*y/this.alto;
    }
