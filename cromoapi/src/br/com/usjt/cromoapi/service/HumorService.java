package br.com.usjt.cromoapi.service;

import br.com.usjt.cromoapi.entity.Humor;
import br.com.usjt.cromoapi.enumerator.Color;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class HumorService {

    private static List<Humor> lista = new ArrayList<>();
    private static Integer chaveSequencial = 1;

    static {
        var humor = new Humor();
        humor.setId((long)chaveSequencial++);
        humor.setColor(Color.RED);
        humor.setData(Calendar.getInstance().getTime());
        humor.setHumor("Feliz");
        var humor2 = new Humor();
        humor.setId((long)chaveSequencial++);
        humor.setColor(Color.BLUE);
        humor.setData(Calendar.getInstance().getTime());
        humor.setHumor("Triste");
    }

    public void adiciona(Humor humor) {
        humor.setId((long)chaveSequencial++);
        HumorService.lista.add(humor);
    }

    public List<Humor> obterHumores() {
        return HumorService.lista;
    }

    public void removerHumor(Long id) {
        var it = lista.iterator();

        while(it.hasNext()) {
            var h = it.next();

            if (h.getId() == id) {
                it.remove();
            }
        }
    }

}
