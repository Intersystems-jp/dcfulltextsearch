import React from 'react';
import { useEffect } from "react";
import { Home } from './components/Home';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

export const App = () => {
 
  useEffect( () => {localStorage.setItem('inputtext','');}, []);   

  return (
    <BrowserRouter>
	<Routes>
	  <Route path='/' element={<Home/>} />
	</Routes>
   </BrowserRouter>   
  );	
}
export default App;
