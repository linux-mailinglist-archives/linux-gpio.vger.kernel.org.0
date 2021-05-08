Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23835377263
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 16:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhEHO2r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 10:28:47 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49577 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229500AbhEHO2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 10:28:47 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 May 2021 10:28:35 EDT
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud7.xs4all.net with ESMTP
        id fNoalDe3DyEWwfNoslAKLA; Sat, 08 May 2021 16:20:39 +0200
From:   Mark Kettenis <kettenis@openbsd.org>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: apple: Add pinctrl nodes
Date:   Sat,  8 May 2021 16:19:56 +0200
Message-Id: <20210508142000.85116-3-kettenis@openbsd.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508142000.85116-1-kettenis@openbsd.org>
References: <20210508142000.85116-1-kettenis@openbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAyluYZHFpNZjlq+A5zPoFVB/AwwVNe0wvSw18aJIBxgBIUO298752rbLucgpSok4Vum8QYFd4IORCZ8HQveGjpnARYVzMlLdOmvpkKMFpPbHr7qpi3m
 BMt7KcEh9BSJOqIHkeQF193a0dg1mxcma66oWeR739sE+A3QUDVgBUb1Sc4HQ+xz9cSEN3AJreLEN4YR1cN8gNpT69rJq568u4oWi4HJAFyBoDhWajS+GG/g
 xQgRnuur0BF3D7zYqLYmZ2LWNS597TQpam/mecxzpRUWz9/GnW4Z4dWb9d979QeFYdQf+wNdeENJxQWLtrU3yO2mRgglJlY5BdoDx5/qeVjX+1cPEPWly4W+
 tZKft8NKKgdXr07sP4jHk8SBO6HqTkKHJzxTpMffeZcljg2B+VFbcbX5zmvKRiiAToV6JcuKVGY5RvcOH1yqFDwvfR6PNagBrjpU42Ea0Joo2hdiv7oIyamZ
 eDyKK1jNTnAwuadP
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pinctrl nodes corresponding to the gpio,t8101 nodes in the
Apple device tree for the Mac mini (M1, 2020).

Clock references are left out at the moment and will be added once
the appropriate bindings have been settled upon.

Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index a1e22a2ea2e5..503a76fc30e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
 
 / {
 	compatible = "apple,t8103", "apple,arm-platform";
@@ -131,5 +132,87 @@ aic: interrupt-controller@23b100000 {
 			interrupt-controller;
 			reg = <0x2 0x3b100000 0x0 0x8000>;
 		};
+
+		pinctrl_ap: pinctrl@23c100000 {
+			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x3c100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 212>;
+
+			interrupt-controller;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
+
+			pcie_pins: pcie-pins {
+				pinmux = <APPLE_PINMUX(150, 1)>,
+					 <APPLE_PINMUX(151, 1)>,
+					 <APPLE_PINMUX(32, 1)>;
+			};
+		};
+
+		pinctrl_aop: pinctrl@24a820000 {
+			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x4a820000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 42>;
+
+			interrupt-controller;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_nub: pinctrl@23d1f0000 {
+			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x3d1f0000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_nub 0 0 23>;
+
+			interrupt-controller;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_smc: pinctrl@23e820000 {
+			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x3e820000 0x0 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_smc 0 0 16>;
+
+			interrupt-controller;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.31.1

