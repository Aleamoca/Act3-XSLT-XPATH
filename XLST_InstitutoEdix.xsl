<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!-- Nos situamos en el nodo raíz -->
  <xsl:template match="/">
    <!-- Como quiero generar un HTML, escribo HTML -->
    <html>
      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>
                <xsl:value-of select="ite/@nombre" />
              </title>
              <!-- También podemos añadir un CSS al html resultante para dar estilos a la página -->
              <link rel="stylesheet" href="instituto.css" type = "text/css" />
      </head>
      <body>
          <!-- Con la etiqueta (value_of) seleccionamos el nodo texto del nodo al que queremos apuntar. 
          El atributo "select" nos premite estableces la expresión XPath para buscar el nodo. 
          Consulta relativa a donde este situado el "templete" (nodo raiz) -->
            <h1>
              <xsl:value-of select="ite">
                <a href="https://www.edix.com/es">Sitio web del Instituto</a>
              </xsl:value-of>
            </h1>
              <!-- 
			          Recorremos con un for-each todos los nodos que devuelva la expresión XPath 
			          "informacion". Lo hacemos de manera relativa a donde esta situado el 
			          elemento "template"
		           -->
              <h1>Información de contacto</h1>
                <!-- Esto sería una lista desordenada "unorder list"-->
              <ul>
                <li>Empresa:
                  <xsl:value-of select="informacion/empresa">
                    <a href="https://www.grupoproeduca.com/espana-2/"></a>
                  </xsl:value-of>
                </li>
                <li>Teléfono:
                  <xsl:value-of select="informacion/telefono"/>
                </li>
              </ul>
              <h1>PROFESORES</h1>
              <table>
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="profesores/profesor">
                    <tr>
                      <td>
                        <xsl:value-of select="profesor/id"/>
                      </td>
                      <td>
                        <xsl:value-of select="profesor/nombre"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <!-- fin del for-each de profesor-->
                </tbody>
              </table>
              <h1>DIRECTOR</h1>
              <table>
                <thead>
                  <tr>
                    <th>NOMBRE</th>
                    <th>DESPACHO</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="director">
                    <tr>
                      <td>
                        <xsl:value-of select="director/nombre"/>
                      </td>
                      <td>
                        <xsl:value-of select="director/despacho"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <h1>JEFE DE ESTUDIOS</h1>
              <table>
                <thead>
                  <tr>
                    <th>NOMBRE</th>
                    <th>DESPACHO</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="jefe_estudios">
                    <tr>
                      <td>
                        <xsl:value-of select="jefe_estudios/nombre"/>
                      </td>
                      <td>
                        <xsl:value-of select="jefe_estudios/despacho"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <table border="1">
                <caption>
                  <h4>CICLOS</h4>
                </caption>
                <thead>
                  <tr>
                    <th>Nombre_Ciclo</th>
                    <th>ID</th>
                    <th>Grado</th>
                    <th>Titulo</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="ciclos/ciclo">
                    <tr>
                      <td>
                        <xsl:value-of select="@id"/>
                      </td>
                      <td>
                        <xsl:value-of select="nombre"/>
                      </td>
                      <td>
                        <xsl:value-of select="grado"/>
                      </td>
                      <td>
                        <xsl:value-of select="titulo"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <br/>
              <div class = "Formulario">
                <!--
                <fieldset> Genera un marco visible que encierra los datos del formulario.
                <legend> Colocado inmediatamente después de una etiqueta <fieldset>, permite colocarle 
                una etiqueta de texto (título).
                -->
                  <fieldset>
                    <legend>Datos personales</legend>
                    <br/>
                    <!--
                    <label> Define una etiqueta estática, que normalmente estará asociada con un elemento 
                    de campo de formulario que se identifica mediante el atributo "for". El valor del
                    atributo "for" se iguala al valor del atributo "id" del elemento del formulario
                   -->
                    <label for="nombre">Nombre: </label>
                    <input id="nombre" type="text" name="nombre"/>
                    <!--
                    La etiqueta <input> define un elemento de campo de texto de formulario.
                    -->
                    <label for="apellidos">Apellidos: </label>
                    <input id="apellidos" type="text" name="apellidos"/>
                    <br/>
                    <br/>
                    <label for="edad">Fecha de nacimiento: </label>
                    <input type="date" name="color"/>
                    <label for="DNI">DNI: </label>
                    <input id="DNI" type="text" name="DNI"/>
                    <br/>
                    <br/>
                    <label for="grado">Grado </label>
                    <select name="grado">
                      <option value="O">DAW</option>
                      <option value="H">DAM</option>
                      <option value="M">ASIR</option>
                    </select>

                    Email:
                    <input type="email" name="email" required/>
                    <br/>
                    <br/>
                    <!--
                     teléfono, campo que solo admite números de teléfono
                    -->
                
                    Teléfono:
                      <input type="tel" name="telefono" placeholder="Nº de teléfono"/>
                      <label for="domicilio"> Domicilio: </label>
                    <br/>
                    <br/>
                    <label for="localidad">Localidad: </label>
                    <input id="localidad" type="text" name="localidad" />
                    <label for="codigo_postal">Código Postal: </label>
                    <input id="codigo_postal" type="text" name="codigo_postal" />
                  </fieldset>
              </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>