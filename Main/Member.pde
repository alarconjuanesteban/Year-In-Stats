public class Member {

    PImage fondo;
    Table data;

    public void member (String name) {
        fondo = loadImage("/Graphic/"+ name +".png");
        data = loadTable("/data.csv");
            // Datos de Mensajes
                int y = 0;
                if(name == "Admin")
                    y = 0;
                if(name == "Senpai")
                    y = 4;
                if(name == "Tejón")
                    y = 8;
                if(name == "Sergäy")
                    y = 12;
                if(name == "Niggo")
                    y = 16;
                int menTotales = data.getInt(y,0);
                int[] graph = new int[12];
                for (int i = 0; i < 12 ; i++) {
                    graph[i] = data.getInt(y+1,i);
                }
                int texto = data.getInt(y,1);
                int diarios = data.getInt(y,2);
            //Datos de Actividad
                int diasActivo = data.getInt(y+2,0);
                int spamsDebates = data.getInt(y+2,1);
                int ratioFluidez = data.getInt(y+2,2);
        stats(menTotales, graph, texto, diarios, diasActivo, spamsDebates, ratioFluidez);
    }

    private void stats(int menTotales, int[] graph, int texto, int diarios, int diasActivo, int spamsDebates, int ratioFluidez){
        drawFondo();
        drawMensajes(menTotales, graph, texto, diarios);
        drawActividad(diasActivo, spamsDebates, ratioFluidez);
    }

    private void drawFondo() {
        //fondo.resize(648,936);
        fondo.resize(540,780);
        image(fondo,0,0);
    }

    private void drawMensajes(int menTotales, int[] graph, int texto, int diarios) {
        // Dibuja la Sección de Mensajes
    }

    private void drawActividad(int diasActivo, int spamsDebates, int ratioFluidez) {
        // Dibuja la Sección de Actividad
    }

}
