Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2F96F91A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfGVF4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:03 -0400
Received: from mout.gmx.net ([212.227.17.20]:35555 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727360AbfGVF4D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774941;
        bh=Mfs0KFxfuAdl7r1+zeKQYCRtJqTlchom4wahS0rVa9E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LAI7HzhkHmg0EPk8R4lCkHHwMYmBL/H+4RGITe1XCKHXI8kDAlC4Kwr62UM3Z4ub/
         9w4invLuc3itgf0SJaJhZjT28rmBIHGhWfIeHS9YGvm73Eu9WF6VolxM+Lc2TMT1ST
         F7DTv1lnEgq1rrlWG66rNGsFjQJbk99tnZSXHn04=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0M96Jd-1hhU9J4AwP-00CPJs; Mon, 22
 Jul 2019 07:55:41 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 08/18] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
Date:   Mon, 22 Jul 2019 07:54:39 +0200
Message-Id: <1563774880-8061-9-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:jOIrka6HlPmHspKjerxs8OHrw+5PSYK7EHf98yzfquXNqTlzaXl
 wqkK02jPXet29eNpvVl6ZCzFT2lDri2YewY5qZYpxPQUlkZaWrqUIjd2H/Vys6vakrEUTLX
 ER5H5A3MWuLkIC9HB/NE+VPVgtGmoN2CRUXq/cpr8hxEVlgMOMmaiLIdiXKGJ9kSRPHWW8y
 11kSozk9voAcY7UBmqx4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RvlB6W0jnFk=:zEnFQRGi6xEmsCsXqgqK6v
 Z86h5PRUbMVuiSbhbpJaaA+iOunXMXODXGIhNbqsxjooEG7RNNMv0+70im+kVOX6Bmm1TkwgE
 Em3rqLuS967zU3WntcmqEp7th1aXZZBTdf06hvQbFoANkn7t2s9jJNAQp3HmJ1vTBEA1joeH8
 jxZjy9+7G7cN4qSuFNmX/U+kDlsOKC9BncLZMg45zW1PY05lnbxn3g9uBofAnjndVXK1Phaho
 SRQMyDsqL/MySpzJTgU3A9FFIG2OGmy/H4H98nhiJRLx6CMORL2RIc8eUPkrEcJkNi0z0dhzb
 wCIbvHgTHy/BwmQRXeseoiYbgbLu933IUGWrvR15B6n02rCOiZkqbvAVJj+HCt1dXTke5joEJ
 maxoaSzapET7qQaWKl7sxNd/cjBc3r703ZwDIG98se1g/65xpMtWPM5+7kNYxtNWFwU/yKx2m
 VC6O7+cS27lkSeYnwtcZqU8PeayjfbZY18DPPMwpOD3W+1zfARWiOII4Gg9qt2graoY6zZlWp
 D0tw0dfpYW+0sdPZ9Sym7PRz/KYzWwpE0nECgY1J5wamm7GbVFGtRAa9+cYDlQ+oF5eCT+ckh
 QvUoTYvbeRLE3q4kU8oj7POGXjqTHwGzssZPr4PFRELygCXDKiYA4j8NWoMvdXbOsHlYpzLTh
 EWvVHOSFECNsbaohLPj3XnmkmvcIonmfwfMEb/kJO+i50UOKJwXKZzMh+/ZeA4unqaH2bcIZt
 Sr8F905f6YHd/hzrU12tybLG17Gcml10oJmZ88+U51G0utiuKuZswgpH2C8QT0AQoFp5Fob9E
 Nzmcca6I73fVKPlrKQO3DSwCjg91EcbCqn3GX9exalRSBeQaPF4L65jJA4DiDjch8K3Cy/Lyr
 qiyMVd/2c0xICvUGEvYy3PofHZRUPVVQ8MY7aVNltDsL2V/+zcU7BqGTZs2ePmSFw+XApi8nG
 PEqsqTpLAgNN6UNVuDpg5T/aNfzwv0+uFvOsCRS4QnMyCarQnnZ6ak/sAeH80Ikys643uNeBh
 TDkyWiXi0VkNeNyp3JhdiLJWfY+iyirulvSxs//lmMc2fvcCQ+U8IoVN+EaN5yDhM9Z76Hq5u
 PlzqoEv/O6BHVo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The new BCM2711 supports an additional clock for the emmc2 block.
So add a new compatible and register this clock only for BCM2711.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 3231b76..fbdc4e1 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -114,6 +114,8 @@
 #define CM_AVEODIV		0x1bc
 #define CM_EMMCCTL		0x1c0
 #define CM_EMMCDIV		0x1c4
+#define CM_EMMC2CTL		0x1d0
+#define CM_EMMC2DIV		0x1d4

 /* General bits for the CM_*CTL regs */
 # define CM_ENABLE			BIT(4)
@@ -290,7 +292,8 @@
 #define BCM2835_MAX_FB_RATE	1750000000u

 #define SOC_BCM2835		BIT(0)
-#define SOC_ALL			(SOC_BCM2835)
+#define SOC_BCM2711		BIT(1)
+#define SOC_ALL			(SOC_BCM2835 | SOC_BCM2711)

 /*
  * Names of clocks used within the driver that need to be replaced
@@ -1999,6 +2002,16 @@ static const struct bcm2835_clk_desc clk_desc_array=
[] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 39),

+	/* EMMC2 clock (only available for BCM2711) */
+	[BCM2711_CLOCK_EMMC2]	=3D REGISTER_PER_CLK(
+		SOC_BCM2711,
+		.name =3D "emmc2",
+		.ctl_reg =3D CM_EMMC2CTL,
+		.div_reg =3D CM_EMMC2DIV,
+		.int_bits =3D 4,
+		.frac_bits =3D 8,
+		.tcnt_mux =3D 42),
+
 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
 		SOC_ALL,
@@ -2230,6 +2243,7 @@ static int bcm2835_clk_probe(struct platform_device =
*pdev)

 static const struct of_device_id bcm2835_clk_of_match[] =3D {
 	{ .compatible =3D "brcm,bcm2835-cprman", .data =3D (void *)SOC_BCM2835 }=
,
+	{ .compatible =3D "brcm,bcm2711-cprman", .data =3D (void *)SOC_BCM2711 }=
,
 	{}
 };
 MODULE_DEVICE_TABLE(of, bcm2835_clk_of_match);
=2D-
2.7.4

