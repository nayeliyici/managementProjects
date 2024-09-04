<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Gestión de Proyectos</title>
    <!-- Enlace a FontAwesome para los iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Enlace al CSS personalizado -->
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Menú lateral -->
        <aside class="sidebar">
            <h2>Menú</h2>
            <ul>
                <li><a href="?view=users"><i class="fas fa-users"></i> Usuarios</a></li>
                <li><a href="?view=projects"><i class="fas fa-tasks"></i> Proyectos</a></li>
                <li><a href="?view=tasks"><i class="fas fa-list"></i> Tareas</a></li>
            </ul>
        </aside>

        <!-- Contenido principal -->
        <main class="content">
            <div class="content-header">
                <h2>
                    <% 
                        String view = request.getParameter("view");
                        if (view == null || view.equals("users")) {
                            out.print("Usuarios");
                        } else if (view.equals("projects")) {
                            out.print("Proyectos");
                        } else if (view.equals("tasks")) {
                            out.print("Tareas");
                        }
                    %>
                </h2>
            </div>
            
            <div class="content-body">
                <table>
                    <thead>
                        <tr>
                            <%
                                if (view == null || view.equals("users")) {
                            %>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th style="color: #333"> . </th>
                            <%
                                } else if (view.equals("projects")) {
                            %>
                            <th>ID</th>
                            <th>Nombre del Proyecto</th>
                            <th>Fecha de Inicio</th>
                            <th style="color: #333"> . </th>
                            <%
                                } else if (view.equals("tasks")) {
                            %>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th style="color: #333"> . </th>
                            <%
                                }
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (view == null || view.equals("users")) {
                                for (int i = 1; i <= 5; i++) {
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td>Usuario <%= i %></td>
                            <td>usuario<%= i %>@ejemplo.com</td>
                            <td> 
                            	<button class="btnEditar"> Editar </button> 
                            	<button class="btnEliminar"> Eliminar </button> 
                            </td>
                        </tr>
                        <%
                                }
                            } else if (view.equals("projects")) {
                                for (int i = 1; i <= 5; i++) {
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td>Proyecto <%= i %></td>
                            <td>2024-08-<%= i+10 %></td>
                        </tr>
                        <%
                                }
                            } else if (view.equals("tasks")) {
                                for (int i = 1; i <= 5; i++) {
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td>Tarea <%= i %></td>
                            <td>En progreso</td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>
