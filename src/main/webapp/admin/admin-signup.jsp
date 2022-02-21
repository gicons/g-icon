<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>Giant Hypermarket | Sign Up</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"><script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="../style/style.css" />
    <style>
         *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            }   

        body{
            font-family: 'Poppins', sans-serif;
        }

        .header{
            background: radial-gradient(#fff, #32cd32);
        }

        .navigationbar{
            display: flex;
            align-items: center;
            padding: 20px;
        }
        
        nav{
            flex: 1;
            text-align: right;
        }

        nav ul{
            display: inline-block;
            list-style-type: none;
        }

        nav ul li{
            display: inline-block;
            margin-right: 20px;
        }

        a{
            text-decoration: none;
            color: #555;
        }


        p{
            color: #555;
        }

        .c1{
            max-width: 1300px;
            margin: auto;
            padding-left: 25px;
            padding-right: 25px;
        }

    





        .background{
            background: url(../images/grocery.jpg) no-repeat;
            background-size: cover;
            height: 120vh;
            display: flex;
        }


        .text{
            margin-top: 45vh;
            flex: 1;
            margin-left: 15%;
            margin-top: 150px;
            margin-bottom: auto;
            font-weight: 300px;
        }

        .box{
            margin-top: 5vh;
            flex: 1;
            margin-left: 25%;
            margin-top: 10px;
            margin-bottom: auto;
            font-size: 15px;
            
        }
    
        .text h1{
            font-size: 70px;
            color:#32cd32;
            font-weight: 500;
        }

        .text p{
            font-size: 20px;
            color: rgb(105, 70, 70);
            font-weight: 400;
        }

        .text p a{
            color: rgb(105, 70, 70);
            font-weight: 700;
        }

        .form{
            background: rgb(105, 70, 70, 0.5);
            padding: 16px ;
            color: #fff;
            
            border-radius: 5px;
            width: 300px;
        }

        input{
           
            padding: 5px;
            background: transparent;
            
            color: #fff;
            
        }

        textarea{
            
            background: transparent;
            color: #fff;
        }

        .adminid, .password, .fullname, .email, .phone, .address{
            border-bottom: 1px solid #fff;
            border-width: thin;
            
        }

        ::placeholder{
            color:burlywood;
            opacity: 0.7;
        }

        .button{
            background: transparent;
            border: 1px solid #fff;
            color: #fff;
            font-size: 15px;
        }

        .button:hover{
            background: #fff;
            color: #000;
        }


    </style>
</head>
<body>
<% String email = session.getAttribute("email").toString();%>
     <div class="header">
        <div class="c1">
                <div class="navigationbar">
                        <div class="logo">
                            <img src="../images/Giant_logo.png" width="85px"> &nbsp;
                        </div>
                        <div class="title">
						     <h1>Giant Hypermarket Pick-Up System</h1>
                            
                        </div>
                        <nav>
                            <ul>
                                <li><a href="admin-home.jsp">Home</a></li>
                                <li><a href="admin-about.jsp">About</a></li>
                                <li><a href="admin-contact.jsp">Contact</a></li>
                                <li><%out.println(email); %><i class='fas fa-user-alt'></i>
                                <li><a href="../index.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </div>
                    </div>
                    

    <!--sign up form-->
    <div class="background">
        <div class="text">
            <h1>Register</h1>
            <p> Have Account? <a href="index.jsp">Login</a></p>
        </div>
        <div class="box">
            <form class="form" action="adminsignup-action.jsp" method="post">
            	<label>Admin Id:</label>
                <input type="text" class="adminid" name="adminid" placeholder="Enter admin id" size="30" required><br><br>
                <label>Fullname:</label>
                <input type="text" class="fullname" name="fullname" placeholder="Enter your name" size="30" required><br><br>
                <label>Gender:</label>
                <input type="radio" name="gender" value="female" > Female
                <input type="radio" name="gender" value="male" > Male
                <br><br>
                <label>Email:</label>
                <input type="email" class="email" name="email" placeholder="someone@abc.com" size="30" required>
                <br><br>
                <label>Phone Number:</label>
                <input type="tel" class="phone" name="phoneno" placeholder="Enter your phone number" size="30" required>
                <br><br>
                <label>Address:</label>                
                <textarea class="address" name="address" placeholder="Enter your address" rows="3" cols="100"></textarea>
                <br><br>
                <label>Password:</label>
                <input type="password" class="password" name="password" placeholder="Password" size="30" required>
				<br><br>
				<label>Confirm Password:</label>
                <input type="password" class="password" name="password1" placeholder="Confirm Password" size="30" required>
                <br><br>
                <input type="submit" class="button" value="Register">
                <input type="reset" class="button" value="Reset">
            </form>
        </div>
    </div>
    
    
   
</body>
</html>