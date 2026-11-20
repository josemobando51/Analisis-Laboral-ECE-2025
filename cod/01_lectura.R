
# Proyecto individual - Herramientas de Datos I
# ECE - IV trimestre de 2025
# 01. Lectura de datos

# Cargar paquete
library(haven)

# Importar base de datos
ece <- read_sav("data/ECE_IV_2025.sav")

# Consultar dimensiones
dim(ece)

# Consultar nombres de variables
names(ece)

# Identificar variables relevantes para el proyecto

grep(
  "nacim|ocup|educ|ingres|ram|formal|asegur|factor",
  names(ece),
  value = TRUE,
  ignore.case = TRUE
)

# Personas ocupadas de 15 años o más

ocupados <- !is.na(ece$Ocupado) &
  ece$Ocupado == 1 &
  !is.na(ece$Edad) &
  ece$Edad >= 15

# Cantidad de personas ocupadas por país de nacimiento

table(
  as_factor(ece$Pais_nacimiento)[ocupados],
  useNA = "ifany"
)

