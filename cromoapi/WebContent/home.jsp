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
                            <input type="text" name="test" class="form-control" id="inlineFormInputGroup" placeholder="Humor">
                        </div>
                    </div>

                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-2" formaction="/cromoapi/adicionar">Enviar</button>
                    </div>

                </form>

            </div>

            <div class="w-auto p-3, shadow p-3 mb-5 bg-white rounded">

                <br class="text-secondary"> Lista de humor: <br />

                <ul>
                    <c:forEach items="${humores}" var="humor">

                        <li class="text-secondary">
                                ${humor.humor} - <fmt:formatDate value="${humor.data}" pattern="dd/MM/yyyy"/>
                            Humor atual - ${humor.color}
                            <a href="/cromoapi/removeHumor?id=${humor.id }">remove</a>
                        </li>

                    </c:forEach>
                </ul>
            </div>

        </div>
    </body>

</html>