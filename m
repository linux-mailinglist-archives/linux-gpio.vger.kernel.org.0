Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0815725C3F8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 17:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbgICPBq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 11:01:46 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:18985 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728908AbgICOFq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 10:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1599141945; x=1630677945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tufrlju2N8kPk+K67Lk/SfPvZ6txZC58fe+RJ5RoN/0=;
  b=GLb3QYuzSeuidqWigg0MP8IVtYCNtb9iRzaIebAH8M7vKya1mtd2bIdP
   o/h5ONrRYwj8B3owzc7TzpSmkllxmpaTHJps/Gg6gRiFaEDwG6sa+Y80L
   CVGYQ4s7ry5aV740Nd0UgiWylX3vJC91M+HgOEEcRRJfYVp3XNjHqmCJc
   nfsgJo+GduMeMfW78iDPZ+0yod+nN8qVuh4nNIHjpAu0+atYpSQKjt5pl
   ZZByUwh/UrMTysZSA0YXLGOYu6g1qv4Vy5A6/hOr3oBFwIeK8BT22UNjm
   dVIWAM9jCaXODKC07XwX6IHV9TDdMD6ePEDG7zMc7SVlSbRE6Z19QmVBr
   g==;
IronPort-SDR: sig/PtixE42DZ+VMd8xVLG7fD07MXzJwlWexLPbtcG9WP/StKOn7JXJH8MLdNfxHMlYeg8OhsY
 BEfi9qmi5RaAtqA6dC6h/59MXezeWlnrpN8t1pgONvkrXfb/WVc/VzvL/0JDN3Jsn5JXtWapre
 HcAzdVN0emyUVlVpA82KDK8Q+asXjRxEP5U2oFtRQ/9EpHnWPfbXx7DKpJEREAsb+ttFeKuAeJ
 hmLDQij9aPchAq/v0VFU+2h0GzRLWhn548SBVybXRKEJw+Z1FIM4wti6uOL3oLH/+d5ljyfeqx
 DUY=
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="94283355"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Sep 2020 06:35:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Sep 2020 06:35:12 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 3 Sep 2020 06:35:10 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 3/3] arm64: dts: sparx5: Add SGPIO devices
Date:   Thu, 3 Sep 2020 15:35:28 +0200
Message-ID: <20200903133528.8595-4-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903133528.8595-1-lars.povlsen@microchip.com>
References: <20200903133528.8595-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds SGPIO devices for the Sparx5 SoC and configures it for the
applicable reference boards.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi     | 52 +++++++++++++++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |  5 ++
 .../dts/microchip/sparx5_pcb134_board.dtsi    |  5 ++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  5 ++
 4 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 5408486b4d3b..3cbf8824a545 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -232,6 +232,22 @@ si2_pins: si2-pins {
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
@@ -262,6 +278,42 @@ emmc_pins: emmc-pins {
 			};
 		};
 
+		sgpio0: gpio@61101036c {
+			compatible = "microchip,sparx5-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio0_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x1101036c 0x100>;
+			gpio-controller;
+			gpio-ranges = <&sgpio0 0 0 192>;
+			#gpio-cells = <4>;
+		};
+
+		sgpio1: gpio@611010484 {
+			compatible = "microchip,sparx5-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio1_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x11010484 0x100>;
+			gpio-controller;
+			gpio-ranges = <&sgpio1 0 0 192>;
+			#gpio-cells = <4>;
+		};
+
+		sgpio2: gpio@61101059c {
+			compatible = "microchip,sparx5-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio2_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x1101059c 0x100>;
+			gpio-controller;
+			gpio-ranges = <&sgpio2 0 0 192>;
+			#gpio-cells = <4>;
+		};
+
 		i2c0: i2c@600101000 {
 			compatible = "snps,designware-i2c";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
index 6b2da7c7520c..9baa085d7861 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
@@ -69,6 +69,11 @@ spi-flash@9 {
 	};
 };
 
+&sgpio0 {
+	status = "okay";
+	microchip,sgpio-port-ranges = <0 23>;
+};
+
 &i2c1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
index 35984785d611..65336be31fd9 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -54,6 +54,11 @@ spi-flash@9 {
 	};
 };
 
+&sgpio2 {
+	status = "okay";
+        microchip,sgpio-port-ranges = <0 0 11 31>;
+};
+
 &gpio {
 	i2cmux_pins_i: i2cmux-pins-i {
 	       pins = "GPIO_16", "GPIO_17", "GPIO_18", "GPIO_19",
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
index 7de66806b14b..5ea2d0910c2b 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
@@ -67,6 +67,11 @@ spi-flash@9 {
 	};
 };
 
+&sgpio2 {
+	status = "okay";
+	microchip,sgpio-port-ranges = <0 0 16 18 28 31>;
+};
+
 &axi {
 	i2c0_imux: i2c0-imux@0 {
 		compatible = "i2c-mux-pinctrl";
-- 
2.27.0

