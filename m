Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166C73096DD
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jan 2021 17:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhA3QnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Jan 2021 11:43:00 -0500
Received: from mout.gmx.net ([212.227.17.21]:49099 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231138AbhA3Qm6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 30 Jan 2021 11:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1612024879;
        bh=bkD8tcc6TQ6B0xOy5hnrRvxDcXEQXOxiPgjHK8m2mBk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=aTuZDq5/TLFVaIn3GEtF6VXjwBDef5ys6S8Oyynrdj6Il0N2K9xhyGqxo4rBiGK+n
         nmL1ZNb5DPFz3WXSrfMX/IfWSTWm0mu/fsUFhtXLupDrooLWu2gDCqp2/wNX1mmMrv
         l/nCTqvSvWpvC/xwXu028TJ6/iaLbN+5CWqJ/s38=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1lWOFa1qls-00QOqV; Sat, 30
 Jan 2021 17:30:14 +0100
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
Subject: [PATCH] pinctrl: nuvoton: npcm7xx: Fix alignment of table header comment
Date:   Sat, 30 Jan 2021 17:29:54 +0100
Message-Id: <20210130162954.918803-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ar8P1SrjiMzeBjeLD2FlFDJqNHYVchuE9yDVDvh6Zy+QsFQjozw
 H8WZrSyR2d4RhWcry1Hl/jPs07imTmkTfLjXops3a1WHxJq9o91OASaVEU31u55ne6/FIGU
 dkLl6eYclyUr0f2OBZIpVBXZxMQ5hhtAm4Oor2X7V/K0dGiijU8XSzR7fXP5ApSBR0qUQBC
 QgZnjvEE+V09rjdZh7AVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xUM3OQ6f0Xc=:nK1f2Rad6YK1Z+dBb0m/a2
 JsmjfCLd/ujE23rGka7oNeWWzkBu94ercIzZmQsCZVhGAfLqauvYGzAsrUaq5mxwrn3ekTIha
 cPpjBnnE85hE47tJvNvqqq4qGmaa4Kf1UiZmPNyu9OIvB5olPJ+FoNcjF0qli21SqwwP3W0e1
 VKb9zt3QvEZJY7NQRmxtq/YYGHtiSHaVnKliPVKQGzThkDCVn5aWGsg8lsddFMFhmqqBt1LFP
 pLZ5vs7HfZTkukpFGgAWCUdDZZIQPUvqaQonGOZ8jjPBmGtSaK1+TDGs7n7DvBbR0TW5kS9aF
 MBvHU8eP9TcyawVUVjR7Vg0PMj71T4FnJMUkV9UT8gmdXc/2HhnXrAagoznQmjzo3+eASZgxX
 HrhRupVJOGtCDFtDO3aspWnZcT9M8mg3+T0DHu7xcgW9/Fl9kJN7l/dHiWw4GcQCua96htU97
 b+ttCidcf76Z8jIO4hf3WK0lEjjPQS7BQETzLMln+9csqQmfOHaXZsup5frfUUSuY9BCcXvdV
 DgTxsOxlb6s9KkCl3iWwJQuzBhsjl21rPpKJMFoPezWKOfrLJzvyRh8sPNjf8I/0LZSRysW8v
 A9NYWpGz70hh9G1Ef9OJaEHuhAKhuPs76+usqJcjRF1qNjJOed9J2feUx2+H4UyRIxDi+WRKJ
 bdfUTSgV0iiVC8TrSr3rPOouQrd+ht076zopLLfdCPTIgs8LR36jJ4Oa4VS16yiZvQSKvBrzT
 cmEVpP+PrDVoAAe06bfIgHwsNlc33Ver6683LWvF2TmuyKgtdxSL3K8njlsKRnTF4ANDg8wuf
 0TBMqMOsHvqqnkrMT56wUyGDXB8O0G8sPOHghPkzxoIZHxqbAcX9OaZkTJAKdsGaO24VURT3e
 pFI9DGr6lx25NeTaoaXQ==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make it so that each column label is in the column that it is supposed
to refer to.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/n=
uvoton/pinctrl-npcm7xx.c
index 6de31b5ee358c..2535ca720668e 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -923,7 +923,7 @@ struct npcm7xx_pincfg {
 };

 static const struct npcm7xx_pincfg pincfg[] =3D {
-	/*	PIN	  FUNCTION 1		   FUNCTION 2		  FUNCTION 3	    FLAGS */
+	/*		PIN	  FUNCTION 1		   FUNCTION 2		  FUNCTION 3	    FLAGS */
 	NPCM7XX_PINCFG(0,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
 	NPCM7XX_PINCFG(1,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),
 	NPCM7XX_PINCFG(2,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),
=2D-
2.29.2

