Member admin;
Member niggo;
Member tejon;
Member sergay;
Member senpai;
Member bosboni;
Member cohete;
Member karen;
Member santy;
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
    PImage PP6; //            .
    PImage PP7; //            .
    PImage PP8; //            .
    PImage PP9; //            .
    PImage PP10; // Y sus distintas variantes

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
        PP7 = loadImage("/Graphic/PP/PP7.png");
        PP7.resize(width,height);
        PP8 = loadImage("/Graphic/PP/PP8.png");
        PP8.resize(width,height);
        PP9 = loadImage("/Graphic/PP/PP9.png");
        PP9.resize(width,height);
        PP10 = loadImage("/Graphic/PP/PP10.png");
        PP10.resize(width,height);
    // Inicialización de Objetos (Miembros)
        loadMembers(year);
    // Carga de Datos al Arreglo de la Gráfica
        loadGraphs();
}

public void loadMembers (int y) {
    admin = new Member("Admin", y);
    niggo = new Member("Niggo", y);
    tejon = new Member("Tejon", y);
    sergay = new Member("Sergay", y);
    senpai = new Member("Senpai", y);
    bosboni = new Member("Bosboni", y);
    cohete = new Member("Cohete", y);
    karen = new Member("Karen", y);
    santy = new Member("Santy", y);
    wol = new Member("WoL!", y);
}

public void loadGraphs() {
    admin.graphLoad();
    niggo.graphLoad();
    tejon.graphLoad();
    sergay.graphLoad();
    senpai.graphLoad();
    bosboni.graphLoad();
    cohete.graphLoad();
    karen.graphLoad();
    santy.graphLoad();
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
                if (mouseX > 0 && mouseX < width/10){
                    image(PP1,0,0);
                    click(1,1);
                }else
                if (mouseX > width/10 && mouseX < width*2/10){
                    image(PP2,0,0);
                    click(1,2);
                }else
                if (mouseX > width*2/10 && mouseX < width*3/10){
                    image(PP3,0,0);
                    click(1,3);
                }else
                if (mouseX > width*3/10 && mouseX < width*4/10){
                    image(PP4,0,0);
                    click(1,4);
                }else
                if (mouseX > width*4/10 && mouseX < width*5/10){
                    image(PP5,0,0);
                    click(1,5);
                }else
                if (mouseX > width*5/10 && mouseX < width*6/10){
                    image(PP6,0,0);
                    click(1,6);
                }
                if (mouseX > width*6/10 && mouseX < width*7/10){
                    image(PP7,0,0);
                    click(1,7);
                }else
                if (mouseX > width*7/10 && mouseX < width*8/10){
                    image(PP8,0,0);
                    click(1,8);
                }else
                if (mouseX > width*8/10 && mouseX < width*9/10){
                    image(PP9,0,0);
                    click(1,9);
                }else
                if (mouseX > width*9/10 && mouseX < width){
                    image(PP10,0,0);
                    click(1,10);
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
    if (mousePressed && mouseButton == LEFT){
        screenC = s;
        memberC = m;
    }
}

public void memberDisplay() {
    switch (memberC) {
        case 1: // Admin
            admin.stats();
        break;
        case 2: // Niggo
            niggo.stats();
        break;
        case 3: // Tejón
            tejon.stats();
        break;
        case 4: // Sergäy
            sergay.stats();
        break;
        case 5: // Senpai
            senpai.stats();
        break;
        case 6: // Bosboni
            bosboni.stats();
        break;
        case 7: // Cohete
            cohete.stats();
        break;
        case 8: // Karen
            karen.stats();
        break;
        case 9: // Santy
            santy.stats();
        break;
        case 10: // WoL! (Totales)
            wol.stats();
        break;
    }
}

public void keyReleased() {
    if(screenC == 1 && key == CODED) {
        // Año++
            if (keyCode == RIGHT && this.year < 2020){
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
