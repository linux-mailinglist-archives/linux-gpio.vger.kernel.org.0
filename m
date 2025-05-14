Return-Path: <linux-gpio+bounces-20122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95597AB63A3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 721574A0FA9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F2F2185AB;
	Wed, 14 May 2025 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6FKA/A0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F02153EA;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206104; cv=none; b=ekpvfsJC3JHIghVEWtbnZzQgrIJI5hsF1Y+Epb+TLmR+c1b6mZ3FuDU2A6matArSjR+M0Ct+uDkthMaB9Q1boFD+6DvmEm4r4IlQ4un76/ZmjFvubNz3skuOCd8sn4iqIqwHbfm9yDeJ5YhvKLjS2jzC0mtlYrCm4cpn/0SuRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206104; c=relaxed/simple;
	bh=Pm8RjpxsF/4T3Jz5C4xdzYDV9KddSNMY1eVaNkY9kdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXhyFzAMpYPQL+PKxZaDjldAtyJp+WiQSE3gsthjYwiYql/NL2pxuniISYAOvvHLN+5I7iFksdJ8u+uy6DErLAyQJZCAwSFjWaMKnH6kt+8Ug28ZzybI6QJGOJK58cf29ut5dBs9neYjmiRkHY0RcKdM8OzOyLuFgexi3BTZjPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6FKA/A0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AAF6C4CEFD;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=Pm8RjpxsF/4T3Jz5C4xdzYDV9KddSNMY1eVaNkY9kdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a6FKA/A0VLcb5Wj9gVKWihgGWtje6S1HfASIniNVddjJB7LcLlpoH4C6ole4PKgfz
	 In1mGbIPWTxxad//6ccgtWDwyzkyeVcTnQtTMwQmUd9xnqEedph7r8xh9GCL10un8h
	 kIZlndFo2MgahMWmUW32bqguhUcJ/ZD/g/Vb9HKmMIVSr8Tag4Of/zoeSS2HhcV5Op
	 xL1UxXxI5XQKCC8TnUBd/MDwiH0FzrUnx4QzU44IKrC8lx9Shqg0n7gkPuhCNA+OY2
	 q5g9Y8ZK0bvAXtx0uLbaOXEIicpMmy/biwOdNSxhR7AT+vpcq5DIbYoEUiHCEY2aJ9
	 SAWTMrmC2dhEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80558C3DA4A;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:35 +0800
Subject: [PATCH 8/8] dts: arm64: amlogic: add S6 pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-8-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=3610;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=LQtEhTH+4eGkcgIF+Vwy2luHuUbtEoQ8YiYPmKbSysk=;
 b=S8+ebZFd/3aLdScnhUNT2oKPoPi/XIvUCU86CBgbhCRKe7b7J6FzLOMCx5QjOuvMj9DIUAUUw
 Lz+sz4JJ1dwBZz+LtWhw6/woTdNSztnNVqS3qabFwUDOx1uSBwibmHm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic S6.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 97 +++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index a8c90245c42a..5324079808c4 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -92,6 +93,102 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			periphs_pinctrl: pinctrl {
+				compatible = "amlogic,pinctrl-s6";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x4000 0x0 0x340>;
+
+				gpioz: gpio@c0 {
+					reg = <0 0xc0 0 0x20>, <0 0x18 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
+				};
+
+				gpiox: gpio@100 {
+					reg = <0 0x100 0 0x30>, <0 0xc 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
+				};
+
+				gpioh: gpio@140 {
+					reg = <0 0x140 0 0x20>, <0 0x2c 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 9>;
+				};
+
+				gpiod: gpio@180 {
+					reg = <0 0x180 0 0x20>, <0 0x8 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 7>;
+				};
+
+				gpiof: gpio@1a0 {
+					reg = <0 0x1a0 0 0x20>, <0 0x20 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_F<<8) 5>;
+				};
+
+				gpioe: gpio@1c0 {
+					reg = <0 0x1c0 0 0x20>, <0 0x48 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 3>;
+				};
+
+				gpioc: gpio@200 {
+					reg = <0 0x200 0 0x20>, <0 0x24 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 8>;
+				};
+
+				gpiob: gpio@240 {
+					reg = <0 0x240 0 0x20>, <0 0x0 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+				};
+
+				gpioa: gpio@280 {
+					reg = <0 0x280 0 0x20>, <0 0x40 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_A<<8) 16>;
+				};
+
+				test_n: gpio@2c0 {
+					reg = <0 0x2c0 0 0x20>;
+					reg-names = "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges =
+						<&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+				};
+
+				gpiocc: gpio@300 {
+					reg = <0 0x300 0 0x20>, <0 0x14 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
+				};
+			};
 		};
 	};
 };

-- 
2.37.1



