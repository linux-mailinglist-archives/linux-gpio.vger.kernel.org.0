Return-Path: <linux-gpio+bounces-23053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFDAFF5EA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E864B3BA8CD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2CC72605;
	Thu, 10 Jul 2025 00:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="CPtnQb9o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C937260F
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752107263; cv=none; b=rERtCM22jlP5bemX3Kt68adfOZEnTfWfZu2XgAkkalqc0Td22W4FEPHyIasJPRow6qaLnJCBfko7wKTvUGSEvK5Gq0M7A2+Rw78qrq1Mmk6hoeagcQduwW1xcqQtG4oeXTpdrwK5Y6Qf8+r6GuGZSWi9uph3cVUG2kQkUkiQq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752107263; c=relaxed/simple;
	bh=tipNFC8X7ZjJwIsy/28H95TjOdSgc7hIrcyILBXQBmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c6MYPziCOsG0Axhud5n1YNTzZZaquERpaMU8VKCn7LCju/iL23YlohaE07e3SpCL1bNRdJHwGPZPCugU+Z0Fb1qfby+i4a10Z8kYKZmzoG4cl8tSfnPATLs9J8dBEUCeClXY9IY4CEHYHy0q0/R7a6r9YpxGXGm5DGVNRqPr0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=CPtnQb9o; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106859; bh=tipNFC8X7ZjJwIsy/28H95TjOdSgc7hIrcyILBXQBmQ=;
	l=6929; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CPtnQb9oHq2qahM6LsvUhJpM9HDSamXWML7vGkg9WA5YdbrOxPjlGTkrtjruRHhi8
	 qgixWUQXvnCs7oVoK3p8XAby30RGGPCTlDvpG9xFd4QENaN+yEaECj5rCLsNyFG402
	 75FCL1zmSyikZm4qYUBklXclgs7w+Kwn0ebAlVc8=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:59 +0900
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
	soc@lists.linux.dev,
	v.pavani@samsung.com
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
	soc@lists.linux.dev,
	Varada Pavani <v.pavani@samsung.com>
Subject: [PATCH 09/16] clk: samsung: artpec-8: Add clock support for CMU_FSYS block
Date: Thu, 10 Jul 2025 09:20:39 +0900
Message-Id: <20250710002047.1573841-10-ksk4725@coasia.com>
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
 - CMU_FSYS

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 134 ++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 15c90fe29308..7ccec4ff8f70 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -18,6 +18,7 @@
 #define CMU_BUS_NR_CLK			(DOUT_CLK_BUS_PCLK + 1)
 #define CMU_CORE_NR_CLK			(DOUT_CLK_CORE_PCLK + 1)
 #define CMU_CPUCL_NR_CLK		(DOUT_CLK_CPUCL_PCLKDBG + 1)
+#define CMU_FSYS_NR_CLK			(DOUT_SCAN_CLK_FSYS_MMC + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
 
 /* register offset definitions for cmu_cmu (0x12400000) */
@@ -620,6 +621,139 @@ static void __init artpec8_clk_cmu_cpucl_init(struct device_node *np)
 CLK_OF_DECLARE(artpec8_clk_cmu_cpucl, "axis,artpec8-cmu-cpucl",
 	       artpec8_clk_cmu_cpucl_init);
 
+/* Register Offset definitions for CMU_FSYS (0x16c10000) */
+#define PLL_LOCKTIME_PLL_FSYS				0x0004
+#define PLL_CON0_MUX_CLK_FSYS_BUS_USER			0x0120
+#define PLL_CON0_MUX_CLK_FSYS_MMC_USER			0x0140
+#define PLL_CON0_MUX_CLK_FSYS_SCAN0_USER		0x0160
+#define PLL_CON0_MUX_CLK_FSYS_SCAN1_USER		0x0180
+#define PLL_CON0_PLL_FSYS				0x01c0
+#define DIV_CLK_FSYS_ADC				0x1804
+#define DIV_CLK_FSYS_BUS300				0x1808
+#define DIV_CLK_FSYS_BUS_QSPI				0x180c
+#define DIV_CLK_FSYS_EQOS_25				0x1810
+#define DIV_CLK_FSYS_EQOS_2P5				0x1814
+#define DIV_CLK_FSYS_EQOS_500				0x1818
+#define DIV_CLK_FSYS_EQOS_INT125			0x181c
+#define DIV_CLK_FSYS_MMC_CARD0				0x1820
+#define DIV_CLK_FSYS_MMC_CARD1				0x1824
+#define DIV_CLK_FSYS_OTP_MEM				0x1828
+#define DIV_CLK_FSYS_PCIE_PHY_REFCLK_SYSPLL		0x182c
+#define DIV_CLK_FSYS_QSPI				0x1830
+#define DIV_CLK_FSYS_SCLK_UART				0x1834
+#define DIV_CLK_FSYS_SFMC_NAND				0x1838
+#define DIV_SCAN_CLK_FSYS_125				0x183c
+#define DIV_SCAN_CLK_FSYS_MMC				0x1840
+#define DIV_SCAN_CLK_FSYS_PCIE_PIPE			0x1844
+
+static const unsigned long cmu_fsys_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_FSYS,
+	PLL_CON0_MUX_CLK_FSYS_BUS_USER,
+	PLL_CON0_MUX_CLK_FSYS_MMC_USER,
+	PLL_CON0_MUX_CLK_FSYS_SCAN0_USER,
+	PLL_CON0_MUX_CLK_FSYS_SCAN1_USER,
+	PLL_CON0_PLL_FSYS,
+	DIV_CLK_FSYS_ADC,
+	DIV_CLK_FSYS_BUS300,
+	DIV_CLK_FSYS_BUS_QSPI,
+	DIV_CLK_FSYS_EQOS_25,
+	DIV_CLK_FSYS_EQOS_2P5,
+	DIV_CLK_FSYS_EQOS_500,
+	DIV_CLK_FSYS_EQOS_INT125,
+	DIV_CLK_FSYS_MMC_CARD0,
+	DIV_CLK_FSYS_MMC_CARD1,
+	DIV_CLK_FSYS_OTP_MEM,
+	DIV_CLK_FSYS_PCIE_PHY_REFCLK_SYSPLL,
+	DIV_CLK_FSYS_QSPI,
+	DIV_CLK_FSYS_SCLK_UART,
+	DIV_CLK_FSYS_SFMC_NAND,
+	DIV_SCAN_CLK_FSYS_125,
+	DIV_SCAN_CLK_FSYS_MMC,
+	DIV_SCAN_CLK_FSYS_PCIE_PIPE,
+};
+
+static const struct samsung_pll_clock cmu_fsys_pll_clks[] __initconst = {
+	PLL(pll_1017x, PLL_FSYS, "fout_pll_fsys", "fin_pll",
+	    PLL_LOCKTIME_PLL_FSYS, PLL_CON0_PLL_FSYS, NULL),
+};
+
+PNAME(mout_fsys_scan0_user_p) = { "fin_pll", "dout_clkcmu_fsys_scan0" };
+PNAME(mout_fsys_scan1_user_p) = { "fin_pll", "dout_clkcmu_fsys_scan1" };
+PNAME(mout_fsys_bus_user_p) = { "fin_pll", "dout_clkcmu_fsys_bus" };
+PNAME(mout_fsys_mmc_user_p) = { "fin_pll", "dout_clkcmu_fsys_ip" };
+PNAME(mout_fsys_pll_fsys_p) = { "fin_pll", "fout_pll_fsys" };
+
+static const struct samsung_mux_clock cmu_fsys_mux_clks[] __initconst = {
+	MUX(0, "mout_clk_pll_fsys", mout_fsys_pll_fsys_p, PLL_CON0_PLL_FSYS, 4, 1),
+	MUX(MOUT_FSYS_SCAN0_USER, "mout_fsys_scan0_user",
+	    mout_fsys_scan0_user_p, PLL_CON0_MUX_CLK_FSYS_SCAN0_USER, 4, 1),
+	MUX(MOUT_FSYS_SCAN1_USER, "mout_fsys_scan1_user",
+	    mout_fsys_scan1_user_p, PLL_CON0_MUX_CLK_FSYS_SCAN1_USER, 4, 1),
+	MUX(MOUT_FSYS_BUS_USER, "mout_fsys_bus_user",
+	    mout_fsys_bus_user_p, PLL_CON0_MUX_CLK_FSYS_BUS_USER, 4, 1),
+	MUX(MOUT_FSYS_MMC_USER, "mout_fsys_mmc_user",
+	    mout_fsys_mmc_user_p, PLL_CON0_MUX_CLK_FSYS_MMC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock cmu_fsys_div_clks[] __initconst = {
+	DIV(DOUT_FSYS_PCIE_PIPE, "dout_fsys_pcie_pipe", "mout_clk_pll_fsys",
+	    DIV_SCAN_CLK_FSYS_PCIE_PIPE, 0, 4),
+	DIV(DOUT_FSYS_ADC, "dout_fsys_adc", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_ADC, 0, 7),
+	DIV(DOUT_FSYS_PCIE_PHY_REFCLK_SYSPLL,
+	    "dout_fsys_pcie_phy_refclk_syspll", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_PCIE_PHY_REFCLK_SYSPLL, 0, 8),
+	DIV(DOUT_FSYS_QSPI, "dout_fsys_qspi", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_QSPI, 0, 4),
+	DIV(DOUT_FSYS_EQOS_INT125, "dout_fsys_eqos_int125", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_EQOS_INT125, 0, 4),
+	DIV(DOUT_FSYS_OTP_MEM, "dout_fsys_otp_mem", "fin_pll",
+	    DIV_CLK_FSYS_OTP_MEM, 0, 9),
+	DIV(DOUT_FSYS_SCLK_UART, "dout_fsys_sclk_uart", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_SCLK_UART, 0, 10),
+	DIV(DOUT_FSYS_SFMC_NAND, "dout_fsys_sfmc_nand", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_SFMC_NAND, 0, 4),
+	DIV(DOUT_SCAN_CLK_FSYS_125,
+	    "dout_scan_clk_fsys_125", "mout_clk_pll_fsys",
+	    DIV_SCAN_CLK_FSYS_125, 0, 4),
+	DIV(DOUT_SCAN_CLK_FSYS_MMC, "dout_scan_clk_fsys_mmc", "fout_pll_fsys",
+	    DIV_SCAN_CLK_FSYS_MMC, 0, 4),
+	DIV(DOUT_FSYS_EQOS_25, "dout_fsys_eqos_25", "dout_fsys_eqos_int125",
+	    DIV_CLK_FSYS_EQOS_25, 0, 4),
+	DIV_F(DOUT_FSYS_EQOS_2p5, "dout_fsys_eqos_2p5", "dout_fsys_eqos_25",
+	      DIV_CLK_FSYS_EQOS_2P5, 0, 4, CLK_SET_RATE_PARENT, 0),
+	DIV(0, "dout_fsys_eqos_500", "mout_clk_pll_fsys",
+	    DIV_CLK_FSYS_EQOS_500, 0, 4),
+	DIV(DOUT_FSYS_BUS300, "dout_fsys_bus300", "mout_fsys_bus_user",
+	    DIV_CLK_FSYS_BUS300, 0, 4),
+	DIV(DOUT_FSYS_BUS_QSPI, "dout_fsys_bus_qspi", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_BUS_QSPI, 0, 4),
+	DIV(DOUT_FSYS_MMC_CARD0, "dout_fsys_mmc_card0", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_MMC_CARD0, 0, 10),
+	DIV(DOUT_FSYS_MMC_CARD1, "dout_fsys_mmc_card1", "mout_fsys_mmc_user",
+	    DIV_CLK_FSYS_MMC_CARD1, 0, 10),
+};
+
+static const struct samsung_cmu_info cmu_fsys_info __initconst = {
+	.pll_clks		= cmu_fsys_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cmu_fsys_pll_clks),
+	.mux_clks		= cmu_fsys_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_fsys_mux_clks),
+	.div_clks		= cmu_fsys_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_fsys_div_clks),
+	.nr_clk_ids		= CMU_FSYS_NR_CLK,
+	.clk_regs		= cmu_fsys_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_fsys_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_fsys_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_fsys_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_fsys, "axis,artpec8-cmu-fsys",
+	       artpec8_clk_cmu_fsys_init);
+
 /* Register Offset definitions for CMU_IMEM (0x10010000) */
 #define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
 #define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
-- 
2.34.1


