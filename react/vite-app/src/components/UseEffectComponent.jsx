import { useEffect } from "react";
export default function UseEffectComponent(){
    useEffect(()=>{
      console.log("inside use effect")
    },[]);
  }