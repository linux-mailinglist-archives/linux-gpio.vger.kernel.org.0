Return-Path: <linux-gpio+bounces-20385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456EABEA55
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 05:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4BC68A174C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 03:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D573A22F3BE;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2Vu6rUm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D222D9F8;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797598; cv=none; b=CrzSg1Xuj7fOGXOeUGHaZ6GXY7Zv6OGAkeYwb96DRhLuKJOX5h3VX2MmL3pyz5BLU2NXkYsfQJvrFmIOd1Q3KaUwlsXTSJDIDdUF0PkwkGAMKWnizjGirWj8P+TroRkq2JgnEyHaHutgitlgwrdTLmQalNMKVUEr9avG+Z526hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797598; c=relaxed/simple;
	bh=Hj/dtiodyDNGd1NBE4jDypDZMQYKxKPm40P5Dg7K4HU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlwtFogkTbECsc1Q0mVl6RSJhUMC5v18eMKyNGnBdKdEvYTkePMnOZH3EFE05t6X1gb+Dk928MjWWRy+T4voYVMx/xoHSbzIdf+rHn+pE4BUX4CukxjqUttx3UOg85tNn/kvaqSdENXYiR+c2G6aKLvEkg1Wt8iS84HAIFW8P1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2Vu6rUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 116CDC4CEFA;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797598;
	bh=Hj/dtiodyDNGd1NBE4jDypDZMQYKxKPm40P5Dg7K4HU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O2Vu6rUmu834e9x61i2UfDkiJ3smJb7s3qXaAK7SBIWiyHUv6h4OhukY6IhO7Q/wk
	 duelz9fGhi8nq4lSEoR2VT/HwwBXS5h/yFHbkFCp5FUalEL0af+4bgkhNV3VrHw3k0
	 KsXmpXoWJ3BpI92BU+YosUjy8EWAFKxe1h7Js+wLXAuTxE5LMxEriCidp+nEhHnQ8f
	 bV+LuYrzTjPA/TJEjJnsOvGtapK4ST3kKUQenfHfpETDxiWoaTtWj82RLs4y3lklsv
	 Zb2/Rf4U4tb+lsmfAGj1/arNk2wNRv9IMGnz8+9W/FTtCkVfFmaQIlrEySgcROoTm5
	 Ee5UhxLoh+KvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0578CC54E92;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:20:00 +0800
Subject: [PATCH v2 6/8] dts: arm64: amlogic: add S7 pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-6-0ce5e3728404@amlogic.com>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
In-Reply-To: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=3129;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=fjCfY1jseWaBwy2ltob7mgikXcrVQkc9RawMyG1Dk4I=;
 b=L8ZMYTQOjtVZCs8goewOzpjby9CPsZsGv82xLFuzqFPqLBLZj/98aRkcRGDtSQYSgW0uJTH1W
 cj9CsA/QQrAD2PJNJwrN99KKJqnKWl0ZiiENaoPWqKjilMX+MTVnKcV
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic S7.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 81 +++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index f0c172681bd1..260918b37b9a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 
 / {
 	cpus {
@@ -94,6 +95,86 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			periphs_pinctrl: pinctrl@4000 {
+				compatible = "amlogic,pinctrl-s7";
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
+					reg = <0 0x180 0 0x20>, <0 0x40 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 12>;
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



