import React from 'react';
import { Header } from './Header';
import { Query } from './Query';

export const Home = () => {

  return (
    <>
        <Tab>キーワード検索</Tab>
      <div className="title">
	  <Header />
	  </div>
      <div className="query">
	  <Query />
	  </div>      
    </>	
  );	
}
export default Home;
