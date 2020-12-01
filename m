Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3059A2C9C7A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 10:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390510AbgLAJSE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 04:18:04 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:34304 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389521AbgLAJSC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 04:18:02 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0B19Fxbu003817; Tue, 1 Dec 2020 18:16:00 +0900
X-Iguazu-Qid: 34treOZZEaJcxewdTG
X-Iguazu-QSIG: v=2; s=0; t=1606814159; q=34treOZZEaJcxewdTG; m=JpTFPXehUvmi4IERx+TDYFzjWgadnTEVz/HaXrx8+FY=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1511) id 0B19Fw5l036151;
        Tue, 1 Dec 2020 18:15:59 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0B19FwFR012399;
        Tue, 1 Dec 2020 18:15:58 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0B19Fwbx008601;
        Tue, 1 Dec 2020 18:15:58 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 4/4] arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver
Date:   Wed,  2 Dec 2020 03:14:06 +0900
X-TSB-HOP: ON
Message-Id: <20201201181406.2371881-5-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIO node in Toshiba Visconti5 SoC-specific DT file.
And enable the GPIO node in TMPV7708 RM main board's board-specific DT file.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
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

