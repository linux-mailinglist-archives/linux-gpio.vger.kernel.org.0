Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E200C666DC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2019 08:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbfGLGRr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jul 2019 02:17:47 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41281 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725791AbfGLGRq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jul 2019 02:17:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1EB192223A;
        Fri, 12 Jul 2019 02:17:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 12 Jul 2019 02:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=LxE0mQurpNi+Nw2gFJjTVSZyJ5
        bmZmtxq8G3mOjaB4Y=; b=cOhV8JN4QdIbJq6mnKkWb3psnXYiBgz6yYy6uCPRNb
        kUjYrUdSF1OYULFdZn2ycjAx9I4m4uHz+62bSnC3+4iMgZVqtufuDx1eCPuL6ucc
        RvGrH1K0RBLg+2oe/4ZSfZasKD5pmHUmDyGKl4t97xxuAhHSCYsUb8zuAtISmE1C
        nrq7gpmiyAc5KsMq/5tNNaKLlnnh0rqMg/F08175gMipURW5Vx514N26FfTPCpvV
        asTmMOOb2jSqohbA0qPOGXdfm08gws3cDv47oLt5P1gs/FXOa+RAKAj5su/HGfS4
        4MxnJesrSDca+9d2zJnKH9ZLgCJRhH1qtDH0tobFKmBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LxE0mQurpNi+Nw2gF
        JjTVSZyJ5bmZmtxq8G3mOjaB4Y=; b=Ekaet4pKp7NOusIIXUjozF3wXk5SH7ITl
        g5xXkkjizrwxfXQSpwgw+7ahsYcN/xJvTbhfFFsR2viWv3q3dgbqbR4A0rdNi9Qr
        rhj4XDNJ5qrpNITkuqGczINkrdSwmK+eUndGT/8ib+dDdGEJMhnuDNNjMWL4YC5K
        E3USkl19fhqi5XU3OQ/sigSZMNswj++PW7xbxgijRd7YgsLMrXAVt3+U4A6yYojl
        p3AdIbjtzSbjCo0ETH4AGQHrAL02ysljnDSy/tM2pn1O/3nyqSkn+Ib1HWpXbyRX
        yqn0Q/fG9IpaaK0yZNBHHqwmtef67oHe2A5KV4yCAft1J6sHIDcPw==
X-ME-Sender: <xms:ByYoXcmxA-4Wr3Jy0LkJne05TdZA9b7mn5sMJLPNnxhuQAfDrO6F0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
    durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ByYoXS0JyD-YpmQ7qxRvKTO_gFcrLUklHGdqlr_WUziHQ4PXX0h6KA>
    <xmx:ByYoXfpj0Mk3dS2kzyOsoOcyYJzZd1-daKLsnhpKvHm_sqzzVi_ArA>
    <xmx:ByYoXXc7JfeCZRCuUaV1wbfMws6ALoyMRTjk5hEWPLSR7O7ee-5Qmw>
    <xmx:CSYoXTBVGv1m8K6A49B6Ul33Qco8-a4X_ro3VAb0grJXbSa7pGTkYA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4A26D380074;
        Fri, 12 Jul 2019 02:17:40 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Strip unnecessary quotes
Date:   Fri, 12 Jul 2019 15:47:21 +0930
Message-Id: <20190712061721.26645-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rob pointed out that we didn't need the noise of the quotes in a
separate review[1], so strip them out for consistency and avoid setting
a bad example.

[1] https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/002009.html

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

This patch applies to the tip of pinctrl/devel where the aspeed pinctrl binding
conversion patches have already landed.

 .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 40 ++++++++---------
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 45 +++++++++----------
 2 files changed, 38 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 61a110a7db8a..faedfed0769c 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -33,28 +33,24 @@ patternProperties:
         "^function|groups$":
           allOf:
             - $ref: "/schemas/types.yaml#/definitions/string"
-            - enum: [ "ACPI", "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
-              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
-              "ADC8", "ADC9", "BMCINT", "DDCCLK", "DDCDAT", "EXTRST", "FLACK",
-              "FLBUSY", "FLWP", "GPID", "GPID0", "GPID2", "GPID4", "GPID6",
-              "GPIE0", "GPIE2", "GPIE4", "GPIE6", "I2C10", "I2C11", "I2C12",
-              "I2C13", "I2C14", "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8",
-              "I2C9", "LPCPD", "LPCPME", "LPCRST", "LPCSMI", "MAC1LINK",
-              "MAC2LINK", "MDIO1", "MDIO2", "NCTS1", "NCTS2", "NCTS3", "NCTS4",
-              "NDCD1", "NDCD2", "NDCD3", "NDCD4", "NDSR1", "NDSR2", "NDSR3",
-              "NDSR4", "NDTR1", "NDTR2", "NDTR3", "NDTR4", "NDTS4", "NRI1",
-              "NRI2", "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS3", "OSCCLK",
-              "PWM0", "PWM1", "PWM2", "PWM3", "PWM4", "PWM5", "PWM6", "PWM7",
-              "RGMII1", "RGMII2", "RMII1", "RMII2", "ROM16", "ROM8", "ROMCS1",
-              "ROMCS2", "ROMCS3", "ROMCS4", "RXD1", "RXD2", "RXD3", "RXD4",
-              "SALT1", "SALT2", "SALT3", "SALT4", "SD1", "SD2", "SGPMCK",
-              "SGPMI", "SGPMLD", "SGPMO", "SGPSCK", "SGPSI0", "SGPSI1", "SGPSLD",
-              "SIOONCTRL", "SIOPBI", "SIOPBO", "SIOPWREQ", "SIOPWRGD", "SIOS3",
-              "SIOS5", "SIOSCI", "SPI1", "SPI1DEBUG", "SPI1PASSTHRU", "SPICS1",
-              "TIMER3", "TIMER4", "TIMER5", "TIMER6", "TIMER7", "TIMER8", "TXD1",
-              "TXD2", "TXD3", "TXD4", "UART6", "USB11D1", "USB11H2", "USB2D1",
-              "USB2H1", "USBCKI", "VGABIOS_ROM", "VGAHS", "VGAVS", "VPI18",
-              "VPI24", "VPI30", "VPO12", "VPO24", "WDTRST1", "WDTRST2" ]
+            - enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14,
+              ADC15, ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT,
+              DDCCLK, DDCDAT, EXTRST, FLACK, FLBUSY, FLWP, GPID, GPID0, GPID2,
+              GPID4, GPID6, GPIE0, GPIE2, GPIE4, GPIE6, I2C10, I2C11, I2C12,
+              I2C13, I2C14, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9, LPCPD,
+              LPCPME, LPCRST, LPCSMI, MAC1LINK, MAC2LINK, MDIO1, MDIO2, NCTS1,
+              NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2,
+              NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NDTS4, NRI1, NRI2,
+              NRI3, NRI4, NRTS1, NRTS2, NRTS3, OSCCLK, PWM0, PWM1, PWM2, PWM3,
+              PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1, RMII2, ROM16,
+              ROM8, ROMCS1, ROMCS2, ROMCS3, ROMCS4, RXD1, RXD2, RXD3, RXD4,
+              SALT1, SALT2, SALT3, SALT4, SD1, SD2, SGPMCK, SGPMI, SGPMLD,
+              SGPMO, SGPSCK, SGPSI0, SGPSI1, SGPSLD, SIOONCTRL, SIOPBI, SIOPBO,
+              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1DEBUG,
+              SPI1PASSTHRU, SPICS1, TIMER3, TIMER4, TIMER5, TIMER6, TIMER7,
+              TIMER8, TXD1, TXD2, TXD3, TXD4, UART6, USB11D1, USB11H2, USB2D1,
+              USB2H1, USBCKI, VGABIOS_ROM, VGAHS, VGAVS, VPI18, VPI24, VPI30,
+              VPO12, VPO24, WDTRST1, WDTRST2 ]
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index cf561bd55128..d1984f619b74 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -42,31 +42,26 @@ patternProperties:
         "^function|groups$":
           allOf:
             - $ref: "/schemas/types.yaml#/definitions/string"
-            - enum: [ "ACPI", "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
-              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
-              "ADC8", "ADC9", "BMCINT", "DDCCLK", "DDCDAT", "ESPI", "FWSPICS1",
-              "FWSPICS2", "GPID0", "GPID2", "GPID4", "GPID6", "GPIE0", "GPIE2",
-              "GPIE4", "GPIE6", "I2C10", "I2C11", "I2C12", "I2C13", "I2C14",
-              "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8", "I2C9", "LAD0",
-              "LAD1", "LAD2", "LAD3", "LCLK", "LFRAME", "LPCHC", "LPCPD",
-              "LPCPLUS", "LPCPME", "LPCRST", "LPCSMI", "LSIRQ", "MAC1LINK",
-              "MAC2LINK", "MDIO1", "MDIO2", "NCTS1", "NCTS2", "NCTS3", "NCTS4",
-              "NDCD1", "NDCD2", "NDCD3", "NDCD4", "NDSR1", "NDSR2", "NDSR3",
-              "NDSR4", "NDTR1", "NDTR2", "NDTR3", "NDTR4", "NRI1", "NRI2",
-              "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS3", "NRTS4", "OSCCLK",
-              "PEWAKE", "PNOR", "PWM0", "PWM1", "PWM2", "PWM3", "PWM4", "PWM5",
-              "PWM6", "PWM7", "RGMII1", "RGMII2", "RMII1", "RMII2", "RXD1",
-              "RXD2", "RXD3", "RXD4", "SALT1", "SALT10", "SALT11", "SALT12",
-              "SALT13", "SALT14", "SALT2", "SALT3", "SALT4", "SALT5", "SALT6",
-              "SALT7", "SALT8", "SALT9", "SCL1", "SCL2", "SD1", "SD2", "SDA1",
-              "SDA2", "SGPS1", "SGPS2", "SIOONCTRL", "SIOPBI", "SIOPBO",
-              "SIOPWREQ", "SIOPWRGD", "SIOS3", "SIOS5", "SIOSCI", "SPI1",
-              "SPI1CS1", "SPI1DEBUG", "SPI1PASSTHRU", "SPI2CK", "SPI2CS0",
-              "SPI2CS1", "SPI2MISO", "SPI2MOSI", "TIMER3", "TIMER4", "TIMER5",
-              "TIMER6", "TIMER7", "TIMER8", "TXD1", "TXD2", "TXD3", "TXD4",
-              "UART6", "USB11BHID", "USB2AD", "USB2AH", "USB2BD", "USB2BH",
-              "USBCKI", "VGABIOSROM", "VGAHS", "VGAVS", "VPI24", "VPO",
-              "WDTRST1", "WDTRST2", ]
+            - enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14,
+              ADC15, ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT,
+              DDCCLK, DDCDAT, ESPI, FWSPICS1, FWSPICS2, GPID0, GPID2, GPID4,
+              GPID6, GPIE0, GPIE2, GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13,
+              I2C14, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9, LAD0, LAD1,
+              LAD2, LAD3, LCLK, LFRAME, LPCHC, LPCPD, LPCPLUS, LPCPME, LPCRST,
+              LPCSMI, LSIRQ, MAC1LINK, MAC2LINK, MDIO1, MDIO2, NCTS1, NCTS2,
+              NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3,
+              NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1,
+              NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PNOR, PWM0, PWM1, PWM2,
+              PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1, RMII2, RXD1,
+              RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13, SALT14,
+              SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8, SALT9, SCL1,
+              SCL2, SD1, SD2, SDA1, SDA2, SGPS1, SGPS2, SIOONCTRL, SIOPBI,
+              SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1CS1,
+              SPI1DEBUG, SPI1PASSTHRU, SPI2CK, SPI2CS0, SPI2CS1, SPI2MISO,
+              SPI2MOSI, TIMER3, TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1,
+              TXD2, TXD3, TXD4, UART6, USB11BHID, USB2AD, USB2AH, USB2BD,
+              USB2BH, USBCKI, VGABIOSROM, VGAHS, VGAVS, VPI24, VPO, WDTRST1,
+              WDTRST2, ]
 
 required:
   - compatible
-- 
2.20.1

