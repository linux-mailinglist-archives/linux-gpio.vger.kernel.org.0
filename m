Return-Path: <linux-gpio+bounces-20576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A521AC4793
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 07:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 179E83B4374
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 05:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DDA1F0995;
	Tue, 27 May 2025 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHLP1OTu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597C1E32B7;
	Tue, 27 May 2025 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323411; cv=none; b=MOTBq5TuXNZ3s2z7G3VdaPCD4wF6133JBhloIORUUWb0OK1Sz932pd2Fbzc7+XWCjQU9vB0WU71v7nsQwUVYKVZuwKVb0zUZj4PU4ibh/1fdPLRamyuyftmBxPgv/Osq5/u9/AY/QUU5CLwN9AzKbVaVYIz9MDcH8tlpCbb6IHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323411; c=relaxed/simple;
	bh=qdbRA/Eml18oOkjntNDv57zIgV1Yf9jZpnL8r1ZIZcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4Tppb1PqXEtHxqjMjR2CdtH9P5EpuIQIsC3ixO77en1QNh/zCe94WFEVwXD3dA3LbjR+1J48sOwAjwbx6FNYFoVoKQGFBHSws39g8+xqPdG1MxTLB8k+dU0vX+C3/V6pVCgX7rFjTJtwGbdAufb3dBbxxzuGYq3+1s5tpjcIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHLP1OTu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ACDFC4CEF2;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748323410;
	bh=qdbRA/Eml18oOkjntNDv57zIgV1Yf9jZpnL8r1ZIZcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HHLP1OTu0Nqzt6AgZc/0MCTqjHSxOYparoIYVvl9mQan1VqSGbTwXBBzCpoJeXTU5
	 DD5ZMFs5WrrrVorTS3v6WnGbEVUl4E7UTeqSpBvwMdgEwzwtiFm07IQxKKjGaW83e8
	 xAPQOgIR0h5vTD7cBukijVBLwPig8U4E4jz2+C8bb0YxvakrWuA/hLhHndyMiacR/5
	 iIoswdFBwGir3o1h624bZxMMagdOUtuo5/V6laHYVuQtz0OEvVari2nr5bBBCTgByJ
	 hnINdm67trOm0sywNlFD3mzam5qmXK8G5/scp55JSEFjk1VtYxNdxkWeI+eGkR307x
	 RzxjUDOCdfLjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9104AC5AD49;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 May 2025 13:23:32 +0800
Subject: [PATCH v3 5/6] dts: arm64: amlogic: add S7D pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-s6-s7-pinctrl-v3-5-44f6a0451519@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748323408; l=3401;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=TkCzL2tpFVGFSar0wGinjtXWgNKBSbV+l775+YV5x9c=;
 b=EWY4VF4AYkuDz79BNUMWvs8VorMEmzWK1voY1ImWT594mZ5+4WrXL0vTyPnCbiVDQzHS6NsLp
 YcPi61WnNPYDzfYiH6ovpFbSUnu2ixNIVvFcAtS8I5mu8Ykl8GZCWKb
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic S7D.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 90 ++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index e1099bc1535d..c4d260d5bb58 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 
 / {
 	cpus {
@@ -94,6 +95,95 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			periphs_pinctrl: pinctrl@4000 {
+				compatible = "amlogic,pinctrl-s7d",
+					     "amlogic,pinctrl-s7";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x4000 0x0 0x340>;
+
+				gpioz: gpio@c0 {
+					reg = <0 0xc0 0 0x20>, <0 0x18 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 13>;
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
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 12>;
+				};
+
+				gpiod: gpio@180 {
+					reg = <0 0x180 0 0x20>, <0 0x40 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 5>;
+				};
+
+				gpioe: gpio@1c0 {
+					reg = <0 0x1c0 0 0x20>, <0 0x48 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
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
+				gpiodv: gpio@280 {
+					reg = <0 0x280 0 0x20>, <0 0x8 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_DV<<8) 7>;
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



