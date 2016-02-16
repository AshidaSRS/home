function fecha() {
  var fecha=new Date();
  var cosa=document.getElementById('fecha');
  cosa.innerHTML=fecha.getDate()+'/'+(fecha.getMonth()+1)+'/'+fecha.getFullYear()+
    "<br>"+fecha.getHours()+':'+fecha.getMinutes()+':'+fecha.getSeconds();
  }

function pintar() {
  var canvas=document.getElementById("lienzo");
  lienzo=canvas.getContext("2d")
  window.addEventListener('mousemove', animacion, false);
}

function animacion(e) {
  fecha();
  lienzo.clearRect(0,0,300,500);
  var xraton=e.clientX;
  var yraton=e.clientY;
  var xcentro=220;
  var ycentro=150;
  var angulo=Math.atan2(xraton-xcentro,yraton-ycentro);
  var x=xcentro+Math.round(Math.sin(angulo)*10);
  var y=ycentro+Math.round(Math.cos(angulo)*10);
  lienzo.beginPath();
  lienzo.arc(xcentro,ycentro,20,0,Math.PI*2, false);
  lienzo.moveTo(xcentro+70,150);
  lienzo.arc(xcentro+50,150,20,0,Math.PI*2, false);
  lienzo.stroke();
  lienzo.beginPath();
  lienzo.moveTo(x+10,y);
  lienzo.arc(x,y,10,0,Math.PI*2, false);
  lienzo.moveTo(x+60,y);
  lienzo.arc(x+50,y,10,0,Math.PI*2, false);
  lienzo.fill();
  lienzo.
}

function actualizarhora() {
  var fecha=new Date();
  var hora=fecha.getHours();
  var min=fecha.getMinutes();
  min=(min<10 ? "0" : "") + min
  var seg=fecha.getSeconds();
  seg=(seg<10 ? "0" : "") + seg
  var elemento=document.getElementById("hora")
  elemento.innerHTML=hora+":"+min+":"+seg;
}

function hora() {
  window.setInterval("actualizarhora()", 1000)
}

function colorear() {
  var chisme=[document.getElementById("cambio")];
  chisme[0].style.color= rgb(color, 0, 0);
  if (aumentar) {
    color=color+1;
  }
  else {
    color=color-1;}
  switch (color) {
    case 0: aumentar=true;
      break;
    case 255: aumentar=false;
      break;
  }
}


function rgb(r, g, b) {
  return "rgb("+r+", "+g+", "+b+")"
}

function carga() {
  fecha();
  pintar();
  actualizarhora();
  hora();
  var col= new Color({rojo:[0, 255], azul:[150, 250]});
  col.aplicar("id", "test", "texto");
  var otro= new Color({verde:[120, 255], azul: [150, 200], ms:1});
  otro.aplicar("id", "cambio", "fondo");
}

window.addEventListener("load", carga, false);

//Clase para cambiar colores, usar arrays para bucles
function Color (context) {
  var limites=[];
  limites[0]=context.rojo || [0, 0];
  limites[1]=context.verde || [0, 0];
  limites[2]=context.azul || [0, 0];
  var aumentos=[];
  var colores=[];
  for (var i=0; i<3; i++) {
    colores[i]=limites[i][0];
    if ((limites[i][1]-limites[i][0])<=0) {
      aumentos[i]=null;}
    else {
      aumentos[i]=true;
    }
  }
  var ms=context.ms || 5;
  this.aplicar=function (identificacion, nombre, tipo) {
    switch (identificacion) {
      case "tag": var elemento=document.getElementsByTagName(nombre);
        break;
      case "id": var elemento=[document.getElementById(nombre)];
        break;
      case "class": var elemento=document.getElementsByClassName(nombre);
        break;
    }
    window.setInterval(this.cambiar, ms, elemento, tipo);
  };
  this.cambiar=function (elemento, tipo) {
    var color=rgb(colores[0], colores[1], colores[2]);
    for (var i=0; i<elemento.length; i++) {
      switch (tipo) {
        case "fondo": elemento[i].style.backgroundColor=color;
          break;
        case "texto":elemento[i].style.color=color;
          break;
      }
    }
    for (var i=0; i<3; i++) {
      switch (aumentos[i]) {
        case true: colores[i]=colores[i]+1;
          break;
        case false: colores[i]=colores[i]-1;
          break;
      }
      if (aumentos[i]!=null) {
        switch (colores[i]) {
          case limites[i][0]:aumentos[i]=true;
            break;
          case limites[i][1]:aumentos[i]=false;
            break;
        }
      }
    }
  };
}
