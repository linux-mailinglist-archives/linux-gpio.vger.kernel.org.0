Return-Path: <linux-gpio+bounces-9102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B725E95D835
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 22:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2388DB20D7E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 20:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C981C8FB9;
	Fri, 23 Aug 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCTApoP/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185961C86E2;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446540; cv=none; b=qEFFpexN6mYdAHzZPToIY/03tQjS+/IQPzUIngi9SYmFP4Aw7i+/dhGwKRk5JwoNx0xb2qdFcxpvD6fWgtf3PJUc/64hpST+4EyCgTB2h7N4hdWgM5MPXByrxyYns4m+OArLjsgWqnoOXxYBnTnzloOzVgcpYgqFGt1F+eFFM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446540; c=relaxed/simple;
	bh=3VLoOfeK4SmzwJCGe8jUQoPK74iqKqEtZ1zhNESSsZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XayMRPbbt5AEfEH+q6GqT1/NH9p4M9Y2cyYLZ61RDmw4GjdE+o0SZH0Agh+/Fd3e54GXs2uNY9KGvWd00VTAdhax+AQBNu+9uK4jsOrIpXffnnpqNZ2EiMk/SoP/VXISG8UUjs9ev3nkqWc188NX/Oek0wKM3Zw3vKgl8Z4nxjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCTApoP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 898D8C4DDE5;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724446539;
	bh=3VLoOfeK4SmzwJCGe8jUQoPK74iqKqEtZ1zhNESSsZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rCTApoP/oK18P0ULBwl7pZmPo3U/K3ZtYQcqwFXtcPrsZl8/uBWwokFHURDIF6pL+
	 JB+vLYukdk/r4P5s0zaxvYVJYaEjcii+JLZMvN5GCxe0J1WNTW3i4uXI6eGrtJwTRZ
	 F91bT4rtyVDwnHzUEl4MKHrCv9UUdguqqf/iK8/4T5BGsyPwkayYnMbZdRtV58xHAh
	 CUXce1RU6LdsTZjZuBg4gZi16ioNbgNpmo2ox+kmZNUvlsCQ3JkGGq1hngK5qDzXeO
	 PHRa5s77ifqGjT2o3vDRC0n+ndSSbNAv6rhdhY53DkR2NNlG+rQVLzqAQy8KpBEY1+
	 l/0TQt7gm5QGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F33FC5321D;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Fri, 23 Aug 2024 22:54:42 +0200
Subject: [PATCH v12 07/12] clk: mmp: Add Marvell PXA1908 APMU driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-pxa1908-lkml-v12-7-cc3ada51beb0@skole.hr>
References: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
In-Reply-To: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5599;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=etQbDEAQHjOwcM5qnhZUzNzuW/R9TppvA6ehNPnVl2s=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGknvmuuF1cTkCtqu/SGwdozQTfsbqaTwU3/Wd3K9naz9
 vh2zazsKGVhEONikBVTZMn973iN97PI1u3Zywxg5rAygQxh4OIUgIk8kWP4X2bmceri702sXN6s
 8cfcJtU9aRGdunnKoubg8oqan3ytKxkZ1miJCTT8ZYneLeC5T7L5VTWnd6+9waL6+kU5UnbVl9+
 wAQA=
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add driver for the APMU controller block found on Marvell's PXA1908 SoC.
This driver is incomplete, lacking support for (at least) GPU, VPU, DSI
and CCIC (camera related) clocks.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/clk/mmp/Makefile           |   2 +-
 drivers/clk/mmp/clk-pxa1908-apmu.c | 121 +++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index 038bcd4d035e..a8b1a4b08824 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o clk-pxa1908-apmu.o
diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa1908-apmu.c
new file mode 100644
index 000000000000..8cfb1258202f
--- /dev/null
+++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/marvell,pxa1908.h>
+
+#include "clk.h"
+
+#define APMU_CLK_GATE_CTRL	0x40
+#define APMU_CCIC1		0x24
+#define APMU_ISP		0x38
+#define APMU_DSI1		0x44
+#define APMU_DISP1		0x4c
+#define APMU_CCIC0		0x50
+#define APMU_SDH0		0x54
+#define APMU_SDH1		0x58
+#define APMU_USB		0x5c
+#define APMU_NF			0x60
+#define APMU_VPU		0xa4
+#define APMU_GC			0xcc
+#define APMU_SDH2		0xe0
+#define APMU_GC2D		0xf4
+#define APMU_TRACE		0x108
+#define APMU_DVC_DFC_DEBUG	0x140
+
+#define APMU_NR_CLKS		17
+
+struct pxa1908_clk_unit {
+	struct mmp_clk_unit unit;
+	void __iomem *base;
+};
+
+static DEFINE_SPINLOCK(pll1_lock);
+static struct mmp_param_general_gate_clk pll1_gate_clks[] = {
+	{PXA1908_CLK_PLL1_D2_GATE, "pll1_d2_gate", "pll1_d2", 0, APMU_CLK_GATE_CTRL, 29, 0, &pll1_lock},
+	{PXA1908_CLK_PLL1_416_GATE, "pll1_416_gate", "pll1_416", 0, APMU_CLK_GATE_CTRL, 27, 0, &pll1_lock},
+	{PXA1908_CLK_PLL1_624_GATE, "pll1_624_gate", "pll1_624", 0, APMU_CLK_GATE_CTRL, 26, 0, &pll1_lock},
+	{PXA1908_CLK_PLL1_832_GATE, "pll1_832_gate", "pll1_832", 0, APMU_CLK_GATE_CTRL, 30, 0, &pll1_lock},
+	{PXA1908_CLK_PLL1_1248_GATE, "pll1_1248_gate", "pll1_1248", 0, APMU_CLK_GATE_CTRL, 28, 0, &pll1_lock},
+};
+
+static DEFINE_SPINLOCK(sdh0_lock);
+static DEFINE_SPINLOCK(sdh1_lock);
+static DEFINE_SPINLOCK(sdh2_lock);
+
+static const char * const sdh_parent_names[] = {"pll1_416", "pll1_624"};
+
+static struct mmp_clk_mix_config sdh_mix_config = {
+	.reg_info = DEFINE_MIX_REG_INFO(3, 8, 2, 6, 11),
+};
+
+static struct mmp_param_gate_clk apmu_gate_clks[] = {
+	{PXA1908_CLK_USB, "usb_clk", NULL, 0, APMU_USB, 0x9, 0x9, 0x1, 0, NULL},
+	{PXA1908_CLK_SDH0, "sdh0_clk", "sdh0_mix_clk", CLK_SET_RATE_PARENT | CLK_SET_RATE_UNGATE, APMU_SDH0, 0x12, 0x12, 0x0, 0, &sdh0_lock},
+	{PXA1908_CLK_SDH1, "sdh1_clk", "sdh1_mix_clk", CLK_SET_RATE_PARENT | CLK_SET_RATE_UNGATE, APMU_SDH1, 0x12, 0x12, 0x0, 0, &sdh1_lock},
+	{PXA1908_CLK_SDH2, "sdh2_clk", "sdh2_mix_clk", CLK_SET_RATE_PARENT | CLK_SET_RATE_UNGATE, APMU_SDH2, 0x12, 0x12, 0x0, 0, &sdh2_lock}
+};
+
+static void pxa1908_axi_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_unit *unit = &pxa_unit->unit;
+
+	mmp_register_general_gate_clks(unit, pll1_gate_clks,
+			pxa_unit->base, ARRAY_SIZE(pll1_gate_clks));
+
+	sdh_mix_config.reg_info.reg_clk_ctrl = pxa_unit->base + APMU_SDH0;
+	mmp_clk_register_mix(NULL, "sdh0_mix_clk", sdh_parent_names,
+			ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT,
+			&sdh_mix_config, &sdh0_lock);
+	sdh_mix_config.reg_info.reg_clk_ctrl = pxa_unit->base + APMU_SDH1;
+	mmp_clk_register_mix(NULL, "sdh1_mix_clk", sdh_parent_names,
+			ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT,
+			&sdh_mix_config, &sdh1_lock);
+	sdh_mix_config.reg_info.reg_clk_ctrl = pxa_unit->base + APMU_SDH2;
+	mmp_clk_register_mix(NULL, "sdh2_mix_clk", sdh_parent_names,
+			ARRAY_SIZE(sdh_parent_names), CLK_SET_RATE_PARENT,
+			&sdh_mix_config, &sdh2_lock);
+
+	mmp_register_gate_clks(unit, apmu_gate_clks, pxa_unit->base,
+			ARRAY_SIZE(apmu_gate_clks));
+}
+
+static int pxa1908_apmu_probe(struct platform_device *pdev)
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
+	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
+
+	pxa1908_axi_periph_clk_init(pxa_unit);
+
+	return 0;
+}
+
+static const struct of_device_id pxa1908_apmu_match_table[] = {
+	{ .compatible = "marvell,pxa1908-apmu" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pxa1908_apmu_match_table);
+
+static struct platform_driver pxa1908_apmu_driver = {
+	.probe = pxa1908_apmu_probe,
+	.driver = {
+		.name = "pxa1908-apmu",
+		.of_match_table = pxa1908_apmu_match_table
+	}
+};
+module_platform_driver(pxa1908_apmu_driver);
+
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Marvell PXA1908 APMU Clock Driver");
+MODULE_LICENSE("GPL");

-- 
2.46.0



