Return-Path: <linux-gpio+bounces-14811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23770A119E1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72C51644CC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 06:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DA522FDFB;
	Wed, 15 Jan 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nr0WRWZv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3940522FAE3;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923323; cv=none; b=dGYwhCIr/EK4EuFcWpVtL5vPhjjng/tXDEs6vjvG7nRCG+vzVTj8DcHos6UWgFqiOCH3CaXrPc96iFITEZrt2k5+BHfOwd3SAkcdfpN/AdN8oBE50YGs+T0qpql9Z1XZO/1lxmJfPwJWs4UQF9BL1T3/VoBhxuuJFQxwuKacYXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923323; c=relaxed/simple;
	bh=/SxWTdCue2Zckk922hHwnnWaopJsKHsFX0I+Fn2cw78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eo/Ufw0hEb2Ce2AUsSbgdesK7RLpcWfItpY8PKxPIKKf27cU3ZVQyYsqvomoVlmHRpF3Dkkh5gjkI5iuUN/pCbWVUgLutYbPtWMba9eS18yl1lTODUJhnEdhh0XRfkiqW+l/FMFYT+KbfyPqqKEY72+ug70ubuQYst93GzwAxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nr0WRWZv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95B79C4AF0E;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736923322;
	bh=/SxWTdCue2Zckk922hHwnnWaopJsKHsFX0I+Fn2cw78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nr0WRWZvGDbfSz1za78/JC43yAlPNRviy98r8R281RFv7Qim8ujemIXeMNUls6W+m
	 x3b9DGCR1kVzNlcnA6XN0zgAhrEsaY/Gs2QXOOoCJWX55R2TZSaRyMAk26bQa3d610
	 jiVeZqnMEhuRlUMYGdi36gOa015pmshOQg7W9fpamSVtGQeODxsQzgkRgPE5HS1NHv
	 lLRjOImadENovohuHjBEtu5tiX1cQVWBjpcFqCCxbsGsI+Ung4BQ6fHBi8BpRR/g8M
	 FsSRysgIRy9jrn6UntRWJyVzp2atKdSEhc+0aks7KNsd3p0hNg/OAu6RBd+o2qVrqG
	 ae77z73Pn+X5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7EEC02183;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 15 Jan 2025 14:42:02 +0800
Subject: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
In-Reply-To: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736923319; l=4311;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=aSN6d2kaDXKKbqczcIvQuPYJ0HGVmaQE8fAHhpyYx2c=;
 b=A3lIedjFIMKh+Tn+ans+gYRNWfCn0w64CYmHQhJ6r3KU9QgPzShZsDaBmV6LofdZ0Gu3ZoY4t
 VGRiLnLkvAYDChN70RYsfVIDjnEmTCUCChMtssOGZCF+FWxoOm2cZ6u
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
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 133 ++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..8eb95580d64a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,135 @@ pwrc: power-controller {
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
+			reg = <0 0x4100 0 0x40>,
+			      <0 0x400c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_X>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
+		};
+
+		gpiot: gpio@4140 {
+			reg = <0 0x4140 0 0x40>,
+			      <0 0x402c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_T>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
+		};
+
+		gpiod: gpio@4180 {
+			reg = <0 0x4180 0 0x40>,
+			      <0 0x4040 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_D>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@41c0 {
+			reg = <0 0x41c0 0 0x40>,
+			      <0 0x4048 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_E>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpiob: gpio@4240 {
+			reg = <0 0x4240 0 0x40>,
+			      <0 0x4000 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_B>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		gpioao: gpio@8e704 {
+			reg = <0 0x8e704 0 0x16>,
+			      <0 0x8e700 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_AO>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
+		};
+
+		test_n: gpio@8e744 {
+			reg = <0 0x8e744 0 0x20>;
+			reg-names = "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_TEST_N>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+
+		func-uart-a {
+			uart_a_default: group-uart-a-pins1 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 12, 1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, 1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 14, 1)>;
+			};
+
+			group-uart-a-pins2 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_D, 2, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_D, 3, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: group-uart-b-pins {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_E, 0, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_E, 1, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: group-uart-d-pins1 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 18, 4)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 19, 4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			group-uart-d-pins2 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, 2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 8, 2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 9, 2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 10, 2)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-e {
+			uart_e_default: group-uart-e-pins {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 14, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 15, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 16, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 17, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+	};
+};

-- 
2.37.1



