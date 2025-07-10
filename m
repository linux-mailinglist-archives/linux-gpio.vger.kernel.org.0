Return-Path: <linux-gpio+bounces-23052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7343AFF5E6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 221DD5A8896
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB33817BD3;
	Thu, 10 Jul 2025 00:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="U1nBOaNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD149BE4A
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752107256; cv=none; b=ccB/vdKVN+JCqpKS0SOn6stxpvZKESaKzo+cq+B9EB5VFS/Ul6dGTT4ZZWFvCKMmIBylr0r/RyLQSDPgmYIoVcn8rZ1E4/zUQkLshrl2PheLqxtEYLPiCitwnzEdjvy0PNG+kLWA/DVktq1EVpEfPm+fWFPymJsVHrLwP/cTATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752107256; c=relaxed/simple;
	bh=MHRM9WlGY8PZrkjRSCsLOOtIq/UdaiwDrCTZs8Cu3zU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f2EuGBhA0z01j5Yorw1ao3Sf4UGCqk2TwWdcRlJGx6B9Wi42lQCHeo1jxDS5Ixp55afs8e+ABPEYgFindAr1tU8ndCwucVtVpRYGYojbPcvlD8iMjzpmoH5QLUSIje3CywRwv+eQg5T3Ap6A/p6DzBTPQlSJgrtL2Ac5h68SeGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=U1nBOaNl; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106853; bh=MHRM9WlGY8PZrkjRSCsLOOtIq/UdaiwDrCTZs8Cu3zU=;
	l=4610; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=U1nBOaNl6RG8gwleWzaqKw4KPohjQxHHRkjbSt/YIYkjO1ZiCMdlemQsrMc4O6FaN
	 ApHHLQafJhmeRC9/xmMLdwnlufg27z1EA/Q/HIVQGhpFlCgD4D4zD31eRoGz5QKvnH
	 M5dvaILYZClXh6GdfQpkIQyAiOg3FvVvP4dtB4xQ=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:53 +0900
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
Subject: [PATCH 04/16] clk: samsung: artpec-8: Add initial clock support
Date: Thu, 10 Jul 2025 09:20:34 +0900
Message-Id: <20250710002047.1573841-5-ksk4725@coasia.com>
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

From: Hakyeong Kim <hgkim05@coasia.com>

Add initial clock support for ARTPEC-8 SoC which is required
for enabling basic clock management.

Add clock support for below CMU block in ARTPEC-8 SoC:
 - CMU_IMEM

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/Kconfig       |  8 ++++
 drivers/clk/samsung/Makefile      |  1 +
 drivers/clk/samsung/clk-artpec8.c | 62 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-artpec8.c

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 76a494e95027..289591b403ad 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
 	select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
 	select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
 	select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
+	select ARTPEC8_COMMON_CLK if ARM64 && ARCH_ARTPEC8
 
 config S3C64XX_COMMON_CLK
 	bool "Samsung S3C64xx clock controller support" if COMPILE_TEST
@@ -102,3 +103,10 @@ config TESLA_FSD_COMMON_CLK
 	help
 	  Support for the clock controller present on the Tesla FSD SoC.
 	  Choose Y here only if you build for this SoC.
+
+config ARTPEC8_COMMON_CLK
+	bool "Axis ARTPEC-8 clock controller support" if COMPILE_TEST
+	depends on COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Axis ARTPEC-8 SoC.
+	  Choose Y here only if you are building for the Axis ARTPEC-8 SoC.
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index b77fe288e4bb..473eb08fc8fc 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -3,6 +3,7 @@
 # Samsung Clock specific Makefile
 #
 
+obj-$(CONFIG_ARTPEC8_COMMON_CLK)	+= clk-artpec8.o
 obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
 obj-$(CONFIG_EXYNOS_3250_COMMON_CLK)	+= clk-exynos3250.o
 obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4.o
diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
new file mode 100644
index 000000000000..11a48b2fcc09
--- /dev/null
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2022-2025  Axis Communications AB.
+ *             https://www.axis.com
+ *
+ * Common Clock Framework support for ARTPEC-8 SoC.
+ */
+
+#include <linux/clk-provider.h>
+#include <dt-bindings/clock/axis,artpec8-clk.h>
+
+#include "clk.h"
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
+
+/* Register Offset definitions for CMU_IMEM (0x10010000) */
+#define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
+#define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
+#define MUX_CLK_IMEM_GIC_CA53				0x1000
+#define MUX_CLK_IMEM_GIC_CA5				0x1008
+
+static const unsigned long cmu_imem_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLK_IMEM_ACLK_USER,
+	PLL_CON0_MUX_CLK_IMEM_JPEG_USER,
+	MUX_CLK_IMEM_GIC_CA53,
+	MUX_CLK_IMEM_GIC_CA5,
+};
+
+PNAME(mout_imem_aclk_user_p) = { "fin_pll", "dout_clkcmu_imem_aclk" };
+PNAME(mout_imem_gic_ca53_p) = { "mout_imem_aclk_user", "fin_pll" };
+PNAME(mout_imem_gic_ca5_p) = { "mout_imem_aclk_user", "fin_pll" };
+PNAME(mout_imem_jpeg_user_p) = { "fin_pll", "dout_clkcmu_imem_jpeg" };
+
+static const struct samsung_mux_clock cmu_imem_mux_clks[] __initconst = {
+	MUX(MOUT_IMEM_ACLK_USER, "mout_imem_aclk_user",
+	    mout_imem_aclk_user_p, PLL_CON0_MUX_CLK_IMEM_ACLK_USER, 4, 1),
+	MUX(MOUT_IMEM_GIC_CA53, "mout_imem_gic_ca53",
+	    mout_imem_gic_ca53_p, MUX_CLK_IMEM_GIC_CA53, 0, 1),
+	MUX(MOUT_IMEM_GIC_CA5, "mout_imem_gic_ca5",
+	    mout_imem_gic_ca5_p, MUX_CLK_IMEM_GIC_CA5, 0, 1),
+	MUX(MOUT_IMEM_JPEG_USER, "mout_imem_jpeg_user",
+	    mout_imem_jpeg_user_p, PLL_CON0_MUX_CLK_IMEM_JPEG_USER, 4, 1),
+};
+
+static const struct samsung_cmu_info cmu_imem_info __initconst = {
+	.mux_clks		= cmu_imem_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_imem_mux_clks),
+	.nr_clk_ids		= CMU_IMEM_NR_CLK,
+	.clk_regs		= cmu_imem_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_imem_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_imem_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_imem_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_imem, "axis,artpec8-cmu-imem",
+	       artpec8_clk_cmu_imem_init);
-- 
2.34.1


