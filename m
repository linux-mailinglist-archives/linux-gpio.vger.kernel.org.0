Return-Path: <linux-gpio+bounces-13742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBB9EC503
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 07:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C004516746A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 06:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57691C5CC6;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVzI0Alg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F461C5496;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899689; cv=none; b=Gr2HD1tRCOpWvhU54GCVoHBG2kStbKcYaNMfcOoUbT41N+lTkZcwpBp5x3nYNteX3mXd/zxJPsIxV3URpqNC4srJ/peuWR2gT+THEEDmeMgfPz9O5m0r/Ot3whBrF8E6ozMDsbWLMFkaBo6sqPLJd+BNejwis4YkSwXGayhRmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899689; c=relaxed/simple;
	bh=UPPnlWPu9KoNlNpvsqGTfPyBQbXQZd4qU+Jb/czZ7/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuvLduEI4WLlW2SBGk2euWoEnqUiBuB844e7YVzeFWOjiprTTbuSIJZ0FdDL/XW8B6sOPBrMTL+K7GGK2b5i9ScDYZoua8xfYoBsTEPVLr7MS5BVW22b+mN+bFijDK2L5qo3mPrI5OsSKgQTF/V9ayWX+QrWsM3KXh+dlIvNPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVzI0Alg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21097C4AF0C;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733899689;
	bh=UPPnlWPu9KoNlNpvsqGTfPyBQbXQZd4qU+Jb/czZ7/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lVzI0Algq+XTOAf/dYDHZb1kI7b3r7XQ2Qhixv6gouPmJBqrx/IhUObZRNdUrZGVb
	 ugFaymGbSB6Oxv6oFu5lSHWOi0QRCHbu6yZojlcvu8baXMi0Tw/bZmpKKO4rGrCaxC
	 pYNVLM42CfqaiQU9QPPLjlkUspBmlptdF0t8zuVtuaK0G9ODHAiVee7LqhmhnpMCrN
	 CZ5zWLazfue4AK1WZLzBg3NqY5QT8JWHVPfqkBSoyUCfmutiQWuN9/myG3bRED4UqU
	 PQ+STpDvXXvH3vIBf7E2WlkyNPpAjCmHiEkTp4njDXX2G17+XqPRiTVYiBJQYpohcI
	 sGD4A4netMulg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112EFE77183;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 11 Dec 2024 14:47:51 +0800
Subject: [PATCH RFC 3/3] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-amlogic-pinctrl-v1-3-410727335119@amlogic.com>
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
In-Reply-To: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733899686; l=4294;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=wd2xEkVGIb+QQGNlpn9fPOzOszeVPGCMX5Z9RWeBF+M=;
 b=V4CFjbseLot8PdTVnt01ycVpwibk0w7BRAlIO9BREobCH/cbUT9/dccE5TNzvbad920xz3xTq
 s+Cse5B+iI3AcJLNHYnZKdsjFDFM1RhjPRWGZUwmwwqX1JaULRCXsW2
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
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 146 ++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..fccae7c9758a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,148 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl";
+		reg = <0x0 0x4000 0x0 0x0050>,
+		      <0x0 0x40c0 0x0 0x0220>;
+		reg-names = "mux", "gpio";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gpiob: gpiob {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <14>;
+			bank-index = <AMLOGIC_GPIO_B>;
+			reg-mux-offset = <0>;
+			reg-gpio-offset = <0x60>;
+			bank-name = "GPIOB";
+		};
+
+		gpiod: gpiod {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <16>;
+			bank-index = <AMLOGIC_GPIO_D>;
+			reg-mux-offset = <0x10>;
+			reg-gpio-offset = <0x30>;
+			bank-name = "GPIOD";
+		};
+
+		gpioe: gpioe {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <2>;
+			bank-index = <AMLOGIC_GPIO_E>;
+			reg-mux-offset = <0x12>;
+			reg-gpio-offset = <0x40>;
+			bank-name = "GPIOE";
+		};
+
+		gpiot: gpiot {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <23>;
+			bank-index = <AMLOGIC_GPIO_T>;
+			reg-mux-offset = <0xb>;
+			reg-gpio-offset = <0x20>;
+			bank-name = "GPIOT";
+		};
+
+		gpiox: gpiox {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <18>;
+			bank-index = <AMLOGIC_GPIO_X>;
+			reg-mux-offset = <0x3>;
+			reg-gpio-offset = <0x10>;
+			bank-name = "GPIOX";
+		};
+
+		func-uart-a {
+			uart_a_default: uart-a-pins1{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 12, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>;
+			};
+
+			uart-a-pins2{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_D, 2, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_D, 3, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: uart-b-default{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_E, 0, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_E, 1, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: uart-d-pins1{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 18, AF4)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 19, AF4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			uart-d-pins2{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-e {
+			uart_e_default: uart-e-pins{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 14, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 15, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 16, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 17, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,pinctrl";
+		reg = <0x0 0x8e700 0x0 0x04>,
+		      <0x0 0x8e704 0x0 0x60>;
+		reg-names = "mux", "gpio";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gpioao: gpioao {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <7>;
+			bank-index = <AMLOGIC_GPIO_AO>;
+			reg-mux-offset = <0>;
+			reg-gpio-offset = <0>;
+			bank-name = "GPIOAO";
+		};
+
+		test_n: gpiotestn {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <1>;
+			bank-index = <AMLOGIC_GPIO_TEST_N>;
+			reg-mux-offset = <0>;
+			bit-mux-offset = <28>;
+			reg-gpio-offset = <0x10>;
+			bank-name = "TEST_N";
+		};
+	};
+};

-- 
2.37.1



