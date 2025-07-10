Return-Path: <linux-gpio+bounces-23043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED5AFF5B0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822793A19DE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CF41537A7;
	Thu, 10 Jul 2025 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="nCEnAlGn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888B1E522
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106863; cv=none; b=nQCjx3G09dylLeaTlA2l/oc5JSGxt9KBTW7fwM3KVHsNiPk6yysEmGaSbCE3kxjgVQog0hU+oY4LKxm+we9/QeV62/dEegCustsk2dDgMd+ybghCOjO2kYdvDg4CCwKDf8iD1WMjGfwqQGfYgeMl4rsygwwzBTjZjtARND8Pugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106863; c=relaxed/simple;
	bh=j6y4CRKseQoEZyQ+Mx7uaatjudKpQjwG59w6BIf/0iw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O1O/8UAmiJH8k7V/kAxmZ6tg9gyqPzEk4azcHs3qRNNSPInnWpKRJtDMPFdmYC7v1Vpju0vLvref11OL4AIjjn2QcOMsepr/WzKf5vlBX1rjVx9wmT2m7mA0xWPRrtJEd8dJCASswomHPBtVG6amABB0gwq9hWwZaanG9a4RkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=nCEnAlGn; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106858; bh=j6y4CRKseQoEZyQ+Mx7uaatjudKpQjwG59w6BIf/0iw=;
	l=2936; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=nCEnAlGn93Nbggu1Wktf5vQnLKtFTsB8hSyHRWlALZ0K60bzWHz9/OGS1RaEp8IEb
	 qNzlVbZf+K98zlFQKZ6Bywbq4j4oAtcQMWzL4HiTPhmfyTkjfQ9PprXFYEU0wCrXFk
	 wiPFfuBr1sT/hWABZSVsA8p/95wAd3I6CBXaPKkU=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:58 +0900
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
Subject: [PATCH 07/16] clk: samsung: artpec-8: Add clock support for CMU_CORE block
Date: Thu, 10 Jul 2025 09:20:37 +0900
Message-Id: <20250710002047.1573841-8-ksk4725@coasia.com>
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
 - CMU_CORE

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 drivers/clk/samsung/clk-artpec8.c | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec8.c b/drivers/clk/samsung/clk-artpec8.c
index 648abdd2f510..f41b7941c630 100644
--- a/drivers/clk/samsung/clk-artpec8.c
+++ b/drivers/clk/samsung/clk-artpec8.c
@@ -16,6 +16,7 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CMU_CMU_NR_CLK			(DOUT_CLKCMU_VPP_CORE + 1)
 #define CMU_BUS_NR_CLK			(DOUT_CLK_BUS_PCLK + 1)
+#define CMU_CORE_NR_CLK			(DOUT_CLK_CORE_PCLK + 1)
 #define CMU_IMEM_NR_CLK			(MOUT_IMEM_JPEG_USER + 1)
 
 /* register offset definitions for cmu_cmu (0x12400000) */
@@ -476,6 +477,50 @@ static void __init artpec8_clk_cmu_bus_init(struct device_node *np)
 CLK_OF_DECLARE(artpec8_clk_cmu_bus, "axis,artpec8-cmu-bus",
 	       artpec8_clk_cmu_bus_init);
 
+/* Register Offset definitions for CMU_CORE (0x12410000) */
+#define PLL_CON0_MUX_CLK_CORE_ACLK_USER			0x0100
+#define PLL_CON0_MUX_CLK_CORE_DLP_USER			0x0120
+#define DIV_CLK_CORE_PCLK				0x1800
+
+static const unsigned long cmu_core_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLK_CORE_ACLK_USER,
+	PLL_CON0_MUX_CLK_CORE_DLP_USER,
+	DIV_CLK_CORE_PCLK,
+};
+
+PNAME(mout_clk_core_aclk_user_p) = { "fin_pll", "dout_clkcmu_core_main" };
+PNAME(mout_clk_core_dlp_user_p) = { "fin_pll", "dout_clkcmu_core_dlp" };
+
+static const struct samsung_mux_clock cmu_core_mux_clks[] __initconst = {
+	MUX(MOUT_CLK_CORE_ACLK_USER, "mout_clk_core_aclk_user",
+	    mout_clk_core_aclk_user_p, PLL_CON0_MUX_CLK_CORE_ACLK_USER, 4, 1),
+	MUX(MOUT_CLK_CORE_DLP_USER, "mout_clk_core_dlp_user",
+	    mout_clk_core_dlp_user_p, PLL_CON0_MUX_CLK_CORE_DLP_USER, 4, 1),
+};
+
+static const struct samsung_div_clock cmu_core_div_clks[] __initconst = {
+	DIV(DOUT_CLK_CORE_PCLK, "dout_clk_core_pclk",
+	    "mout_clk_core_aclk_user", DIV_CLK_CORE_PCLK, 0, 4),
+};
+
+static const struct samsung_cmu_info cmu_core_info __initconst = {
+	.mux_clks		= cmu_core_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_core_mux_clks),
+	.div_clks		= cmu_core_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_core_div_clks),
+	.nr_clk_ids		= CMU_CORE_NR_CLK,
+	.clk_regs		= cmu_core_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_core_clk_regs),
+};
+
+static void __init artpec8_clk_cmu_core_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &cmu_core_info);
+}
+
+CLK_OF_DECLARE(artpec8_clk_cmu_core, "axis,artpec8-cmu-core",
+	       artpec8_clk_cmu_core_init);
+
 /* Register Offset definitions for CMU_IMEM (0x10010000) */
 #define PLL_CON0_MUX_CLK_IMEM_ACLK_USER			0x0100
 #define PLL_CON0_MUX_CLK_IMEM_JPEG_USER			0x0120
-- 
2.34.1


