document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
  
    form.addEventListener("submit", async function (e) {
      e.preventDefault(); 
  
      const formData = {
        fullName: document.getElementById("fullName").value,
        dob: document.getElementById("dob").value,
        email: document.getElementById("email").value,
        phoneNumber: document.getElementById("phone").value,
        likeToDonate: (document.querySelector('input[name="donate"]:checked')?.value === "yes") ? true : false,
        organName: document.getElementById("organ").value,
        additionalComments : document.getElementById("message").value
      };
  
      try {
        const response = await fetch("http://localhost:5000/donor/register", {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify(formData)
        });
  
        const result = await response.json();
        console.log("Response from server:", result);
  
        alert("Registration successful! ✅");
        form.reset(); // clear form
  
      } catch (error) {
        console.error("Error submitting form:", error);
        alert("Failed to submit. Please try again. ❌");
      }
    });
  });
  