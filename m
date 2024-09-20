Return-Path: <linux-gpio+bounces-10327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679D97D7CF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A7B1F22C06
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D23A186289;
	Fri, 20 Sep 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLGB38J1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AA184556;
	Fri, 20 Sep 2024 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847131; cv=none; b=nSsyNm38V/x2I8s4c6tymXeJlGdWoMGFl/KolmktWnpAsLv+X2f3Yf/nJLv7RSJwxq1RxGSUmukGo8+td44vbcLmdVZxMAtWhng2QTd8bEP/s7TKyaCRnfdZZKrtn0TTItT9Ac9evmfmvYCIiRDAltGUKeKh9i9YEFAlDlOu158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847131; c=relaxed/simple;
	bh=x8/3xESKE2zvAJ0xnCHKLa52lE/a48hHn2Y5NhXTZ04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZB+gXyiGuk0m5OEDiW0pEeniJnfm7ue+w0vp6jrxNv7Xe1g3Z3es9P6oau6RU7GwqARhYfR1TDQS+yOZpcR30GTs3Nba3JxjU0EMLBJC9P2i6eQqpI7KbqbLdmBWuiFLgEi8Hajn4hBTaFplSe0oQNIxBd2rJAXJEClyJosm3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLGB38J1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb806623eso18645865e9.2;
        Fri, 20 Sep 2024 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847127; x=1727451927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7Q+KjHAXWzDg5KX8y+Eo0UlkNLZ4H1BnGxMEKtXAzE=;
        b=GLGB38J15LD+edMtUk2zehVLuL+jLIpfGdBkkFSgQ9C+HwJWAua02NP0ZMFsBm9PjS
         BPoIcg+0cxYZXLxeqsL5d1JSLoH+Hk9HIWrgEH5XWBcQXhUvyBbe50jqw1zgNbt9z1s+
         MdA1uwwavDoxR1zR3DOscDccPmVI+E72w3Ehx546cf7vAL70xqi3xF0amHs11+RrMB4J
         dfJP/64hWr8smBN5yJcXoeC43ELHStvkLDgSvp+sIi3ufaNfhZVzrn3dit3vs8Re9lOH
         Kd6lo5MMY1fQsN6acA5DEktB+BhToppOAEmYP5usQ4vSsxqXUhq+fLBoiuTzdHDAa/oj
         Xp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847127; x=1727451927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7Q+KjHAXWzDg5KX8y+Eo0UlkNLZ4H1BnGxMEKtXAzE=;
        b=LUQtB93+N1219Ge4KK6cexqXG5jOofMtoWTimtaP53t1pykkJC1fm1WCFXt23rZrIT
         r/dEd1VHEDejcDkqZ8yHoFY7MHlzKIrokQV7qtif5gEqrcQPI7h5FrMLD9TkQPAq1Pus
         4bJud+jLc4brkGbzC3ST29LxlTn+liYUzEmWoTVSKKC/M2fvomt83MKIYzVJDygtULvf
         ztvjl/tXgcrCmt/2tTcR2PtnOXAXcujtbq10Sko4s/DZGKAORq1DZMgtqRj2RPUihgrn
         goj+kt+CTvSdB//hGaJ1wgz//xhSgR67ByEZb7sOZ7hJIjVvZQOqrUC+I6yjgHwVj3+T
         Er0w==
X-Forwarded-Encrypted: i=1; AJvYcCVv/4OpefZaWqUCryiYBpOFU2MjPbDbEpSntbiAssUiP+Q3j/F8F0LqRy8nn8WL5rDjmWYBq1C+gXNpAA==@vger.kernel.org, AJvYcCXKf5fHgA7XMJpCaeFlWnmDbSCYkQjGP30MpXBnts6ZG9IVdEvQUa30BBhl+ilpzavfYupcaFWi1z1zW8ps@vger.kernel.org, AJvYcCXO3inevLtYEJl4YuUwlSUNWnBGjYEa0M8du1T3dL5QThISkl9RHNPpnHe2umbgmxCTyv8P0onXD679@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnvQwzYoHjSjwbNrM2TtHp4IHQvEFr+cjbO72FTfC9dXhLKGw
	7KVtURCGMgn6qG1Ce56n5RD87ct/l7NcRg5loI2fU4tMRVJKia5s
X-Google-Smtp-Source: AGHT+IGyQuzWLMtLYqo74Ev6vJKzQFe6Ml7zH3pB5SFQXJ3lx5nknjgRnrOQ9URPVEcRT4e+I8UB3A==
X-Received: by 2002:a05:600c:354a:b0:42c:c1f6:6ded with SMTP id 5b1f17b1804b1-42e7ad9afabmr23748065e9.29.1726847126852;
        Fri, 20 Sep 2024 08:45:26 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:26 -0700 (PDT)
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
Subject: [PATCH v5 08/10] arm64: dts: exynos: Add initial support for exynos8895 SoC
Date: Fri, 20 Sep 2024 18:45:06 +0300
Message-Id: <20240920154508.1618410-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
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

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Further platform support will be added over time.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1094 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  251 ++++
 2 files changed, 1345 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
new file mode 100644
index 000000000..51e9c9c4b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
@@ -0,0 +1,1094 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_abox {
+	gph0: gph0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph1: gph1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gph3: gph3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
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
+	};
+
+	gpa3: gpa3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa4: gpa4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	bt_hostwake: bt-hostwake-pins {
+		samsung,pins = "gpa2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	pcie_wake: pcie-wake-pins {
+		samsung,pins = "gpa3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart1_bus: uart1-bus-pins {
+		samsung,pins = "gpa4-4", "gpa4-3", "gpa4-2", "gpa4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	wlan_host_wake: wlan-host-wake-pins {
+		  samsung,pins = "gpa0-7";
+		  samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		  samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		  samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		  samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl_busc {
+	gpb2: gpb2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hsi2c0_bus: hsi2c0-bus-pins {
+		samsung,pins = "gpb2-1", "gpb2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	speedy_bus: speedy-bus-pins {
+		samsung,pins = "gpb2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
+
+&pinctrl_fsys0 {
+	gpi0: gpi0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpi1: gpi1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	ufs_rst_n: ufs-rst-n-pins {
+		samsung,pins = "gpi0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	ufs_refclk_out: ufs-refclk-out-pins {
+		samsung,pins = "gpi0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_fsys1 {
+	gpj0: gpj0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpj1: gpj1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	bt_btwake: bt-btwake-pins {
+		samsung,pins = "gpj1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_en: bt-en-pins {
+		samsung,pins ="gpj1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	cfg_wlanen: cfg-wlanen-pins {
+		samsung,pins = "gpj1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	sd2_clk: sd2-clk-pins {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	sd2_cmd: sd2-cmd-pins {
+		samsung,pins = "gpj0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	sd2_bus1: sd2-bus-width1-pins {
+		samsung,pins = "gpj0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	sd2_bus4: sd2-bus-width4-pins {
+		samsung,pins = "gpj0-3", "gpj0-4", "gpj0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	/* For Drive strength swapping */
+	sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV3>;
+	};
+
+	sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
+		samsung,pins = "gpj0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpb1: gpb1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd0: gpd0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd1: gpd1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd2: gpd2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpd3: gpd3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe7: gpe7-gpio-bank {
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
+	hsi2c5_bus: hsi2c5-bus-pins {
+		samsung,pins = "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c6_bus: hsi2c6-bus-pins {
+		samsung,pins = "gpd1-3", "gpd1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c7_bus: hsi2c7-bus-pins {
+		samsung,pins = "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c8_bus: hsi2c8-bus-pins {
+		samsung,pins = "gpd1-7", "gpd1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c9_bus: hsi2c9-bus-pins {
+		samsung,pins = "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c10_bus: hsi2c10-bus-pins {
+		samsung,pins = "gpd2-3", "gpd2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c11_bus: hsi2c11-bus-pins {
+		samsung,pins = "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c12_bus: hsi2c12-bus-pins {
+		samsung,pins = "gpd3-3", "gpd3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hs_i2c14_bus: hs-i2c14-bus-pins {
+		samsung,pins = "gpe6-3", "gpe6-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	spi2_bus: spi2-bus-pins {
+		samsung,pins = "gpd1-3", "gpd1-2", "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	spi2_cs: spi2-cs-pins {
+		samsung,pins = "gpd1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_bus: spi3-bus-pins {
+		samsung,pins = "gpd1-7", "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi3_cs: spi3-cs-pins {
+		samsung,pins = "gpd1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_bus: spi4-bus-pins {
+		samsung,pins = "gpd2-3", "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi4_cs: spi4-cs-pins {
+		samsung,pins = "gpd2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_bus: spi5-bus-pins {
+		samsung,pins = "gpd3-3", "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi5_cs: spi5-cs-pins {
+		samsung,pins = "gpd3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	uart0_bus: uart0-bus-pins {
+		samsung,pins = "gpd0-7", "gpd0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_bus: uart2-bus-pins {
+		samsung,pins = "gpd1-3", "gpd1-2", "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_bus_dual: uart2-bus-dual-pins {
+		samsung,pins = "gpd1-1", "gpd1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus: uart3-bus-pins {
+		samsung,pins = "gpd1-7", "gpd1-6", "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_bus_dual: uart3-bus-dual-pins {
+		samsung,pins = "gpd1-5", "gpd1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus: uart4-bus-pins {
+		samsung,pins = "gpd2-3", "gpd2-2", "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_bus_dual: uart4-bus-dual-pins {
+		samsung,pins = "gpd2-1", "gpd2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus: uart5-bus-pins {
+		samsung,pins = "gpd3-3", "gpd3-2", "gpd3-1", "gpd3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_bus_dual: uart5-bus-dual-pins {
+		samsung,pins = "gpd3-1", "gpd3-0";
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
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc1: gpc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc2: gpc2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpc3: gpc3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe3: gpe3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe4: gpe4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe5: gpe5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe6: gpe6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg0: gpg0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpk0: gpk0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	hrm_irq: hrm-irq-pins {
+		samsung,pins = "gpe6-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	hsi2c1_bus: hsi2c1-bus-pins {
+		samsung,pins = "gpc2-1", "gpc2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c2_bus: hsi2c2-bus-pins {
+		samsung,pins = "gpc2-3", "gpc2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
+
+	hsi2c3_bus: hsi2c3-bus-pins {
+		samsung,pins = "gpc2-5", "gpc2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c4_bus: hsi2c4-bus-pins {
+		samsung,pins = "gpc2-7", "gpc2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c13_bus: hsi2c13-bus-pins {
+		samsung,pins = "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c14_bus: hsi2c14-bus-pins {
+		samsung,pins = "gpe5-3", "gpe5-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c15_bus: hsi2c15-bus-pins {
+		samsung,pins = "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c16_bus: hsi2c16-bus-pins {
+		samsung,pins = "gpe1-3", "gpe1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c17_bus: hsi2c17-bus-pins {
+		samsung,pins = "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c18_bus: hsi2c18-bus-pins {
+		samsung,pins = "gpe1-7", "gpe1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c19_bus: hsi2c19-bus-pins {
+		samsung,pins = "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c20_bus: hsi2c20-bus-pins {
+		samsung,pins = "gpe2-3", "gpe2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c21_bus: hsi2c21-bus-pins {
+		samsung,pins = "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c22_bus: hsi2c22-bus-pins {
+		samsung,pins = "gpe2-7", "gpe2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c23_bus: hsi2c23-bus-pins {
+		samsung,pins = "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c24_bus: hsi2c24-bus-pins {
+		samsung,pins = "gpe3-3", "gpe3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c25_bus: hsi2c25-bus-pins {
+		samsung,pins = "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c26_bus: hsi2c26-bus-pins {
+		samsung,pins = "gpe3-7", "gpe3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c27_bus: hsi2c27-bus-pins {
+		samsung,pins = "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c28_bus: hsi2c28-bus-pins {
+		samsung,pins = "gpe4-3", "gpe4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c29_bus: hsi2c29-bus-pins {
+		samsung,pins = "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c30_bus: hsi2c30-bus-pins {
+		samsung,pins = "gpe4-7", "gpe4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV2>;
+	};
+
+	hsi2c31_bus: hsi2c31-bus-pins {
+		samsung,pins = "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	hsi2c32_bus: hsi2c32-bus-pins {
+		samsung,pins = "gpe5-7", "gpe5-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_bus: spi0-bus-pins {
+		samsung,pins = "gpc3-3", "gpc3-2", "gpc3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi0_cs: spi0-cs-pins {
+		samsung,pins = "gpc3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_bus: spi1-bus-pins {
+		samsung,pins = "gpc3-7", "gpc3-6", "gpc3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi1_cs: spi1-cs-pins {
+		samsung,pins = "gpc3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_bus: spi6-bus-pins {
+		samsung,pins = "gpe5-3", "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi6_cs: spi6-cs-pins {
+		samsung,pins = "gpe5-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_bus: spi7-bus-pins {
+		samsung,pins = "gpe1-3", "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi7_cs: spi7-cs-pins {
+		samsung,pins = "gpe1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_bus: spi8-bus-pins {
+		samsung,pins = "gpe1-7", "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi8_cs: spi8-cs-pins {
+		samsung,pins = "gpe1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_bus: spi9-bus-pins {
+		samsung,pins = "gpe2-3", "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi9_cs: spi9-cs-pins {
+		samsung,pins = "gpe2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_bus: spi10-bus-pins {
+		samsung,pins = "gpe2-7", "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi10_cs: spi10-cs-pins {
+		samsung,pins = "gpe2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_bus: spi11-bus-pins {
+		samsung,pins = "gpe3-3", "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi11_cs: spi11-cs-pins {
+		samsung,pins = "gpe3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_bus: spi12-bus-pins {
+		samsung,pins = "gpe3-7", "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi12_cs: spi12-cs-pins {
+		samsung,pins = "gpe3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_bus: spi13-bus-pins {
+		samsung,pins = "gpe4-3", "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi13_cs: spi13-cs-pins {
+		samsung,pins = "gpe4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_bus: spi14-bus-pins {
+		samsung,pins = "gpe4-7", "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi14_cs: spi14-cs-pins {
+		samsung,pins = "gpe4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_bus: spi15-bus-pins {
+		samsung,pins = "gpe5-7", "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	spi15_cs: spi15-cs-pins {
+		samsung,pins = "gpe5-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+
+	uart6_bus: uart6-bus-pins {
+		samsung,pins = "gpe5-3", "gpe5-2", "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart6_bus_dual: uart6-bus-dual-pins {
+		samsung,pins = "gpe5-1", "gpe5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus: uart7-bus-pins {
+		samsung,pins = "gpe1-3", "gpe1-2", "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_bus_dual: uart7-bus-dual-pins {
+		samsung,pins = "gpe1-1", "gpe1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus: uart8-bus-pins {
+		samsung,pins = "gpe1-7", "gpe1-6", "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_bus_dual: uart8-bus-dual-pins {
+		samsung,pins = "gpe1-5", "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus: uart9-bus-pins {
+		samsung,pins = "gpe2-3", "gpe2-2", "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_bus_dual: uart9-bus-dual-pins {
+		samsung,pins = "gpe2-1", "gpe2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus: uart10-bus-pins {
+		samsung,pins = "gpe2-7", "gpe2-6", "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_bus_dual: uart10-bus-dual-pins {
+		samsung,pins = "gpe2-5", "gpe2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus: uart11-bus-pins {
+		samsung,pins = "gpe3-3", "gpe3-2", "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_bus_dual: uart11-bus-dual-pins {
+		samsung,pins = "gpe3-1", "gpe3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus: uart12-bus-pins {
+		samsung,pins = "gpe3-7", "gpe3-6", "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart12_bus_dual: uart12-bus-dual-pins {
+		samsung,pins = "gpe3-5", "gpe3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus: uart13-bus-pins {
+		samsung,pins = "gpe4-3", "gpe4-2", "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart13_bus_dual: uart13-bus-dual-pins {
+		samsung,pins = "gpe4-1", "gpe4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus: uart14-bus-pins {
+		samsung,pins = "gpe4-7", "gpe4-6", "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart14_bus_dual: uart14-bus-dual-pins {
+		samsung,pins = "gpe4-5", "gpe4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus: uart15-bus-pins {
+		samsung,pins = "gpe5-7", "gpe5-6", "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart15_bus_dual: uart15-bus-dual-pins {
+		samsung,pins = "gpe5-5", "gpe5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_vts {
+	gph2: gph2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
new file mode 100644
index 000000000..223ebd482
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
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
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	/* There's no PMU model for the Mongoose cores */
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
+	};
+
+	oscclk: osc-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	psci {
+		compatible = "arm,psci";
+		method = "smc";
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+		cpu_suspend = <0xc4000001>;
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos8895-chipid",
+				     "samsung,exynos850-chipid";
+			reg = <0x10000000 0x24>;
+		};
+
+		gic: interrupt-controller@10201000 {
+			compatible = "arm,gic-400";
+			reg = <0x10201000 0x1000>,
+			      <0x10202000 0x1000>,
+			      <0x10204000 0x2000>,
+			      <0x10206000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+			#address-cells = <0>;
+			#size-cells = <1>;
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
+		pinctrl_busc: pinctrl@15a30000 {
+			compatible = "samsung,exynos8895-pinctrl";
+			reg = <0x15a30000 0x1000>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pmu_system_controller: system-controller@16480000 {
+			compatible = "samsung,exynos8895-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x16480000 0x10000>;
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
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		/*
+		 * Non-updatable, broken stock Samsung bootloader does not
+		 * configure CNTFRQ_EL0
+		 */
+		clock-frequency = <26000000>;
+	};
+};
+
+#include "exynos8895-pinctrl.dtsi"
+#include "arm/samsung/exynos-syscon-restart.dtsi"
-- 
2.34.1


