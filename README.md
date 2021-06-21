# marvel-app

En el presente documento se pretende definir la estructura que sigue el proyecto asi como la arquitectura y patrones de diseño implementados en él.
Asimismo, se pretende explicar que librerias se utilizan y porque, además de explicar futuras vias de desarrollo para el proyecto.

## Estructura del proyecto

En el proyecto se implementan dos funcionalidades principalmente, listar los superhéroes de Marvel obtenidos por una API y mostrar el detalle de estos superhéroes.

## Arquitectura

### SOLID

La arquitectura principal se basa en los principios sólid y es una adaptación propia, parecida a VIPER. El proyecto se divide en 3 carpetas principalmente: presentation, data y domain. 

En **data** se encuentran aquellos elementos que se conectan con la API o se encontrarían aquellos que se comunicarán con una DB local. En esta capa encontramos los DataSource, que son los que proveen la información, y la implementación de los Repositories que son quien envian información hasta la capa de dominio. Esta capa solo tiene dependencia con dominio.

En **domain** se encuentran aquellos elementos que se denominan *de capa de negocio*, necesarios para satisfacer los requerimientos del proyecto. En esta capa econtramos las interficies de los repositorios, necesarios para que sean implementados en la capa de data, los casos de uso, representando funcionalidades clave de negocio, y por último las entities, representación en forma de datos de los elementos de negocio. Esta capa no tiene dependencia con ningúna otra.

En **presentation** se encuentran los elementos necesarios para presentar de forma visual las funcionalidades a los usuarios. Mas adelante hablaremos sobre la arquitectura que se ha seguido para la vista. Esta capa tiene dependencia con **domain**

### MVVM

Para la parte de presentación se ha implementado el patrón MVVM. Esto se hace substituyendo al normalmente utilizado Presenter en la arquitectura VIPER. Esto se hace por la facilidad que te permite el patrón MVVM para comunicarte con la vista y por la facilidad que se tiene luego para cambiar el tipo de vista de UIKIT a SWIFTUI u otros posibles en el futuro, como está haciendo ya Kotlin con su KMM.

### Patrones de diseño

Dado que es un proyecto pequeño y con requerimientos relativamente sencillos no se han implementado un gran número de patrones de diseño, a excepción del patron Singleton.

En futuros desarrollos de otras funcionalidades podrían ser implementados algunos de estos patrones: Decorator, Strategy, Facade, Factory, Builder, Compositor, etc.

### Otras carpetas

#### Resources

En esta carpeta se encuentran todas aquellas cosas que necesita el proyecto para mostrar recursos. En ella encontramos las fuentes que se utilizen en el proyecto, las imagenes, la LaunchScreen, etc.

#### Config

En esta carpeta se encuentran los archivos de configuración del proyecto. En primero lugar el Info.plist que nos da información sobre todo el proyecto y por otro lado el Config.plis, archivo de configuración para poner información de diferentes entornos como puede ser la *url base* a la que atacar o *private keys* de proveedores externos.

## Librerias

### Alamofire

Esta es una de las librerias mas utilizadas de Swift, utilizada para realizar peticiones a APIs.

### AlamofireImage

Esta es una libreria relacionada con la anterior que ofrece un componente específico para Alamofire para descargar imagenes

### ObjectMapper

Libreria para convertir fácilmente los modelos del proyecto a JSON y viceversa.

### AlamofireObjectMapper

Libreria relacionada con ObjectMapper y Alamofire para que ofrece un componente específica para Alamofire que descarga directamente los modelos del proyecto sin tener que realizar las conversiones con JSON manualmente.

### Localize-Swift

Libreria que facilita la localización de la aplicación

### SkeletonView

Libreria utilizada para mostrar a los usuarios que los datos estan siendo cargados sin la necesidad de mostrar *loadings* bloqueantes y de una manera elegante

## Futuras vias de desarrollo

### Mejorar el detalle del superhéroe

Además de la información básica que se muestra, se podría mostrar la otra información relacionada con los superhéroes como los comics, historias, eventos y series, haciendo carrouseles en el mismo detalle.

### Añadir filtros en la lista de superhéroes

El único filtro de datos que se ha hecho en lista ha sido el del búscador, buscando los superhéroes por las primeras letras de su nombre. Se podrían añadir los otros filtros como el orden, en los comics que aparecen, cambiar búsqueda a nombres completos, etc.

### Implementar RxSwift

Una posible implementación hubiera sido la de utilizar la librería RxSwift para añadir reactividad a nuestra aplicación.

### Utilizar SwiftUI para la parte visual

Gracias a la arquitectura utilizada, es muy fácil cambiar la parte visual implementada con UIKit a SwiftUI.
