Return-Path: <linux-gpio+bounces-20577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AFAC4796
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 07:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6103A17762E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 05:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681941FBC94;
	Tue, 27 May 2025 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC+EMllW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEC1F8728;
	Tue, 27 May 2025 05:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323413; cv=none; b=KuvFGeFnlKvV7JzIsQyb6kuNJyk2WNTT0x+N6iMpX1gxrJl8CckKMh8WdPb66vVLCDQNqOVdprYUiQ6Qh6INxS6LlnN5Km8TaB3E7f2sgL6Pq7Qv6QlfEu6fzLZBognTtYczux65DiYE09ZKNayupxjTV38+tLwgKBT+zI+oaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323413; c=relaxed/simple;
	bh=Hxa2EX+nSJ0LzGazJMi3CxQ9ZJHR9/MQI2pW4yU8x+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqStun4Nt7s4Qc0yZNGqtfTo0YOc/wWpHBZ9BOXZ8DGM5DW+JjDiGXSOwdrDHE1NCaJpg7IE+lVygTfB4P3IbHpq5LH6MA7sK7ExQe5dCfflBkA9ONkkXWaRVbStb8fBuALdm8PKpA1iVYOhN4HYb+RpuX3aZo4Yy0PjEtBJygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC+EMllW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C6E1C4CEEA;
	Tue, 27 May 2025 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748323412;
	bh=Hxa2EX+nSJ0LzGazJMi3CxQ9ZJHR9/MQI2pW4yU8x+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MC+EMllWmRM04E3Wkn8A2+u265k3pgch+vQgcfuIWWqCuORSFmTKfea3w2kwS2n6q
	 D/XJ+SoKfDy75Rqkk1PNrpuGDmQ7m+2QH05lR2LtNqepqFfnZOj0PxboVbJoww0PEB
	 /jw37UuyDw4wvHVCqYn7WwYJDAv98L3JTZHUW8G1sbbsg1u6/pwi3okx9Z1ktHCy08
	 LUFHz3rqsClc0+aB579606KEx2t2n5FuEgQxJkxEx5s+BBcB0qzaiG3q3tRuCTm4FF
	 cN4TlRF4D2mqrdsD+AeWotTojcnSpb8qkEGnRFwrEOeiHm9i4ixotbWOTA4z65KzUU
	 khwjK2APWFWWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82731C54ED1;
	Tue, 27 May 2025 05:23:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 May 2025 13:23:33 +0800
Subject: [PATCH v3 6/6] dts: arm64: amlogic: add S6 pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-s6-s7-pinctrl-v3-6-44f6a0451519@amlogic.com>
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748323408; l=3615;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qrXyaWIhl6dY6RYbLmLL01WMo+S+QWiFeDMWvb8QD9A=;
 b=u3zN/dtoGY4LzAhcNGxLOH583hQ6CcnTOBWKrKQaglkUFetx+P5jMcrz+kEMsJijtZ8YiWYa7
 KbK8TeGFliECxl5Q/oU5jSBVPxc/NbyslAf8+m6Ds/1HcbLG5bNwE4d
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
index a8c90245c42a..5f602f1170c0 100644
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
+			periphs_pinctrl: pinctrl@4000 {
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



