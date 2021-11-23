package main.br.com.usjt.cromoapi.service;

import main.br.com.usjt.cromoapi.entity.Humor;
import main.br.com.usjt.cromoapi.repository.HumorRepository;

import java.util.List;

public class HumorService {

    private HumorRepository repository;

    public HumorService(HumorRepository repository) {
        this.repository = repository;
    }

    public void adiciona(Humor humor) {
        repository.create(humor);
    }

    public List<Humor> obterHumores() {
        return repository.getAll();
    }

    public void remover(int id) {
        repository.remove(id);
    }

}
