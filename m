Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3ECB38B501
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 19:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbhETRO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 13:14:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42395 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235395AbhETRO4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 13:14:56 -0400
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud9.xs4all.net with ESMTP
        id jmEWllugRVN4kjmEnlB7e8; Thu, 20 May 2021 19:13:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621530813; bh=bsnO8l7SUux3m+SAtpyvVWCiju520gKsdmdg7rdmmrE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=KxS05xaly9ZvujaygNM0NoxTadoOmsnWpdNVPTKvhOKK1lhlb+griG+eNEj5/ou6T
         A+gewrnZ6T/zZ8dfDGiCgYlICAyZuQxe7UEfCxUUdIap2YChhKumNEbG4SqvYr2gTE
         zKf+1L32mKKPcXbczVzg2IhUTEJngdLmgQhcV40bb8+E1w9yGfjVgt2iMVPjh8wMIT
         0MaS/jLbmMANj0FXeHnexmi2W4jhi9uDWSGYJerslQUvYMacjNK6vpfaa4U06R6tVu
         0glhqWsJDnvkR9mXL0vUVhC9Pg9gO2S7ImD1kEPEp/RbmH4HuJCXhmDWIsbNERfiM4
         bKW1NC1mSYXUw==
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: apple: Add pinctrl nodes
Date:   Thu, 20 May 2021 19:13:07 +0200
Message-Id: <20210520171310.772-3-mark.kettenis@xs4all.nl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520171310.772-1-mark.kettenis@xs4all.nl>
References: <20210520171310.772-1-mark.kettenis@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNue/EHJcQ/3kj0ETzEOtiBUroVlXyBrziKGnpC8nRodkb00C8I36JbQZDWTmOsY6b7bJHCrcJFrOnEqNS/6vch8FbCAPC3K5M3pjsDGEv6tuaZla31w
 /QfYCqbCuQhXoH6TFWtSvxctE+j/KD3SpwQtIYkYW7wJQZiQbNI72SdycMX9cLsMp9ZiT9FB+4JUPbuiphuVyl33W4gJU3hiefPuHcpbofHQRjRJVoRdrutZ
 O54j/D2SZR0gqJuuTjKRSW7P5eI264/mJD/UVxkEpOHAHCPF2LyKBMK8AGetVKtzQABlRvNjQPWMPnI6W+Z8iSh46Qo92mWLdKAjOJ4CF/mOPFfASeRkMzVf
 gVv1AcVp3jbZoCwBG74+lM8D1MQSVVRRIeSeWdWEleIS9lKZCaOS4RifU6POdwqpo+xz1bB0SIO46lGX6sDzrlUz6SNPc8YeCCz5hdKA7BGB/ZZnVxgHxI74
 TCi/9fi2TYReSpDI
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Mark Kettenis <kettenis@openbsd.org>

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

