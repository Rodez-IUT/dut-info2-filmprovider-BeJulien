<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />
    <xsl:template match="/films">
        <html>
            <head>
                <title>Film Provider</title>
            </head>
            <body>
                <h1>Liste des films</h1>
                <xsl:apply-templates select="film" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="film">
        <xsl:variable name="id_auteur" select="attribute::id_realisateur" />
        <xsl:variable name="nom_auteur" select="/films/realisateur[@id_realisateur = $id_auteur]/nom" />
        <xsl:variable name="prenom_auteur" select="/films/realisateur[@id_realisateur = $id_auteur]/prenom" />

        <table width="60%">
            <tr>
                <td colspan="2">
                    <b><xsl:value-of select="titre" /></b>
                    <i>
                        (<xsl:value-of select="$prenom_auteur" />,
                        <xsl:value-of select="$nom_auteur" />)
                    </i>
                </td>
            </tr>
            <tr>
                <xsl:if test="resume/image">
                    <td>
                        <img src="{resume/image/@source}" />
                    </td>
                </xsl:if>
                <td>
                    <xsl:value-of select="resume/text" />
                </td>
            </tr>
        </table>
        <hr />
    </xsl:template>
</xsl:stylesheet>