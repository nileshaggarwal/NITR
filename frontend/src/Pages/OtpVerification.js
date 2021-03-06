import React, { useEffect, useState } from "react";
import Footer from "../Components/footer/Footer";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import Header from "../Components/header/Header";
import "./css/otpVerification.css";
import { otpVerify } from "./helper/authhelper";
import { Redirect } from "react-router";

const OtpVerification = ({ match }) => {
  const [otp, setOtp] = useState();
  const [didRedirect, setDidRedirect] = useState(false);
  const [error, setError] = useState(false);
  const email = match.params.email;

  const onSubmit = (event) => {
    event.preventDefault();
    otpVerify({ otp, email }).then((data) => {
      if (data.error) {
        setError(data.error);
        errorMessage();
      } else {
        setOtp();
        console.log("verified");
        setDidRedirect(true);
      }
    });
  };

  const errorMessage = () => {
    toast(error);
  };

  const success =
    "New Account created successfully. Please verify your account";
  const successMessage = () => {
    toast(success, {
      position: "top-right",
      autoClose: 5000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
    });
  };

  const performRedirect = () => {
    if (didRedirect) {
      return <Redirect to="/signin" />;
    }
  };

  const handleChange = (event) => {
    setOtp(event.target.value);
  };

  useEffect(() => {
    successMessage();
  }, []);

  const OtpVerificationPage = () => {
    return (
      <div className="otpverification">
        <div className="otpinputbox">
          <div className="head">
            <h1>OTP Verification</h1>
          </div>
          <div className="explain">
            <span>
              Please enter the 6 digit OTP sent to you on entered Email-address
            </span>
          </div>
          <div className="input">
            <input onChange={handleChange} value={otp} type="number" />
          </div>
          <div className="submitbutton">
            <button onClick={onSubmit}>confirm</button>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div>
      {Header()}
      {OtpVerificationPage()}
      {performRedirect()}
      <ToastContainer
        position="top-right"
        autoClose={5000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
      />
      {Footer()}
    </div>
  );
};

export default OtpVerification;
