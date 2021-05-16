Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AAA382073
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 20:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhEPSlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 14:41:13 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45137 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231358AbhEPSlL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 May 2021 14:41:11 -0400
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud7.xs4all.net with ESMTP
        id iLZ1lyWmcMajpiLZIl0Ae7; Sun, 16 May 2021 20:32:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621189968; bh=bsnO8l7SUux3m+SAtpyvVWCiju520gKsdmdg7rdmmrE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=SujX6nEiLDbf0ljIL3LCoMX+ouqKRs1Ya99VxqGXc2XwNDII9nfbbPENQj/FrWA7u
         buGX+l+ZauRWmIq/zoLEmcUK6ojwwyNWpZk9qhre3fCXNVJSXssb/r4BxMk+y5BKaZ
         P6Mm8qCrPH8ffblMK8jbSdrLrpuhuCrNDSGap0qnbbhnj9LuArx7kGc8BcdSvjytWG
         JLxuhOF0+tbtjRr2bmDiTrBhNJogNaA61SU+CCtGZedA2iMlBjSwIobwxhiuDcLTOe
         g8mUtai3LP3kEsTk0WiZQsc7nzUTfLs0sEMddoD+b37c1AOc/LWh72MX3DqAMB1lzC
         ygIw9O6KPvvEw==
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: apple: Add pinctrl nodes
Date:   Sun, 16 May 2021 20:32:18 +0200
Message-Id: <20210516183221.93686-3-mark.kettenis@xs4all.nl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516183221.93686-1-mark.kettenis@xs4all.nl>
References: <20210516183221.93686-1-mark.kettenis@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfE7TE6sAt+XAoM6XPUe8AUyZOfwx2Vaq/o2WzDzTF+IjvXR3s0B21IKrbjR7UArcBkCQEps9NcOhQ1ofZsKr8fRR4WTYiwYXWc33BqJtl4Cp5E+EjsEA
 4ijc9xP4jlYYn/JMmI6jfxlGkudkQs4z/E0oBrFFu6i375l85E6+tiV4G6cX+ldclGY4yxHAC4Ihui0q57MtQZfgR6v2dL7xVMLE89u4qgjIGo7B6UWzP647
 TxqBg9tNOy3ltW01Krn8gDW5ji7HpgY350a/dyhbwymtrtGG2Kmv/PBbwUzC5tPVFKV7AMPzw6K0M0YTl+/g58zKUE8HdvgCWLXmAw1UFm1PBrVgMvdWxfxo
 8OKJWzmcfThBdMKFr6QTT3ppbWOI8+D12TmFmqAGe/8EkCzVpklB+DGl+Oo2ovqJtl7hGX7kSE0vjQwIyNzFLJ7YSabDH9B9ifOGnmpnHTG7LgTpqCtyYSkW
 w44IBzrZPYnXdDaT
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

