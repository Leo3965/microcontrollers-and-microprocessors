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

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="https://github.com/Leo3965/microcontrollers-and-microprocessors">CromoAPI</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/cromoapi">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/cromoapi/listar">Listar</a>
                    </li>

                </ul>
                <form style="display: flex; margin-left: 300px;" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pesquisar</button>
                </form>
            </div>
        </nav>

        <div class="w-auto p-3, shadow p-3 mb-5 bg-white rounded">

            <ol class="list-group list-group-numbered">
                <c:forEach items="${humores}" var="humor">

                    <li class="list-group-item d-flex justify-content-between align-items-start">
                        <div class="ms-2 me-auto">
                            <div class="fw-bold">${humor.color}</div>
                            Humor atual - ${humor.humor} - ${humor.data}
                        </div>
                        <span class="badge bg-primary rounded-pill">
                            <a style="color: aliceblue" href="/cromoapi/remover?id=${humor.id}">remover</a>
                        </span>
                    </li>

                </c:forEach>
            </ol>
        </div>

    </div>

</body>

</html>