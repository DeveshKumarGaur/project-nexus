function setFormMessage(formElement, type, message){
    const messageElement = formElement.querySelector(".form_message");

    messageElement.textContent = message;
    messageElement.classList.remove("form_message--success", "form_message--error");
    messageElement.classList.add('form_message--$(type)');
}

function setInputError(inputElement, message){
    inputElement.classList.add("form_input--error");
    inputElement.parentElement.querySelector(".form_input-error-message").textContent =message;
}

function clearInputError(inputElement) {
    inputElement.classList.remove("form_input--error");
    inputElement.parentElement.querySelector(".form_input-error-message").textContent = "";
}
//setFormMessage(loginForm, "success", "You're logged in!");

document.addEventListener("DOMContentLoaded", ()=>{
    const loginForm =document.querySelector("#login");
    const createAccountForm =document.querySelector("#createAccount");

    document.querySelector("#linkCreateAccount").addEventListener("click",e =>{
        e.preventDefault();
        login.classList.add("form--hidden");
        createAccount.classList.remove("form--hidden");
    });

    
    document.querySelector("#linkLogin").addEventListener("click",e =>{
        e.preventDefault();
        login.classList.remove("form--hidden");
        createAccount.classList.add("form--hidden");
    });

    loginForm.addEventListener("submit", e => {
        e.preventDefault();
        
        setFormMessage(loginForm, "error", "Invalid Username/Password Combination");
    
    });
    
    document.querySelectorAll(".form_input").forEach(inputElement =>{
        inputElement.addEventListener("keyup", e =>{
            if (e.target.id === "signupUsername" && e.target.value.length>0 && e.target.value.length < 10) {
                setInputError(inputElement, "Username must be atleast 10 characters in Length");
            }
            if (e.target.id === "emailValidate") {
                const emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
                console.log("----", !emailRegex.test(e.target.value));
                if (!emailRegex.test(e.target.value)) {
                    setInputError(inputElement, "Enter Valid Email");
                } else {
                    clearInputError(inputElement); // Clear any previous error message
                }
            }
            if (e.target.id==="cnfPassword") {
                const pass1 = document.getElementById('password').value;
                const pass2 = document.getElementById('cnfPassword').value;
                console.log("sssss",pass1, pass2);
                if (pass1 != pass2) {
                    setInputError(inputElement, "Password & confirm password should be same");
                }else {
                    clearInputError(inputElement);
                }
            }
        });
    inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
        });
    });
});