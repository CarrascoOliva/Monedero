<%-- 
    Document   : Monedero
    Created on : 5 oct. 2023, 21:27:13
    Author     : cuent
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%
    String strTotal = request.getParameter("total");
    String strPago = request.getParameter("pago");
    double total = 0;
    double pago = 0;
    if (strTotal != null && !strTotal.isEmpty()) {
        total = Double.parseDouble(strTotal);
    }
    if (strPago != null && !strPago.isEmpty()) {
        pago = Double.parseDouble(strPago);
    }
    double cambio = pago - total;

    String no = "";
    String si = "";

    //Si el cambio es negatiovo, es la variable no
    if (cambio < 0) {
        no = "No tienes suficiente";
    }//Si el cambio es 0, es la variable si
    if (cambio == 0) {
        si = "Precio justo";
    }

    int billetes500 = 0, billetes200 = 0, billetes100 = 0, billetes50 = 0, billetes20 = 0, billetes10 = 0, billetes5 = 0;
    int monedas2 = 0, monedas1 = 0, monedas50c = 0, monedas20c = 0, monedas10c = 0, monedas5c = 0, monedas2c = 0, monedas1c = 0;
    
    //Se restan 500 del cambio mientras sea posible y se incrementa la variable en 1 y asi con todos los otros while.
    while (cambio >= 500) {
        cambio -= 500;
        billetes500++;
    }
    while (cambio >= 200) {
        cambio -= 200;
        billetes200++;
    }
    while (cambio >= 100) {
        cambio -= 100;
        billetes100++;
    }
    while (cambio >= 50) {
        cambio -= 50;
        billetes50++;
    }
    while (cambio >= 20) {
        cambio -= 20;
        billetes20++;
    }
    while (cambio >= 10) {
        cambio -= 10;
        billetes10++;
    }
    while (cambio >= 5) {
        cambio -= 5;
        billetes5++;
    }
    while (cambio >= 2) {
        cambio -= 2;
        monedas2++;
    }
    while (cambio >= 1) {
        cambio -= 1;
        monedas1++;
    }
    while (cambio >= 0.50) {
        cambio -= 0.50;
        monedas50c++;
    }
    while (cambio >= 0.20) {
        cambio -= 0.20;
        monedas20c++;
    }
    while (cambio >= 0.10) {
        cambio -= 0.10;
        monedas10c++;
    }
    while (cambio >= 0.05) {
        cambio -= 0.05;
        monedas5c++;
    }
    while (cambio >= 0.02) {
        cambio -= 0.02;
        monedas2c++;
    }
    while (cambio >= 0.01) {
        cambio -= 0.01;
        monedas1c++;
    }

    DecimalFormat df = new DecimalFormat("#.##");
%>
<html>
    <head>
        <link rel="stylesheet" href="../CSS/style.css"/>
        <title>Gestor de cambio al pagar</title>
    </head>
    <style>

    </style>
    <body>
        <div class="contenedor">
            <h1>Gestor de cambio al pagar</h1>
            <p>Precio producto: <%=strTotal%></p>
            <p>Entregado: <%=strPago%></p>
            <p>Total a devolver: <%= df.format(pago - total)%></p> 
            <p>Desglose del cambio:</p>
            <% if (!no.isEmpty()) {%><div class="no"><%= no%></div><% } %>
            <% if (!si.isEmpty()) {%><div class="si"><%= si%></div><% } %>
            <div  class="dinero" >
                <% if (billetes500 > 0) {%><div><img src="../Recursos/500e.png" ><p><%=billetes500%> </p></div><% } %>
                <% if (billetes200 > 0) {%><div><img src="../Recursos/200e.png" ><p><%=billetes200%> </p></div><% } %>
                <% if (billetes100 > 0) {%><div><img src="../Recursos/100e.png" ><p><%=billetes100%> </p></div><% } %>
                <% if (billetes50 > 0) {%><div><img src="../Recursos/50e.png" ><p><%=billetes50%> </p></div><% } %>
                <% if (billetes20 > 0) {%><div><img src="../Recursos/20e.png" ><p><%=billetes20%> </p></div><% } %>
                <% if (billetes10 > 0) {%><div><img src="../Recursos/10e.png" ><p><%=billetes10%> </p></div><% } %>
                <% if (billetes5 > 0) {%><div><img src="../Recursos/5e.png" ><p><%=billetes5%> </p></div><% } %>
            </div>   
            <div class="dinero">

                <% if (monedas2 > 0) {%><div><img src="../Recursos/2e.png" ><p><%=monedas2%> </p></div><% } %>
                <% if (monedas1 > 0) {%><div><img src="../Recursos/1e.png" ><p><%=monedas1%> </p></div><% } %>
                <% if (monedas50c > 0) {%><div><img src="../Recursos/50c.png" ><p><%=monedas50c%></p></div><% } %>
                <% if (monedas20c > 0) {%><div><img src="../Recursos/20c.png" ><p><%=monedas20c%></p></div><% } %>
                <% if (monedas10c > 0) {%><div><img src="../Recursos/10c.png" ><p><%=monedas10c%> </p></div><% } %>
                <% if (monedas5c > 0) {%><div><img src="../Recursos/5c.png" ><p><%=monedas5c%></p></div><% } %>
                <% if (monedas2c > 0) {%><div><img src="../Recursos/2c.png" ><p><%=monedas2c%> </p></div><% } %>
                <% if (monedas1c > 0) {%><div><img src="../Recursos/1c.png" ><p><%=monedas1c%> </p></div><% }%>
            </div>
            <div>
                <a href="../index.html"><button class="button-74">Otra operación</button></a>
            </div>

        </div>
    </body>
</html>
