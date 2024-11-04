Return-Path: <linux-gpio+bounces-12538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E433C9BBACD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A25F8282BDC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEBA1C9B62;
	Mon,  4 Nov 2024 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyFSpCcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EDB1C4A35;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=STYr5Tgett9aNixDShAetw1bqE/1GxYvp+YxRql0al9glqXEDBaCk6DkfXUxu+gIYnnR3tFlJdUdJ6iuvuXtiMabgQL1wx5Y40nxuD/tF50bchEtzZfbHQUZlWfqYyYSAslqE4tJacComvSxKvk1+txxiOFF2GPwYaYa9jS32Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=peTA0PscjSJ4J07vcy7yP6ASB12E2sO+b5nvvBhSJ9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEdmP2ySgVp7XS80SWO2InOCShRaWKL+kedWosT4uCHamG7SWAOCKWKs+dIhibVadBtpBfsAO/dzfj0EKldJQT5g28uagi1acXKjn2Vo/WUfpE8LuaYh/vxSolZSAYwYQAyQa46/nO5KAGtJ7wVtSwrX12ziiJ8N04eZnRnP7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyFSpCcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5066EC4CEE7;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=peTA0PscjSJ4J07vcy7yP6ASB12E2sO+b5nvvBhSJ9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oyFSpCcOqz8ExdF2IomziQZXa+luvCwllnje7ZMMciSpnF0p+HjUKNBYNKg+GRH+s
	 yaMjP695eZYsh3y/DDVxkLwJ/5pVw8BOlk/cbot0DWedQbqSen4KOOHGkkR3DVdief
	 8u/2g/fGhsBYp9OWyICpgs26+QWTXd34aWstm/99AE0AZlM5nQ47R/TWNb0YvXuT2C
	 LoODehKPLi7N/4j0DCZtwOXbBxP144NVwPHFB+ITR1D7dKwubKuvL4DGDU9025JmVN
	 56OoB5iSK4TgMR8hdBBOK5i3LAH2bJScDfXujRw8s/WV9IGAbgS1RFcIx+ZiOE5K3y
	 RgOp2zKubxGNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46291D1BDC7;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:10 +0100
Subject: [PATCH RESEND v13 08/12] clk: mmp: Add Marvell PXA1908 MPMU driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-8-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5045;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=JnTtD2V8ufw9m4R9VdL419Kxy07NUBByxCVJFps4Bk8=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0PXJW21MNW6tbNurnRIzPe+VXflpYUbLaxtW2Q1V
 h/MFPDoKGVhEONikBVTZMn973iN97PI1u3Zywxg5rAygQxh4OIUgIkcvs7I8GrRND6BQ0HL1vO8
 EXjxZXuVVceByLuJuazK4ULT79w7/oThf2j/nXPbt1zYfunD0a3Snqt2P7ufGf153vdzBx5nF1z
 v/sgNAA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add driver for the MPMU controller block on Marvell's PXA1908 SoC. The
driver is incomplete, currently only supporting the fixed PLL1; dynamic
PLLs 2-4 and CPU/DDR/AXI clock support is missing.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/clk/mmp/Makefile           |   2 +-
 drivers/clk/mmp/clk-pxa1908-mpmu.c | 112 +++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index a8b1a4b08824bc0ee7e6541a670808f31bf40240..062cd87fa8ddcc6808b6236f8c4dd524aaf02030 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o clk-pxa1908-apmu.o
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o clk-pxa1908-apmu.o clk-pxa1908-mpmu.o
diff --git a/drivers/clk/mmp/clk-pxa1908-mpmu.c b/drivers/clk/mmp/clk-pxa1908-mpmu.c
new file mode 100644
index 0000000000000000000000000000000000000000..e3337bacaadd5ad49b1258ba38632c7e5f103d93
--- /dev/null
+++ b/drivers/clk/mmp/clk-pxa1908-mpmu.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/units.h>
+
+#include <dt-bindings/clock/marvell,pxa1908.h>
+
+#include "clk.h"
+
+#define MPMU_UART_PLL		0x14
+
+#define MPMU_NR_CLKS		39
+
+struct pxa1908_clk_unit {
+	struct mmp_clk_unit unit;
+	void __iomem *base;
+};
+
+static struct mmp_param_fixed_rate_clk fixed_rate_clks[] = {
+	{PXA1908_CLK_CLK32, "clk32", NULL, 0, 32768},
+	{PXA1908_CLK_VCTCXO, "vctcxo", NULL, 0, 26 * HZ_PER_MHZ},
+	{PXA1908_CLK_PLL1_624, "pll1_624", NULL, 0, 624 * HZ_PER_MHZ},
+	{PXA1908_CLK_PLL1_416, "pll1_416", NULL, 0, 416 * HZ_PER_MHZ},
+	{PXA1908_CLK_PLL1_499, "pll1_499", NULL, 0, 499 * HZ_PER_MHZ},
+	{PXA1908_CLK_PLL1_832, "pll1_832", NULL, 0, 832 * HZ_PER_MHZ},
+	{PXA1908_CLK_PLL1_1248, "pll1_1248", NULL, 0, 1248 * HZ_PER_MHZ},
+};
+
+static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
+	{PXA1908_CLK_PLL1_D2, "pll1_d2", "pll1_624", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D4, "pll1_d4", "pll1_d2", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D6, "pll1_d6", "pll1_d2", 1, 3, 0},
+	{PXA1908_CLK_PLL1_D8, "pll1_d8", "pll1_d4", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D12, "pll1_d12", "pll1_d6", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D13, "pll1_d13", "pll1_624", 1, 13, 0},
+	{PXA1908_CLK_PLL1_D16, "pll1_d16", "pll1_d8", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D24, "pll1_d24", "pll1_d12", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D48, "pll1_d48", "pll1_d24", 1, 2, 0},
+	{PXA1908_CLK_PLL1_D96, "pll1_d96", "pll1_d48", 1, 2, 0},
+	{PXA1908_CLK_PLL1_32, "pll1_32", "pll1_d13", 2, 3, 0},
+	{PXA1908_CLK_PLL1_208, "pll1_208", "pll1_d2", 2, 3, 0},
+	{PXA1908_CLK_PLL1_117, "pll1_117", "pll1_624", 3, 16, 0},
+};
+
+static struct u32_fract uart_factor_tbl[] = {
+	{.numerator = 8125, .denominator = 1536},	/* 14.745MHz */
+};
+
+static struct mmp_clk_factor_masks uart_factor_masks = {
+	.factor = 2,
+	.num_mask = GENMASK(12, 0),
+	.den_mask = GENMASK(12, 0),
+	.num_shift = 16,
+	.den_shift = 0,
+};
+
+static void pxa1908_pll_init(struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_unit *unit = &pxa_unit->unit;
+
+	mmp_register_fixed_rate_clks(unit, fixed_rate_clks,
+					ARRAY_SIZE(fixed_rate_clks));
+
+	mmp_register_fixed_factor_clks(unit, fixed_factor_clks,
+					ARRAY_SIZE(fixed_factor_clks));
+
+	mmp_clk_register_factor("uart_pll", "pll1_d4",
+			CLK_SET_RATE_PARENT,
+			pxa_unit->base + MPMU_UART_PLL,
+			&uart_factor_masks, uart_factor_tbl,
+			ARRAY_SIZE(uart_factor_tbl), NULL);
+}
+
+static int pxa1908_mpmu_probe(struct platform_device *pdev)
+{
+	struct pxa1908_clk_unit *pxa_unit;
+
+	pxa_unit = devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERNEL);
+	if (IS_ERR(pxa_unit))
+		return PTR_ERR(pxa_unit);
+
+	pxa_unit->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pxa_unit->base))
+		return PTR_ERR(pxa_unit->base);
+
+	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, MPMU_NR_CLKS);
+
+	pxa1908_pll_init(pxa_unit);
+
+	return 0;
+}
+
+static const struct of_device_id pxa1908_mpmu_match_table[] = {
+	{ .compatible = "marvell,pxa1908-mpmu" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pxa1908_mpmu_match_table);
+
+static struct platform_driver pxa1908_mpmu_driver = {
+	.probe = pxa1908_mpmu_probe,
+	.driver = {
+		.name = "pxa1908-mpmu",
+		.of_match_table = pxa1908_mpmu_match_table
+	}
+};
+module_platform_driver(pxa1908_mpmu_driver);
+
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Marvell PXA1908 MPMU Clock Driver");
+MODULE_LICENSE("GPL");

-- 
2.47.0



