Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCAC1D1386
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733243AbgEMM47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:59 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:29599 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733200AbgEMM45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374616; x=1620910616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tnLWmU9TG0hHNpiEsQJmeBvXg8PJsOm3nln/lwMbNII=;
  b=jWMv1SiElsKoLpJiDb0vND4QaEsOf5JjkWYiqsVDmZKGLDy2JO1FK26+
   WGvGBEjtWZFCa+xYTmaYP+VM40rFBwKqReHNIdfXVsZnxj2wHYGdajaVR
   zw4O+KXZBEfqf56D5objzPvlg6Zk7Nqa7lnoPFTDO7movSsp9Y413eLpm
   Aa9SHTnzzcK+u7Nbk0xM0KdqeMmvdXTEJfj0ilkkfjZAaeNDX3Ia1G+jr
   BhoS/LZZuliSeUKsmZRaAy1kmZG4RDEHmErJd8qFzuejKWDdBP6Eruz2K
   S87VNLQ77kPjMj1hoAY68rdS2QMo0YkF3dtY/eOFZO3plDMZGmrT/z51V
   w==;
IronPort-SDR: iPcmnwfvFRdYKmx9fcBuWP/43p5J+o/Hc4a9KPJnQ45OI62gYQOywxkAutC2Lxc7aN6VKmbdQL
 C2romUuZo8OLj5ePxprebSXup3EIm2IxT467FjHmpBibuXw4O5t/lLOAMF2oijchUKNYVdYxgx
 de2mmO/IDSBNmxot12YgHkFtgxLmatdkOmeSHLg6u6cP1ktNiIZ0gYtSGEur/x6MBjKuhNBNxX
 7hbb9JM2e1M5PqbaYX2TiRVSkMANTEgGHXfmQxgxJR3QK6R+T018jvB0OUR4mJy7YnxQfJEU+B
 wgU=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="76494636"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:58 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:52 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 08/14] arm64: dts: sparx5: Add pinctrl support
Date:   Wed, 13 May 2020 14:55:26 +0200
Message-ID: <20200513125532.24585-9-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This add pinctrl support to the Microchip Sparx5 SoC.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 3136b4369f507..45a60993789c8 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -102,6 +102,8 @@ gic: interrupt-controller@600300000 {
 		};

 		uart0: serial@600100000 {
+			pinctrl-0 = <&uart_pins>;
+			pinctrl-names = "default";
 			compatible = "ns16550a";
 			reg = <0x6 0x00100000 0x20>;
 			clocks = <&ahb_clk>;
@@ -113,6 +115,8 @@ uart0: serial@600100000 {
 		};

 		uart1: serial@600102000 {
+			pinctrl-0 = <&uart2_pins>;
+			pinctrl-names = "default";
 			compatible = "ns16550a";
 			reg = <0x6 0x00102000 0x20>;
 			clocks = <&ahb_clk>;
@@ -131,5 +135,27 @@ timer1: timer@600105000 {
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 		};

+		gpio: pinctrl@6110101e0 {
+			compatible = "microchip,sparx5-pinctrl";
+			reg = <0x6 0x110101e0 0x90>, <0x6 0x10508010 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 0 64>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+
+			uart_pins: uart-pins {
+				pins = "GPIO_10", "GPIO_11";
+				function = "uart";
+			};
+
+			uart2_pins: uart2-pins {
+				pins = "GPIO_26", "GPIO_27";
+				function = "uart2";
+			};
+
+		};
+
 	};
 };
--
2.26.2
