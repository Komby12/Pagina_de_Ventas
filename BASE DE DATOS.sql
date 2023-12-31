  CREATE DATABASE BDM;
 use BDM;

CREATE TABLE Usuario(
 ID_US INT  PRIMARY KEY NOT NULL,
 Nom_Us varchar(100) NOT NULL,
 Ape_Us varchar(100) NOT NULL,
 Cedula varchar(100) NOT NULL,
 Direccion varchar(100) NOT NULL,
 Telefono varchar(100) NOT NULL,
 FeNa_Usuario date NOT NULL,
 Correo_Us varchar(100) NOT NULL,
 ID_Pais INT,
 ID_Provincia INT,
 ID_Ciudad INT,
 foreign key(ID_Pais) references Pais(ID_Pais),
 foreign key(ID_Provincia) references PROVINCIA (ID_Provincia),
 foreign key(ID_Ciudad) references Ciudad(ID_Ciudad)
);

DROP TABLE Producto;

CREATE TABLE Ciudad(
ID_Ciudad INT PRIMARY KEY NOT NULL,
Nom_Ciudad VARCHAR(100) NOT NULL,
ID_Pais INT,
ID_Provincia INT,
foreign key(ID_Pais) references Pais (ID_Pais),
foreign key(ID_Provincia) references PROVINCIA (ID_Provincia)
);

CREATE TABLE PROVINCIA(
ID_Provincia INT PRIMARY KEY NOT NULL,
Nom_Provin Varchar(100)
);

CREATE TABLE Pais(
ID_Pais INT PRIMARY KEY NOT NULL,
Nom_Pais VARCHAR(100) NOT NULL
);

CREATE TABLE Cliente(
ID_Cliente INT PRIMARY KEY NOT NULL,
Dire_Fact VARCHAR(100) NOT NULL,
Celu_cliente INT NOT NULL,
Email_Cliente VARCHAR(100) NOT NULL,
Fax_Client VARCHAR(100) NOT NULL,
Boletin_Clien boolean NOT NULL,
ID_US INT,
foreign key(ID_Us) references Usuario (ID_Us)
);

CREATE TABLE Mensaje(
ID_Mensaje INT PRIMARY KEY NOT NULL,
nFrom VARCHAR(100),
nTo  VARCHAR(100),
Titulo VARCHAR(100),
Fecha_Men DATE,
Mensaje  VARCHAR(10000),
leido boolean
);


CREATE TABLE Operador(
ID_OP INT PRIMARY KEY NOT NULL,
TIPO_OP VARCHAR(100),
ID_US INT,
foreign key(ID_Us) references Usuario (ID_Us)
);

CREATE TABLE Pedido(
ID_PEDIDO INT PRIMARY KEY NOT NULL,
Fecha_Ped DATE NOT NULL,
total_Pe INT NOT NULL,
Forma_pago VARCHAR(100),
Pagado boolean,
Entregado boolean,
Dire_Envio VARCHAR(1000) NOT NULL,
Dire_fACTURA VARCHAR(1000) NOT NULL,
Empresa_Trans VARCHAR(200) NOT NULL,
NROguia VARCHAR(100) NOT NULL,
Costo_Trans INT NOT NULL,
ID_Cliente INT,
foreign key(ID_Cliente) references Cliente (ID_Cliente)
);

CREATE TABLE Categoria(
ID_CAT INT PRIMARY KEY NOT NULL,
NOM_CAT VARCHAR(100) NOT NULL,
NOMBRE_CATE VARCHAR(100) NOT NULL,
Order_Cat  INT NOT  NULL,
Seccion VARCHAR(100) NOT NULL
);


CREATE TABLE Compra(
ID_COMPRA INT PRIMARY KEY NOT NULL,
Fecha_Com DATE NOT NULL,
total double NOT NULL,
ID_VEN INT,
foreign key(ID_VEN) references VENDEDOR (ID_VEN)
);


CREATE TABLE VENDEDOR(
ID_VEN INT PRIMARY KEY NOT NULL,
nombre_ven VARCHAR(100) NOT NULL,
DIRE_VEN VARCHAR(100) NOT NULL,
CIUDAD_VEN VARCHAR(100) NOT NULL,
PAIS_VEN VARCHAR(100) NOT NULL,
PROVINCIA_VEN VARCHAR(100) NOT NULL,
EMAIL_VEN VARCHAR(100) NOT NULL,
Tef_Ven INT NOT NULL,
CONTAC_VEN VARCHAR(100) NOT NULL
);

CREATE TABLE DETALLE_PEDIDO(
ID_PEDIDODET INT  PRIMARY KEY NOT NULL,
Item INT NOT NULL,
CANTIDAD_PE INT NOT NULL,
PRECIO_PE DOUBLE NOT NULL,
SUBTOTAL DOUBLE NOT NULL,
COSTO_ENVIO DOUBLE NOT NULL,
ID_PEDIDO INT,
ID_PRODUCTO  INT,
 foreign key(ID_PEDIDO) references Pedido (ID_Pedido),
 foreign key(ID_PRODUCTO) references PRODUCTO (ID_PRODUCTO)
);

CREATE TABLE DETALLE_COMPRA(
ID_DETCOMPRA INT NOT NULL,
ItemCom INT NOT NULL,
CANTIDAD_COM INT NOT NULL,
PRECIO_COM DOUBLE NOT NULL,
SUBTOTAL_COM DOUBLE NOT NULL,
COSTO_ENVIOCom DOUBLE NOT NULL,
ID_PRODUCTO INT,
ID_COMPRA INT,
foreign key(ID_PRODUCTO) references PRODUCTO (ID_PRODUCTO),
foreign key(ID_COMPRA) references Compra (ID_COMPRA)
);

CREATE TABLE PRODUCTO(
ID_PRODUCTO INT PRIMARY KEY NOT NULL,
TITULO VARCHAR(100) NOT NULL,
DESCRIPCION_PRO VARCHAR(1000) NOT NULL,
PRECIO_PRO DOUBLE  NOT  NULL,
EXTISTENCIA INT NOT NULL,
PESO DOUBLE  NOT NULL,
MOSTRAR_PORTADA boolean
);

CREATE TABLE FOTO(
ID_FOTO INT NOT NULL,
Pat_f  VARCHAR(100),
ID_PRODUCTO INT,
foreign key(ID_PRODUCTO) references PRODUCTO (ID_PRODUCTO)
);

CREATE TABLE COMENTARIO_PRODUCTO(
ID_Comment INT NOT NULL,
TEXTO_COM VARCHAR(200),
FECHA_COM DATE,
CONTESTACION VARCHAR(200),
 foreign key(ID_PRODUCTO) references PRODUCTO (ID_PRODUCTO),
 foreign key(ID_Cliente) references Cliente (ID_Cliente),
foreign key(ID_OP) references Operador (ID_OP)
);




