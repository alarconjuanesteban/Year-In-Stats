Member admin;
Member senpai;
Member tejon;
Member sergay;
Member niggo;

void setup(){
    // Configuración del Sketch
        fullScreen();
        translate((width-(height*1080/1560))/2,0);
        /*size = 3;
        switch (size){
            case 1:
                xSketch = 432;
                ySketch = 624;
            break;
            case 2:
                xSketch = 540;
                ySketch = 780;
            break;
            case 3:
                xSketch = 648;
                ySketch = 936;
            break;
        }
        size(xSketch, ySketch);*/
    // Inicialización de Objetos (Miembros)
        admin = new Member("Admin");
        //senpai = new Member("Senpai");
        tejon = new Member("Tejón");
        //sergay = new Member("Sergäy");
        //niggo = new Member("Niggo");
    // Proyección de Estadísticas
        admin.stats();
        //senpai.stats();
        //tejon.stats();
        //sergay.stats();
        //niggo.stats();
    // Configuraciones Posteriores
        shapeMode(CENTER);
        fill(0);
}

void draw(){
    // Inicialización de los Overlays
        /*rect(100,100,100,100);
        int[] menMes = new int[12];
        for (int i = 0; i < 12 ; i++) {
            menMes[i] = admin.getX(i);
        }
        if(Overlay.mouseOver(menMes[0])){
            // asd
        }*/
}
