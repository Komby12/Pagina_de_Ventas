const form = document.getElementById('form');
const usuario = document.getElementById('username');
const Despcripcion = document.getElementById('Despcripcion');



form.addEventListener('submit', e => {
	e.preventDefault();
	
	checkInputs();
});

function checkInputs() {
	// trim to remove the whitespaces
	const usuarioValue = usuario.value.trim();
	const DespValue = Despcripcion.value.trim();
    const PrecioValue = Precio.value.trim();


	if(usuarioValue === '') {
		setErrorFor(usuario, 'Pon nombre a la categoria');
	} else {
		setSuccessFor(usuario);
	}


    if(DespValue === '') {
		setErrorFor(Despcripcion, 'No se puede dejar la descripcion en blanco');
	} else {
		setSuccessFor(Despcripcion);
	}
   

    
}

function setErrorFor(input, message) {
	const formControl = input.parentElement;
	const small = formControl.querySelector('small');
	formControl.className = 'form-control error';
	small.innerText = message;
}

function setSuccessFor(input) {
	const formControl = input.parentElement;
	formControl.className = 'form-control success';
}





