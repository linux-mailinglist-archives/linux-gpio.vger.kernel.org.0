Return-Path: <linux-gpio+bounces-8621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653A94A3BD
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 814641F22F4A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63BD1D4168;
	Wed,  7 Aug 2024 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+/kZCgx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6786A1D2F56;
	Wed,  7 Aug 2024 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021767; cv=none; b=Gq7ge7DRufVtxdIDZnKt9qfgkW1n9j7tJpEwu8PaB5G/6+V0pNBYgeCHI/iId06nWJubBvg1roWe/rAU5vITppvlXDJ0/a2AmvCQpYsxW/+fhp/F5LbuEj1upZfstZAQEf9rJKeSaj7MJqMXPZlFf4Y44aMRjdziOzbUmpQg65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021767; c=relaxed/simple;
	bh=AYoWOwd01xzH4jMCk/YMDpadz2eNwpD9iXeNfEkZap8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aX8X1674fej4Hk0sB+za/XTQcEV2X45CRKSEaTYG1RkAyv5G7Q2U2XyJXh4T7jVfZknJWItZkjEfdZaWCfiK21ZidpdNz8RZfLO5ia298m/fHM7gFKHu8INv99GHiRBdJpsiC022fYL/WAa7Dab8ArZAiCPgqvxNvl/wQ18vo3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+/kZCgx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so10371235e9.2;
        Wed, 07 Aug 2024 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021763; x=1723626563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDhiXiu/OR0mfjLHDe7PlQsvn9CZwyKU2g8OxcG/rwc=;
        b=D+/kZCgx1HGBWGac+yUWdTHnlYLv+CAtKeX9JvYG4QJjKsPHZhcz8p6aMqOCCL3WGH
         uIho1lEjOhVarSS+pEaTyxY8HG0txXM5iprB634CMEPSfSYSVycnL7oWe1r0bgVP7g94
         iiMfxz9BEKgYOkAE1+x9reReKgslrzFord+xt0WLwDDuca7e2gL+aXw5/e+zTyzM+KiP
         2SAyzNxWe/wAHNFJrLPvII53Jvi6SLWmmL9qWTTgGQV5pZGWqfRmDWiBBrMgNBE/Ksnn
         c4RkGyd5dCLp7ejR0yjjbvBPLMitBU+Nj/TvKfV3sE2Gzr5KsIMDDpIKn1kh9RXG0dhB
         M4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021763; x=1723626563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDhiXiu/OR0mfjLHDe7PlQsvn9CZwyKU2g8OxcG/rwc=;
        b=R4T1NrR2oI4ZGSphOgnULneziKNRz3c7+G+9xOfjqRaPHqVgWF3WfkwTJVCw7Rz3cm
         M7BZDmU5r3y2N4fbOeYwLiR316v0I4VlWIcQPoqTVWl4HsLXUanceMzqGIEhcT13m+8O
         tY2v20kfy4Rb6T1XzT4LLwSSB9iUrjLd0hLFKTLj97f7NcKc7opLUR1+Gda5R/OD5Hkp
         SOF1uer4d1TmBHum8AkQ5omlYrhSWxTXLqak2EO2vXw28+mWv/VaGjA+RYX9sQG5eiY2
         1umXf420Nbig5eZEgEljfWvsAUu3K92vBuDGlRqh+O3/EvknuHBfttNZFrFiTYVoZOvq
         aPpg==
X-Forwarded-Encrypted: i=1; AJvYcCWB4O8cVIjn6zaAAXxhWRJJY1CblJuTAjTuTwXl/yImsXEaME2KoV9rtP3bgtreNaXTgUyFR3N3iNARJZU0KAChNnDXmtMCWCwzbs7qhiaJgwLglTb0nbTHiWTzS/6cZsn4cEDtfYt9t0glOKVeSeTOVJdvKh04zsfjLOkVNr/kALFK4UU=
X-Gm-Message-State: AOJu0YxJR7FmIQjBWOxUkOnQxKUs40kPCvSTVYG1Uc54wwN+piyJoW8d
	wL1gfxChpX83I/sRlohfTvMmNWHvy5h1auAt4pYDW/TU+MIsDrKy
X-Google-Smtp-Source: AGHT+IHf2TgRDn7H47ASGof5PFXNBiTO7QqWd3FFXe358i7zEO7rWeWDTZfbHF74aplSX83KbFS0eQ==
X-Received: by 2002:a05:600c:5102:b0:427:d72a:6c26 with SMTP id 5b1f17b1804b1-428e6af2e18mr122802765e9.6.1723021762554;
        Wed, 07 Aug 2024 02:09:22 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:22 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] arm64: dts: exynos: Add initial support for exynos8895 SoC
Date: Wed,  7 Aug 2024 12:08:56 +0300
Message-Id: <20240807090858.356366-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos 8895 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy
S8 (dreamlte), S8 Plus (dream2lte), Note 8 (greatlte) and the Meizu
15 Plus (m1891). Add minimal support for that SoC, including:

- All 8 cores via PSCI
- ChipID
- Generic ARMV8 Timer
- Enumarate all pinctrl nodes

Further platform support will be added over time.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
 2 files changed, 1631 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
new file mode 100644
index 000000000..1dcb61e2e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
@@ -0,0 +1,1378 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+	gpa0: gpa0 {
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
+	gpa1: gpa1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <3>;
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
+	gpa2: gpa2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa3: gpa3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa4: gpa4 {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	bt_hostwake: bt-hostwake {
+		samsung,pins = "gpa2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart1_bus: uart1-bus {
+		samsung,pins = "gpa4-4", "gpa4-3", "gpa4-2", "gpa4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart1_default: uart1-default {
+		samsung,pins = "gpa4-4", "gpa4-3", "gpa4-2", "gpa4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	uart1_btsleep: uart1-btsleep {
+		samsung,pins = "gpa4-4", "gpa4-3", "gpa4-2", "gpa4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	pcie_wake: pcie_wake {
+		samsung,pins = "gpa3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	wlan_host_wake: wlan_host_wake{
+		  samsung,pins = "gpa0-7";
+		  samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		  samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		  samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		  samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl_abox {
+	gph0: gph0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph1: gph1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph3: gph3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_vts {
+	gph2: gph2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_fsys0 {
+	gpi0: gpi0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+	gpi1: gpi1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	ufs_rst_n: ufs-rst-n {
+		samsung,pins = "gpi0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	ufs_refclk_out: ufs-refclk-out {
+		samsung,pins = "gpi0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_fsys1 {
+	gpj1: gpj1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+	gpj0: gpj0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	sd2_clk: sd2-clk {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	sd2_cmd: sd2-cmd {
+		samsung,pins = "gpj0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	sd2_bus1: sd2-bus-width1 {
+		samsung,pins = "gpj0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	sd2_bus4: sd2-bus-width4 {
+		samsung,pins = "gpj0-3", "gpj0-4", "gpj0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	/* For Drive strength swapping */
+	sd2_clk_fast_slew_rate_1x: sd2-clk_fast_slew_rate_1x {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	sd2_clk_fast_slew_rate_2x: sd2-clk_fast_slew_rate_2x {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	sd2_clk_fast_slew_rate_3x: sd2-clk_fast_slew_rate_3x {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	sd2_clk_fast_slew_rate_4x: sd2-clk_fast_slew_rate_4x {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	pcie0_clkreq: pcie0_clkreq {
+		samsung,pins = "gpj1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie0_clkreq_output: pcie0_clkreq_output {
+		samsung,pins = "gpj1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-val = <1>;
+	};
+
+	pcie0_perst: pcie0_perst {
+		samsung,pins = "gpj1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	cfg_wlanen: cfg-wlanen {
+		samsung,pins = "gpj1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie1_clkreq: pcie1_clkreq {
+		samsung,pins = "gpj1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie1_clkreq_output: pcie1_clkreq_output {
+		samsung,pins = "gpj1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-val = <1>;
+	     };
+
+	pcie1_perst: pcie1_perst {
+		samsung,pins = "gpj1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	bt_en: bt-en {
+		samsung,pins ="gpj1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_btwake: bt-btwake {
+		samsung,pins = "gpj1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_busc {
+	gpb2: gpb2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus {
+		samsung,pins = "gpb2-1", "gpb2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	speedy_bus: speedy-bus {
+		samsung,pins = "gpb2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpd0: gpd0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd1: gpd1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd2: gpd2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd3: gpd3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb1: gpb1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe7: gpe7 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	uart0_bus: uart0-bus {
+		samsung,pins = "gpd0-7", "gpd0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_bus_single: uart2-bus-single {
+		samsung,pins = "gpd1-3", "gpd1-2", "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_bus_dual: uart2-bus-dual {
+		samsung,pins = "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_single: uart3-bus-single {
+		samsung,pins = "gpd1-7", "gpd1-6", "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_dual: uart3-bus-dual {
+		samsung,pins = "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_single: uart4-bus-single {
+		samsung,pins = "gpd2-3", "gpd2-2", "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_dual: uart4-bus-dual {
+		samsung,pins = "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_single: uart5-bus-single {
+		samsung,pins = "gpd3-3", "gpd3-2", "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_dual: uart5-bus-dual {
+		samsung,pins = "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	hsi2c5_bus: hsi2c5-bus {
+		samsung,pins = "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus {
+		samsung,pins = "gpd1-3", "gpd1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c7_bus: hsi2c7-bus {
+		samsung,pins = "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c8_bus: hsi2c8-bus {
+		samsung,pins = "gpd1-7", "gpd1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c9_bus: hsi2c9-bus {
+		samsung,pins = "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c10_bus: hsi2c10-bus {
+		samsung,pins = "gpd2-3", "gpd2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c11_bus: hsi2c11-bus {
+		samsung,pins = "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c12_bus: hsi2c12-bus {
+		samsung,pins = "gpd3-3", "gpd3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hs_i2c14_bus: hs-i2c14-bus {
+		samsung,pins = "gpe6-3", "gpe6-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	spi2_bus: spi2-bus {
+		samsung,pins = "gpd1-3", "gpd1-2", "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	spi2_cs: spi2-cs {
+		samsung,pins = "gpd1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi2_cs_func: spi2-cs-func {
+		samsung,pins = "gpd1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_bus: spi3-bus {
+		samsung,pins = "gpd1-7", "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_cs: spi3-cs {
+		samsung,pins = "gpd1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_cs_func: spi3-cs-func {
+		samsung,pins = "gpd1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_bus: spi4-bus {
+		samsung,pins = "gpd2-3", "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_cs: spi4-cs {
+		samsung,pins = "gpd2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_cs_func: spi4-cs-func {
+		samsung,pins = "gpd2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_bus: spi5-bus {
+		samsung,pins = "gpd3-3", "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_cs: spi5-cs {
+		samsung,pins = "gpd3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_cs_func: spi5-cs-func {
+		samsung,pins = "gpd3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	pwm_tout1: pwm-tout1 {
+		   samsung,pins = "gpd0-5";
+		   samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		   samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		   samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	motor_rst_n: motor_rst_n {
+		samsung,pins = "gpe7-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	motor_mode: motor_mode {
+		samsung,pins = "gpf1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
+
+&pinctrl_peric1 {
+	gpb0: gpb0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc0: gpc0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc1: gpc1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc2: gpc2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc3: gpc3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpk0: gpk0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe5: gpe5 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe6: gpe6 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe3: gpe3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe4: gpe4 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg0: gpg0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	uart6_bus_single: uart6-bus-single {
+		samsung,pins = "gpe5-3", "gpe5-2", "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart6_bus_dual: uart6-bus-dual {
+		samsung,pins = "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_single: uart7-bus-single {
+		samsung,pins = "gpe1-3", "gpe1-2", "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_dual: uart7-bus-dual {
+		samsung,pins = "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus_single: uart8-bus-single {
+		samsung,pins = "gpe1-7", "gpe1-6", "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus_dual: uart8-bus-dual {
+		samsung,pins = "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus_single: uart9-bus-single {
+		samsung,pins = "gpe2-3", "gpe2-2", "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus_dual: uart9-bus-dual {
+		samsung,pins = "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_single: uart10-bus-single {
+		samsung,pins = "gpe2-7", "gpe2-6", "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_dual: uart10-bus-dual {
+		samsung,pins = "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_single: uart11-bus-single {
+		samsung,pins = "gpe3-3", "gpe3-2", "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_dual: uart11-bus-dual {
+		samsung,pins = "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_single: uart12-bus-single {
+		samsung,pins = "gpe3-7", "gpe3-6", "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_dual: uart12-bus-dual {
+		samsung,pins = "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_single: uart13-bus-single {
+		samsung,pins = "gpe4-3", "gpe4-2", "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_dual: uart13-bus-dual {
+		samsung,pins = "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus_single: uart14-bus-single {
+		samsung,pins = "gpe4-7", "gpe4-6", "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus_dual: uart14-bus-dual {
+		samsung,pins = "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_single: uart15-bus-single {
+		samsung,pins = "gpe5-7", "gpe5-6", "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_dual: uart15-bus-dual {
+		samsung,pins = "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus {
+		samsung,pins = "gpc2-1", "gpc2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c1_bus_in: hsi2c1-bus-in {
+		samsung,pins = "gpc2-1", "gpc2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus {
+		samsung,pins = "gpc2-3", "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	hsi2c2_bus_in: hsi2c2-bus-in {
+		samsung,pins = "gpc2-3", "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus {
+		samsung,pins = "gpc2-5", "gpc2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c3_bus_in: hsi2c3-bus-in {
+		samsung,pins = "gpc2-5", "gpc2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c4_bus: hsi2c4-bus {
+		samsung,pins = "gpc2-7", "gpc2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c4_bus_in: hsi2c4-bus-in {
+		samsung,pins = "gpc2-7", "gpc2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c13_bus: hsi2c13-bus {
+		samsung,pins = "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c14_bus: hsi2c14-bus {
+		samsung,pins = "gpe5-3", "gpe5-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c15_bus: hsi2c15-bus {
+		samsung,pins = "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c16_bus: hsi2c16-bus {
+		samsung,pins = "gpe1-3", "gpe1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c17_bus: hsi2c17-bus {
+		samsung,pins = "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c18_bus: hsi2c18-bus {
+		samsung,pins = "gpe1-7", "gpe1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c19_bus: hsi2c19-bus {
+		samsung,pins = "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c20_bus: hsi2c20-bus {
+		samsung,pins = "gpe2-3", "gpe2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c21_bus: hsi2c21-bus {
+		samsung,pins = "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c22_bus: hsi2c22-bus {
+		samsung,pins = "gpe2-7", "gpe2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c23_bus: hsi2c23-bus {
+		samsung,pins = "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c24_bus: hsi2c24-bus {
+		samsung,pins = "gpe3-3", "gpe3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c25_bus: hsi2c25-bus {
+		samsung,pins = "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c26_bus: hsi2c26-bus {
+		samsung,pins = "gpe3-7", "gpe3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c27_bus: hsi2c27-bus {
+		samsung,pins = "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c27_bus_in: hsi2c27-bus-in {
+		samsung,pins = "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c28_bus: hsi2c28-bus {
+		samsung,pins = "gpe4-3", "gpe4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c28_bus_in: hsi2c28-bus-in {
+		samsung,pins = "gpe4-3", "gpe4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c29_bus: hsi2c29-bus {
+		samsung,pins = "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c30_bus: hsi2c30-bus {
+		samsung,pins = "gpe4-7", "gpe4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	hsi2c31_bus: hsi2c31-bus {
+		samsung,pins = "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c32_bus: hsi2c32-bus {
+		samsung,pins = "gpe5-7", "gpe5-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_bus: spi0-bus {
+		samsung,pins = "gpc3-3", "gpc3-2", "gpc3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_cs: spi0-cs {
+		samsung,pins = "gpc3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_cs_func: spi0-cs-func {
+		samsung,pins = "gpc3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_bus: spi1-bus {
+		samsung,pins = "gpc3-7", "gpc3-6", "gpc3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_cs: spi1-cs {
+		samsung,pins = "gpc3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_cs_func: spi1-cs-func {
+		samsung,pins = "gpc3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_bus: spi6-bus {
+		samsung,pins = "gpe5-3", "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_cs: spi6-cs {
+		samsung,pins = "gpe5-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_cs_func: spi6-cs-func {
+		samsung,pins = "gpe5-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_bus: spi7-bus {
+		samsung,pins = "gpe1-3", "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_cs: spi7-cs {
+		samsung,pins = "gpe1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_cs_func: spi7-cs-func {
+		samsung,pins = "gpe1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_bus: spi8-bus {
+		samsung,pins = "gpe1-7", "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_bus_suspend: spi8-bus-suspend {
+		samsung,pins = "gpe1-7", "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;	/* INPUT */
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;	/* DOWN */
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_cs: spi8-cs {
+		samsung,pins = "gpe1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_cs_func: spi8-cs-func {
+		samsung,pins = "gpe1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_cs_func_suspend: spi8-cs-func-suspend {
+		samsung,pins = "gpe1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;	/* INPUT */
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;	/* DOWN */
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_bus: spi9-bus {
+		samsung,pins = "gpe2-3", "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_cs: spi9-cs {
+		samsung,pins = "gpe2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_cs_func: spi9-cs-func {
+		samsung,pins = "gpe2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_idle: spi9-idle {
+		samsung,pins = "gpe2-3", "gpe2-2", "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_bus: spi10-bus {
+		samsung,pins = "gpe2-7", "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_cs: spi10-cs {
+		samsung,pins = "gpe2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_cs_func: spi10-cs-func {
+		samsung,pins = "gpe2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_bus: spi11-bus {
+		samsung,pins = "gpe3-3", "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_cs: spi11-cs {
+		samsung,pins = "gpe3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_cs_func: spi11-cs-func {
+		samsung,pins = "gpe3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_bus: spi12-bus {
+		samsung,pins = "gpe3-7", "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_cs: spi12-cs {
+		samsung,pins = "gpe3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_cs_func: spi12-cs-func {
+		samsung,pins = "gpe3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_bus: spi13-bus {
+		samsung,pins = "gpe4-3", "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_cs: spi13-cs {
+		samsung,pins = "gpe4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_cs_func: spi13-cs-func {
+		samsung,pins = "gpe4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_bus: spi14-bus {
+		samsung,pins = "gpe4-7", "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_cs: spi14-cs {
+		samsung,pins = "gpe4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_cs_func: spi14-cs-func {
+		samsung,pins = "gpe4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_bus: spi15-bus {
+		samsung,pins = "gpe5-7", "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_cs: spi15-cs {
+		samsung,pins = "gpe5-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_cs_func: spi15-cs-func {
+		samsung,pins = "gpe5-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	decon_f_te_on: decon_f_te_on {
+		samsung,pins = "gpb0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+	};
+
+	decon_f_te_off: decon_f_te_off {
+		samsung,pins = "gpb0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+	};
+
+	hrm_irq: hrm-irq {
+		samsung,pins = "gpe6-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	hrm_irqsleep: hrm-irqsleep {
+		samsung,pins = "gpe6-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	hrm_irqidle: hrm-irqidle {
+		samsung,pins = "gpe6-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
new file mode 100644
index 000000000..3ed381ee5
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Samsung's Exynos 8895 SoC device tree source
+ *
+ * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos8895";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_abox;
+		pinctrl2 = &pinctrl_vts;
+		pinctrl3 = &pinctrl_fsys0;
+		pinctrl4 = &pinctrl_fsys1;
+		pinctrl5 = &pinctrl_busc;
+		pinctrl6 = &pinctrl_peric0;
+		pinctrl7 = &pinctrl_peric1;
+	};
+
+	arm-a53-pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>,
+				     <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@0 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m2";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@1 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m2";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@2 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m2";
+			reg = <0x2>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@3 {
+			device_type = "cpu";
+			compatible = "samsung,mongoose-m2";
+			reg = <0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci";
+		method = "smc";
+		cpu_suspend = <0xc4000001>;
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <26000000>;
+	};
+
+	fixed-rate-clocks {
+		oscclk: osc-clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "oscclk";
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos8895-chipid",
+				     "samsung,exynos850-chipid";
+			reg = <0x10000000 0x24>;
+		};
+
+		gic: interrupt-controller@10200000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x10201000 0x1000>,
+			      <0x10202000 0x1000>,
+			      <0x10204000 0x2000>,
+			      <0x10206000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		pinctrl_alive: pinctrl@164b0000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x164b0000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos8895-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		pinctrl_abox: pinctrl@13e60000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x13e60000 0x1000>;
+		};
+
+		pinctrl_vts: pinctrl@14080000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x14080000 0x1000>;
+		};
+
+		pinctrl_fsys0: pinctrl@11050000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x11050000 0x1000>;
+			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_fsys1: pinctrl@11430000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x11430000 0x1000>;
+			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_busc: pinctrl@15a30000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x15a30000 0x1000>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric0: pinctrl@104d0000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x104d0000 0x1000>;
+			interrupts = <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric1: pinctrl@10980000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x10980000 0x1000>;
+			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pmu_system_controller: system-controller@16480000 {
+			compatible = "samsung,exynos8895-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x16480000 0x10000>;
+		};
+	};
+};
+
+#include "exynos8895-pinctrl.dtsi"
+#include "arm/samsung/exynos-syscon-restart.dtsi"
-- 
2.34.1


