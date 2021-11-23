package main.br.com.usjt.cromoapi.service;


import main.br.com.usjt.cromoapi.enumerator.Color;

import java.util.Locale;

public class ColorService {

    public Color getColorByString(String color){
        color = color.toUpperCase(Locale.ROOT);
        switch (color){
            case "BLUE":
                return Color.BLUE;
            case "RED":
                return Color.RED;
            case "YELLOW":
                return Color.YELLOW;
            case "GREEN":
                return Color.GREEN;
            case "ORANGE":
                return Color.ORANGE;
            case "PURPLE":
                return Color.PURPLE;
            case "SUNLIGHT":
                return Color.SUNLIGHT;
            case "TURNOFF":
                return Color.TURNOFF;
            default:
                return null;
        }
    }
}
