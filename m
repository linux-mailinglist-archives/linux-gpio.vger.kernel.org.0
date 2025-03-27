Return-Path: <linux-gpio+bounces-18053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E4A72C56
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 10:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38DF07A1D88
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17E520CCD9;
	Thu, 27 Mar 2025 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIvaULif"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591820C033;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743067598; cv=none; b=ELmIAZDM5fA3NsdIIc7XoObQ/c+ybATL8SjZpzEkwmCo++9o5c+iy37maW7HKhycZIwlzalOaq0dyVqSsbNOGahwk6YilRwyuBt3GpUqaeCUAQ7lr4B0hMMEPV+deD8jCLfegIqVrs8IpXEST0C+vSQx7Mo/qKLO2M1GWGHLrmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743067598; c=relaxed/simple;
	bh=cYPE4hxj2E/+XBZrJpUbI6pIfd/alhO++G3MPN6trQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuwC4K58ngAG86LFPrmE5TRap+3R04htu90BccXjCS7LEyDQo2CcRzWk1phv2WVifeYmKL4ATcXa3nMz1Hyqdo3OJQDe3Ptw8Iv4/1mcCDF2+3N/HRsnTx7yw9AIn1EudSj6Os09FXkCJuw552SrkpOlzdN1D7JsRfWRCqWKLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIvaULif; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FEE0C4CEE8;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743067597;
	bh=cYPE4hxj2E/+XBZrJpUbI6pIfd/alhO++G3MPN6trQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KIvaULifV+wNNdCEg0rADuuV03aLDbFJt2xFhV+hQy+PlpBujaLjMZEsQETNbgdrs
	 vYN7V3YJgCb089cg76MTE+GAOcL/XS/fQfmWJZEmdLvtq8MB2F0eXOlezyb4lvn2o4
	 u33iqe0WXMiYP6UF8iEQH7xlXe2TSv8db52uSsiL8ncISf78boipVxgZOjL5dsq4yR
	 /vIqgPbDY15O7A6S0GZDNrRXCD2Q72IOumgHLvbzCu9ivgMZDuilihifOT/4K+5TVO
	 pipwKiL2R9dukUop3CzcXUANyYAqlsqggPh1mfQ/BhubCnZGyXvHVxlDafC+dw7EM8
	 DYxFMa+7tvomQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84491C36012;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 27 Mar 2025 17:26:36 +0800
Subject: [PATCH 2/2] dts: arm64: amlogic: add a5 pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-a5-pinctrl-v1-2-49320349c463@amlogic.com>
References: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
In-Reply-To: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743067595; l=3211;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=zTXCd3mjrQB2UAQ+DUxS9Et3VYgrEbPO04Lv0RVd3Dc=;
 b=uLPxQhdvFA9JdqryhrPPHciK/D+98xm4FI8UAUBwfEwXpyZasZzFKunrWC9/x5mVLhU/vxfP4
 NoPpdyD8GfNBHqqLHLl/1XB6tVlZwAIYxK++H6ID02hl+ZCBuq+e21R
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A5.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 32ed1776891b..844302db2133 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "amlogic-a4-common.dtsi"
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 / {
 	cpus {
@@ -50,6 +51,95 @@ pwrc: power-controller {
 };
 
 &apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl-a5",
+			     "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
+
+		gpioz: gpio@c0 {
+			reg = <0x0 0xc0 0x0 0x40>,
+			      <0x0 0x18 0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
+		};
+
+		gpiox: gpio@100 {
+			reg = <0x0 0x100 0x0 0x40>,
+			      <0x0 0xc   0x0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
+		};
+
+		gpiot: gpio@140 {
+			reg = <0x0 0x140 0x0 0x40>,
+			      <0x0 0x2c  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
+		};
+
+		gpiod: gpio@180 {
+			reg = <0x0 0x180 0x0 0x40>,
+			      <0x0 0x40  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@1c0 {
+			reg = <0x0 0x1c0 0x0 0x40>,
+			      <0x0 0x48  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpioc: gpio@200 {
+			reg = <0x0 0x200 0x0 0x40>,
+			      <0x0 0x24  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
+		};
+
+		gpiob: gpio@240 {
+			reg = <0x0 0x240 0x0 0x40>,
+			      <0x0 0x0   0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		gpioh: gpio@280 {
+			reg = <0x0 0x280 0x0 0x40>,
+			      <0x0 0x4c  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
+		};
+
+		gpio_test_n: gpio@2c0 {
+			reg = <0x0 0x2c0 0x0 0x40>,
+			      <0x0 0x3c  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+	};
+
 	gpio_intc: interrupt-controller@4080 {
 		compatible = "amlogic,a5-gpio-intc",
 			     "amlogic,meson-gpio-intc";

-- 
2.37.1



