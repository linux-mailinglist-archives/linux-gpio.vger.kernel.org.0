Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEACC4AA9C4
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Feb 2022 16:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380286AbiBEPyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Feb 2022 10:54:00 -0500
Received: from mout.gmx.net ([212.227.15.15]:35567 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1380282AbiBEPyA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Feb 2022 10:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644076430;
        bh=5et5IUkQeGLITjhMu9UAGqm9VpqhlDQyT1g9WVmTbCs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CFwBXWh1lCL4fivxCOu/Gnze2bkvrruP03pBlwPyK3akfLAdg8cR0qDJYSVdoni3N
         o1Jf1dFoaspqElQCWMQG+dt7ghBZDRbp6BmSChzC1VQgkGjxS5vLoaKFRbW6fcWh+d
         +NJRnLefNSldQ6UaVc6yOrkD9jcZAz/NXxlzvOyo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.182.239]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzhj9-1mLMqt1uCH-00vjK7; Sat, 05
 Feb 2022 16:53:50 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        kernel test robot <lkp@intel.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/2] pinctrl: nuvoton: npcm7xx: Rename DS() macro to DSTR()
Date:   Sat,  5 Feb 2022 16:53:31 +0100
Message-Id: <20220205155332.1308899-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205155332.1308899-1-j.neuschaefer@gmx.net>
References: <20220205155332.1308899-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hewL6cIcJsXmP+79VERqwa4VXcXQo5nlp3efl2SLBMeUihGMMAl
 GUlmEEbwwH7rkBEhUYnddtIQkoQu99HPKpt21pzOXwj/hKMYcG/PCulhizBTwrbOhIEjX27
 8bmOCpks/eRRgpHmNDOG1+6a31ZXGjiC2ZSO1cOCaLdD4fFAu6ts0QFTuFQRkIEOeTupMeN
 Tsxf6MtKoXhwyTwLKFQQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X1GzSRtMWso=:GAEuqVo6sD+iHwqpAhbe/H
 7Mv3ELO8lKzd5A1qLugEPGYdTA/tIj29sUGHn0X/gxFuZIA8I7RHA4rG5BNjK1RIbOBzOsF7f
 AcOXYtAdtrLCX19HlJlPq5rUs8FgTOJDr2X3kmZHHBkMQVE5cDTwqCRWrZdtXOA2jV4ArRnz7
 wF58wgc6onp9nKsK0ithmDoBKzTE1Y94xB9lqYWSp1xzBHW+f0rA39SZIZzeHceLTx4M+bSan
 P/FEVRlnvE3UXWBH4K5JUPdqgjEkTLnyMD3AqECrEf/SEfUEPIemNDwcStc2XVAjj1cD7K8/C
 usfqjUMPWmSEI2n1U5YElh8a+tfgUBURaqymPzuNN56jHbVKntrlBIp+WsfeP4bJbnYtf0BUF
 zhlUbPQqe6vjbVBub+Lq5CPibKg5dxEAq72tYVm1QqeITs6e3Z/Ng3k1/+7i+I4P46kwF1Myt
 ntt1QjytRjFRUhJYyZQ5k2OomcnnzJFWL/rjaag5wSwKYQ2cJ02P4n3bgCDgxRblpxfD/cO5h
 KPTew6tnqVIKJvOMwIEHSOiaUAdIVFfDUI1n0EOhGlU1ocikKViEvZwrCsXwkdZMKyLCpp8tY
 ck/kp9yfWIOYfkg7HEVD8uaOprfO4Gjm/Sk/KMWvOi2mPqUEuCJnqy8ZMJAfbGekRvKe8lbYx
 K1gUE7CpVnfMX7BK36CJwC+4J82j2Njv1xgFsKwjcclCfkry1dpC7fgrgG7Hm3EN5RhLVdwys
 1fO3oV165RuzYuxIpATy5CjH6olwARcbn5WrDqj5PoIwGIk4NnxXNQl1ez68f3V437IQppM0m
 btSGVp9YQRc1oWmx9A7XhMU40Tgu3xypsZPE6oj0pmcLtApnLTy5ZCYl7Kbkq4efybpkQVgYP
 /EjxPQhjYxlaysPfv20KoDGvzusTuUqW0TzqTzufRbRSDsNnEIbg80k2IRMd4vUBi8rYzw8KP
 4QLr5C2pdnr0+cIwDUKTkt9fGqQ/onuaPmLjP43BK/qMGC/blNp07vsHLfaWzewUezYcp+0Zj
 6yyRjeQBJPxlVCkNTrHv7U6nx6tHGa9E5YMvVnzpT7mlZSKbVHR2hz/IVBAxfOVfqykpE3mjU
 TuRVtkTDr/zHqU=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The name "DS" is defined in arch/x86/um/shared/sysdep/ptrace_64.h,
which results in a compiler warning when build-testing on ARCH=3Dum.
Rename this driver's "DS" macro to DSTR so avoid this collision.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 3b588e43ee5c7 ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driv=
er")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 158 +++++++++++-----------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/n=
uvoton/pinctrl-npcm7xx.c
index e05bbc7fb09de..6656bac3f3840 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -905,7 +905,7 @@ static struct npcm7xx_func npcm7xx_funcs[] =3D {
 #define DRIVE_STRENGTH_HI_SHIFT		12
 #define DRIVE_STRENGTH_MASK		0x0000FF00

-#define DS(lo, hi)	(((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
+#define DSTR(lo, hi)	(((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
 			 ((hi) << DRIVE_STRENGTH_HI_SHIFT))
 #define DSLO(x)		(((x) >> DRIVE_STRENGTH_LO_SHIFT) & 0xF)
 #define DSHI(x)		(((x) >> DRIVE_STRENGTH_HI_SHIFT) & 0xF)
@@ -925,31 +925,31 @@ struct npcm7xx_pincfg {
 static const struct npcm7xx_pincfg pincfg[] =3D {
 	/*		PIN	  FUNCTION 1		   FUNCTION 2		  FUNCTION 3	    FLAGS */
 	NPCM7XX_PINCFG(0,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
-	NPCM7XX_PINCFG(1,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),
-	NPCM7XX_PINCFG(2,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),
+	NPCM7XX_PINCFG(1,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DSTR(8, 12)),
+	NPCM7XX_PINCFG(2,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DSTR(8, 12)),
 	NPCM7XX_PINCFG(3,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
 	NPCM7XX_PINCFG(4,	 iox2, MFSEL3, 14,	 smb1d, I2CSEGSEL, 7,	none, NONE, 0=
,	     SLEW),
 	NPCM7XX_PINCFG(5,	 iox2, MFSEL3, 14,	 smb1d, I2CSEGSEL, 7,	none, NONE, 0=
,	     SLEW),
 	NPCM7XX_PINCFG(6,	 iox2, MFSEL3, 14,	 smb2d, I2CSEGSEL, 10,  none, NONE,=
 0,       SLEW),
 	NPCM7XX_PINCFG(7,	 iox2, MFSEL3, 14,	 smb2d, I2CSEGSEL, 10,  none, NONE,=
 0,       SLEW),
-	NPCM7XX_PINCFG(8,      lkgpo1, FLOCKR1, 4,        none, NONE, 0,	none, N=
ONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(9,      lkgpo2, FLOCKR1, 8,        none, NONE, 0,	none, N=
ONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(10,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12)),
-	NPCM7XX_PINCFG(11,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12)),
+	NPCM7XX_PINCFG(8,      lkgpo1, FLOCKR1, 4,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(9,      lkgpo2, FLOCKR1, 8,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(10,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12)),
+	NPCM7XX_PINCFG(11,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12)),
 	NPCM7XX_PINCFG(12,	 gspi, MFSEL1, 24,	 smb5b, I2CSEGSEL, 19,  none, NONE=
, 0,	     SLEW),
 	NPCM7XX_PINCFG(13,	 gspi, MFSEL1, 24,	 smb5b, I2CSEGSEL, 19,  none, NONE=
, 0,	     SLEW),
 	NPCM7XX_PINCFG(14,	 gspi, MFSEL1, 24,	 smb5c, I2CSEGSEL, 20,	none, NONE,=
 0,	     SLEW),
 	NPCM7XX_PINCFG(15,	 gspi, MFSEL1, 24,	 smb5c, I2CSEGSEL, 20,	none, NONE,=
 0,	     SLEW),
-	NPCM7XX_PINCFG(16,     lkgpo0, FLOCKR1, 0,        none, NONE, 0,	none, N=
ONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(17,      pspi2, MFSEL3, 13,     smb4den, I2CSEGSEL, 23,  =
none, NONE, 0,       DS(8, 12)),
-	NPCM7XX_PINCFG(18,      pspi2, MFSEL3, 13,	 smb4b, I2CSEGSEL, 14,  none,=
 NONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(19,      pspi2, MFSEL3, 13,	 smb4b, I2CSEGSEL, 14,  none,=
 NONE, 0,	     DS(8, 12)),
+	NPCM7XX_PINCFG(16,     lkgpo0, FLOCKR1, 0,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(17,      pspi2, MFSEL3, 13,     smb4den, I2CSEGSEL, 23,  =
none, NONE, 0,       DSTR(8, 12)),
+	NPCM7XX_PINCFG(18,      pspi2, MFSEL3, 13,	 smb4b, I2CSEGSEL, 14,  none,=
 NONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(19,      pspi2, MFSEL3, 13,	 smb4b, I2CSEGSEL, 14,  none,=
 NONE, 0,	     DSTR(8, 12)),
 	NPCM7XX_PINCFG(20,	smb4c, I2CSEGSEL, 15,    smb15, MFSEL3, 8,      none,=
 NONE, 0,	     0),
 	NPCM7XX_PINCFG(21,	smb4c, I2CSEGSEL, 15,    smb15, MFSEL3, 8,      none,=
 NONE, 0,	     0),
 	NPCM7XX_PINCFG(22,      smb4d, I2CSEGSEL, 16,	 smb14, MFSEL3, 7,      no=
ne, NONE, 0,	     0),
 	NPCM7XX_PINCFG(23,      smb4d, I2CSEGSEL, 16,	 smb14, MFSEL3, 7,      no=
ne, NONE, 0,	     0),
-	NPCM7XX_PINCFG(24,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12)),
-	NPCM7XX_PINCFG(25,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12)),
+	NPCM7XX_PINCFG(24,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12)),
+	NPCM7XX_PINCFG(25,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12)),
 	NPCM7XX_PINCFG(26,	 smb5, MFSEL1, 2,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
 	NPCM7XX_PINCFG(27,	 smb5, MFSEL1, 2,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
 	NPCM7XX_PINCFG(28,	 smb4, MFSEL1, 1,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
@@ -965,12 +965,12 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
 	NPCM7XX_PINCFG(40,	smb3b, I2CSEGSEL, 11,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
 	NPCM7XX_PINCFG(41,  bmcuart0a, MFSEL1, 9,         none, NONE, 0,	none, N=
ONE, 0,	     0),
-	NPCM7XX_PINCFG(42,  bmcuart0a, MFSEL1, 9,         none, NONE, 0,	none, N=
ONE, 0,	     DS(2, 4) | GPO),
+	NPCM7XX_PINCFG(42,  bmcuart0a, MFSEL1, 9,         none, NONE, 0,	none, N=
ONE, 0,	     DSTR(2, 4) | GPO),
 	NPCM7XX_PINCFG(43,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,  bmcuart1,=
 MFSEL3, 24,    0),
 	NPCM7XX_PINCFG(44,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,  bmcuart1,=
 MFSEL3, 24,    0),
 	NPCM7XX_PINCFG(45,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,	none, NONE=
, 0,	     0),
-	NPCM7XX_PINCFG(46,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,	none, NONE=
, 0,	     DS(2, 8)),
-	NPCM7XX_PINCFG(47,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,	none, NONE=
, 0,	     DS(2, 8)),
+	NPCM7XX_PINCFG(46,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,	none, NONE=
, 0,	     DSTR(2, 8)),
+	NPCM7XX_PINCFG(47,      uart1, MFSEL1, 10,	 jtag2, MFSEL4, 0,	none, NONE=
, 0,	     DSTR(2, 8)),
 	NPCM7XX_PINCFG(48,	uart2, MFSEL1, 11,   bmcuart0b, MFSEL4, 1,      none,=
 NONE, 0,	     GPO),
 	NPCM7XX_PINCFG(49,	uart2, MFSEL1, 11,   bmcuart0b, MFSEL4, 1,      none,=
 NONE, 0,	     0),
 	NPCM7XX_PINCFG(50,	uart2, MFSEL1, 11,	  none, NONE, 0,        none, NONE=
, 0,	     0),
@@ -980,8 +980,8 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(54,	uart2, MFSEL1, 11,	  none, NONE, 0,        none, NONE=
, 0,	     0),
 	NPCM7XX_PINCFG(55,	uart2, MFSEL1, 11,	  none, NONE, 0,        none, NONE=
, 0,	     0),
 	NPCM7XX_PINCFG(56,	r1err, MFSEL1, 12,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
-	NPCM7XX_PINCFG(57,       r1md, MFSEL1, 13,        none, NONE, 0,        =
none, NONE, 0,       DS(2, 4)),
-	NPCM7XX_PINCFG(58,       r1md, MFSEL1, 13,        none, NONE, 0,	none, N=
ONE, 0,	     DS(2, 4)),
+	NPCM7XX_PINCFG(57,       r1md, MFSEL1, 13,        none, NONE, 0,        =
none, NONE, 0,       DSTR(2, 4)),
+	NPCM7XX_PINCFG(58,       r1md, MFSEL1, 13,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(2, 4)),
 	NPCM7XX_PINCFG(59,	smb3d, I2CSEGSEL, 13,	  none, NONE, 0,	none, NONE, 0,=
	     0),
 	NPCM7XX_PINCFG(60,	smb3d, I2CSEGSEL, 13,	  none, NONE, 0,	none, NONE, 0,=
	     0),
 	NPCM7XX_PINCFG(61,      uart1, MFSEL1, 10,	  none, NONE, 0,	none, NONE, =
0,     GPO),
@@ -1004,19 +1004,19 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(77,    fanin13, MFSEL2, 13,        none, NONE, 0,	none, N=
ONE, 0,	     0),
 	NPCM7XX_PINCFG(78,    fanin14, MFSEL2, 14,        none, NONE, 0,	none, N=
ONE, 0,	     0),
 	NPCM7XX_PINCFG(79,    fanin15, MFSEL2, 15,        none, NONE, 0,	none, N=
ONE, 0,	     0),
-	NPCM7XX_PINCFG(80,	 pwm0, MFSEL2, 16,        none, NONE, 0,	none, NONE, =
0,	     DS(4, 8)),
-	NPCM7XX_PINCFG(81,	 pwm1, MFSEL2, 17,        none, NONE, 0,	none, NONE, =
0,	     DS(4, 8)),
-	NPCM7XX_PINCFG(82,	 pwm2, MFSEL2, 18,        none, NONE, 0,	none, NONE, =
0,	     DS(4, 8)),
-	NPCM7XX_PINCFG(83,	 pwm3, MFSEL2, 19,        none, NONE, 0,	none, NONE, =
0,	     DS(4, 8)),
-	NPCM7XX_PINCFG(84,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(85,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(86,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     DS(8, 12) | SLEW),
+	NPCM7XX_PINCFG(80,	 pwm0, MFSEL2, 16,        none, NONE, 0,	none, NONE, =
0,	     DSTR(4, 8)),
+	NPCM7XX_PINCFG(81,	 pwm1, MFSEL2, 17,        none, NONE, 0,	none, NONE, =
0,	     DSTR(4, 8)),
+	NPCM7XX_PINCFG(82,	 pwm2, MFSEL2, 18,        none, NONE, 0,	none, NONE, =
0,	     DSTR(4, 8)),
+	NPCM7XX_PINCFG(83,	 pwm3, MFSEL2, 19,        none, NONE, 0,	none, NONE, =
0,	     DSTR(4, 8)),
+	NPCM7XX_PINCFG(84,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(85,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(86,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     DSTR(8, 12) | SLEW),
 	NPCM7XX_PINCFG(87,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(88,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(89,         r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(90,      r2err, MFSEL1, 15,        none, NONE, 0,        =
none, NONE, 0,       0),
-	NPCM7XX_PINCFG(91,       r2md, MFSEL1, 16,	  none, NONE, 0,        none,=
 NONE, 0,	     DS(2, 4)),
-	NPCM7XX_PINCFG(92,       r2md, MFSEL1, 16,	  none, NONE, 0,        none,=
 NONE, 0,	     DS(2, 4)),
+	NPCM7XX_PINCFG(91,       r2md, MFSEL1, 16,	  none, NONE, 0,        none,=
 NONE, 0,	     DSTR(2, 4)),
+	NPCM7XX_PINCFG(92,       r2md, MFSEL1, 16,	  none, NONE, 0,        none,=
 NONE, 0,	     DSTR(2, 4)),
 	NPCM7XX_PINCFG(93,    ga20kbc, MFSEL1, 17,	 smb5d, I2CSEGSEL, 21,  none,=
 NONE, 0,	     0),
 	NPCM7XX_PINCFG(94,    ga20kbc, MFSEL1, 17,	 smb5d, I2CSEGSEL, 21,  none,=
 NONE, 0,	     0),
 	NPCM7XX_PINCFG(95,	  lpc, NONE, 0,		  espi, MFSEL4, 8,      gpio, MFSEL1=
, 26,    0),
@@ -1062,34 +1062,34 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(133,	smb10, MFSEL4, 13,	  none, NONE, 0,	none, NONE, 0,	 =
    0),
 	NPCM7XX_PINCFG(134,	smb11, MFSEL4, 14,	  none, NONE, 0,	none, NONE, 0,	 =
    0),
 	NPCM7XX_PINCFG(135,	smb11, MFSEL4, 14,	  none, NONE, 0,	none, NONE, 0,	 =
    0),
-	NPCM7XX_PINCFG(136,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(137,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(138,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(139,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(140,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
+	NPCM7XX_PINCFG(136,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(137,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(138,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(139,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(140,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
 	NPCM7XX_PINCFG(141,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    0),
-	NPCM7XX_PINCFG(142,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
+	NPCM7XX_PINCFG(142,	  sd1, MFSEL3, 12,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
 	NPCM7XX_PINCFG(143,       sd1, MFSEL3, 12,      sd1pwr, MFSEL4, 5,      =
none, NONE, 0,       0),
-	NPCM7XX_PINCFG(144,	 pwm4, MFSEL2, 20,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(4, 8)),
-	NPCM7XX_PINCFG(145,	 pwm5, MFSEL2, 21,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(4, 8)),
-	NPCM7XX_PINCFG(146,	 pwm6, MFSEL2, 22,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(4, 8)),
-	NPCM7XX_PINCFG(147,	 pwm7, MFSEL2, 23,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(4, 8)),
-	NPCM7XX_PINCFG(148,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(149,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(150,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(151,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(152,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
+	NPCM7XX_PINCFG(144,	 pwm4, MFSEL2, 20,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(4, 8)),
+	NPCM7XX_PINCFG(145,	 pwm5, MFSEL2, 21,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(4, 8)),
+	NPCM7XX_PINCFG(146,	 pwm6, MFSEL2, 22,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(4, 8)),
+	NPCM7XX_PINCFG(147,	 pwm7, MFSEL2, 23,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(4, 8)),
+	NPCM7XX_PINCFG(148,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(149,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(150,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(151,	 mmc8, MFSEL3, 11,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(152,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
 	NPCM7XX_PINCFG(153,     mmcwp, FLOCKR1, 24,       none, NONE, 0,	none, N=
ONE, 0,	     0),  /* Z1/A1 */
-	NPCM7XX_PINCFG(154,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
+	NPCM7XX_PINCFG(154,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
 	NPCM7XX_PINCFG(155,     mmccd, MFSEL3, 25,      mmcrst, MFSEL4, 6,      =
none, NONE, 0,       0),  /* Z1/A1 */
-	NPCM7XX_PINCFG(156,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(157,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(158,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(159,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DS(8, 12) | SLEW),
-
-	NPCM7XX_PINCFG(160,    clkout, MFSEL1, 21,        none, NONE, 0,        =
none, NONE, 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(161,	  lpc, NONE, 0,		  espi, MFSEL4, 8,      gpio, MFSEL=
1, 26,    DS(8, 12)),
-	NPCM7XX_PINCFG(162,    serirq, NONE, 0,           gpio, MFSEL1, 31,	none=
, NONE, 0,	     DS(8, 12)),
+	NPCM7XX_PINCFG(156,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(157,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(158,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(159,	  mmc, MFSEL3, 10,	  none, NONE, 0,	none, NONE, 0,	 =
    DSTR(8, 12) | SLEW),
+
+	NPCM7XX_PINCFG(160,    clkout, MFSEL1, 21,        none, NONE, 0,        =
none, NONE, 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(161,	  lpc, NONE, 0,		  espi, MFSEL4, 8,      gpio, MFSEL=
1, 26,    DSTR(8, 12)),
+	NPCM7XX_PINCFG(162,    serirq, NONE, 0,           gpio, MFSEL1, 31,	none=
, NONE, 0,	     DSTR(8, 12)),
 	NPCM7XX_PINCFG(163,	  lpc, NONE, 0,		  espi, MFSEL4, 8,      gpio, MFSEL=
1, 26,    0),
 	NPCM7XX_PINCFG(164,	  lpc, NONE, 0,		  espi, MFSEL4, 8,      gpio, MFSEL=
1, 26,    SLEWLPC),
 	NPCM7XX_PINCFG(165,	  lpc, NONE, 0,		  espi, MFSEL4, 8,      gpio, MFSEL=
1, 26,    SLEWLPC),
@@ -1102,25 +1102,25 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(172,	 smb6, MFSEL3, 1,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(173,	 smb7, MFSEL3, 2,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(174,	 smb7, MFSEL3, 2,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
-	NPCM7XX_PINCFG(175,	pspi1, MFSEL3, 4,       faninx, MFSEL3, 3,      none=
, NONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(176,     pspi1, MFSEL3, 4,       faninx, MFSEL3, 3,      =
none, NONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(177,     pspi1, MFSEL3, 4,       faninx, MFSEL3, 3,      =
none, NONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(178,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(179,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(180,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   DS(8, 12) | SLEW),
+	NPCM7XX_PINCFG(175,	pspi1, MFSEL3, 4,       faninx, MFSEL3, 3,      none=
, NONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(176,     pspi1, MFSEL3, 4,       faninx, MFSEL3, 3,      =
none, NONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(177,     pspi1, MFSEL3, 4,       faninx, MFSEL3, 3,      =
none, NONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(178,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(179,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(180,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   DSTR(8, 12) | SLEW),
 	NPCM7XX_PINCFG(181,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(182,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
-	NPCM7XX_PINCFG(183,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(184,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DS(8, 12) | SLEW | GPO),
-	NPCM7XX_PINCFG(185,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DS(8, 12) | SLEW | GPO),
-	NPCM7XX_PINCFG(186,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DS(8, 12)),
-	NPCM7XX_PINCFG(187,   spi3cs1, MFSEL4, 17,        none, NONE, 0,	none, N=
ONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(188,  spi3quad, MFSEL4, 20,     spi3cs2, MFSEL4, 18,     =
none, NONE, 0,    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(189,  spi3quad, MFSEL4, 20,     spi3cs3, MFSEL4, 19,     =
none, NONE, 0,    DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(190,      gpio, FLOCKR1, 20,   nprd_smi, NONE, 0,	none, N=
ONE, 0,	     DS(2, 4)),
-	NPCM7XX_PINCFG(191,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),  /* XX */
-
-	NPCM7XX_PINCFG(192,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),  /* XX */
+	NPCM7XX_PINCFG(183,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(184,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DSTR(8, 12) | SLEW | GPO),
+	NPCM7XX_PINCFG(185,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DSTR(8, 12) | SLEW | GPO),
+	NPCM7XX_PINCFG(186,     spi3, MFSEL4, 16,	  none, NONE, 0,	none, NONE, 0=
,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(187,   spi3cs1, MFSEL4, 17,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(8, 12)),
+	NPCM7XX_PINCFG(188,  spi3quad, MFSEL4, 20,     spi3cs2, MFSEL4, 18,     =
none, NONE, 0,    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(189,  spi3quad, MFSEL4, 20,     spi3cs3, MFSEL4, 19,     =
none, NONE, 0,    DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(190,      gpio, FLOCKR1, 20,   nprd_smi, NONE, 0,	none, N=
ONE, 0,	     DSTR(2, 4)),
+	NPCM7XX_PINCFG(191,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  DSTR(8, 12)),  /* XX */
+
+	NPCM7XX_PINCFG(192,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  DSTR(8, 12)),  /* XX */
 	NPCM7XX_PINCFG(193,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(194,	smb0b, I2CSEGSEL, 0,	  none, NONE, 0,	none, NONE, 0,=
	     0),
 	NPCM7XX_PINCFG(195,	smb0b, I2CSEGSEL, 0,	  none, NONE, 0,	none, NONE, 0,=
	     0),
@@ -1131,11 +1131,11 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(200,        r2, MFSEL1, 14,        none, NONE, 0,        =
none, NONE, 0,       0),
 	NPCM7XX_PINCFG(201,	   r1, MFSEL3, 9,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	  none, NONE, 0,	none, NONE, 0,=
	     0),
-	NPCM7XX_PINCFG(203,    faninx, MFSEL3, 3,         none, NONE, 0,	none, N=
ONE, 0,	     DS(8, 12)),
+	NPCM7XX_PINCFG(203,    faninx, MFSEL3, 3,         none, NONE, 0,	none, N=
ONE, 0,	     DSTR(8, 12)),
 	NPCM7XX_PINCFG(204,	  ddc, NONE, 0,           gpio, MFSEL3, 22,	none, NO=
NE, 0,	     SLEW),
 	NPCM7XX_PINCFG(205,	  ddc, NONE, 0,           gpio, MFSEL3, 22,	none, NO=
NE, 0,	     SLEW),
-	NPCM7XX_PINCFG(206,	  ddc, NONE, 0,           gpio, MFSEL3, 22,	none, NO=
NE, 0,	     DS(4, 8)),
-	NPCM7XX_PINCFG(207,	  ddc, NONE, 0,           gpio, MFSEL3, 22,	none, NO=
NE, 0,	     DS(4, 8)),
+	NPCM7XX_PINCFG(206,	  ddc, NONE, 0,           gpio, MFSEL3, 22,	none, NO=
NE, 0,	     DSTR(4, 8)),
+	NPCM7XX_PINCFG(207,	  ddc, NONE, 0,           gpio, MFSEL3, 22,	none, NO=
NE, 0,	     DSTR(4, 8)),
 	NPCM7XX_PINCFG(208,       rg2, MFSEL4, 24,         ddr, MFSEL3, 26,     =
none, NONE, 0,       0),
 	NPCM7XX_PINCFG(209,       rg2, MFSEL4, 24,         ddr, MFSEL3, 26,     =
none, NONE, 0,       0),
 	NPCM7XX_PINCFG(210,       rg2, MFSEL4, 24,         ddr, MFSEL3, 26,     =
none, NONE, 0,       0),
@@ -1147,20 +1147,20 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(216,   rg2mdio, MFSEL4, 23,         ddr, MFSEL3, 26,     =
none, NONE, 0,       0),
 	NPCM7XX_PINCFG(217,   rg2mdio, MFSEL4, 23,         ddr, MFSEL3, 26,     =
none, NONE, 0,       0),
 	NPCM7XX_PINCFG(218,     wdog1, MFSEL3, 19,        none, NONE, 0,	none, N=
ONE, 0,	     0),
-	NPCM7XX_PINCFG(219,     wdog2, MFSEL3, 20,        none, NONE, 0,	none, N=
ONE, 0,	     DS(4, 8)),
+	NPCM7XX_PINCFG(219,     wdog2, MFSEL3, 20,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(4, 8)),
 	NPCM7XX_PINCFG(220,	smb12, MFSEL3, 5,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(221,	smb12, MFSEL3, 5,	  none, NONE, 0,	none, NONE, 0,	  =
   0),
 	NPCM7XX_PINCFG(222,     smb13, MFSEL3, 6,         none, NONE, 0,	none, N=
ONE, 0,	     0),
 	NPCM7XX_PINCFG(223,     smb13, MFSEL3, 6,         none, NONE, 0,	none, N=
ONE, 0,	     0),

 	NPCM7XX_PINCFG(224,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     SLEW),
-	NPCM7XX_PINCFG(225,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DS(8, 12) | SLEW | GPO),
-	NPCM7XX_PINCFG(226,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DS(8, 12) | SLEW | GPO),
-	NPCM7XX_PINCFG(227,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(228,   spixcs1, MFSEL4, 28,        none, NONE, 0,	none, N=
ONE, 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(229,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(230,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DS(8, 12) | SLEW),
-	NPCM7XX_PINCFG(231,    clkreq, MFSEL4, 9,         none, NONE, 0,        =
none, NONE, 0,	     DS(8, 12)),
+	NPCM7XX_PINCFG(225,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DSTR(8, 12) | SLEW | GPO),
+	NPCM7XX_PINCFG(226,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DSTR(8, 12) | SLEW | GPO),
+	NPCM7XX_PINCFG(227,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(228,   spixcs1, MFSEL4, 28,        none, NONE, 0,	none, N=
ONE, 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(229,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(230,	 spix, MFSEL4, 27,        none, NONE, 0,	none, NONE,=
 0,	     DSTR(8, 12) | SLEW),
+	NPCM7XX_PINCFG(231,    clkreq, MFSEL4, 9,         none, NONE, 0,        =
none, NONE, 0,	     DSTR(8, 12)),
 	NPCM7XX_PINCFG(253,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  GPI), /* SDHC1 power */
 	NPCM7XX_PINCFG(254,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  GPI), /* SDHC2 power */
 	NPCM7XX_PINCFG(255,	 none, NONE, 0,		  none, NONE, 0,	none, NONE, 0,	   =
  GPI), /* DACOSEL */
=2D-
2.34.1

