<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Lista de Películas y Directores</title>
                <link rel="stylesheet" href="cine.css"/>
            </head>
            <body>
                <header>
                    <nav>
                        <a href="#peliculas">Peliculas</a>
                        <a href="#directores">Directores</a>
                        <a href="#actores">Actores</a>
                        <a href="#compositores">Compositores</a>
                    </nav>
                    
                </header>
                <main>
                    <h2 >Peliculas:</h2>
                    <div id="peliculas">
                        <xsl:apply-templates select="cine/peliculas/pelicula"/>
                    </div>
                    
                    <h2>Directores:</h2>
                    <div id="directores">
                        <xsl:apply-templates select="cine/directores/director"/>
                    </div>
                    
                    <h2>Actores:</h2>
                    <div id="actores">
                        <xsl:apply-templates select="cine/actores/actor"/>
                    </div>
                    
                    <h2>Compositores:</h2>
                    <div id="compositores">
                        <xsl:apply-templates select="cine/compositores/compositor"/>
                    </div>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para películas -->
    <xsl:template match="pelicula">
        <div class="pelicula">
            <section>Imagen</section>
            <div>
                <p><b>Titulo: </b> <xsl:value-of select="titulo"/></p>
                <p><b>Genero: </b><xsl:value-of select="genero"/></p>
                <p><b>Año de Estreno: </b><xsl:value-of select="a_estreno"/></p>
                <p><b>Reparto: </b></p>
                <ul>
                    <xsl:apply-templates select="reparto/principales/principal"/>
                    <xsl:apply-templates select="reparto/secundarios/secundario"/>
                </ul>
                <p><b>Director: </b><xsl:value-of select="director_pelicula"/></p>
                <p><b>Compositor Banda Sonora: </b><xsl:value-of select="banda_sonora"/></p>
                <p><b>Distribuidora: </b><xsl:value-of select="productora"/></p>
                <p><b>Recaudacion: </b><xsl:value-of select="recaudacion"/></p>
                <p><b>Premios: </b></p>
                <ul>
                    <xsl:apply-templates select="premios_pelicula/premio_pelicula"/>
                </ul>
            </div>
        </div>
    </xsl:template>
    
    <!-- Plantilla para reparto -->
    <xsl:template match="principal|secundario">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
    <!-- Plantilla para premios de película -->
    <xsl:template match="premio_pelicula">
        <li><xsl:value-of select="categoria_premio"/>: <xsl:value-of select="ganador_premio"/></li>
    </xsl:template>
    
    
    <!-- Plantilla para directores -->
    <xsl:template match="director">
        <div class="director">
            <section>Imagen</section>
            <div>
                <p><b>Nombre: </b><xsl:value-of select="nombre"/></p>
                <ul>
                    <xsl:apply-templates select="obras/obra"/>
                </ul>
                <p><b>Premios:</b></p>
                <ul>
                    <xsl:apply-templates select="premios_director/premio_director"/>
                </ul>
            </div>
        </div>
    </xsl:template>
    
    <!-- Plantilla para obras -->
    <xsl:template match="obra">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
    <!-- Plantilla para premios de director -->
    <xsl:template match="premio_director">
        <li><xsl:value-of select="categoria"/>: <xsl:value-of select="obra_ganadora"/></li>
    </xsl:template>
    
    <!-- Plantilla para actores-->
    <xsl:template match="actor">
        <div class="actor">
            <section>Imagen</section>
            <div>
                <p><b>Nombre: </b><xsl:value-of select="nombre"/></p>
                <ul>
                    <xsl:apply-templates select="actuaciones/actuacion"/>
                </ul>
                <p><b>Premios: </b></p>
                <ul>
                    <xsl:apply-templates select="premios_actor/premio_actor"/>
                </ul>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="actuacion">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    <xsl:template match="premio_actor">
        <li><xsl:value-of select="categoria_actuacion"/>: <xsl:value-of select="actuacion"/></li>
    </xsl:template>
    
    <!-- Plantilla para compositores-->
    <xsl:template match="compositor">
        <div class="compositor">
            <section>Imagen</section>
            <div>
                <p><b>Nombre: </b><xsl:value-of select="nombre"/></p>
                <ul>
                    <xsl:apply-templates select="peliculas_compuestas/pelicula_compuesta"/>
                </ul>
                <p><b>Premios: </b></p>
                <ul>
                     <xsl:apply-templates select="premios_compositores/premio_compositor"/>
                </ul>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="pelicula_compuesta">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
   <xsl:template match="premio_compositor">
        <li><xsl:value-of select="galardones"/>: <xsl:value-of select="pelicula_premiada"/></li>
    </xsl:template>
</xsl:stylesheet>
