Return-Path: <linux-gpio+bounces-11383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E89D99F8AD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD4A1F23649
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9512003AF;
	Tue, 15 Oct 2024 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="RMf6wwVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DDF1FF044;
	Tue, 15 Oct 2024 21:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026323; cv=none; b=tVY338oZXIZSwrUsiWTxl2R6gxxPYpP2Ft3dNzh8WBbMN/yTr8X4MXG+I1o4zw6cLa6LlZwRUlPgntEtSdA/+TWWqHiJ2hqWvwKhwMv++ncUI+bb4UJLjaQIgJHgAsMnFZE6MFF7tL38oyJXI6haruR/Mlqh+4k1brDpXR9M5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026323; c=relaxed/simple;
	bh=prwkzYVAPS8mF4UPbbihuKENaA7AMZ05lgB99oMaIt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gf/Qc59mVcdCxHZJd6Hu6FkGmPA6C2fuDWaLlbt7/lA4PlFGUpdRPici11dUWlAjziRSkMlfEPSq/zw1k4LUDJyoeiYbFHOtscBwkoBhqdVTVd1gIcYPaSZS3wAfuaO+NjQRQHRGYFXAvGVnDzC/IXWDkbKHIMtLg3lRJCE5zOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=RMf6wwVk; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmp40VZqz4wLk;
	Tue, 15 Oct 2024 21:05:16 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmnw1BfBz8sWN;
	Tue, 15 Oct 2024 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026310;
	bh=prwkzYVAPS8mF4UPbbihuKENaA7AMZ05lgB99oMaIt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMf6wwVk41akzy1rRS1O/XCx0j+MeBmaM1QMmlM3lH2lBUWmrfhaTZpCpxLsgA694
	 OexDU91N8N7xxTNtV/reARbZg0QffTNiQhrqOqDqaGXfPGtzXM9/M46i9qB++KyROk
	 nXCReV8wDwFAJEpNV7o3nOAMUn2/FK27sKiA/1GmSY69H6NiAMLzKJ4voYvrCfWJ8O
	 /ci09AFKVseCL36JY8G0ZniISY5q6ONqpaFQPX6wvvvH4q8EXswfc/1bfbGTDP8WLs
	 nz/tF2H94c/HLwPCjKzsuSXl7GkF5d/6biyxvl2QLy83j9z7U3dsvpmH9IlQ+PqNSW
	 suFuy4uBpZLZA==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos: Add Exynos 990 pinctrl nodes
Date: Tue, 15 Oct 2024 23:04:49 +0200
Message-ID: <20241015210450.964093-5-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl nodes for the Exynos 990 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../boot/dts/exynos/exynos990-pinctrl.dtsi    | 2195 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi     |   57 +
 2 files changed, 2252 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
new file mode 100644
index 000000000000..a03d36458d76
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
@@ -0,0 +1,2195 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Exynos 990 pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa3: gpa3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa4: gpa4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpq0: gpq0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	speedy_bus: speedy-bus-pins {
+		samsung,pins = "gpq0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	speedy1_bus: speedy1-bus-pins {
+		samsung,pins = "gpq0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* UART1 is also referred to as UART_BT in downstream. */
+	uart1_bus_single: uart1-bus-pins {
+		samsung,pins = "gpq0-3", "gpq0-2", "gpq0-1", "gpq0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	uart1_rxd_pull: uart1-bus-rxd-pins {
+		samsung,pins = "gpq0-0";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	uart1_bus_rts: uart1-bus-rts-pins {
+		samsung,pins = "gpq0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart1_bus_tx_input: uart1-bus-tx-input-pins {
+		samsung,pins = "gpq0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	uart1_bus_tx_dat: uart1-bus-tx-dat-pins {
+		samsung,pins = "gpq0-1";
+	};
+
+	uart1_bus_tx_con: uart1-bus-tx-con-pins {
+		samsung,pins = "gpq0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+	};
+
+	wlan_host_wake: wlan-host-wake-pins {
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl_cmgp {
+	gpm0: gpm0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpm1: gpm1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpm2: gpm2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpm3: gpm3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpm4: gpm4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm5: gpm5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm6: gpm6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm7: gpm7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm8: gpm8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm9: gpm9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm10: gpm10-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm11: gpm11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm12: gpm12-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm13: gpm13-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm14: gpm14-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm15: gpm15-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm16: gpm16-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm17: gpm17-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm18: gpm18-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm19: gpm19-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm20: gpm20-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm21: gpm21-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm22: gpm22-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm23: gpm23-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm24: gpm24-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm25: gpm25-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm26: gpm26-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm27: gpm27-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm28: gpm28-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm29: gpm29-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm30: gpm30-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm31: gpm31-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm32: gpm32-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm33: gpm33-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	hsi2c38_bus: hsi2c38-bus-pins {
+		samsung,pins = "gpm0-0", "gpm1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c39_bus: hsi2c39-bus-pins {
+		samsung,pins = "gpm2-0", "gpm3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c40_bus: hsi2c40-bus-pins {
+		samsung,pins = "gpm4-0", "gpm5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c41_bus: hsi2c41-bus-pins {
+		samsung,pins = "gpm6-0", "gpm7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c42_bus: hsi2c42-bus-pins {
+		samsung,pins = "gpm8-0", "gpm9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c43_bus: hsi2c43-bus-pins {
+		samsung,pins = "gpm10-0", "gpm11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c44_bus: hsi2c44-bus-pins {
+		samsung,pins = "gpm12-0", "gpm13-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c45_bus: hsi2c45-bus-pins {
+		samsung,pins = "gpm14-0", "gpm15-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi19_bus: spi19-bus-pins {
+		samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi19_cs: spi19-cs-pins {
+		samsung,pins = "gpm3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi19_cs_func: spi19-cs-func-pins {
+		samsung,pins = "gpm3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi20_bus: spi20-bus-pins {
+		samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi20_cs: spi20-cs-pins {
+		samsung,pins = "gpm7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi20_cs_func: spi20-cs-func-pins {
+		samsung,pins = "gpm7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi21_bus: spi21-bus-pins {
+		samsung,pins = "gpm8-0", "gpm9-0", "gpm10-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi21_cs: spi21-cs-pins {
+		samsung,pins = "gpm11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi21_cs_func: spi21-cs-func-pins {
+		samsung,pins = "gpm11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi22_bus: spi22-bus-pins {
+		samsung,pins = "gpm12-0", "gpm13-0", "gpm14-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi22_cs: spi22-cs-pins {
+		samsung,pins = "gpm15-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi22_cs_func: spi22-cs-func-pins {
+		samsung,pins = "gpm15-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	uart21_bus_single: uart21-bus-pins {
+		samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0", "gpm3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart21_bus_dual: uart21-bus-dual-pins {
+		samsung,pins = "gpm0-0", "gpm1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart22_bus_single: uart22-bus-pins {
+		samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0", "gpm7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart22_bus_dual: uart22-bus-dual-pins {
+		samsung,pins = "gpm4-0", "gpm5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart23_bus_single: uart23-bus-pins {
+		samsung,pins = "gpm8-0", "gpm9-0", "gpm10-0", "gpm11-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart23_bus_dual: uart23-bus-dual-pins {
+		samsung,pins = "gpm8-0", "gpm9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart24_bus_single: uart24-bus-pins {
+		samsung,pins = "gpm12-0", "gpm13-0", "gpm14-0", "gpm15-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart24_bus_dual: uart24-bus-dual-pins {
+		samsung,pins = "gpm12-0", "gpm13-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_hsi1 {
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pcie0_clkreq: pcie0-clkreq-pins {
+		samsung,pins = "gpf0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie0_perst: pcie0-perst-pins {
+		samsung,pins = "gpf0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie1_clkreq: pcie1-clkreq-pins {
+		samsung,pins = "gpf0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie1_perst: pcie1-perst-pins {
+		samsung,pins = "gpf0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	ufs_rst_n: ufs-rst-n-pins {
+		samsung,pins = "gpf2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	ufs_refclk_out: ufs-refclk-out-pins {
+		samsung,pins = "gpf2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	sd2_clk: sd2-clk-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV3>;
+	};
+
+	sd2_cmd: sd2-cmd-pins {
+		samsung,pins = "gpf1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+	};
+
+	sd2_bus1: sd2-bus-width1-pins {
+		samsung,pins = "gpf1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+	};
+
+	sd2_bus4: sd2-bus-width4-pins {
+		samsung,pins = "gpf1-3", "gpf1-4", "gpf1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+	};
+
+	sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV1>;
+	};
+
+	sd2_clk_fast_slew_rate_1_5x: sd2-clk-fast-slew-rate-1-5x-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV1_5>;
+	};
+
+	sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2>;
+	};
+
+	sd2_clk_fast_slew_rate_2_5x: sd2-clk-fast-slew-rate-2-5x-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2_5>;
+	};
+
+	sd2_clk_fast_slew_rate_3x: sd2-clk-fas-slew-rate-3x-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV3>;
+	};
+
+	sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV4>;
+	};
+
+	sd2_pins_as_pdn: sd2-pins-as-pdn-pins {
+		samsung,pins = "gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3", "gpf1-4", "gpf1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+};
+
+&pinctrl_hsi2 {
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pcie2_clkreq: pcie2-clkreq-pins {
+		samsung,pins = "gpf3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie2_perst: pcie2-perst-pins {
+		samsung,pins = "gpf3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpg0: gpg0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp0: gpp0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp1: gpp1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp2: gpp2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp3: gpp3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp4: gpp4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pins = "gpp0-0", "gpp0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pins = "gpp0-2", "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pins = "gpp0-4", "gpp0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pins = "gpp0-6", "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c4_bus: hsi2c4-bus-pins {
+		samsung,pins = "gpp1-0", "gpp1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	hsi2c5_bus: hsi2c5-bus-pins {
+		samsung,pins = "gpp1-2", "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus-pins {
+		samsung,pins = "gpp1-4", "gpp1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c7_bus: hsi2c7-bus-pins {
+		samsung,pins = "gpp1-6", "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c8_bus: hsi2c8-bus-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c9_bus: hsi2c9-bus-pins {
+		samsung,pins = "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c10_bus: hsi2c10-bus-pins {
+		samsung,pins = "gpp2-4", "gpp2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c11_bus: hsi2c11-bus-pins {
+		samsung,pins = "gpp2-6", "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c26_bus: hsi2c26-bus-pins {
+		samsung,pins = "gpp3-0", "gpp3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c27_bus: hsi2c27-bus-pins {
+		samsung,pins = "gpp3-2", "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	hsi2c28_bus: hsi2c28-bus-pins {
+		samsung,pins = "gpp3-4", "gpp3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c29_bus: hsi2c29-bus-pins {
+		samsung,pins = "gpp3-6", "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c30_bus: hsi2c30-bus-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c31_bus: hsi2c31-bus-pins {
+		samsung,pins = "gpp4-2", "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpp0-2", "gpp0-1", "gpp0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi0_cs: spi0-cs-pins {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi0_cs_func: spi0-cs-func-pins {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pins = "gpp0-6", "gpp0-5", "gpp0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi1_cs: spi1-cs-pins {
+		samsung,pins = "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi1_cs_func: spi1-cs-func-pins {
+		samsung,pins = "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pins = "gpp1-2", "gpp1-1", "gpp1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi2_cs: spi2-cs-pins {
+		samsung,pins = "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi2_cs_func: spi2-cs-func-pins {
+		samsung,pins = "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pins = "gpp1-6", "gpp1-5", "gpp1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi3_cs: spi3-cs-pins {
+		samsung,pins = "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi3_cs_func: spi3-cs-func-pins {
+		samsung,pins = "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pins = "gpp2-2", "gpp2-1", "gpp2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi4_cs: spi4-cs-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi4_cs_func: spi4-cs-func-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi4_fp_inactive: spi4-fp-inactive-pins {
+		samsung,pins = "gpp2-3", "gpp2-2", "gpp2-1", "gpp2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi4_fp_cs_func_high: spi4-fp-cs-func-high-pins {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi5_bus: spi5-bus-pins {
+		samsung,pins = "gpp2-6", "gpp2-5", "gpp2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi5_cs: spi5-cs-pins {
+		samsung,pins = "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi5_cs_func: spi5-cs-func-pins {
+		samsung,pins = "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi13_bus: spi13-bus-pins {
+		samsung,pins = "gpp3-2", "gpp3-1", "gpp3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi13_cs: spi13-cs-pins {
+		samsung,pins = "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi13_cs_func: spi13-cs-func-pins {
+		samsung,pins = "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi14_bus: spi14-bus-pins {
+		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi14_cs: spi14-cs-pins {
+		samsung,pins = "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi14_cs_func: spi14-cs-func-pins {
+		samsung,pins = "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi15_bus: spi15-bus-pins {
+		samsung,pins = "gpp4-2", "gpp4-1", "gpp4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi15_cs: spi15-cs-pins {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi15_cs_func: spi15-cs-func-pins {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	uart0_bus: uart0-bus-pins {
+		samsung,pins = "gpp4-6", "gpp4-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	uart2_bus_single: uart2-bus-pins {
+		samsung,pins = "gpp0-0", "gpp0-1", "gpp0-2", "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_bus_dual: uart2-bus-dual-pins {
+		samsung,pins = "gpp0-0", "gpp0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_single: uart3-bus-pins {
+		samsung,pins = "gpp0-4", "gpp0-5", "gpp0-6", "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_dual: uart3-bus-dual-pins {
+		samsung,pins = "gpp0-4", "gpp0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_single: uart4-bus-pins {
+		samsung,pins = "gpp1-0", "gpp1-1", "gpp1-2", "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_dual: uart4-bus-dual-pins {
+		samsung,pins = "gpp1-0", "gpp1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_single: uart5-bus-pins {
+		samsung,pins = "gpp1-4", "gpp1-5", "gpp1-6", "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_dual: uart5-bus-dual-pins {
+		samsung,pins = "gpp1-4", "gpp1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart6_bus_single: uart6-bus-pins {
+		samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart6_bus_dual: uart6-bus-dual-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_single: uart7-bus-pins {
+		samsung,pins = "gpp2-4", "gpp2-5", "gpp2-6", "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_dual: uart7-bus-dual-pins {
+		samsung,pins = "gpp2-4", "gpp2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_single: uart15-bus-pins {
+		samsung,pins = "gpp3-0", "gpp3-1", "gpp3-2", "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_dual: uart15-bus-dual-pins {
+		samsung,pins = "gpp3-0", "gpp3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart16_bus_single: uart16-bus-pins {
+		samsung,pins = "gpp3-4", "gpp3-5", "gpp3-6", "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart16_bus_dual: uart16-bus-dual-pins {
+		samsung,pins = "gpp3-4", "gpp3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart17_bus_single: uart17-bus-pins {
+		samsung,pins = "gpp4-0", "gpp4-1", "gpp4-2", "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart17_bus_dual: uart17-bus-dual-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_peric1 {
+	gpb0: gpb0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb1: gpb1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb2: gpb2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg1: gpg1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp5: gpp5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp6: gpp6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp7: gpp7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp8: gpp8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp9: gpp9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	aud_i2s0_bus: aud-i2s0-bus-pins {
+		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s0_idle: aud-i2s0-idle-pins {
+		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s1_bus: aud-i2s1-bus-pins {
+		samsung,pins = "gpb0-4", "gpb0-5", "gpb0-6", "gpb0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s1_idle: aud-i2s1-idle-pins {
+		samsung,pins = "gpb0-4", "gpb0-5", "gpb0-6", "gpb0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s2_bus: aud-i2s2-bus-pins {
+		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s2_idle: aud-i2s2-idle-pins {
+		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s3_bus: aud-i2s3-bus-pins {
+		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s3_idle: aud-i2s3-idle-pins {
+		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s4_bus: aud-i2s4-bus-pins {
+		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s4_pci: aud-i2s4-pci-pins {
+		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s4_idle: aud-i2s4-idle-pins {
+		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s5_bus: aud-i2s5-bus-pins {
+		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_i2s5_idle: aud-i2s5-idle-pins {
+		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_dsd_bus: aud-dsd-bus-pins {
+		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	aud_dsd_idle: aud-dsd-idle-pins {
+		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	cfg_wlanen: cfg-wlanen-pins {
+		samsung,pins = "gpb0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	cnss_wlan_en_active: cnss-wlan-en-active-pins {
+		samsung,pins = "gpb0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	cnss_wlan_en_sleep: cnss-wlan-en-sleep-pins {
+		samsung,pins = "gpb0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	decon_f_te_on: decon-f-te-on-pins {
+		samsung,pins = "gpc0-4";
+		samsung,pin-function = <0xf>;
+	};
+
+	decon_f_te_off: decon-f-te-off-pins {
+		samsung,pins = "gpc0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+	};
+
+	decon_s_te_on: decon-s-te-on-pins {
+		samsung,pins = "gpc0-5";
+		samsung,pin-function = <0xf>;
+	};
+
+	decon_s_te_off: decon-s-te-off-pins {
+		samsung,pins = "gpc0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+	};
+
+	hsi2c12_bus: hsi2c12-bus-pins {
+		samsung,pins = "gpp5-0", "gpp5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c13_bus: hsi2c13-bus-pins {
+		samsung,pins = "gpp5-2", "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c14_bus: hsi2c14-bus-pins {
+		samsung,pins = "gpp5-4", "gpp5-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c15_bus: hsi2c15-bus-pins {
+		samsung,pins = "gpp5-6", "gpp5-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c16_bus: hsi2c16-bus-pins {
+		samsung,pins = "gpp6-0", "gpp6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c17_bus: hsi2c17-bus-pins {
+		samsung,pins = "gpp6-2", "gpp6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c18_bus: hsi2c18-bus-pins {
+		samsung,pins = "gpp6-4", "gpp6-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c19_bus: hsi2c19-bus-pins {
+		samsung,pins = "gpp6-6", "gpp6-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c20_bus: hsi2c20-bus-pins {
+		samsung,pins = "gpp7-0", "gpp7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c21_bus: hsi2c21-bus-pins {
+		samsung,pins = "gpp7-2", "gpp7-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c22_bus: hsi2c22-bus-pins {
+		samsung,pins = "gpp7-4", "gpp7-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c23_bus: hsi2c23-bus-pins {
+		samsung,pins = "gpp7-6", "gpp7-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c24_bus: hsi2c24-bus-pins {
+		samsung,pins = "gpp8-0", "gpp8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c25_bus: hsi2c25-bus-pins {
+		samsung,pins = "gpp8-2", "gpp8-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c32_bus: hsi2c32-bus-pins {
+		samsung,pins = "gpp8-4", "gpp8-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c33_bus: hsi2c33-bus-pins {
+		samsung,pins = "gpp8-6", "gpp8-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c34_bus: hsi2c34-bus-pins {
+		samsung,pins = "gpp9-0", "gpp9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c35_bus: hsi2c35-bus-pins {
+		samsung,pins = "gpp9-2", "gpp9-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c36_bus: hsi2c36-bus-pins {
+		samsung,pins = "gpp9-4", "gpp9-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	hsi2c37_bus: hsi2c37-bus-pins {
+		samsung,pins = "gpp9-6", "gpp9-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk0_out: sensor-mclk0-out-pins {
+		samsung,pins = "gpc0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk1_out: sensor-mclk1-out-pins {
+		samsung,pins = "gpg1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk2_out: sensor-mclk2-out-pins {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk3_out: sensor-mclk3-out-pins {
+		samsung,pins = "gpc0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk4_out: sensor-mclk4-out-pins {
+		samsung,pins = "gpc0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk5_out: sensor-mclk5-out-pins {
+		samsung,pins = "gpg1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk0_fn: sensor-mclk0-fn-pins {
+		samsung,pins = "gpc0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk1_fn: sensor-mclk1-fn-pins {
+		samsung,pins = "gpg1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk2_fn: sensor-mclk2-fn-pins {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk3_fn: sensor-mclk3-fn-pins {
+		samsung,pins = "gpc0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk4_fn: sensor-mclk4-fn-pins {
+		samsung,pins = "gpc0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	sensor_mclk5_fn: sensor-mclk5-fn-pins {
+		samsung,pins = "gpg1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi6_bus: spi6-bus-pins {
+		samsung,pins = "gpp5-2", "gpp5-1", "gpp5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi6_cs: spi6-cs-pins {
+		samsung,pins = "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi6_cs_func: spi6-cs-func-pins {
+		samsung,pins = "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi7_bus: spi7-bus-pins {
+		samsung,pins = "gpp5-6", "gpp5-5", "gpp5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi7_cs: spi7-cs-pins {
+		samsung,pins = "gpp5-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi7_cs_func: spi7-cs-func-pins {
+		samsung,pins = "gpp5-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi8_bus: spi8-bus-pins {
+		samsung,pins = "gpp6-2", "gpp6-1", "gpp6-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi8_cs: spi8-cs-pins {
+		samsung,pins = "gpp6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi8_cs_func: spi8-cs-func-pins {
+		samsung,pins = "gpp6-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi9_bus: spi9-bus-pins {
+		samsung,pins = "gpp6-6", "gpp6-5", "gpp6-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi9_cs: spi9-cs-pins {
+		samsung,pins = "gpp6-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi9_cs_func: spi9-cs-func-pins {
+		samsung,pins = "gpp6-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi10_bus: spi10-bus-pins {
+		samsung,pins = "gpp7-2", "gpp7-1", "gpp7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi10_cs: spi10-cs-pins {
+		samsung,pins = "gpp7-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi10_cs_func: spi10-cs-func-pins {
+		samsung,pins = "gpp7-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi11_bus: spi11-bus-pins {
+		samsung,pins = "gpp7-6", "gpp7-5", "gpp7-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi11_cs: spi11-cs-pins {
+		samsung,pins = "gpp7-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi11_cs_func: spi11-cs-func-pins {
+		samsung,pins = "gpp7-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi12_bus: spi12-bus-pins {
+		samsung,pins = "gpp8-2", "gpp8-1", "gpp8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi12_cs: spi12-cs-pins {
+		samsung,pins = "gpp8-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi12_cs_func: spi12-cs-func-pins {
+		samsung,pins = "gpp8-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi16_bus: spi16-bus-pins {
+		samsung,pins = "gpp8-6", "gpp8-5", "gpp8-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi16_cs: spi16-cs-pins {
+		samsung,pins = "gpp8-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi16_cs_func: spi16-cs-func-pins {
+		samsung,pins = "gpp8-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi17_bus: spi17-bus-pins {
+		samsung,pins = "gpp9-2", "gpp9-1", "gpp9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi17_cs: spi17-cs-pins {
+		samsung,pins = "gpp9-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi17_cs_func: spi17-cs-func-pins {
+		samsung,pins = "gpp9-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi18_bus: spi18-bus-pins {
+		samsung,pins = "gpp9-6", "gpp9-5", "gpp9-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi18_cs: spi18-cs-pins {
+		samsung,pins = "gpp9-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi18_cs_func: spi18-cs-func-pins {
+		samsung,pins = "gpp9-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	uart8_bus_single: uart8-bus-pins {
+		samsung,pins = "gpp5-3", "gpp5-2", "gpp5-1", "gpp5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus_dual: uart8-bus-dual-pins {
+		samsung,pins = "gpp5-0", "gpp5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus_single: uart9-bus-pins {
+		samsung,pins = "gpp5-7", "gpp5-6", "gpp5-5", "gpp5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus_dual: uart9-bus-dual-pins {
+		samsung,pins = "gpp5-4", "gpp5-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_single: uart10-bus-pins {
+		samsung,pins = "gpp6-3", "gpp6-2", "gpp6-1", "gpp6-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_dual: uart10-bus-dual-pins {
+		samsung,pins = "gpp6-0", "gpp6-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_single: uart11-bus-pins {
+		samsung,pins = "gpp6-7", "gpp6-6", "gpp6-5", "gpp6-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_dual: uart11-bus-dual-pins {
+		samsung,pins = "gpp6-4", "gpp6-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_single: uart12-bus-pins {
+		samsung,pins = "gpp7-3", "gpp7-2", "gpp7-1", "gpp7-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_dual: uart12-bus-dual-pins {
+		samsung,pins = "gpp7-0", "gpp7-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_single: uart13-bus-pins {
+		samsung,pins = "gpp7-7", "gpp7-6", "gpp7-5", "gpp7-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_dual: uart13-bus-dual-pins {
+		samsung,pins = "gpp7-4", "gpp7-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus_single: uart14-bus-pins {
+		samsung,pins = "gpp8-3", "gpp8-2", "gpp8-1", "gpp8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus_dual: uart14-bus-dual-pins {
+		samsung,pins = "gpp8-0", "gpp8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart18_bus_single: uart18-bus-pins {
+		samsung,pins = "gpp8-7", "gpp8-6", "gpp8-5", "gpp8-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart18_bus_dual: uart18-bus-dual-pins {
+		samsung,pins = "gpp8-4", "gpp8-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart19_bus_single: uart19-bus-pins {
+		samsung,pins = "gpp9-3", "gpp9-2", "gpp9-1", "gpp9-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart19_bus_dual: uart19-bus-dual-pins {
+		samsung,pins = "gpp9-0", "gpp9-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart20_bus_single: uart20-bus-pins {
+		samsung,pins = "gpp9-7", "gpp9-6", "gpp9-5", "gpp9-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart20_bus_dual: uart20-bus-dual-pins {
+		samsung,pins = "gpp9-4", "gpp9-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_vts {
+	gpv0: gpv0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	amic_pdm: amic-pdm-pins {
+		samsung,pins = "gpv0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk: dmic-bus-clk-pins {
+		samsung,pins = "gpv0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk_idle: dmic-bus-clk-idle-pins {
+		samsung,pins = "gpv0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk1: dmic-bus-clk1-pins {
+		samsung,pins = "gpv0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk1_idle: dmic-bus-clk1-idle-pins {
+		samsung,pins = "gpv0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk2: dmic-bus-clk2-pins {
+		samsung,pins = "gpv0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_bus_clk2_idle: dmic-bus-clk2-idle-pins {
+		samsung,pins = "gpv0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm: dmic-pdm-pins {
+		samsung,pins = "gpv0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm_idle: dmic-pdm-idle-pins {
+		samsung,pins = "gpv0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm1_bus: dmic-pdm1-bus-pins {
+		samsung,pins = "gpv0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm1_idle: dmic-pdm1-idle-pins {
+		samsung,pins = "gpv0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm2_bus: dmic-pdm2-bus-pins {
+		samsung,pins = "gpv0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+
+	dmic_pdm2_idle: dmic-pdm2-idle-pins {
+		samsung,pins = "gpv0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 16fda5fe8163..c1986f00e443 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -14,6 +14,16 @@ / {
 
 	interrupt-parent = <&gic>;
 
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_cmgp;
+		pinctrl2 = &pinctrl_hsi1;
+		pinctrl3 = &pinctrl_hsi2;
+		pinctrl4 = &pinctrl_peric0;
+		pinctrl5 = &pinctrl_peric1;
+		pinctrl6 = &pinctrl_vts;
+	};
+
 	arm-a55-pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
@@ -176,6 +186,51 @@ gic: interrupt-controller@10101000 {
 			#address-cells = <0>;
 			#size-cells = <1>;
 		};
+
+		pinctrl_peric0: pinctrl@10430000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x10430000 0x1000>;
+			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric1: pinctrl@10730000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x10730000 0x1000>;
+			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_hsi1: pinctrl@13040000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x13040000 0x1000>;
+			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_hsi2: pinctrl@13c30000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x13c30000 0x1000>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_vts: pinctrl@15580000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x15580000 0x1000>;
+		};
+
+		pinctrl_alive: pinctrl@15850000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x15850000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos990-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_cmgp: pinctrl@15c30000 {
+			compatible = "samsung,exynos990-pinctrl";
+			reg = <0x15c30000 0x1000>;
+		};
 	};
 
 	timer {
@@ -192,3 +247,5 @@ timer {
 		clock-frequency = <26000000>;
 	};
 };
+
+#include "exynos990-pinctrl.dtsi"
-- 
2.45.2


