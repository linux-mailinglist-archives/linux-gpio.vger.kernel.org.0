Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108D71D1730
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388846AbgEMOLv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:11:51 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:38182 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388793AbgEMOLu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 10:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589379109; x=1620915109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dj/tqGjjDtj2A9PaqeSsjiB8UtDRZ0jP0v5pZdM7/yE=;
  b=GvvFdOv5hDTqp67Lz8INK4LbULY9nuhbZyPIe0mBJfw1DlRt3IsV8q3D
   0fb77ocElGgMP5+BnxyleRYXmmTWnbodcIJzmnyM5c399+qEtWQmwfAiz
   y6aABiZjhd9AYEnxgIhRv/P+t6Rk2H2nDEmmRzQUJ7ZBNYuEG7C8mt4me
   Tw0NYhTJ957KC47PO94+89ggGz993dMu1PEERGHu6NAJEwMA5/yy17SHn
   CvwyPySaCGobqMkkBZQZApmUzvYnW/gyIMNOHNvo8VywetuD/2EMj3YMv
   /H2CoiPCCcfN0uemTRpo3RkRZtaH7cOpR7ghwo3vqBfsSE2MbxPZ0iH4C
   A==;
IronPort-SDR: GCvGB2O5qzhphdVtjFPJUTIZwX2bvDRmVC5jMlmG08bTSDE/UpKDexka79h8f1+0xeh1otbyAS
 ghS/6GRQIEWmYOv/ttTRyTxh4LlbTxjfg/O1nb25iLprkvGj1M+29RjIJKU0wpTvahP2fcP798
 n69qE+4Vxm1x/zXGZlttuXMmFPYDnsyz48p/qNSvlug9HzZzkh5o7OHIWdZ7gRVoaOG4S9Fm1i
 J+hXXCqMsuOaO/y72T+Wop97ARfagWMWYzDwbNqi8QHJN1Ln/Pfp8C39B+0TnD9/0dAEgy2VUP
 5rQ=
X-IronPort-AV: E=Sophos;i="5.73,388,1583218800"; 
   d="scan'208";a="76510168"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 07:11:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 07:11:48 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 07:11:46 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/3] arm64: dts: sparx5: Add SGPIO devices
Date:   Wed, 13 May 2020 16:11:34 +0200
Message-ID: <20200513141134.25819-4-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513141134.25819-1-lars.povlsen@microchip.com>
References: <20200513141134.25819-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds SGPIO devices for the Sparx5 SoC and configures it for the
applicable reference boards.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 52 +++++++++++++++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |  5 ++
 .../dts/microchip/sparx5_pcb134_board.dtsi    |  5 ++
 3 files changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 60629861a5157..b4fda5616536c 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -213,6 +213,22 @@ si2_pins: si2-pins {
 				function = "si2";
 			};

+			sgpio0_pins: sgpio-pins {
+				pins = "GPIO_0", "GPIO_1", "GPIO_2", "GPIO_3";
+				function = "sg0";
+			};
+
+			sgpio1_pins: sgpio1-pins {
+				pins = "GPIO_4", "GPIO_5", "GPIO_12", "GPIO_13";
+				function = "sg1";
+			};
+
+			sgpio2_pins: sgpio2-pins {
+				pins = "GPIO_30", "GPIO_31", "GPIO_32",
+				       "GPIO_33";
+				function = "sg2";
+			};
+
 			uart_pins: uart-pins {
 				pins = "GPIO_10", "GPIO_11";
 				function = "uart";
@@ -243,6 +259,42 @@ emmc_pins: emmc-pins {
 			};
 		};

+		sgpio0: gpio@61101036c {
+			compatible = "mscc,ocelot-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio0_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x1101036c 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 64 64>;
+		};
+
+		sgpio1: gpio@611010484 {
+			compatible = "mscc,ocelot-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio1_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x11010484 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 128 64>;
+		};
+
+		sgpio2: gpio@61101059c {
+			compatible = "mscc,ocelot-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio2_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x1101059c 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&gpio 0 192 64>;
+		};
+
 		i2c0: i2c@600101000 {
 			compatible = "snps,designware-i2c";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
index 94c4c3fd5a786..fd4f5b3ddcc49 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
@@ -55,6 +55,11 @@ spi-flash@1 {
 	};
 };

+&sgpio0 {
+	status = "okay";
+	microchip,sgpio-ports = <0x00FFFFFF>;
+};
+
 &i2c1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
index 628a05d3f57ce..2f781258f8c99 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -47,6 +47,11 @@ spi-flash@0 {
 	};
 };

+&sgpio0 {
+	status = "okay";
+	microchip,sgpio-ports = <0x00FFFFFF>;
+};
+
 &gpio {
 	i2cmux_pins_i: i2cmux-pins-i {
 	       pins = "GPIO_16", "GPIO_17", "GPIO_18", "GPIO_19",
--
2.26.2
