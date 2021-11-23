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

            <br class="text-secondary"> Lista de humor: <br />

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

        <footer class="p-3 mb-2 bg-light text-white">
            <nav aria-label="Navegação de página exemplo">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="/cromoapi">Home</a></li>
                </ul>
            </nav>
        </footer>

    </div>

</body>

</html>