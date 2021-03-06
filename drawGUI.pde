void drawLCD()
{
  image(lcd_IMG, 0, 0);
  drawDigits();
  pila.drawStack(numFloating);
  drawOutput();
  textFont(font);
  fill(80);
  textAlign(LEFT);
  text((pila.stackSize() + 1), 40, 348);
  if (inDegrees) { image(degrees_IMG, 548, 301); }
  else { image(radians_IMG, 548, 301); }
}

void drawDigits()
{
  fill(digitCol);
  textFont(digitFont);
  textAlign(RIGHT);
  if (!isResult)
  {
    String pSTR;
    if (digitSTR.length() > maxDigits) { pSTR = digitSTR.substring(0, maxDigits); }
    else { pSTR = digitSTR; }
    text(pSTR,baseDigitX, baseDigitY);
  }
  else
  {
    String numStr = formatNumber(digitNUM);
    text(numStr, baseDigitX, baseDigitY);
  }
}

void drawOutput()
{
  textFont(outputFont);
  textAlign(CENTER);
  fill(outputCol);
  text(outputSTR, 300, 349);
}

String formatNumber(double n)
{
  String numStr;
  if ((n > maxNum) || (n < minNum) || ((n > minEps) && (n < maxEps) && n != 0.0))
  {
    DecimalFormatSymbols sym = DecimalFormatSymbols.getInstance();
    //if (n > minEps && n < 0.0) { sym.setExponentSeparator("e-"); }
    //else { sym.setExponentSeparator("e+"); }
    //if ((n > minEps && n < 0 ) || (n > 0.0 && n < maxEps)) { sym.setExponentSeparator("x10^"); }
    //else { sym.setExponentSeparator("x10^+"); }
    if ((n > minEps && n < 0 ) || (n > 0.0 && n < maxEps)) { sym.setExponentSeparator(" E"); }
    else { sym.setExponentSeparator(" E+"); }
    df = new DecimalFormat("#.################E0", sym);
  }
  else
  {
    if (numFloating == -1) // real format
    {
      df = new DecimalFormat("#,##0.0################");
    }
    else if (numFloating == -2) // hour minute seconds format
    {
      //df = new DecimalFormat("00,00");
      df = new DecimalFormat("##,##");
      //DecimalFormat df = new DecimalFormat("00"); // "0" means don't omit leading zero

    }
    else
    switch(numFloating)
    {
      case  0: df = new DecimalFormat("#,##0"); break;
      case  1: df = new DecimalFormat("#,##0.0"); break;
      case  2: df = new DecimalFormat("#,##0.00"); break;
      case  3: df = new DecimalFormat("#,##0.000"); break;
      case  4: df = new DecimalFormat("#,##0.0000"); break;
      case  5: df = new DecimalFormat("#,##0.00000"); break;
      case  6: df = new DecimalFormat("#,##0.000000"); break;
      case  7: df = new DecimalFormat("#,##0.0000000"); break;
      case  8: df = new DecimalFormat("#,##0.00000000"); break;
      case  9: df = new DecimalFormat("#,##0.000000000"); break;
      case 10: df = new DecimalFormat("#,##0.0000000000"); break;
      case 11: df = new DecimalFormat("#,##0.00000000000"); break;
      case 12: df = new DecimalFormat("#,##0.000000000000"); break;
    }
  }
  numStr = df.format(n);
  //println(numStr);
  return numStr;
}


void showGUI()
{
  // buttons
  btn7.show();
  btn8.show();
  btn9.show();
  btnDIV.show();
  btnCLS.show();
  btnEEX.show();

  btn4.show();
  btn5.show();
  btn6.show();
  btnMULT.show();
  btnENTER.show();
  btnDEL.show();

  btn1.show();
  btn2.show();
  btn3.show();
  btnMINUS.show();
  btnBACK.show();

  btn0.show();
  btnDOT.show();
  btnCHS.show();
  btnPLUS.show();
  btnLASTX.show();

  btnX2.show();
  btnEULER.show();
  btnPOWTEN.show();
  btnPOW.show();
  btnINVERSE.show();
  btnINT.show();
  btnABS.show();

  btnSQRT.show();
  btnLN.show();
  btnLOG.show();
  btnROOTS.show();
  btnCBRT.show();
  btnFRAC.show();
  btnROUND.show();

  btnSIN.show();
  btnCOS.show();
  btnTAN.show();
  btnSINH.show();
  btnCOSH.show();
  btnTANH.show();
  btnPI.show();

  btnASIN.show();
  btnACOS.show();
  btnATAN.show();
  btnASINH.show();
  btnACOSH.show();
  btnATANH.show();
  btnE.show();

  btnTODEG.show();
  btnTORAD.show();
  btnRECT.show();
  btnPOLAR.show();
  btnDMS.show();
  btnDD.show();
  btnPHI.show();

  btnGCD.show();
  btnLCM.show();
  btnFACTORIZE.show();
  btnPROP.show();
  btnQEQ.show();
  btnCEQ.show();
  btnHORNER.show();

  btnFACT.show();
  btnFIBO.show();
  //btnBINOMIAL.show();
  btnPERM.show();
  btnCOMB.show();
  btnSTAT.show();
  btnLR.show();
  btnRND.show();

  btnFRACTADD.show();
  btnFRACTSUB.show();
  btnFRACTMUL.show();
  btnFRACTDIV.show();
  btnFRACTGEN.show();
  btnCRAMER.show();
  btnTRIANGLE.show();

  // column buttons
  btnX_Y.show();
  btnFIX.show();
  btnSTOALL.show();
  btnRCLALL.show();
  btnPERC.show();
  btnDELTA.show();
  btnCXADD.show();
  btnCXSUB.show();
  btnCXMUL.show();
  btnCXDIV.show();
  btnCXINV.show();
  btnCXPOW.show();
  btnVECADD.show();
  btnVECSUB.show();
  btnVECCRO.show();
  btnVECDOT.show();
  btnVECANG.show();
  btnVECMAG.show();
  btnTADD.show();
  btnTSUB.show();
  btnASEQ.show();
  btnGSEQ.show();
  btnSLOPE.show();
  btnEDIT.show();
  btnMATH.show();
  btnEXIT.show();

  // Forth
  btnDUP.show();
  btnDROP.show();
  btnSWAP.show();
  btnOVER.show();
  btnROT.show();
  btnNIP.show();
  btnTUCK.show();

  btn2DUP.show();
  btn2DROP.show();
  btn2SWAP.show();
  btn2OVER.show();
  btn2ROT.show();
  btn2NIP.show();
  btn2TUCK.show();

  btnCOPYS.show();
  btnPASTES.show();
  //btnTWINS.show();
  btnPICKS.show();
  btnROLLS.show();
  btnRUPS.show();
  btnRDOWNS.show();
  btnFLIPS.show();
  btnCLEAR.show();
  btnLOAD.show();
  btnSAVE.show();
  btnHELP.show();

  // Memory
  btnSTO1.show();
  btnSTO2.show();
  btnSTO3.show();
  btnSTO4.show();
  btnSTO5.show();
  btnRCL1.show();
  btnRCL2.show();
  btnRCL3.show();
  btnRCL4.show();
  btnRCL5.show();
}