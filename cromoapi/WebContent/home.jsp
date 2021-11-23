<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:url value="/" var="linkServletHumor"/>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>

        <div class="p-3 mb-2 bg-light text-white">

            <div class="w-auto p-3, shadow p-3 mb-5 bg-white rounded">

                <form action="linkServletHumor" method="post">
                    <div class="col-auto">
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">=)</div>
                            </div>
                            <input type="text" name="humor" class="form-control" id="inlineFormInputGroup" placeholder="insira o seu humor">
                        </div>
                    </div>

                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-2" formaction="/cromoapi/adicionar">Enviar</button>
                    </div>
                </form>

            </div>

            <div class="p-3 mb-2 bg-light text-white">
                <nav aria-label="Navegação de página exemplo">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="/cromoapi/listar">Listar</a></li>
                    </ul>
                </nav>
            </div>

            <div class="w-auto p-3, shadow p-3 mb-5 bg-white rounded">
                <ol class="list-group list-group-numbered">
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Verde</div>
                            O verde é a cor que ajuda a promover o equilíbrio interno e a diminuir o estresse
                        </div>
                        <span class="badge bg-primary rounded-pill">1</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Azul</div>
                            A cor azul possui propriedades calmantes e tranquilizantes, que atuam no sistema nervoso e em todo o sistema muscular
                        </div>
                        <span class="badge bg-primary rounded-pill">2</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Vermelho</div>
                            O vermelho é a cor que aumenta a energia, a vitalidade e a adrenalina
                        </div>
                        <span class="badge bg-primary rounded-pill">3</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Amarelo</div>
                            O amarelo é a cor que estimula o intelecto e o sistema nervoso central
                        </div>
                        <span class="badge bg-primary rounded-pill">4</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Laranja</div>
                            O laranja é uma cor muito utilizada na cromoterapia pelo seu poder energético
                        </div>
                        <span class="badge bg-primary rounded-pill">5</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Roxo</div>
                            Reduz medos e angústias e traz estabilidade e equilíbrio da consciência
                        </div>
                        <span class="badge bg-primary rounded-pill">6</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Desligar</div>
                            Desliga todas as luzes
                        </div>
                        <span class="badge bg-primary rounded-pill">7</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">Sol</div>
                            Simula a luz solar no ambiente
                        </div>
                        <span class="badge bg-primary rounded-pill">8</span>
                    </li>
                </ol>
            </div>

        </div>

    </body>

</html>