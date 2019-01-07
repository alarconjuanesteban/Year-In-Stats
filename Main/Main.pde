Member admin;
Member senpai;
Member tejon;
Member sergay;
Member niggo;
Member wol;

// Variables Preinicializadas
    int screenC = 0; // Control de Pantalla
    int memberC = 0; // Control de Miembro
    PImage fondo; // Fondo del Sketch

void setup(){
    // Configuración del Sketch
        fullScreen();
        shapeMode(CORNER);
        noStroke();
        fondo = loadImage("/Graphic/Fondo.png");
        fondo.resize(width,height);
    // Inicialización de Objetos (Miembros)
        admin = new Member("Admin");
        senpai = new Member("Senpai");
        tejon = new Member("Tejón");
        sergay = new Member("Sergäy");
        niggo = new Member("Niggo");
        wol = new Member("WoL!");
    // Proyección de Estadísticas
        //admin.stats();
        //senpai.stats();
        //tejon.stats();
        //sergay.stats();
        //niggo.stats();
        //wol.stats();
    // Carga de Datos al Arreglo de la Gráfica
        admin.graphArray();
        senpai.graphArray();
        tejon.graphArray();
        sergay.graphArray();
        niggo.graphArray();
        wol.graphArray();
}

void draw(){
    // Dibujo del Fondo
        image(fondo,0,0);
    // Pantalla de Selección
        select();
        memberDisplay();
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
        default: // Vacío (Sin Display)
        break;
    }
}

private void select() {
    if (screenC == 0)
        highlight();
    click();
}

private void highlight() {
    if (mouseX > 0 && mouseX < width/6){
        rect(0,0,width/6,height);
    }else
    if (mouseX > width/6 && mouseX < width*2/6){
        rect(width/6,0,width/6,height);
    }else
    if (mouseX > width*2/6 && mouseX < width*3/6){
        rect(width*2/6,0,width/6,height);
    }else
    if (mouseX > width*3/6 && mouseX < width*4/6){
        rect(width*3/6,0,width/6,height);
    }else
    if (mouseX > width*4/6 && mouseX < width*5/6){
        rect(width*4/6,0,width/6,height);
    }else
    if (mouseX > width*5/6 && mouseX < width){
        rect(width*5/6,0,width/6,height);
    }
}

private void click() {
    if(mousePressed && mouseButton == LEFT && screenC == 0) {
        if (mouseX > 0 && mouseX < width/6){
            memberC = 1;
        }else
        if (mouseX > width/6 && mouseX < width*2/6){
            memberC = 2;
        }else
        if (mouseX > width*2/6 && mouseX < width*3/6){
            memberC = 3;
        }else
        if (mouseX > width*3/6 && mouseX < width*4/6){
            memberC = 4;
        }else
        if (mouseX > width*4/6 && mouseX < width*5/6){
            memberC = 5;
        }else
        if (mouseX > width*5/6 && mouseX < width){
            memberC = 6;
        }
        screenC = 1;
    }
}
