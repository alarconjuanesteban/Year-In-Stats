Member admin;
/*Member senpai;
Member tejon;
Member sergay;
Member niggo;*/

void setup(){
    // Configuración del Sketch
        //size(648,936);
        size(540,780);
    // Inicialización de Objetos (Miembros)
        admin = new Member("Admin");
        /*senpai = new Member("Senpai");
        tejon = new Member("Tejón");
        sergay = new Member("Sergäy");
        niggo = new Member("Niggo");*/
    // Proyección de Estadísticas
        admin.stats();
        /*senpai.stats();
        tejon.stats();
        sergay.stats();
        niggo.stats();*/
}
