Return-Path: <linux-gpio+bounces-11293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB699C4E4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA52FB2BEC9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBA8156C6F;
	Mon, 14 Oct 2024 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUVO0SEU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8591527BB;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896765; cv=none; b=edHf/IkHMjHCalbd3z2TZ/DKykch8q//tybrsgJzyc/HTyZUWNDYjyVrcFStZCS5tKOgwpH0Uiqg7vYm5rZQSfMvhLWDwbBMjIqfpfPpsd43wEjNOgCEM1D2NGHcybpBi309KUF39QUfbzRTZC8mNhlXEBmZZ+NMY6VIBu6XNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896765; c=relaxed/simple;
	bh=MtB6QbmqNb4ufVq80lo9MPhDT5CunsbL/rj/E+3vF4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYdcpGT9yQeGK3OAQKdc/Yqh4LdwHfUaC3u8k6jPaEv6odxmBxDeb32uGcoZ9+z3Cl4obXGuSiicCJcWtn4CoBMJrV20m5bab4HvKvXh8OUOjU59DqXr7coESgcte5toHSEisDS52DDApTreLXw8x0SefRs+TCMQPRxFWaLBkO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUVO0SEU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82E3BC4CED2;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728896764;
	bh=MtB6QbmqNb4ufVq80lo9MPhDT5CunsbL/rj/E+3vF4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nUVO0SEUw0dbjsxbaJfZevaZJr3MM/qpom3NoWj4b+PDNr2LZHFnjFtii2kgay7Lk
	 cGoI+C4mcMKIbP+dVA0mZjQdeghhp9U/988GarYpHzA8zlfpUcsnB8kALc+d6sv9aD
	 Wd1qd7DcPvHL0cuyDVxeIV+jX6BGC0QhFYZtUyVWD+rui5lhg/t8b/SCk3oqgA97sr
	 5XDHBM5ZDl4HUReLxrsjzXzwMaBfTlMU2uohgfaT80I+X+zdRNGeRD8R8tkm6G5PZu
	 AU7Y7MsiF614aW9UsAyFy0n2zyUQDPVR3C9hHwQmQOjexLjSnNUp06Ox9/NwYmqIW/
	 lottLx82Rk40A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B34CFC527;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 14 Oct 2024 17:05:53 +0800
Subject: [PATCH v2 3/3] arm64: dts: amlogic: a4: add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
In-Reply-To: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896762; l=1593;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=C3HURuKYy33qf23hNf067NewT9lHq3pt8By8uPgxg5g=;
 b=qqhTr2rQmwMKDgYY/dL2jR89f0X7pkQ60FXWN8yWMQYWvBlmArE8F7hm2XIkZQvzjNY0Ylx73
 OGigvcbliGmCPdGvYMNgsw5QwjEgSqUoIJzLUXFJNqjMSea2R64bQ4i
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a748351e8b1b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/gpio/amlogic-a4-gpio.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 PERIPHS_PIN_NUM>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&aobus_pinctrl 0 0 AOBUS_PIN_NUM>;
+		};
+	};
+
+};

-- 
2.37.1



