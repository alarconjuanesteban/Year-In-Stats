import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Main extends PApplet {

Member admin;
Member senpai;
Member tejon;
Member sergay;
Member niggo;
Member wol;

// Declaración y Preinicialización de Variables
    int year = 2019; // Año a Evaluar
    int alto = 1560 - 54; // Alto Original
    int ancho = 2773; // Ancho Original
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

public void setup(){
    // Configuración del Sketch

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
        admin = new Member("Admin", year);
        senpai = new Member("Senpai", year);
        tejon = new Member("Tejón", year);
        sergay = new Member("Sergäy", year);
        niggo = new Member("Niggo", year);
        wol = new Member("WoL!", year);
    // Proyección de Estadísticas
        //admin.stats();
        //senpai.stats();
        //tejon.stats();
        //sergay.stats();
        //niggo.stats();
        //wol.stats();
    // Carga de Datos al Arreglo de la Gráfica
        admin.graphLoad();
        senpai.graphLoad();
        tejon.graphLoad();
        sergay.graphLoad();
        niggo.graphLoad();
        wol.graphLoad();
}

public void draw(){
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

private void click (int s, int m) { // Controlador de Pantallas Post-Click
    if (mousePressed && mouseButton == LEFT){
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

// Ajustes de Coordenadas (Illustrator --> Sketch Dinámico)
    public int X (int x) {
        return width*x/this.ancho;
    }

    public int Y (int y) {
        return height*y/this.alto;
    }
    
public class Member {

    PImage plantilla;
    Table data;
    int[] graph;
    PShape g;
    PFont consolas;
    PFont gabriola;
    PFont cambria;
    PFont book;
    PFont bookBold;
    int c;
    int y;

    public Member (String name, int year) {
        plantilla = loadImage("/Graphic/"+ name +".png");
        data = loadTable("/Data/"+ year +".csv");
        graph = new int[12];
        g = createShape();
        consolas = createFont("Consolas Bold", 12, true);
        gabriola = createFont("Gabriola", 20, true);
        cambria = createFont("Cambria Italic", 15, true);
        book = createFont("Book Antiqua", 35, true);
        bookBold = createFont("Book Antiqua Bold", 50, true);
        fill(0);
        if(name == "Admin"){
            c = color(200, 0, 0);
            y = 1;
        }
        if(name == "Senpai"){
            c = color(0, 200, 100);
            y = 5;
        }
        if(name == "Tejón"){
            c = color(100, 0, 100);
            y = 9;
        }
        if(name == "Sergäy"){
            c = color(0, 100, 255);
            y = 13;
        }
        if(name == "Niggo"){
            c = color(255, 150, 0);
            y = 17;
        }
        if(name == "WoL!"){
            c = color(0, 0, 0);
            y = 21;
        }
    }

    public void graphLoad() {
        graphArray();
        g.beginShape();
            g.stroke(c);
            g.strokeWeight(2);
            g.noFill();
            int count = 0;
            int[] graphAjustada = ajustar(graph, min(graph));
            for (int i = 0; i < graph.length; i++) {
                g.vertex(X(count), Y(graphAjustada[i]));
                count -= 32;
            }
        g.endShape();
    }

    public void graphArray() {
        for (int i = 0; i < 12 ; i++)
            graph[i] = data.getInt(y+1,i);
    }

    public void stats () {
        // Datos de Mensajes
            int mT = data.getInt(y,0);
            String menTotales = nfc(mT);
            float t = data.getFloat(y,1);
            float m = 100-t;
            String texto = nfc(t,2);
            String multimedia = nfc(m,2);
            int menDiarios = data.getInt(y,2);
        //Datos de Actividad
            int diasActivo = data.getInt(y+2,0);
            int spamsDebates = data.getInt(y+2,1);
            int ratioFluidez = data.getInt(y+2,2);
        stats(menTotales, graph, t, texto, multimedia, menDiarios, diasActivo, spamsDebates, ratioFluidez);
    }

    private void stats(String menTotales, int[] graph, float t, String texto, String multimedia, int menDiarios, int diasActivo, int spamsDebates, int ratioFluidez){
        pushMatrix();
            translate((width-(height*1080/1560))/2,0);
            drawPlantilla();
            drawMensajes(menTotales, graph, t, texto, multimedia, menDiarios);
            drawActividad(diasActivo, spamsDebates, ratioFluidez);
        popMatrix();
    }

    private void drawPlantilla() {
        //plantilla.resize(648,936);
        //plantilla.resize(540,780);
        plantilla.resize(height*1080/1560,height);
        image(plantilla,0,0);
    }

    private void drawMensajes(String menTotales, int[] graph, float t, String texto, String multimedia, int menDiarios) {
        // Mensajes Totales + Diarios En Promedio
            textAlign(CENTER);
            textFont(bookBold);
            text(menTotales, X(290), Y(480));
            textFont(bookBold, 65);
            text(menDiarios, X(820), Y(722));
        // Porcentaje de Texto vs. Multimedia
            textAlign(RIGHT);
            textFont(book);
            text(texto, X(590), Y(725));
            text(multimedia, X(590), Y(840));
        // Gráficas
            graph(graph);
            pie(t);
    }

    private void graph (int[] graph) {
        int max = max(graph);
        int min = min(graph);
        limit(max, min);
        mean(graph);
        pushMatrix();
            rotate(PI);
            shape(g, X(-520), Y(-534));
        popMatrix();
    }

    private int max (int[] arr) {
        int x = arr[0];
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] > x)
                x = arr[i];
        }
        return x;
    }

    private int min (int[] arr) {
        int x = arr[0];
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < x)
                x = arr[i];
        }
        return x;
    }

    private int[] ajustar (int[] graph, int min) {
        int[] graphAjustada = new int[12];
        // Restarle el Mínimo valor a todo el Arreglo:
            for (int i = 0; i < graph.length; i++) {
                graphAjustada[i] = graph[i] - min;
            }
        // Ajuste Porcentual:
            int maxTemp = max(graphAjustada);
            for (int i = 0; i < graphAjustada.length; i++) {
                graphAjustada[i] = (graphAjustada[i]*100)/maxTemp;
            }
        return graphAjustada;
    }

    private void limit(int max, int min) {
        textAlign(CENTER);
        textFont(consolas);
        text(max, X(480), Y(430));
        text(min, X(480), Y(553));
    }

    private void mean(int[] graph) {
        int ac = 0;
        for (int i = 0; i < graph.length; i++) {
            ac += graph[i];
        }
        int m = ac/graph.length;
        pushStyle();
            textFont(cambria);
            textAlign(CENTER);
            fill(200);
            text("Media: " + m, X(680), Y(565));
        popStyle();
    }

    private void pie (float t) {
        pushStyle();
            fill(c, 150);
            noStroke();
            float tRadial = (t*360)/100;
            float radio = width*9.1f/100;
            arc(X(290), Y(745), radio, radio, 0, radians(tRadial));
            //arc(X(290), Y(745), 125, 125, 0, radians(tRadial));
        popStyle();
    }

    private void drawActividad(int diasActivo, int spamsDebates, int ratioFluidez) {
        textAlign(CENTER);
        textFont(bookBold, 50);
        text(diasActivo, X(250), Y(1215));
        text(spamsDebates, X(540), Y(1215));
        text(ratioFluidez, X(830), Y(1215));
    }

    public int getX(int i){
        return data.getInt(y+1,i);
    }


}

    public void settings(){
        fullScreen();
    }

    static public void main(String[] passedArgs) {
        String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#C80014", "Main" };
        if (passedArgs != null) {
            PApplet.main(concat(appletArgs, passedArgs));
        } else {
            PApplet.main(appletArgs);
        }
    }

}
