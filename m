Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC20A2D6CAB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 01:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394526AbgLKApo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 19:45:44 -0500
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:50822 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390106AbgLKApi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 19:45:38 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 0BB0hY8E006165; Fri, 11 Dec 2020 09:43:34 +0900
X-Iguazu-Qid: 34trMRoISkACchRKde
X-Iguazu-QSIG: v=2; s=0; t=1607647414; q=34trMRoISkACchRKde; m=tmCBBE/JMLe4wS1hi/XtcFrm8j5BY3+pNTVs07b8EC0=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 0BB0hXSb032364;
        Fri, 11 Dec 2020 09:43:33 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0BB0hXOp001509;
        Fri, 11 Dec 2020 09:43:33 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0BB0hWbW012066;
        Fri, 11 Dec 2020 09:43:33 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v4 4/4] arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver
Date:   Fri, 11 Dec 2020 18:41:38 +0900
X-TSB-HOP: ON
Message-Id: <20201211094138.2863677-5-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIO node in Toshiba Visconti5 SoC-specific DT file.
And enable the GPIO node in TMPV7708 RM main board's board-specific DT file.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
 .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  4 +++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
index ed0bf7f13f54..950010a290f0 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
@@ -41,3 +41,7 @@ &uart1 {
 	clocks = <&uart_clk>;
 	clock-names = "apb_pclk";
 };
+
+&gpio {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 242f25f4e12a..ac9bddb35b0a 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -157,6 +157,33 @@ pmux: pmux@24190000 {
 			reg = <0 0x24190000 0 0x10000>;
 		};
 
+		gpio: gpio@28020000 {
+			compatible = "toshiba,gpio-tmpv7708";
+			reg = <0 0x28020000 0 0x1000>;
+			#gpio-cells = <0x2>;
+			gpio-ranges = <&pmux 0 0 32>;
+			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts =
+				<GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		uart0: serial@28200000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0x28200000 0 0x1000>;
-- 
2.29.2

