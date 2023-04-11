
// Function untuk check username dan password masa login
function logMe()
{
  if ($('#username').val() == '')
      {
        Swal.fire({
          title: 'Oops',
          text: 'Please Enter Username',
          icon: 'warning',
          confirmButtonText: 'Okay'
        })
      }
  else if ($('#password').val() == '')
      {
        Swal.fire({
          title: 'Oops',
          text: 'Please Enter Password',
          icon: 'warning',
          confirmButtonText: 'Okay'
        })
      }		
  else
      {
          $.ajax({
            method: "POST",
            url: 'login_act.cfm',
            data: $('#loginform').serialize(),
            cache: false,
            dataType: "script"
          })
            .done(function( html ) {
              $( "#process_login" ).html( html );
            });
      }	
}

// Untuk logout
function logout()
{
    Swal.fire({
      title: 'Are You Sure?',
      text: "Logout From System",
      icon: 'warning',
      confirmButtonColor: '#3085d6',
      confirmButtonText: 'Yep, I Am Sure',
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
            async:true,
            cache: false,
            type:'GET',
            url:'logout_act.cfm',
            dataType:'script'
        });
      }
    });

}   


// Force untuk type nombor je dalam input
$.fn.ForceNumericOnly = function()
{
    return this.each(function()
    {
        $(this).keydown(function(e)
        {
            var key = e.charCode || e.keyCode || 0;

            // allow backspace, tab, delete, arrows, numbers and keypad numbers ONLY
            return (
                key == 8 ||
                key == 9 ||
                key == 46 ||
                key == 190 ||   // normal .
                key == 110 ||   // keypad .
                (key >= 37 && key <= 40) ||
                (key >= 48 && key <= 57) ||
                (key >= 96 && key <= 105));
        })
    })
};