Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A483B37FB43
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 18:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235030AbhEMQLJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 May 2021 12:11:09 -0400
Received: from mout.gmx.net ([212.227.15.15]:45725 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234935AbhEMQLI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 May 2021 12:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620922192;
        bh=yHZOanl+7lAyfwZ0IKQ6jvxuiFtoltCg8sl+03ShmH8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=d+EgMSyb8QmROW7hWrcbZbGSFvtly7XWapxJTLlocdzDTSNRbaXW4JNazd0n/553a
         mhW3WsvKOKEwylAliV/tEJGsPShzih34d0jZBbzwdfJVT3vRjvfew34h2pe7BUF246
         ZLHZy8SGrTeVO0pEujSJveVUo3FQSnDY91BFiKgY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MirjS-1l2g1U0sFQ-00eqXh; Thu, 13
 May 2021 18:09:52 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: npcm: Align a few entries in the pin function table
Date:   Thu, 13 May 2021 18:09:47 +0200
Message-Id: <20210513160947.1716185-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4D7VmaLIN+x85KYn/jYiQDttmjIIFuuEsO2Z9vGGTBF4nN3Pbyy
 jU2CGRW7MY+T05JPVnU5O6qUQyKcwTpeX02qZOnpddMw4sHu3ENMXIv0sh4Eo5r7icFf980
 EhANrto7NeDtge2KIaIe/BEy9Rjciet6NG3T3UHmmeJNRHVbiDf31W5YIk6jY18ejr9kR5/
 cqUHc5RnuRndhF29Fd39g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9KenyV4S/E8=:vGJrOuYx47XMY5OwuK5JWf
 XPG9gkfiAHIoOzCC0lMuMCC3YDFLEVrdAnWU+A0h0Qgry9D6nZpO91+iKKTK2RyWYHDumv05T
 6BGruyJaDBS/NOuHKz7mL/DMDwXmDQgTEdjBZSPKhF/Od/ypraAMydRilF6E5IFsEWS/gY15A
 mPWD3GP7BIrDiWUBGGFsQqjGdTSIFRliZQyyt8v7vdigttY9DJpA+pFszWUe+godumb75DcLP
 zUQzwliltKxhRgjXt24ihAEH5rHfXulzZJcjYLBxt0t1eH5NEuTrh7TT0yllJ1AomP97HWFQ+
 ErE7jvyWd7Ih7VEajShQZoDYSU5RGkd0l2qWjO1AmyuXQW/HDJpVErd+89RLYNt5/685B9VhR
 cD4CrDSGS7l6B7u/zfVqPnuGF3UP3ZmNo9Rj25x2UoJ9e/kq/cV4OAM3BxjlfFduaTpYzsn+7
 IxaQlemub6Rwoopgp/qH1GSykBm6StTKeduoQVgcRr6oawUhBrIBnms4//thpo4NuS4sT/X1t
 Eb1n/JTTVurLxqh8scfAocCXh4/MJesrFtC88hxm0aL3Zwwsb3ljzyAUZNZN/3O6jttIGRt1p
 lc0TP0H0s+fmuNVZ+pJHlEdcuGb1biGXLKCF2r+TWAziOWDyVil5Z3jU4GwhbZVWlYtOjaQwT
 stRqwH2FjE0/YVYW6oyK3ZEF//j9kwI/4EGovDcx8boiU+Q5n+UlNHs586c25E6CwFQOxTNSa
 N2Qpv7/+cqiQdOLhHOoKgpJgTCYre97DHGDpAzQJchZ3la4ipF91g9BudRp7laCt4cnUvOdGR
 NnNQmmp4twFJsw7y5hLaWp2mma7EJOfFcHO4lWaeznoxz92cN/L7SCq06iZuG8iH+9JTTYrFu
 h7JxxNdDKnL///obFMAC2WsadW1qWMHlZE3u8z+PDilnKGhX1os7obYZvbenDL7OX/cw2Yw5J
 OIRDm22VIm24vtDdah/uUs7TSpVptSuVsRwnAaeixLbmjnCb9zC5DB13h0s6wqHrQAsiDMWfN
 HkvYyc+NWG4623nqOU3w3wb4D28LrSRt86i/TF9jtQ5JrWxdgV/9fr6wVlOxHR3uOp2Adqu/l
 by+g4Q7+CVoJ4sTXuKy6vbWKCBmDBafdD5Hojlub1hsAghTX0tvi3qTn73ISeJU0yqlf8+2la
 gadXZaHPd0/JUOnPEH24iWu6H7A/xt45KiZn673XCYTDhs/bRk8k8+0GumcgE1aMDvLetxehG
 BzbPde71UzTGwdaHX
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The entries for GPIO 33 and 34 are not properly aligned. Fix the
alignment.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/n=
uvoton/pinctrl-npcm7xx.c
index 2535ca720668e..bb1ea47ec4c60 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -958,8 +958,8 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(31,	 smb3, MFSEL1, 0,	  none, NONE, 0,	none, NONE, 0,	   =
  0),

 	NPCM7XX_PINCFG(32,    spi0cs1, MFSEL1, 3,	  none, NONE, 0,	none, NONE, 0=
,	     0),
-	NPCM7XX_PINCFG(33,   none, NONE, 0,     none, NONE, 0,	none, NONE, 0,	  =
   SLEW),
-	NPCM7XX_PINCFG(34,   none, NONE, 0,     none, NONE, 0,	none, NONE, 0,	  =
   SLEW),
+	NPCM7XX_PINCFG(33,	 none, NONE, 0,           none, NONE, 0,	none, NONE, =
0,	     SLEW),
+	NPCM7XX_PINCFG(34,	 none, NONE, 0,           none, NONE, 0,	none, NONE, =
0,	     SLEW),
 	NPCM7XX_PINCFG(37,	smb3c, I2CSEGSEL, 12,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
 	NPCM7XX_PINCFG(38,	smb3c, I2CSEGSEL, 12,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
 	NPCM7XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
=2D-
2.30.2

