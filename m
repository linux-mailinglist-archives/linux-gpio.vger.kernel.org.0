Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6D4CF1C9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 06:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbfJHEl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 00:41:28 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:41631 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729656AbfJHEl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 00:41:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 983CE5B3E;
        Tue,  8 Oct 2019 00:41:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 08 Oct 2019 00:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=GhXRb+nFJbQ1J
        lYVdwDdYTE4/+duajXpoQXuOmm9rjs=; b=OA7b7JRy4RKEomRGji3QCRpTtMQji
        AiW0QomZFSXLidGORl5iEszZ1mSxL5u2O5N+O5OELQYGjy5TutWzdr6ai2PTZSF2
        YGZ23vHDCAdN+QrLxdq8N8bG0yl3iLv0SyJJ84WR0VR9IYQFmGtUgqXDg/QlIr+n
        n0dmtZB1oKW51cW1TxzLPSdUWaJD9HSgqPpySph7lf7lLyLEfbDNbwwc1s81tEl3
        pxrNbo9c2fk1xLKCpauuSJaxPcOr+D9Tyh9bRGkWgiCk0L9dJt4wK9RDsgvW2YmE
        RBCEAjz4t/vDjttAuy+b7NTZmXjCoaCKo+W+xwIp4IIpBJqMpZDBBml3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=GhXRb+nFJbQ1JlYVdwDdYTE4/+duajXpoQXuOmm9rjs=; b=AuQK1eI4
        jOoeqajlYPJaY6zz+52orU7B7GOsUutq4zj9ufgl6S6Jcs60Qbd/QA3/4fjivzWy
        usIKStP5zifpZE2lIX7E019zrDDF6DMYQE6oVMTeiQXE0+p7ytnNdjyd045gTkAh
        vU6wdz6nH5sWQDA1RaSmVEFg3QLTH/2BwmeTlIxz7uAC7wJ1Kox1RD4/eYG4gobW
        rSt6IDGdlKrlwgVsCghjlyRWOW7/Rg6JKNexWukHHMz9qurk1ZJkj6RTrVNC6Q0s
        LbqCZCiHG0f+IHo+iRxmfz8aOEBWlFxzGI2CKvmRQoLubOZ74W05w6M/Sl+ADFT/
        2O9SAom49fax+A==
X-ME-Sender: <xms:cxOcXe8J5rfoK2Qn2N8i44u8jO_k1EE-wBuIxac6uM9Ddcvyql2jBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
    td
X-ME-Proxy: <xmx:cxOcXeSL2gMAhYkOcuJiSRCkDfcFKPFq3QG_pYT0RfozXCOlveefJA>
    <xmx:cxOcXae4bFswYcCz6e0yMBxoaN0Uoe7RBAqUrh3vUfqTjMVwwCWSPA>
    <xmx:cxOcXWB38CiAxQAjPzbiKLlB4yfxioP5DDcwYCkPZUsBVn5rQrzzqQ>
    <xmx:dROcXWWVRT-jYrYz5KUZnh9KQ9UqKQACsoEZN7szALw4xDA3RMxFAQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 24B4280065;
        Tue,  8 Oct 2019 00:41:19 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, johnny_huang@aspeedtech.com,
        ryanchen.aspeed@gmail.com
Subject: [PATCH 1/7] dt-bindings: pinctrl: aspeed-g6: Rework SD3 function and groups
Date:   Tue,  8 Oct 2019 15:11:47 +1030
Message-Id: <20191008044153.12734-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
References: <20191008044153.12734-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename SD3 functions and groups to EMMC to better reflect their intended
use before the binding escapes too far into the wild. Also clean up the
SD3 pin groups to eliminate some silliness that slipped through the
cracks (SD3DAT[4-7]) by unifying them into three new groups: EMMCG1,
EMMCG4 and EMMCG8 for 1, 4 and 8-bit data buses respectively.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Unfortunately reflowing the list creates a lot of noise in this change. As
mentioned the SD3DAT[4-7] groups are renamed, as is the SD3 function. There
should be no functional changes beyond that.

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 86 +++++++++----------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index f83d888176cc..064b7dfc4252 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -33,13 +33,13 @@ patternProperties:
           allOf:
             - $ref: "/schemas/types.yaml#/definitions/string"
             - enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
-              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, ESPI,
-              ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID, FWSPIWP, GPIT0, GPIT1,
-              GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1, GPIU2,
-              GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, I2C1, I2C10, I2C11, I2C12,
-              I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5, I2C6, I2C7,
-              I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ, LPC,
-              LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2,
+              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMC,
+              ESPI, ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID, FWSPIWP, GPIT0,
+              GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
+              GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, I2C1, I2C10, I2C11,
+              I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5, I2C6,
+              I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ,
+              LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2,
               MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2,
               NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3,
               NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1,
@@ -48,47 +48,45 @@ patternProperties:
               PWM8, PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3,
               RMII4, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12,
               SALT13, SALT14, SALT15, SALT16, SALT2, SALT3, SALT4, SALT5,
-              SALT6, SALT7, SALT8, SALT9, SD1, SD2, SD3, SD3DAT4, SD3DAT5,
-              SD3DAT6, SD3DAT7, SGPM1, SGPS1, SIOONCTRL, SIOPBI, SIOPBO,
-              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1,
-              SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11,
-              TACH12, TACH13, TACH14, TACH15, TACH2, TACH3, TACH4, TACH5,
-              TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2, THRU3, TXD1,
-              TXD2, TXD3, TXD4, UART10, UART11, UART12, UART13, UART6, UART7,
-              UART8, UART9, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3,
-              WDTRST4, ]
+              SALT6, SALT7, SALT8, SALT9, SD1, SD2, SGPM1, SGPS1, SIOONCTRL,
+              SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
+              SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1,
+              TACH10, TACH11, TACH12, TACH13, TACH14, TACH15, TACH2, TACH3,
+              TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2,
+              THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12, UART13,
+              UART6, UART7, UART8, UART9, VB, VGAHS, VGAVS, WDTRST1, WDTRST2,
+              WDTRST3, WDTRST4, ]
         groups:
           allOf:
             - $ref: "/schemas/types.yaml#/definitions/string"
             - enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
-              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, ESPI,
-              ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID, FWQSPID, FWSPIWP, GPIT0,
-              GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
-              GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, HVI3C3, HVI3C4, I2C1,
-              I2C10, I2C11, I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3,
-              I2C4, I2C5, I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6,
-              JTAGM, LHPD, LHSIRQ, LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ,
-              MACLINK1, MACLINK2, MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3,
-              MDIO4, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4,
-              NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1,
-              NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE,
-              PWM0, PWM1, PWM10G0, PWM10G1, PWM11G0, PWM11G1, PWM12G0, PWM12G1,
-              PWM13G0, PWM13G1, PWM14G0, PWM14G1, PWM15G0, PWM15G1, PWM2, PWM3,
-              PWM4, PWM5, PWM6, PWM7, PWM8G0, PWM8G1, PWM9G0, PWM9G1, QSPI1,
-              QSPI2, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3,
-              RMII4, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10G0, SALT10G1,
-              SALT11G0, SALT11G1, SALT12G0, SALT12G1, SALT13G0, SALT13G1,
-              SALT14G0, SALT14G1, SALT15G0, SALT15G1, SALT16G0, SALT16G1,
-              SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8, SALT9G0,
-              SALT9G1, SD1, SD2, SD3, SD3DAT4, SD3DAT5, SD3DAT6, SD3DAT7,
-              SGPM1, SGPS1, SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD,
-              SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
-              SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11, TACH12, TACH13,
-              TACH14, TACH15, TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8,
-              TACH9, THRU0, THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4,
-              UART10, UART11, UART12G0, UART12G1, UART13G0, UART13G1, UART6,
-              UART7, UART8, UART9, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3,
-              WDTRST4, ]
+              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMCG1,
+              EMMCG4, EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID,
+              FWQSPID, FWSPIWP, GPIT0, GPIT1, GPIT2, GPIT3, GPIT4, GPIT5,
+              GPIT6, GPIT7, GPIU0, GPIU1, GPIU2, GPIU3, GPIU4, GPIU5, GPIU6,
+              GPIU7, HVI3C3, HVI3C4, I2C1, I2C10, I2C11, I2C12, I2C13, I2C14,
+              I2C15, I2C16, I2C2, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9,
+              I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ, LPC, LPCHC, LPCPD,
+              LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2, MACLINK3, MACLINK4,
+              MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1,
+              NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2,
+              NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4,
+              OSCCLK, PEWAKE, PWM0, PWM1, PWM10G0, PWM10G1, PWM11G0, PWM11G1,
+              PWM12G0, PWM12G1, PWM13G0, PWM13G1, PWM14G0, PWM14G1, PWM15G0,
+              PWM15G1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, PWM8G0, PWM8G1,
+              PWM9G0, PWM9G1, QSPI1, QSPI2, RGMII1, RGMII2, RGMII3, RGMII4,
+              RMII1, RMII2, RMII3, RMII4, RXD1, RXD2, RXD3, RXD4, SALT1,
+              SALT10G0, SALT10G1, SALT11G0, SALT11G1, SALT12G0, SALT12G1,
+              SALT13G0, SALT13G1, SALT14G0, SALT14G1, SALT15G0, SALT15G1,
+              SALT16G0, SALT16G1, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7,
+              SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPS1, SIOONCTRL,
+              SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
+              SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1,
+              TACH10, TACH11, TACH12, TACH13, TACH14, TACH15, TACH2, TACH3,
+              TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0, THRU1, THRU2,
+              THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12G0,
+              UART12G1, UART13G0, UART13G1, UART6, UART7, UART8, UART9, VB,
+              VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4, ]
 
 required:
   - compatible
-- 
2.20.1

