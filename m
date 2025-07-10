Return-Path: <linux-gpio+bounces-23038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC34AFF5A0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B79A3A6189
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84437260F;
	Thu, 10 Jul 2025 00:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="IrijufEN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB1B660
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106861; cv=none; b=PejeAmByp60+YRz1uv66iDj5ZRbWI0rGFvFAVSAdMj/LjRM+GWPz3lJCFtooI1SnegZfZs6aL5LPDVQpBnYNiMukQt1FHkLv9UIN2vwyhOwU7ZHIMovjFYfo0znJuO/GzidpCICzF8Ma9eBgtEDnCeqR1vRNEReaJgM67BZmQ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106861; c=relaxed/simple;
	bh=aGEr76CsLsun8YmT5u0ToKpQ9RFtyGBLK/ZS8n1/duI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HfOxsAQZ8paSsc6JggD452IAeBUya0nHpMEMkyUUAL1RL45o9KBZDXqW2jog3N5037QCEYtdXpeVenUOGa1F3mSLDvZTWV9khp9eDSdLb1KgLjvbsBjRLBgb2Fj+QonZszM3UZCSzZHd/c7kyZwMRTHtPekr0ynDBiEwcQ+U0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=IrijufEN; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106854; bh=aGEr76CsLsun8YmT5u0ToKpQ9RFtyGBLK/ZS8n1/duI=;
	l=18547; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=IrijufENcox1E6Bi4yjdknE6v1I+zPaymkgBVdDxv+Wsx7HjD2EYpAEUG6ddJHPdb
	 tPvxkuIS0/kPI8Klw+yrNkKNq5sXycvliSy+CzXM2ulTU32NhW3iTa3Lgg1Ewcb331
	 lxgpPx7gGxtM2qxMVReTX43t5YCZMvg7d5SMtqHQ=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:54 +0900
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
Subject: [PATCH 05/16] clk: samsung: artpec-8: Add clock support for CMU_CMU block
Date: Thu, 10 Jul 2025 09:20:35 +0900
Message-Id: <20250710002047.1573841-6-ksk4725@coasia.com>
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

Add clock support for below CMU block in ARTPEC-8 SoC.
 - CMU_CMU

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 415 ++++++++++++++++++++++++++++++
 1 file changed, 415 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 11a48b2fcc09..1ef9e52ad24b 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -14,8 +14,423 @@
 #include "clk.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
+#define CMU_CMU_NR_CLK			(DOUT_CLKCMU_VPP_CORE + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
 
+/* register offset definitions for cmu_cmu (0x12400000) */
+#define PLL_LOCKTIME_PLL_AUDIO			0x0000
+#define PLL_LOCKTIME_PLL_SHARED0		0x0004
+#define PLL_LOCKTIME_PLL_SHARED1		0x0008
+#define PLL_CON0_PLL_AUDIO			0x0100
+#define PLL_CON0_PLL_SHARED0			0x0120
+#define PLL_CON0_PLL_SHARED1			0x0140
+#define MUX_CLKCMU_2D				0x1000
+#define MUX_CLKCMU_3D				0x1004
+#define MUX_CLKCMU_BUS_BUS			0x1008
+#define MUX_CLKCMU_BUS_DLP			0x100c
+#define MUX_CLKCMU_CDC_CORE			0x1010
+#define MUX_CLKCMU_FSYS_SCAN0			0x1014
+#define MUX_CLKCMU_FSYS_SCAN1			0x1018
+#define MUX_CLKCMU_IMEM_JPEG			0x101c
+#define MUX_CLKCMU_PERI_DISP			0x1020
+#define MUX_CLKCMU_CORE_BUS			0x1024
+#define MUX_CLKCMU_CORE_DLP			0x1028
+#define MUX_CLKCMU_CPUCL_SWITCH			0x1030
+#define MUX_CLKCMU_DLP_CORE			0x1034
+#define MUX_CLKCMU_FSYS_BUS			0x1038
+#define MUX_CLKCMU_FSYS_IP			0x103c
+#define MUX_CLKCMU_IMEM_ACLK			0x1054
+#define MUX_CLKCMU_MIF_BUSP			0x1080
+#define MUX_CLKCMU_MIF_SWITCH			0x1084
+#define MUX_CLKCMU_PERI_IP			0x1088
+#define MUX_CLKCMU_RSP_CORE			0x108c
+#define MUX_CLKCMU_TRFM_CORE			0x1090
+#define MUX_CLKCMU_VCA_ACE			0x1094
+#define MUX_CLKCMU_VCA_OD			0x1098
+#define MUX_CLKCMU_VIO_CORE			0x109c
+#define MUX_CLKCMU_VIP0_CORE			0x10a0
+#define MUX_CLKCMU_VIP1_CORE			0x10a4
+#define MUX_CLKCMU_VPP_CORE			0x10a8
+
+#define DIV_CLKCMU_BUS_BUS			0x1800
+#define DIV_CLKCMU_BUS_DLP			0x1804
+#define DIV_CLKCMU_CDC_CORE			0x1808
+#define DIV_CLKCMU_FSYS_SCAN0			0x180c
+#define DIV_CLKCMU_FSYS_SCAN1			0x1810
+#define DIV_CLKCMU_IMEM_JPEG			0x1814
+#define DIV_CLKCMU_MIF_SWITCH			0x1818
+#define DIV_CLKCMU_CORE_DLP			0x181c
+#define DIV_CLKCMU_CORE_MAIN			0x1820
+#define DIV_CLKCMU_PERI_DISP			0x1824
+#define DIV_CLKCMU_CPUCL_SWITCH			0x1828
+#define DIV_CLKCMU_DLP_CORE			0x182c
+#define DIV_CLKCMU_FSYS_BUS			0x1830
+#define DIV_CLKCMU_FSYS_IP			0x1834
+#define DIV_CLKCMU_VIO_AUDIO			0x1838
+#define DIV_CLKCMU_GPU_2D			0x1848
+#define DIV_CLKCMU_GPU_3D			0x184c
+#define DIV_CLKCMU_IMEM_ACLK			0x1854
+#define DIV_CLKCMU_MIF_BUSP			0x1884
+#define DIV_CLKCMU_PERI_AUDIO			0x1890
+#define DIV_CLKCMU_PERI_IP			0x1894
+#define DIV_CLKCMU_RSP_CORE			0x1898
+#define DIV_CLKCMU_TRFM_CORE			0x189c
+#define DIV_CLKCMU_VCA_ACE			0x18a0
+#define DIV_CLKCMU_VCA_OD			0x18a4
+#define DIV_CLKCMU_VIO_CORE			0x18ac
+#define DIV_CLKCMU_VIP0_CORE			0x18b0
+#define DIV_CLKCMU_VIP1_CORE			0x18b4
+#define DIV_CLKCMU_VPP_CORE			0x18b8
+#define DIV_PLL_SHARED0_DIV2			0x18bc
+#define DIV_PLL_SHARED0_DIV3			0x18c0
+#define DIV_PLL_SHARED0_DIV4			0x18c4
+#define DIV_PLL_SHARED1_DIV2			0x18c8
+#define DIV_PLL_SHARED1_DIV3			0x18cc
+#define DIV_PLL_SHARED1_DIV4			0x18d0
+
+static const unsigned long cmu_cmu_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_AUDIO,
+	PLL_LOCKTIME_PLL_SHARED0,
+	PLL_LOCKTIME_PLL_SHARED1,
+	PLL_CON0_PLL_AUDIO,
+	PLL_CON0_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
+	MUX_CLKCMU_2D,
+	MUX_CLKCMU_3D,
+	MUX_CLKCMU_BUS_BUS,
+	MUX_CLKCMU_BUS_DLP,
+	MUX_CLKCMU_CDC_CORE,
+	MUX_CLKCMU_FSYS_SCAN0,
+	MUX_CLKCMU_FSYS_SCAN1,
+	MUX_CLKCMU_IMEM_JPEG,
+	MUX_CLKCMU_PERI_DISP,
+	MUX_CLKCMU_CORE_BUS,
+	MUX_CLKCMU_CORE_DLP,
+	MUX_CLKCMU_CPUCL_SWITCH,
+	MUX_CLKCMU_DLP_CORE,
+	MUX_CLKCMU_FSYS_BUS,
+	MUX_CLKCMU_FSYS_IP,
+	MUX_CLKCMU_IMEM_ACLK,
+	MUX_CLKCMU_MIF_BUSP,
+	MUX_CLKCMU_MIF_SWITCH,
+	MUX_CLKCMU_PERI_IP,
+	MUX_CLKCMU_RSP_CORE,
+	MUX_CLKCMU_TRFM_CORE,
+	MUX_CLKCMU_VCA_ACE,
+	MUX_CLKCMU_VCA_OD,
+	MUX_CLKCMU_VIO_CORE,
+	MUX_CLKCMU_VIP0_CORE,
+	MUX_CLKCMU_VIP1_CORE,
+	MUX_CLKCMU_VPP_CORE,
+	DIV_CLKCMU_BUS_BUS,
+	DIV_CLKCMU_BUS_DLP,
+	DIV_CLKCMU_CDC_CORE,
+	DIV_CLKCMU_FSYS_SCAN0,
+	DIV_CLKCMU_FSYS_SCAN1,
+	DIV_CLKCMU_IMEM_JPEG,
+	DIV_CLKCMU_MIF_SWITCH,
+	DIV_CLKCMU_CORE_DLP,
+	DIV_CLKCMU_CORE_MAIN,
+	DIV_CLKCMU_PERI_DISP,
+	DIV_CLKCMU_CPUCL_SWITCH,
+	DIV_CLKCMU_DLP_CORE,
+	DIV_CLKCMU_FSYS_BUS,
+	DIV_CLKCMU_FSYS_IP,
+	DIV_CLKCMU_VIO_AUDIO,
+	DIV_CLKCMU_GPU_2D,
+	DIV_CLKCMU_GPU_3D,
+	DIV_CLKCMU_IMEM_ACLK,
+	DIV_CLKCMU_MIF_BUSP,
+	DIV_CLKCMU_PERI_AUDIO,
+	DIV_CLKCMU_PERI_IP,
+	DIV_CLKCMU_RSP_CORE,
+	DIV_CLKCMU_TRFM_CORE,
+	DIV_CLKCMU_VCA_ACE,
+	DIV_CLKCMU_VCA_OD,
+	DIV_CLKCMU_VIO_CORE,
+	DIV_CLKCMU_VIP0_CORE,
+	DIV_CLKCMU_VIP1_CORE,
+	DIV_CLKCMU_VPP_CORE,
+	DIV_PLL_SHARED0_DIV2,
+	DIV_PLL_SHARED0_DIV3,
+	DIV_PLL_SHARED0_DIV4,
+	DIV_PLL_SHARED1_DIV2,
+	DIV_PLL_SHARED1_DIV3,
+	DIV_PLL_SHARED1_DIV4,
+};
+
+static const struct samsung_pll_rate_table artpec8_pll_audio_rates[] = {
+	PLL_36XX_RATE(25 * MHZ, 589823913U, 47, 1, 1, 12184),
+	PLL_36XX_RATE(25 * MHZ, 393215942U, 47, 3, 0, 12184),
+	PLL_36XX_RATE(25 * MHZ, 294911956U, 47, 1, 2, 12184),
+	PLL_36XX_RATE(25 * MHZ, 100000000U, 32, 2, 2, 0),
+	PLL_36XX_RATE(25 * MHZ,  98303985U, 47, 3, 2, 12184),
+	PLL_36XX_RATE(25 * MHZ,  49151992U, 47, 3, 3, 12184),
+};
+
+static const struct samsung_pll_clock cmu_cmu_pll_clks[] __initconst = {
+	PLL(pll_1017x, PLL_SHARED0, "fout_pll_shared0", "fin_pll",
+	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0, NULL),
+	PLL(pll_1017x, PLL_SHARED1, "fout_pll_shared1", "fin_pll",
+	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON0_PLL_SHARED1, NULL),
+	PLL(pll_1031x, PLL_AUDIO, "fout_pll_audio", "fin_pll",
+	    PLL_LOCKTIME_PLL_AUDIO, PLL_CON0_PLL_AUDIO, artpec8_pll_audio_rates),
+};
+
+PNAME(mout_clkcmu_bus_bus_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_bus_dlp_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared0_div4",
+	"dout_pll_shared1_div2", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_core_bus_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared0_div4", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_core_dlp_p) = {
+	"dout_pll_shared0_div2", "dout_pll_sahred1_div2",
+	"dout_pll_shared0_div3", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_cpucl_switch_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared1_div2",
+	"dout_pll_shared0_div3", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_fsys_bus_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div2",
+	"dout_pll_shared1_div4", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_fsys_ip_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared1_div3",
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3" };
+PNAME(mout_clkcmu_fsys_sfmc_p) = {
+	"dout_pll_shared1_div3", "dout_pll_shared0_div2",
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3" };
+PNAME(mout_clkcmu_fsys_scan0_p) = {
+	"dout_pll_shared0_div4", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_fsys_scan1_p) = {
+	"dout_pll_shared0_div4", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_imem_imem_p) = {
+	"dout_pll_shared1_div4", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div2" };
+PNAME(mout_clkcmu_imem_jpeg_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div2", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_cdc_core_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_dlp_core_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared1_div2",
+	"dout_pll_shared0_div3", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_3d_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared1_div2",
+	"dout_pll_shared0_div3", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_2d_p) = {
+	"dout_pll_shared0_div2", "dout_pll_shared1_div2",
+	"dout_pll_shared0_div3", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_mif_switch_p) = {
+	"dout_pll_shared0", "dout_pll_shared1",
+	"dout_pll_shared0_div2", "dout_pll_shared0_div3" };
+PNAME(mout_clkcmu_mif_busp_p) = {
+	"dout_pll_shared0_div3", "dout_pll_shared1_div4",
+	"dout_pll_shared0_div4", "dout_pll_shared0_div2" };
+PNAME(mout_clkcmu_peri_disp_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div2",
+	"dout_pll_shared1_div4", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_peri_ip_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div4",
+	"dout_pll_shared1_div4", "dout_pll_shared0_div2" };
+PNAME(mout_clkcmu_rsp_core_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_trfm_core_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_vca_ace_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_vca_od_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_vio_core_p) = {
+	"dout_pll_shared0_div3", "dout_pll_shared0_div2",
+	"dout_pll_shared1_div2", "dout_pll_shared1_div3" };
+PNAME(mout_clkcmu_vip0_core_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_vip1_core_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_vpp_core_p) = {
+	"dout_pll_shared1_div2", "dout_pll_shared0_div3",
+	"dout_pll_shared1_div3", "dout_pll_shared1_div4" };
+PNAME(mout_clkcmu_pll_shared0_p) = { "fin_pll", "fout_pll_shared0" };
+PNAME(mout_clkcmu_pll_shared1_p) = { "fin_pll", "fout_pll_shared1" };
+PNAME(mout_clkcmu_pll_audio_p) = { "fin_pll", "fout_pll_audio" };
+
+static const struct samsung_fixed_factor_clock cmu_fixed_factor_clks[] __initconst = {
+	FFACTOR(DOUT_CLKCMU_OTP, "dout_clkcmu_otp", "fin_pll", 1, 8, 0),
+};
+
+static const struct samsung_mux_clock cmu_cmu_mux_clks[] __initconst = {
+	MUX(0, "mout_clkcmu_pll_shared0", mout_clkcmu_pll_shared0_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(0, "mout_clkcmu_pll_shared1", mout_clkcmu_pll_shared1_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+	MUX(0, "mout_clkcmu_pll_audio", mout_clkcmu_pll_audio_p,
+	    PLL_CON0_PLL_AUDIO, 4, 1),
+	MUX(0, "mout_clkcmu_bus_bus", mout_clkcmu_bus_bus_p,
+	    MUX_CLKCMU_BUS_BUS, 0, 2),
+	MUX(0, "mout_clkcmu_bus_dlp", mout_clkcmu_bus_dlp_p,
+	    MUX_CLKCMU_BUS_DLP, 0, 2),
+	MUX(0, "mout_clkcmu_core_bus", mout_clkcmu_core_bus_p,
+	    MUX_CLKCMU_CORE_BUS, 0, 2),
+	MUX(0, "mout_clkcmu_core_dlp", mout_clkcmu_core_dlp_p,
+	    MUX_CLKCMU_CORE_DLP, 0, 2),
+	MUX(0, "mout_clkcmu_cpucl_switch", mout_clkcmu_cpucl_switch_p,
+	    MUX_CLKCMU_CPUCL_SWITCH, 0, 3),
+	MUX(0, "mout_clkcmu_fsys_bus", mout_clkcmu_fsys_bus_p,
+	    MUX_CLKCMU_FSYS_BUS, 0, 2),
+	MUX(0, "mout_clkcmu_fsys_ip", mout_clkcmu_fsys_ip_p,
+	    MUX_CLKCMU_FSYS_IP, 0, 2),
+	MUX(0, "mout_clkcmu_fsys_scan0", mout_clkcmu_fsys_scan0_p,
+	    MUX_CLKCMU_FSYS_SCAN0, 0, 1),
+	MUX(0, "mout_clkcmu_fsys_scan1", mout_clkcmu_fsys_scan1_p,
+	    MUX_CLKCMU_FSYS_SCAN1, 0, 1),
+	MUX(0, "mout_clkcmu_imem_imem", mout_clkcmu_imem_imem_p,
+	    MUX_CLKCMU_IMEM_ACLK, 0, 2),
+	MUX(0, "mout_clkcmu_imem_jpeg", mout_clkcmu_imem_jpeg_p,
+	    MUX_CLKCMU_IMEM_JPEG, 0, 2),
+	nMUX(0, "mout_clkcmu_cdc_core", mout_clkcmu_cdc_core_p,
+	     MUX_CLKCMU_CDC_CORE, 0, 2),
+	nMUX(0, "mout_clkcmu_dlp_core", mout_clkcmu_dlp_core_p,
+	     MUX_CLKCMU_DLP_CORE, 0, 2),
+	MUX(0, "mout_clkcmu_3d", mout_clkcmu_3d_p,
+	    MUX_CLKCMU_3D, 0, 2),
+	MUX(0, "mout_clkcmu_2d", mout_clkcmu_2d_p,
+	    MUX_CLKCMU_2D, 0, 2),
+	MUX(0, "mout_clkcmu_mif_switch", mout_clkcmu_mif_switch_p,
+	    MUX_CLKCMU_MIF_SWITCH, 0, 2),
+	MUX(0, "mout_clkcmu_mif_busp", mout_clkcmu_mif_busp_p,
+	    MUX_CLKCMU_MIF_BUSP, 0, 2),
+	MUX(0, "mout_clkcmu_peri_disp", mout_clkcmu_peri_disp_p,
+	    MUX_CLKCMU_PERI_DISP, 0, 2),
+	MUX(0, "mout_clkcmu_peri_ip", mout_clkcmu_peri_ip_p,
+	    MUX_CLKCMU_PERI_IP, 0, 2),
+	MUX(0, "mout_clkcmu_rsp_core", mout_clkcmu_rsp_core_p,
+	    MUX_CLKCMU_RSP_CORE, 0, 2),
+	nMUX(0, "mout_clkcmu_trfm_core", mout_clkcmu_trfm_core_p,
+	     MUX_CLKCMU_TRFM_CORE, 0, 2),
+	MUX(0, "mout_clkcmu_vca_ace", mout_clkcmu_vca_ace_p,
+	    MUX_CLKCMU_VCA_ACE, 0, 2),
+	MUX(0, "mout_clkcmu_vca_od", mout_clkcmu_vca_od_p,
+	    MUX_CLKCMU_VCA_OD, 0, 2),
+	MUX(0, "mout_clkcmu_vio_core", mout_clkcmu_vio_core_p,
+	    MUX_CLKCMU_VIO_CORE, 0, 2),
+	nMUX(0, "mout_clkcmu_vip0_core", mout_clkcmu_vip0_core_p,
+	     MUX_CLKCMU_VIP0_CORE, 0, 2),
+	nMUX(0, "mout_clkcmu_vip1_core", mout_clkcmu_vip1_core_p,
+	     MUX_CLKCMU_VIP1_CORE, 0, 2),
+	nMUX(0, "mout_clkcmu_vpp_core", mout_clkcmu_vpp_core_p,
+	     MUX_CLKCMU_VPP_CORE, 0, 2),
+};
+
+static const struct samsung_div_clock cmu_cmu_div_clks[] __initconst = {
+	DIV(DOUT_PLL_SHARED0_DIV2, "dout_pll_shared0_div2",
+	    "mout_clkcmu_pll_shared0", DIV_PLL_SHARED0_DIV2, 0, 1),
+	DIV(DOUT_PLL_SHARED0_DIV3, "dout_pll_shared0_div3",
+	    "mout_clkcmu_pll_shared0", DIV_PLL_SHARED0_DIV3, 0, 2),
+	DIV(DOUT_PLL_SHARED0_DIV4, "dout_pll_shared0_div4",
+	    "dout_pll_shared0_div2", DIV_PLL_SHARED0_DIV4, 0, 1),
+	DIV(DOUT_PLL_SHARED1_DIV2, "dout_pll_shared1_div2",
+	    "mout_clkcmu_pll_shared1", DIV_PLL_SHARED1_DIV2, 0, 1),
+	DIV(DOUT_PLL_SHARED1_DIV3, "dout_pll_shared1_div3",
+	    "mout_clkcmu_pll_shared1", DIV_PLL_SHARED1_DIV3, 0, 2),
+	DIV(DOUT_PLL_SHARED1_DIV4, "dout_pll_shared1_div4",
+	    "dout_pll_shared1_div2", DIV_PLL_SHARED1_DIV4, 0, 1),
+	DIV(DOUT_CLKCMU_BUS_BUS, "dout_clkcmu_bus_bus",
+	    "mout_clkcmu_bus_bus", DIV_CLKCMU_BUS_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_BUS_DLP, "dout_clkcmu_bus_dlp",
+	    "mout_clkcmu_bus_dlp", DIV_CLKCMU_BUS_DLP, 0, 4),
+	DIV(DOUT_CLKCMU_CORE_MAIN, "dout_clkcmu_core_main",
+	    "mout_clkcmu_core_bus", DIV_CLKCMU_CORE_MAIN, 0, 4),
+	DIV(DOUT_CLKCMU_CORE_DLP, "dout_clkcmu_core_dlp",
+	    "mout_clkcmu_core_dlp", DIV_CLKCMU_CORE_DLP, 0, 4),
+	DIV(DOUT_CLKCMU_CPUCL_SWITCH, "dout_clkcmu_cpucl_switch",
+	    "mout_clkcmu_cpucl_switch", DIV_CLKCMU_CPUCL_SWITCH, 0, 3),
+	DIV(DOUT_CLKCMU_FSYS_BUS, "dout_clkcmu_fsys_bus",
+	    "mout_clkcmu_fsys_bus", DIV_CLKCMU_FSYS_BUS, 0, 4),
+	DIV(DOUT_CLKCMU_FSYS_IP, "dout_clkcmu_fsys_ip",
+	    "mout_clkcmu_fsys_ip", DIV_CLKCMU_FSYS_IP, 0, 9),
+	DIV(DOUT_CLKCMU_FSYS_SCAN0, "dout_clkcmu_fsys_scan0",
+	    "mout_clkcmu_fsys_scan0", DIV_CLKCMU_FSYS_SCAN0, 0, 4),
+	DIV(DOUT_CLKCMU_FSYS_SCAN1, "dout_clkcmu_fsys_scan1",
+	    "mout_clkcmu_fsys_scan1", DIV_CLKCMU_FSYS_SCAN1, 0, 4),
+	DIV(DOUT_CLKCMU_IMEM_ACLK, "dout_clkcmu_imem_aclk",
+	    "mout_clkcmu_imem_imem", DIV_CLKCMU_IMEM_ACLK, 0, 4),
+	DIV(DOUT_CLKCMU_IMEM_JPEG, "dout_clkcmu_imem_jpeg",
+	    "mout_clkcmu_imem_jpeg", DIV_CLKCMU_IMEM_JPEG, 0, 4),
+	DIV_F(DOUT_CLKCMU_CDC_CORE, "dout_clkcmu_cdc_core",
+	      "mout_clkcmu_cdc_core", DIV_CLKCMU_CDC_CORE, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(DOUT_CLKCMU_DLP_CORE, "dout_clkcmu_dlp_core",
+	      "mout_clkcmu_dlp_core", DIV_CLKCMU_DLP_CORE, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV(DOUT_CLKCMU_GPU_3D, "dout_clkcmu_gpu_3d",
+	    "mout_clkcmu_3d", DIV_CLKCMU_GPU_3D, 0, 3),
+	DIV(DOUT_CLKCMU_GPU_2D, "dout_clkcmu_gpu_2d",
+	    "mout_clkcmu_2d", DIV_CLKCMU_GPU_2D, 0, 4),
+	DIV(DOUT_CLKCMU_MIF_SWITCH, "dout_clkcmu_mif_switch",
+	    "mout_clkcmu_mif_switch", DIV_CLKCMU_MIF_SWITCH, 0, 4),
+	DIV(DOUT_CLKCMU_MIF_BUSP, "dout_clkcmu_mif_busp",
+	    "mout_clkcmu_mif_busp", DIV_CLKCMU_MIF_BUSP, 0, 3),
+	DIV(DOUT_CLKCMU_PERI_DISP, "dout_clkcmu_peri_disp",
+	    "mout_clkcmu_peri_disp", DIV_CLKCMU_PERI_DISP, 0, 4),
+	DIV(DOUT_CLKCMU_PERI_IP, "dout_clkcmu_peri_ip",
+	    "mout_clkcmu_peri_ip", DIV_CLKCMU_PERI_IP, 0, 4),
+	DIV(DOUT_CLKCMU_PERI_AUDIO, "dout_clkcmu_peri_audio",
+	    "mout_clkcmu_pll_audio", DIV_CLKCMU_PERI_AUDIO, 0, 4),
+	DIV(DOUT_CLKCMU_RSP_CORE, "dout_clkcmu_rsp_core",
+	    "mout_clkcmu_rsp_core", DIV_CLKCMU_RSP_CORE, 0, 4),
+	DIV_F(DOUT_CLKCMU_TRFM_CORE, "dout_clkcmu_trfm_core",
+	      "mout_clkcmu_trfm_core", DIV_CLKCMU_TRFM_CORE, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV(DOUT_CLKCMU_VCA_ACE, "dout_clkcmu_vca_ace",
+	    "mout_clkcmu_vca_ace", DIV_CLKCMU_VCA_ACE, 0, 4),
+	DIV(DOUT_CLKCMU_VCA_OD, "dout_clkcmu_vca_od",
+	    "mout_clkcmu_vca_od", DIV_CLKCMU_VCA_OD, 0, 4),
+	DIV(DOUT_CLKCMU_VIO_CORE, "dout_clkcmu_vio_core",
+	    "mout_clkcmu_vio_core", DIV_CLKCMU_VIO_CORE, 0, 4),
+	DIV(DOUT_CLKCMU_VIO_AUDIO, "dout_clkcmu_vio_audio",
+	    "mout_clkcmu_pll_audio", DIV_CLKCMU_VIO_AUDIO, 0, 4),
+	DIV_F(DOUT_CLKCMU_VIP0_CORE, "dout_clkcmu_vip0_core",
+	      "mout_clkcmu_vip0_core", DIV_CLKCMU_VIP0_CORE, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(DOUT_CLKCMU_VIP1_CORE, "dout_clkcmu_vip1_core",
+	      "mout_clkcmu_vip1_core", DIV_CLKCMU_VIP1_CORE, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(DOUT_CLKCMU_VPP_CORE, "dout_clkcmu_vpp_core",
+	      "mout_clkcmu_vpp_core", DIV_CLKCMU_VPP_CORE, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+};
+
+static const struct samsung_cmu_info cmu_cmu_info __initconst = {
+	.pll_clks		= cmu_cmu_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cmu_cmu_pll_clks),
+	.fixed_factor_clks	= cmu_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(cmu_fixed_factor_clks),
+	.mux_clks		= cmu_cmu_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_cmu_mux_clks),
+	.div_clks		= cmu_cmu_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_cmu_div_clks),
+	.nr_clk_ids		= CMU_CMU_NR_CLK,
+	.clk_regs		= cmu_cmu_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_cmu_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_cmu_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_cmu_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_cmu, "axis,artpec8-cmu-cmu",
+	       artpec8_clk_cmu_cmu_init);
+
 /* Register Offset definitions for CMU_IMEM (0x10010000) */
 #define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
 #define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
-- 
2.34.1


