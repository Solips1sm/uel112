<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="Fichier_CSS.css" type="text/css"/>
            </head>
            <body>
                <h2>Catalog of cars</h2>
                <xsl:for-each select="catalogue/vehicules/vehicule">
                    <div>
                        <table border="1">
                            <tr>
                                <th>Brand</th>
                                <th>Year</th>
                                <th>Motor</th>
                                <th>Type</th>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="marque"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@annee"/>
                                </td>

                                <td>
                                    <xsl:value-of select="/catalogue/type_moteur/moteur[@reference_moteur=current()/moteur/@reference_moteur]" />
                                    <!-- AS: There is absolutely. No. Documentation. On this. Like, this was the absolute worst time in the world.
                                we're scoping upon the motor using predicate filtering, where current node (current car) motor reference is used as the
                                var for the attribute input that we select. -->
                                </td>
                                <td>
                                    <xsl:value-of select="type"/>
                                </td>
                            </tr>
                        </table>
                        <xsl:choose>
                            <xsl:when test="marque='Peugeot'">
                                <img class="car_logo" src="https://upload.wikimedia.org/wikipedia/en/thumb/9/9d/Peugeot_2021_Logo.svg/800px-Peugeot_2021_Logo.svg.png" alt="Peugeot logo"/>
                            </xsl:when>
                            <xsl:when test="marque='Ford'">
                                <img class="car_logo" src="https://pbs.twimg.com/profile_images/1390283337055490048/Dt5ZJBL6_400x400.png" alt="Ford logo"/>
                            </xsl:when>
                            <xsl:when test="marque='Renault'">
                                <img class="car_logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Renault_2021_Text.svg/1024px-Renault_2021_Text.svg.png" alt="Renault logo"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- AS: could've used the logo of the company that sells them potentially  -->
                            </xsl:otherwise>
                        </xsl:choose>

                        <table border="1">
                            <tr>
                                <th>Options</th>
                                <th>Price</th>
                            </tr>

                            <xsl:for-each select="options_disponibles/configuration">
                                <tr>
                                    <td>
                                        <xsl:value-of select="/catalogue/liste_options/option[@reference_option = current()/@reference_option]" />
                                        <!--AS: That was much easier-->
                                    </td>
                                    <td>
                                        <xsl:value-of select="/catalogue/liste_options/option[@reference_option = current()/@reference_option]/@prix" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>

                        <br></br>
                        <br></br>
                        <br></br>


                    </div>
                </xsl:for-each>

            </body>
        </html>


    </xsl:template>

</xsl:stylesheet>