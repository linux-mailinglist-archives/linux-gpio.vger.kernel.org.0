Return-Path: <linux-gpio+bounces-14992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A98A18AA3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 04:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 847837A18CB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 03:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4182F15E5DC;
	Wed, 22 Jan 2025 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRcPLwZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD96156C62;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737516366; cv=none; b=Lx9L5Ada8vOd37DfRjddHpKPrCdS7/tK6ZAWRnY/7tC3A/FchDLB87p45qp/Zc3EXdZDtsaQICi5D7OuA6tzMLju7AHKOpxytj9+Gm4RbUFdZo4331XkWz170CHiZVR9eky83LK/LxoljQmiVsS6FTe6sD1FQ1Smgsdj4LuRseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737516366; c=relaxed/simple;
	bh=ft/eT+IDr/xR3rp9yrIbeaRUSRkbdxArkfLcqtRDnBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwuz4PeyjLynZ7iNTuyA+XW7b1HT2haOLPhtfVwWSezSi1qkMHve7wi08gt0PVuhkpi9fwm5P6EeI7rNcxS/rSQINSzKl/qEa4j3y0hwOnwdykJY9KdW02KOCIzo5sJ4t1uaJosXXCECaAhAcZyVxjVzetIdKTSMCMDhU6JpNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRcPLwZO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A4B0C4AF0F;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737516365;
	bh=ft/eT+IDr/xR3rp9yrIbeaRUSRkbdxArkfLcqtRDnBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rRcPLwZOQPrtTUa9I8kOMNR65pkUTSTP8J0b5HtHFYgpBTt7JyqUO/Ji/4i1pMpi+
	 cw46W49McDaiOpm8dujY8dyiv2A6MurX1Y3eLeMURrKsMPYJJjhPe1OJTc/I3nXO42
	 G33hCdFYIIv39gpImymyTVhgiaJksLDWtYShJe/bBvdLivRdnx5+r/5ccpHngBGwhz
	 NeaZq5BIXX1KTsz2CIsuvhE2EPXWknUB0am+RaiHLWO6mqbb4ily7uYkfQHX7Trgdw
	 KH++1GcGWAjdRXbEdlr850os7roa/yK8jKnQDCvYm6tVQkogeemAHYruJPR+dsxDrg
	 87alCfRCnGExg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA1BC02182;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 22 Jan 2025 11:26:02 +0800
Subject: [PATCH v4 4/5] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-amlogic-pinctrl-v4-4-4677b2e18ff1@amlogic.com>
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
In-Reply-To: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737516363; l=3998;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=3vIT8gp2Sq/SEzg1cHAZH94RjUt3E/v9k4pLIU4p4/k=;
 b=QIIg6PNOleSUG5qAfEVD3I8bxHd3jp+bzf0BZSgHal3pxnFuEORh1iyrXJT5ANfL9why2Yf/K
 SmSL19Q0FLZAhwXr8QfGA+xX/O6usNcFgeTUEZC/eh5F8zpp7NNYcBK
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4 and add uart pinconf.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 120 ++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..efba8565af3c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,122 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl {
+		compatible = "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpiox: gpio@4100 {
+			reg = <0 0x4100 0 0x40>, <0 0x400c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
+		};
+
+		gpiot: gpio@4140 {
+			reg = <0 0x4140 0 0x40>, <0 0x402c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
+		};
+
+		gpiod: gpio@4180 {
+			reg = <0 0x4180 0 0x40>, <0 0x4040 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@41c0 {
+			reg = <0 0x41c0 0 0x40>, <0 0x4048 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpiob: gpio@4240 {
+			reg = <0 0x4240 0 0x40>, <0 0x4000 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		gpioao: gpio@8e704 {
+			reg = <0 0x8e704 0 0x16>, <0 0x8e700 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
+		};
+
+		test_n: gpio@8e744 {
+			reg = <0 0x8e744 0 0x20>;
+			reg-names = "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+
+		func-uart-a {
+			uart_a_default: group-uart-a-pins1 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_X, 12, 1)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_X, 13, 1)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_X, 14, 1)>;
+			};
+
+			group-uart-a-pins2 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 2, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_D, 3, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: group-uart-b-pins {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_E, 0, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_E, 1, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: group-uart-d-pins1 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 18, 4)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 19, 4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			group-uart-d-pins2 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 7, 2)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 8, 2)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 9, 2)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 10, 2)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-e {
+			uart_e_default: group-uart-e-pins {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 14, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 15, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 16, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 17, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+	};
+};

-- 
2.37.1



