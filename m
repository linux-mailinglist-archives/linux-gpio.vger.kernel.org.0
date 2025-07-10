Return-Path: <linux-gpio+bounces-23050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C1AFF5DB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8874A48B7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4ED1F09B6;
	Thu, 10 Jul 2025 00:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="LLIjLWsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD21CF5C0
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106874; cv=none; b=fUEKv+3Ec+0T0DrI/1Wsd7az1FWnnai/eIC5PiqhmonEmQLkeSWW6kH0NnOGB5Kp73IPdiBBeyP1Hfp/hqA/5YuZ/XRtl5E1hohJyJsPMaXGA0VQe7jTHjNNecxWqpVOCO+igvWnUjRpjSrs+FiIpAjTxcA9iCJDjF8GfVBnZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106874; c=relaxed/simple;
	bh=VXMeEzCpt7byvNMipZoteX6Lo9p/O94MNW8zdQ1oez8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DqnpRm+lA6dBJQWf/j71H+j+poVttZoYssr/I4aFGoi7pd9sm4UmWpvSclGeK/nJoCE41UBeoTdf88bLDsvNclW1hv/y6li0egQwCMIN1nTVC3HCgf9RpRKmbfPky//eMRHev8e1k+oggOJQLkxhyA1mJHGtCpOtysTq6aD3Vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=LLIjLWsL; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106869; bh=VXMeEzCpt7byvNMipZoteX6Lo9p/O94MNW8zdQ1oez8=;
	l=14080; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=LLIjLWsLlLzLLm2HYEqhWQ3ricFanQjt+Aen6uaSSxtS6A5eJtx8zvlC0Z0wkSk5w
	 fqBTgUhnodj9Urzv4bwpJiBI0+o++k4OsrJuzllANVTnJ6zpQCwySZvuhQGDtKZ480
	 l0AZIP7YpvqoBK97k6zoDhbyykLtXVBsmu/cNnNo=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:21:08 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ravi Patel <ravi.patel@samsung.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 15/16] arm64: dts: axis: Add initial pinctrl support
Date: Thu, 10 Jul 2025 09:20:45 +0900
Message-Id: <20250710002047.1573841-16-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: SeonGu Kang <ksk4725@coasia.com>

Add initial pin configuration nodes for the Axis ARTPEC-8 SoC.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
---
 arch/arm64/boot/dts/axis/artpec-pinctrl.h     |  36 ++
 arch/arm64/boot/dts/axis/artpec8-grizzly.dts  |   1 +
 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi | 373 ++++++++++++++++++
 arch/arm64/boot/dts/axis/artpec8.dtsi         |  17 +
 4 files changed, 427 insertions(+)
 create mode 100644 arch/arm64/boot/dts/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/axis/artpec-pinctrl.h
new file mode 100644
index 000000000000..c2c1e25b7f6a
--- /dev/null
+++ b/arch/arm64/boot/dts/axis/artpec-pinctrl.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Axis ARTPEC-8 SoC device tree pinctrl constants
+ *
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2022-2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#ifndef __DTS_ARM64_AXIS_ARTPEC_PINCTRL_H__
+#define __DTS_ARM64_AXIS_ARTPEC_PINCTRL_H__
+
+#define ARTPEC_PIN_PULL_NONE		0
+#define ARTPEC_PIN_PULL_DOWN		1
+#define ARTPEC_PIN_PULL_UP		3
+
+#define ARTPEC_PIN_FUNC_INPUT		0
+#define ARTPEC_PIN_FUNC_OUTPUT		1
+#define ARTPEC_PIN_FUNC_2		2
+#define ARTPEC_PIN_FUNC_3		3
+#define ARTPEC_PIN_FUNC_4		4
+#define ARTPEC_PIN_FUNC_5		5
+#define ARTPEC_PIN_FUNC_6		6
+#define ARTPEC_PIN_FUNC_EINT		0xf
+#define ARTPEC_PIN_FUNC_F		ARTPEC_PIN_FUNC_EINT
+
+/* Drive strength for ARTPEC */
+#define ARTPEC_PIN_DRV_SR1		0x8
+#define ARTPEC_PIN_DRV_SR2		0x9
+#define ARTPEC_PIN_DRV_SR3		0xa
+#define ARTPEC_PIN_DRV_SR4		0xb
+#define ARTPEC_PIN_DRV_SR5		0xc
+#define ARTPEC_PIN_DRV_SR6		0xd
+
+#endif /* __DTS_ARM64_AXIS_ARTPEC_PINCTRL_H__ */
diff --git a/arch/arm64/boot/dts/axis/artpec8-grizzly.dts b/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
index 7671130a0333..f14420e76188 100644
--- a/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
+++ b/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 #include "artpec8.dtsi"
+#include "artpec8-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 / {
 	model = "ARTPEC-8 grizzly board";
diff --git a/arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi
new file mode 100644
index 000000000000..2d22a8be9d61
--- /dev/null
+++ b/arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2022-2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include "artpec-pinctrl.h"
+
+&pinctrl_fsys {
+	serial0_bus: serial0-bus-pins {
+		samsung,pins = "gpf4-4", "gpf4-5";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	qspi_clk: qspi-clk-pins {
+		samsung,pins = "gpf0-2";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_4>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	qspi_data: qspi-data-pins {
+		samsung,pins = "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_4>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps0: gps0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps1: gps1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pins = "gpf4-0", "gpf4-1";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pins = "gpf4-2", "gpf4-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	pwm0_out: pwm0-out-pins {
+		samsung,pins = "gpf3-0";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	pwm1_out: pwm1-out-pins {
+		samsung,pins = "gpf3-1";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	pwm2_out: pwm2-out-pins {
+		samsung,pins = "gpf3-2";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	pwm3_out: pwm3-out-pins {
+		samsung,pins = "gpf3-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc0_clk: mmc0-clk-pins {
+		samsung,pins = "gps0-0";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc0_bus: mmc0-bus-pins {
+		samsung,pins = "gps0-1", "gps0-2", "gps0-3", "gps0-4", "gps0-5";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc0_cd: mmc0-cd-pins {
+		samsung,pins = "gps0-6";
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc0_wp: mmc0-wp-pins {
+		samsung,pins = "gps0-7";
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc0_rst: mmc0-rst-pins {
+		samsung,pins = "gps0-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc1_clk: mmc1-clk-pins {
+		samsung,pins = "gps1-0";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc1_bus: mmc1-bus-pins {
+		samsung,pins = "gps1-1", "gps1-2", "gps1-3", "gps1-4", "gps1-5";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc1_cd: mmc1-cd-pins {
+		samsung,pins = "gps1-6";
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc1_wp: mmc1-wp-pins {
+		samsung,pins = "gps1-7";
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	mmc1_rst: mmc1-rst-pins {
+		samsung,pins = "gps1-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_DOWN>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	eth_gpio: eth-gpio-pins {
+		samsung,pins = "gpe1-0", "gpe1-1", "gpe1-2", "gpe1-3", "gpe1-4",
+			       "gpe1-5", "gpe1-6", "gpe1-7", "gpe0-0", "gpe0-1",
+			       "gpe0-2", "gpe0-3", "gpe0-4", "gpe0-5", "gpe0-6",
+			       "gpe0-7", "gpe2-1";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	eth_mdio: eth-mdio-pins {
+		samsung,pins = "gpe2-0";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	eth_ref_clk: eth-ref-clk-pins {
+		samsung,pins = "gpe2-2";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	eth_gtx_clk: eth-gtx-clk-pins {
+		samsung,pins = "gpe2-2";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	eth_phy_intr: eth-phy-intr-pins {
+		samsung,pins = "gpe2-4";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_DOWN>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	eth_pps: eth-pps-pins {
+		samsung,pins = "gpf4-6";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	sfmc_ctrl: sfmc-ctrl-pins {
+		samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3",
+			       "gpf0-4", "gpf1-0", "gpf1-1", "gpf1-2";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	sfmc_io: sfmc-io-pins {
+		samsung,pins = "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3", "gpf2-4",
+			       "gpf2-5", "gpf2-6", "gpf2-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_NONE>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+};
+
+&pinctrl_peric {
+	serial1_bus: serial1-bus-pins {
+		samsung,pins = "gpa2-0", "gpa2-1", "gpa2-2", "gpa2-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	serial2_bus: serial2-bus-pins {
+		samsung,pins = "gpa2-4", "gpa2-5", "gpa2-6", "gpa2-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpa0-0", "gpa0-1", "gpa0-2", "gpa0-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	spi0_bus_nocs: spi0-bus-nocs-pins {
+		samsung,pins = "gpa0-0", "gpa0-1", "gpa0-2";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpk0: gpk0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	i2s0_bus: i2s0-bus-pins {
+		samsung,pins = "gpa1-4", "gpa1-5", "gpa1-6", "gpa1-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	i2s0_idle: i2s0-idle-pins {
+		samsung,pins = "gpa1-4", "gpa1-5", "gpa1-6", "gpa1-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	i2s1_bus: i2s1-bus-pins {
+		samsung,pins = "gpa1-0", "gpa1-1", "gpa1-2", "gpa1-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	i2s1_idle: i2s1-idle-pins {
+		samsung,pins = "gpa1-0", "gpa1-1", "gpa1-2", "gpa1-3";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pins = "gpa0-6", "gpa0-7";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pins = "gpa0-4", "gpa0-5";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_3>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/axis/artpec8.dtsi b/arch/arm64/boot/dts/axis/artpec8.dtsi
index 296192560adf..9c2afbac75b9 100644
--- a/arch/arm64/boot/dts/axis/artpec8.dtsi
+++ b/arch/arm64/boot/dts/axis/artpec8.dtsi
@@ -17,6 +17,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		pinctrl0 = &pinctrl_fsys;
+		pinctrl1 = &pinctrl_peric;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -237,6 +242,18 @@ cmu_peri: clock-controller@16410000 {
 			status = "disabled";
 		};
 
+		pinctrl_fsys: pinctrl@16c30000 {
+			compatible = "axis,artpec8-pinctrl";
+			reg = <0x16c30000 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric: pinctrl@165f0000 {
+			compatible = "axis,artpec8-pinctrl";
+			reg = <0x165f0000 0x1000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		serial_0: serial@16cc0000 {
 			compatible = "axis,artpec8-uart";
 			reg = <0x16cc0000 0x100>;
-- 
2.34.1


