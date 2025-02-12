Return-Path: <linux-gpio+bounces-15796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B521A31DDF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB52F188AAD1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 05:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4081F9F70;
	Wed, 12 Feb 2025 05:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRlsRDXG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AB1F8AC5;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337847; cv=none; b=YPcyNz73tkvLakIWy3yc8hau1hzsSA3i6B3wrgea35sGiiBVoMD9Gn7EWI7auXVtJ5bqdP5l3lualno1Vgp6oYsvBMGH+tOxlBf4TKCKVAigF5hqUDkBmBwSjlkfN24IjsUupQUKhTlgDJCjKPpBiCU+XGniziDuzi/ZSveDGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337847; c=relaxed/simple;
	bh=ft/eT+IDr/xR3rp9yrIbeaRUSRkbdxArkfLcqtRDnBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W87U9B1hFZfpfPpI7o+g1tHeF8KQR9dBtCz/GPc4Ra1Ya3u9mcF0wGUIvhWG+pqSMGlGsycL9n0bJ/slcaUPyZGBhe1RRH2RvsSBs9Pcmp7Xv0y87QqD5dLrB40u6KIFf31pD8jLijGgbrQO4PaJjASYTzTpaB+tdfUYGXlG654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRlsRDXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A60BC4CEE6;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739337846;
	bh=ft/eT+IDr/xR3rp9yrIbeaRUSRkbdxArkfLcqtRDnBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jRlsRDXG96MAP9uFLmZyGMG9zISl2rYSXbxjDV6sMCAPXmh0Jl3HrX9wjbFkpBQQy
	 d2sBW3vxi0nesTyFnvNFZgZucfhDAlyXaRaYIcoGIKGnHEIYd5lTUBa1JetJZc+nu/
	 M5Y72ipOadWYhSzn0PmP5xacxAile1TWbXe7LK2R0tz83CnNWwa410NoZC1e/0yh9w
	 JsGMLAmgh4q9Q9FS2zq7Iu1lELRob3GJVsSsDIuHMc/QsaUvJmAP4b9+anoudlu2UC
	 C0G1As+EwPJ0kpy6sXtYeZ5TYiAZs5SLgCXX0RzmAfeEZ6+sG57HW0O2CblU65BNyF
	 44xlaaIb0ne8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D144C02198;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Feb 2025 13:20:53 +0800
Subject: [PATCH v5 4/5] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-amlogic-pinctrl-v5-4-282bc2516804@amlogic.com>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739337841; l=3998;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=3vIT8gp2Sq/SEzg1cHAZH94RjUt3E/v9k4pLIU4p4/k=;
 b=CKcvLzYcvMxgidle0+cqIxJjc3cQTkElphh1cu3U8w9H7VknNHLUhrCV+ZIy4lx0r966gKh7J
 Ixy+idkMk8qDmiCitrh9qbD4uTka/omawbHWhTa+DXZJkMVHdGDJ6LM
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



