import random
from streamlit_option_menu import option_menu
import hydralit_components as hc
import streamlit as st
import time
import mysql.connector as c
import pandas as pd
import requests
from streamlit_lottie import st_lottie
from PIL import Image
from random import randint

con = c.connect(host="localhost", user="root",
                password="Saran@5187473", database="OnlineBankingSystem")

st.set_page_config(page_title="DBMS Project", page_icon=":maple_leaf:", layout="wide")

feedbackList = []

list2=[]
list1=[]
user_id=0
accno = random.randint(493476,999999)
cid = random.randint(21,1000)

class feedback:
    def __init__(self, name, text):
        self.feedback_name = name
        self.feedback_text = text

    def add_feedback(self):
        feedbackList.append(self)
        return 1

if con.is_connected:
    print("Successfully connected")
cursor = con.cursor()
st.title("Online Banking System")

def streamlit_menu(example=2):

    if example == 3:
        # 2. horizontal menu with custom style
        selected = option_menu(
            menu_title=None,  # required
            options=["Home","Cust Login","Emp Login","Loan","about-us"],  # required
            icons=["house","envelope","envelope","book","file"],  # optional
            menu_icon="cast",  # optional
            default_index=0,  # optional
            orientation="horizontal",
            styles={
                "container": {"padding": "0!important", "background-color": "000000"},
                "icon": {"color": "orange", "font-size": "25px"},
                "nav-link": {
                    "font-size": "25px",
                    "text-align": "left",
                    "margin": "0px",
                    "--hover-color": "#eee",
                },
                "nav-link-selected": {"background-color": "green"},
            },
        )
        return selected

selected = streamlit_menu(example=3)

st.sidebar.success("Online Banking System")

if  selected == "Home":
    st.markdown("<h1 style='text-align: center; color: orange;'>Welcome To Online Banking System</h1>", unsafe_allow_html=True)
    with st.container():
        def load_lottieurl(url):
            r = requests.get(url)
            if r.status_code != 200:
                return None
            return r.json()

        # Use local CSS
        def local_css(file_name):
            with open(file_name) as f:
                st.markdown(f"<style>{f.read()}</style>", unsafe_allow_html=True)

        local_css("style/style.css")
        lottie_coding = load_lottieurl("https://assets3.lottiefiles.com/private_files/lf30_hsabbeks.json")
        lottie_coding_email = load_lottieurl("https://assets2.lottiefiles.com/packages/lf20_5wr08scz.json")
        with st.container():
            title_container = st.container()
            col1, col2 = st.columns([1, 20])
           
            st.markdown("<h2 style='text-align: center; color: orange;'>Open New Account or view Old in Cust Login</h2>", unsafe_allow_html=True)
            st.markdown("<h6 style='text-align: center; color: white;'>Check about the Loan Taken in Loan Tab</h6>", unsafe_allow_html=True)

        with st.container():
            st.write("---")
            st.header("Give Your Feedback for Our Site here!")
            st.write("##")

            contact_form = """
            <form action="" method="POST">
                <input type="hidden" name="_captcha" value="false">
                <input type="text" name="name" placeholder="Your name" required>
                <input type="email" name="email" placeholder="Your email" required>
                <textarea name="message" placeholder="Your message here" required></textarea>
                <button type="submit">Send</button>
            </form>
            """
            left_column, right_column = st.columns(2)
            with left_column:
                st.markdown(contact_form, unsafe_allow_html=True)
            with right_column:
                st_lottie(lottie_coding_email, height=300, key="email")
if selected == "about-us":
    st.markdown("""
       ### Our Website Creators
       ##### Dheeraj Kumar
       ##### Praveen
       ##### Saran     
    """, True)
    st.header("Some Customer Feedback: ")
    col1, col2 = st.columns(2)
    st.subheader("Add your feedback")
    feedback_name = st.text_input("Enter your name: ")
    feedback_text = st.text_area("Write about us: ")
    if col1.button("submit"):
        p = feedback(feedback_name, feedback_text)
        if(feedback.add_feedback(p)):
            st.success("Feedback submitted successfully!")
    if col2.button("View Other feedbacks"):
        st.write(feedbackList)
if  selected == "Cust Login":
    st.title("Signup/Login As Customer")
    login = st.selectbox("How do you want to login?",
                         ["Signup as Customer", "Login as Customer"])
    if login == "Login as Customer":
        userid=st.text_input("UserID: ")
        passwd=st.text_input("Password: ", type="password")
        query="select username , password from login WHERE role = 'customer' "

        cursor.execute(query)
        data = cursor.fetchall()
        for i in range(len(data)):
            list1.append(data[i][0])
            list2.append(data[i][1])
        c1, c2 = st.columns([7, 1])
        if c2.button("Submit"):
            bol1 = (userid in list1)
            bol2 = (passwd in list2)
            if (bol1) and (bol2):
                st.success("Sucessfully logged in....")
                st.success("You Account Details:")
                display = "SELECT * FROM customer where email  IN ( SELECT email_id from LOGIN where username='{}')".format(userid)
                cursor.execute(display)
                records=cursor.fetchall()
                st.sidebar.write("WELCOME:\n")
                for row in records:
                    st.write("CustomerID = ", row[0], )
                    st.write("DOB = ", row[1])
                    st.write("First Name  = ", row[2])
                    st.write("Last Name  = ", row[3], "\n")
                    st.write("Phone NO. = ", row[4], )
                    st.write("emailID = ", row[5])
                    st.write("State  = ", row[6])
                    st.write("City  = ", row[7], "\n")
                    st.write("Pincode = ", row[8], )
                    st.write("Pan Number = ", row[9])
                    st.write("Account Number  = ", row[10])
                st.error("User-id or Password may not be correct")


    if login == "Signup as Customer":
        query = "select cust_id from customer"
        cursor.execute(query)
        data = cursor.fetchall()
        user_id=len(data)+1
        first, last, lnm = st.columns(3)
        user_name=first.text_input("First Name")
        last_name=lnm.text_input("Last Name")
        email=last.text_input("E-mail")
        passw, phno = st.columns([3, 1])
        passwd=passw.text_input("Password: ", type="password")
        number=phno.text_input("Phone number")
        firstcs, lastcc, lnmcp = st.columns(3)
        pano, dobo = st.columns([3, 1])
        cstate = firstcs.text_input("State")
        cscity = lastcc.text_input("City")
        cpin = lnmcp.text_input("Pin Code")
        cdob = dobo.text_input("D.O.B")
        cpan = pano.text_input("Pan Number")
        cstm = 'customer'
        cabt = accno+cid
        query2 = "INSERT INTO  LOGIN VALUES('{}' , '{}' , '{}' , '{}')".format(email,cstm,cabt,passwd)
        cursor.execute(query2)
        c1, c2 = st.columns([7, 1])
        
        if c2.button("Submit"):
            query10 = "insert into account values('{}','{}','{}')".format(accno,0,0)
            cursor.execute(query10)
            st.success("You have been successfully registered")
            query1 ="insert into customer(cust_id,dob,first_name,last_name,phone_no,email,cust_address_state,cust_address_city,cust_address_pincode,pan_no,account_no) VALUES({},'{}','{}','{}',{},'{}','{}','{}','{}','{}','{}')".format(cid, cdob ,user_name ,last_name ,number, email, cstate,cscity ,cpin ,cpan,accno)
            cur = con.cursor()
            cur.execute(query1)
            con.commit()
            display1 = "SELECT * FROM customer where email  IN ( SELECT email_id from LOGIN where username='{}')".format(cabt)
            cursor.execute(display1)
            records1=cursor.fetchall()
            st.write('username(*use it for logging in next time):',cabt)
            for row in records1:
                    st.write("CustomerID = ", row[0], )
                    st.write("DOB = ", row[1])
                    st.write("First Name  = ", row[2])
                    st.write("Last Name  = ", row[3], "\n")
                    st.write("Phone NO. = ", row[4], )
                    st.write("emailID = ", row[5])
                    st.write("State  = ", row[6])
                    st.write("City  = ", row[7], "\n")
                    st.write("Pincode = ", row[8], )
                    st.write("Pan Number = ", row[9])
                    st.write("Account Number  = ", row[10])
            cid=+1
            accno +=1
            

if  selected == "Emp Login":
    st.title("Check For the Loan")
    login = st.selectbox("How do you want to login?",
                         ["Login as Employee"])
    if login == "Login as Employee":
        userid=st.text_input("UserID: ")
        passwd=st.text_input("Password: ", type="password")

        query="select username, password from login WHERE role='Employee'"

        cursor.execute(query)
        data = cursor.fetchall()
        for i in range(len(data)):
            list1.append(data[i][0])
            list2.append(data[i][1])
        c1, c2 = st.columns([7, 1])
        if c2.button("Submit"):
            bol1 = (userid in list1)
            bol2 = (passwd in list2)
            if (bol1) and (bol2):
                st.success("Sucessfully logged in....")
                st.success("Your Details:")
                display = "SELECT * FROM customer where email  IN ( SELECT email_id from LOGIN where username='{}')".format(userid)
                cursor.execute(display)
                records3=cursor.fetchall()

                st.sidebar.write("WELCOME:\n")
                for row in records3:
                    st.write("EmployeeID = ", row[0], )
                    st.write("DOB = ", row[1])
                    st.write("First Name  = ", row[2])
                    st.write("Last Name  = ", row[3], "\n")
                    st.write("Phone NO. = ", row[4], )
                    st.write("emailID = ", row[5])
                    st.write("State  = ", row[6])
                    st.write("City  = ", row[7], "\n")
                    st.write("Pincode = ", row[8], )
                    st.write("Pan Number = ", row[9])
                    st.write("Account Number  = ", row[10])
            else:
                st.error("User-id or Password may not be correct")
if selected == "Loan":
    st.title("Check Your Loan")
    login = st.selectbox("Enter the your Account No. below after selecting Yes",
                         ["Yes", "No"])
    if login == "Yes":
        accountno=st.number_input("Account No. : ")
        query="select account_no from customer"
        cursor.execute(query)
        data = cursor.fetchall()
        for i in range(len(data)):
            list1.append(data[i][0])
        c1, c2 = st.columns([7, 1])
        if c2.button("Submit"):
            bol1 = (accountno in list1)
            if (bol1):
                st.success("Sucessfully logged in....")
                st.success("You Loan Details:")
                display = "SELECT * FROM loans where account_no = '{}'".format(accountno)
                cursor.execute(display)
                records2=cursor.fetchall()
                for row in records2:
                    st.write("LoanID = ", row[0], )
                    st.write("Term = ", row[1])
                    st.write("Rate of Interest  = ", row[2])
                    st.write("Amount  = ", row[3], "\n")
                    st.write("Type of loan = ", row[4], )
                    st.write("Account No. = ", row[5])
            else:
                st.write("Either you don't have an account or you haven't taken a loan yet")

st.sidebar.image("bnk.png", use_column_width=True)