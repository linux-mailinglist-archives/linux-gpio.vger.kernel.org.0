Return-Path: <linux-gpio+bounces-23039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16AAFF5A1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA3643A530F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86FE78F4A;
	Thu, 10 Jul 2025 00:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="vh5S674m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6047C125D6
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106863; cv=none; b=THy2GdTPtlQeS1xT1ua8/HXykobCshrM3kXHwR+BxNmZI3rpAgWz1lWKAeWPznm1udzv+JFCMGLT3QvTVEst2EF5IygtVq4C2Qb9WM+l4EuA7uqQA7mJH4DTxR1QXuQDg18lFitrV8yZBP9gkx4OkFlCbRbdk7iV4iCunyWjvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106863; c=relaxed/simple;
	bh=DyFX5NVU0qfu6w33KZd1xOrQORMsGM0vYCT7ZpTXwlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NGH+v0m9bFxKwLpzt2G256+A/xpQ/GOdoJUCJ3tBIZs+5yR1NWxnUxW7Dpflt3cZthPiMlo5i9coo3N02Rq6H3c1mhY/fC27JyAsobxPHh0AJLMwe8GFW86sBWVC2FyEDpuaVwIvFBEIlACnba8c33wUEICiiA5fpOuePClw0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=vh5S674m; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106850; bh=DyFX5NVU0qfu6w33KZd1xOrQORMsGM0vYCT7ZpTXwlo=;
	l=4651; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=vh5S674mIvXVosNkJsEGHaPWeduY8Ag4VBabLfEEwvW3o5DycqS4EdFl8pQYA/FPo
	 ygmb4clDvQFkVscMIC02TQcJn/HJiKKQCyy4jXhqcHeH9YbWo/LW1rX04NGzloTJmU
	 eFESaz1fIyCReTrtdaGPR5JMXBiyvKUZWYnQB83Q=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:50 +0900
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
Subject: [PATCH 01/16] dt-bindings: clock: Add CMU bindings definitions for ARTPEC-8 platform
Date: Thu, 10 Jul 2025 09:20:31 +0900
Message-Id: <20250710002047.1573841-2-ksk4725@coasia.com>
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

From: Ravi Patel <ravi.patel@samsung.com>

Add device tree clock definitions constants for ARTPEC-8 platform.
ARTPEC-8 platform has separate instances for each particular CMU.
So clock IDs in this bindings header also start from 1 for each CMU block.

Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 include/dt-bindings/clock/axis,artpec8-clk.h | 122 +++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

diff --git a/include/dt-bindings/clock/axis,artpec8-clk.h b/include/dt-bindings/clock/axis,artpec8-clk.h
new file mode 100644
index 000000000000..69adfa999e34
--- /dev/null
+++ b/include/dt-bindings/clock/axis,artpec8-clk.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2022-2025  Axis Communications AB.
+ *             https://www.axis.com
+ *
+ * Device Tree binding constants for ARTPEC-8 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ARTPEC8_H
+#define _DT_BINDINGS_CLOCK_ARTPEC8_H
+
+/* CMU_CMU */
+#define PLL_SHARED0				1
+#define DOUT_PLL_SHARED0_DIV2			2
+#define DOUT_PLL_SHARED0_DIV3			3
+#define DOUT_PLL_SHARED0_DIV4			4
+#define PLL_SHARED1				5
+#define DOUT_PLL_SHARED1_DIV2			6
+#define DOUT_PLL_SHARED1_DIV3			7
+#define DOUT_PLL_SHARED1_DIV4			8
+#define PLL_AUDIO				9
+#define DOUT_CLKCMU_BUS_BUS			10
+#define DOUT_CLKCMU_BUS_DLP			11
+#define DOUT_CLKCMU_CDC_CORE			12
+#define DOUT_CLKCMU_OTP				13
+#define DOUT_CLKCMU_CORE_MAIN			14
+#define DOUT_CLKCMU_CORE_DLP			15
+#define DOUT_CLKCMU_CPUCL_SWITCH		16
+#define DOUT_CLKCMU_DLP_CORE			17
+#define DOUT_CLKCMU_FSYS_BUS			18
+#define DOUT_CLKCMU_FSYS_IP			19
+#define DOUT_CLKCMU_FSYS_SCAN0			20
+#define DOUT_CLKCMU_FSYS_SCAN1			21
+#define DOUT_CLKCMU_GPU_3D			22
+#define DOUT_CLKCMU_GPU_2D			23
+#define DOUT_CLKCMU_IMEM_ACLK			24
+#define DOUT_CLKCMU_IMEM_JPEG			25
+#define DOUT_CLKCMU_MIF_SWITCH			26
+#define DOUT_CLKCMU_MIF_BUSP			27
+#define DOUT_CLKCMU_PERI_DISP			28
+#define DOUT_CLKCMU_PERI_IP			29
+#define DOUT_CLKCMU_PERI_AUDIO			30
+#define DOUT_CLKCMU_RSP_CORE			31
+#define DOUT_CLKCMU_TRFM_CORE			32
+#define DOUT_CLKCMU_VCA_ACE			33
+#define DOUT_CLKCMU_VCA_OD			34
+#define DOUT_CLKCMU_VIO_CORE			35
+#define DOUT_CLKCMU_VIO_AUDIO			36
+#define DOUT_CLKCMU_VIP0_CORE			37
+#define DOUT_CLKCMU_VIP1_CORE			38
+#define DOUT_CLKCMU_VPP_CORE			39
+
+/* CMU_BUS */
+#define MOUT_CLK_BUS_ACLK_USER			1
+#define MOUT_CLK_BUS_DLP_USER			2
+#define DOUT_CLK_BUS_PCLK			3
+
+/* CMU_CORE */
+#define MOUT_CLK_CORE_ACLK_USER			1
+#define MOUT_CLK_CORE_DLP_USER			2
+#define DOUT_CLK_CORE_PCLK			3
+
+/* CMU_CPUCL */
+#define PLL_CPUCL				1
+#define MOUT_CLK_CPUCL_PLL			2
+#define MOUT_CLKCMU_CPUCL_SWITCH_USER		3
+#define DOUT_CLK_CPUCL_CPU			4
+#define DOUT_CLK_CLUSTER_ACLK			5
+#define DOUT_CLK_CLUSTER_PCLKDBG		6
+#define DOUT_CLK_CLUSTER_CNTCLK			7
+#define DOUT_CLK_CLUSTER_ATCLK			8
+#define DOUT_CLK_CPUCL_PCLK			9
+#define DOUT_CLK_CPUCL_CMUREF			10
+#define DOUT_CLK_CPUCL_DBG			11
+#define DOUT_CLK_CPUCL_PCLKDBG			12
+
+/* CMU_FSYS */
+#define PLL_FSYS				1
+#define MOUT_FSYS_SCAN0_USER			2
+#define MOUT_FSYS_SCAN1_USER			3
+#define MOUT_FSYS_BUS_USER			4
+#define MOUT_FSYS_MMC_USER			5
+#define DOUT_FSYS_PCIE_PIPE			6
+#define DOUT_FSYS_ADC				7
+#define DOUT_FSYS_PCIE_PHY_REFCLK_SYSPLL	8
+#define DOUT_FSYS_EQOS_INT125			9
+#define DOUT_FSYS_OTP_MEM			10
+#define DOUT_FSYS_SCLK_UART			11
+#define DOUT_FSYS_EQOS_25			12
+#define DOUT_FSYS_EQOS_2p5			13
+#define DOUT_FSYS_BUS300			14
+#define DOUT_FSYS_BUS_QSPI			15
+#define DOUT_FSYS_MMC_CARD0			16
+#define DOUT_FSYS_MMC_CARD1			17
+#define DOUT_SCAN_CLK_FSYS_125			18
+#define DOUT_FSYS_QSPI				19
+#define DOUT_FSYS_SFMC_NAND			20
+#define DOUT_SCAN_CLK_FSYS_MMC			21
+
+/* CMU_IMEM */
+#define MOUT_IMEM_ACLK_USER			1
+#define MOUT_IMEM_GIC_CA53			2
+#define MOUT_IMEM_GIC_CA5			3
+#define MOUT_IMEM_JPEG_USER			4
+
+/* CMU_PERI */
+#define MOUT_PERI_IP_USER			1
+#define MOUT_PERI_AUDIO_USER			2
+#define MOUT_PERI_I2S0				3
+#define MOUT_PERI_I2S1				4
+#define MOUT_PERI_DISP_USER			5
+#define DOUT_PERI_SPI				6
+#define DOUT_PERI_UART1				7
+#define DOUT_PERI_UART2				8
+#define DOUT_PERI_PCLK				9
+#define DOUT_PERI_I2S0				10
+#define DOUT_PERI_I2S1				11
+#define DOUT_PERI_DSIM				12
+
+#endif /* _DT_BINDINGS_CLOCK_ARTPEC8_H */
-- 
2.34.1


