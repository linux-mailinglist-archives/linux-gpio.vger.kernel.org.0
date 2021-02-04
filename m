Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC51F30FABD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 19:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238753AbhBDSHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 13:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238425AbhBDSDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 13:03:50 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5D5C061221
        for <linux-gpio@vger.kernel.org>; Thu,  4 Feb 2021 10:02:36 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id R62Q240044C55Sk0662QyJ; Thu, 04 Feb 2021 19:02:34 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-G8; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7eCF-006uET-Ge; Thu, 04 Feb 2021 13:57:19 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: pinctrl: Group tuples in pin control properties
Date:   Thu,  4 Feb 2021 13:57:18 +0100
Message-Id: <20210204125718.1646082-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in "pinctrl-*" properties should be grouped using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt    |  2 +-
 .../devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt    |  2 +-
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt  |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  4 ++--
 .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt   |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt     |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-single.txt     | 10 +++++-----
 .../devicetree/bindings/pinctrl/samsung-pinctrl.txt    |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
index e295dda4bbbab958..40e0a9a19525b40d 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
@@ -39,7 +39,7 @@ For example:
 		      <0x660009b0 0x40>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&nand_sel &uart3_rx &sdio0_d4>;
+		pinctrl-0 = <&nand_sel>, <&uart3_rx>, <&sdio0_d4>;
 
 		/* Select nand function */
 		nand_sel: nand_sel {
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
index 603564e5fe6f0e54..dede11e4ef78087f 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
@@ -30,7 +30,7 @@ For example:
 		      <0x1803f408 0x04>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&pwm &gpio_b &nand_sel>;
+		pinctrl-0 = <&pwm>, <&gpio_b>, <&nand_sel>;
 
 		pwm: pwm {
 			function = "pwm";
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 8ac1d0851a0f8f0a..bfab5ca49fd1211a 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -60,7 +60,7 @@ iomuxc-lpsr controller and SDA pad from iomuxc controller as:
 
 i2c1: i2c@30a20000 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c1_1 &pinctrl_i2c1_2>;
+	pinctrl-0 = <&pinctrl_i2c1_1>, <&pinctrl_i2c1_2>;
 };
 
 iomuxc-lpsr@302c0000 {
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 4613bb17ace3f6e1..9dae60acf950641d 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -77,13 +77,13 @@ For example:
 	device {
 		pinctrl-names = "active", "idle";
 		pinctrl-0 = <&state_0_node_a>;
-		pinctrl-1 = <&state_1_node_a &state_1_node_b>;
+		pinctrl-1 = <&state_1_node_a>, <&state_1_node_b>;
 	};
 
 	/* For the same device if using state IDs */
 	device {
 		pinctrl-0 = <&state_0_node_a>;
-		pinctrl-1 = <&state_1_node_a &state_1_node_b>;
+		pinctrl-1 = <&state_1_node_a>, <&state_1_node_b>;
 	};
 
 	/*
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 8b94aa8f5971ceb7..6ec3c8d79f496b52 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -134,7 +134,7 @@ gpio21: gpio@21 {
 	#interrupt-cells = <0x2>;
 	microchip,irq-mirror;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2cgpio0irq &gpio21pullups>;
+	pinctrl-0 = <&i2cgpio0irq>, <&gpio21pullups>;
 
 	gpio21pullups: pinmux {
 		pins =	"gpio0", "gpio1", "gpio2", "gpio3",
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 931a18cd1e238e6c..360e59c9301a93a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -91,7 +91,7 @@ Examples:
 	pinctrl@1c20800 {
 		compatible = "mediatek,mt8135-pinctrl";
 		reg = <0 0x1000B000 0 0x1000>;
-		mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;
+		mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
 		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
index bb99991193148cb2..bfd222b0549569df 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
@@ -80,7 +80,7 @@ Optional properties:
   property.
 
 		/* pin base, nr pins & gpio function */
-		pinctrl-single,gpio-range = <&range 0 3 0 &range 3 9 1>;
+		pinctrl-single,gpio-range = <&range 0 3 0>, <&range 3 9 1>;
 
 - interrupt-controller : standard interrupt controller binding if using
   interrupts for wake-up events for example. In this case pinctrl-single
@@ -185,10 +185,10 @@ pmx_gpio: pinmux@d401e000 {
 	pinctrl-single,function-mask = <7>;
 
 	/* sparse GPIO range could be supported */
-	pinctrl-single,gpio-range = <&range 0 3 0 &range 3 9 1
-				&range 12 1 0 &range 13 29 1
-				&range 43 1 0 &range 44 49 1
-				&range 94 1 1 &range 96 2 1>;
+	pinctrl-single,gpio-range = <&range 0 3 0>, <&range 3 9 1>,
+				    <&range 12 1 0>, <&range 13 29 1>,
+				    <&range 43 1 0>, <&range 44 49 1>,
+				    <&range 94 1 1>, <&range 96 2 1>;
 
 	range: gpio-range {
 		#pinctrl-single,gpio-range-cells = <3>;
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 7734ab6fec449471..38a1416fd2cd8e1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -336,7 +336,7 @@ Example 3: A uart client node that supports 'default' and 'flow-control' states.
 		interrupts = <0 52 0>;
 		pinctrl-names = "default", "flow-control;
 		pinctrl-0 = <&uart0_data>;
-		pinctrl-1 = <&uart0_data &uart0_fctl>;
+		pinctrl-1 = <&uart0_data>, <&uart0_fctl>;
 	};
 
 Example 4: Set up the default pin state for uart controller.
-- 
2.25.1

