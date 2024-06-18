Return-Path: <linux-gpio+bounces-7534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B824D90CB39
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138BB2891A3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1318413DDDA;
	Tue, 18 Jun 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC43U3Cu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB03E13C661;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712556; cv=none; b=pELPbQkAhdYZPGE6PdkLcIBeFPhSklMYjMY9TRocmcYAG9pQwgOqK2H3zZBPtzazTKUS8pvFfAGewVow2HNym0KhJfAfdY0Hse2Kto8DLyk7MbFy/J9Ev6aKgS9QAd6zGccbY9K91cH31NeAr/F4iNIJcs1v8vaHrN6E+qB1h48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712556; c=relaxed/simple;
	bh=6eHddPVGPNGu45tjA8N1T/anIVe7WOGhBOGi7XxkJdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvZlV/hJ/hJm2bxJuyIQ1ViNaHp0AcSXM6eb7+xU4krgCkkkSsPAvf/nUHU67cE+S9KOxQDncJyvGECu/zEVxXfyWLiAVuVtxu3QzKDl/g+oVjVpJXXQWxUEFMSMawLutqEDiLbhTcwgEtz4a0UJL8VyLjvZCPVEVAwWYDicGn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC43U3Cu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 627E9C4DDF5;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=6eHddPVGPNGu45tjA8N1T/anIVe7WOGhBOGi7XxkJdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cC43U3CuQXq8V2F1NSmN8rubVSAGKnjVcsh526T5mTvcENOME+2NZjyW3wfn2ogZX
	 ap8m0T1d6ld+Y5ao7rVKIxz+Jyci+MdLxvEh9ZQOh+hBcKULCvvHKWmivuDJQ+JWkc
	 gCK7SJxkxsmt1XxVisLffvG4xnBk0EYrUmbu8DsIelaNKCaQLUOersvP9m89nsO+FM
	 f+EBOHmPpzTniNj64WG6XCx40f9Lx/akby5BMXIpEVhMGXcPVg0nu8DT7eitzA7BRy
	 nUXxKVr3QK7F/lSjZN3mACaz4GF/+ykK8laeSWY0siV7Yj7+6bgW3a5Hpb2HEnpSF+
	 DWDr8CsX/pntw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BFDC2BA1A;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:17 +0200
Subject: [PATCH RESEND v10 06/12] clk: mmp: Add Marvell PXA1908 APBCP
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-6-754e5ece9078@skole.hr>
References: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
In-Reply-To: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Rob Herring <robh@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3684;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=USsJLoGDJXHCWdJAW+Lle+IllTO8RpuR/kOtJOEgQTM=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjSzjdqPrk5439ujl37FnaOZCH/H4FxOSGuV
 7KtJlxxbWGJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40gAKCRCaEZ6wQi2W
 4ZR9D/0abX3/veVQFsJm4Y8Z43Zyb6M+Jh7Qn+CmNgrYQmUACzFHDxHJGw75/yY9DDLNZE5zUBB
 b52erwMRTeDDLLDJwYfehJIgWDwgbCvEH2e9AgQfOD+jNwImTcMtnaJRMihx4S0ZMQ87A3Ywhg5
 /G8H5q0eMHxGs3+H9MMxF4Rpg+Gy9xS1eWFqv8egN8bsNXr6wxXkiKqgjfW0yEHI24zgoJ+g65q
 +VXlZHbsOOvOg8Fvje31nP+4+UgdYwcPAERqwuDq52+sQkugFoG5GDuBJZOiHcNKt0Ab6D4SBq9
 Cte7vaW0ju5/rYo8jojgIJa7YUZbFb0W0Zsy/5aFvWT1xcFnqUK+vPpoB0rd34d1uTsbYT+HvCD
 T4wceQmDxLJ8cH7DVqD8jwkRVQJpu28hb/MMuECzXBI+m50VD/sUF/Ugse/ltv0YV6yKlKEOwbA
 gUmym54Qxhcu3KUQ+ZBSwAHIRY7sI2U77nKbdeuwlpnRRPll57eaWvKOyfjEHsDEM1hqS3/xsX4
 P1+Rl/yfweqhVrRx1Wt1P/fsigVJ87nKYKaldlsvJnINfbgl7ubkwm1NW/PjsPayT7CS1ifMbaZ
 fKk8rzPgzaPZVAdqQxmoFZZ3lqQ1ygklVMUQs0xck4IQSc8F4CWJ8R/2gRDF/3OL6ipU/nCoI08
 qskazq/HwR7lsSA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add driver for the APBCP controller block found on Marvell's PXA1908
SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/clk/mmp/Makefile            |  2 +-
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 84 +++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index 685bb80f8ae1..038bcd4d035e 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1908-apbcp.o
diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
new file mode 100644
index 000000000000..2a53cf276407
--- /dev/null
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/units.h>
+
+#include <dt-bindings/clock/marvell,pxa1908.h>
+
+#include "clk.h"
+
+#define APBCP_UART2		0x1c
+#define APBCP_TWSI2		0x28
+#define APBCP_AICER		0x38
+
+#define APBCP_NR_CLKS		4
+
+struct pxa1908_clk_unit {
+	struct mmp_clk_unit unit;
+	void __iomem *base;
+};
+
+static DEFINE_SPINLOCK(uart2_lock);
+
+static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
+
+static struct mmp_param_gate_clk apbcp_gate_clks[] = {
+	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x7, 0x3, 0x0, 0, &uart2_lock},
+	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x7, 0x3, 0x0, 0, NULL},
+	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x7, 0x2, 0x0, 0, NULL},
+};
+
+static struct mmp_param_mux_clk apbcp_mux_clks[] = {
+	{0, "uart2_mux", uart_parent_names, ARRAY_SIZE(uart_parent_names), CLK_SET_RATE_PARENT, APBCP_UART2, 4, 3, 0, &uart2_lock},
+};
+
+static void pxa1908_apb_p_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_unit *unit = &pxa_unit->unit;
+
+	mmp_register_mux_clks(unit, apbcp_mux_clks, pxa_unit->base,
+			ARRAY_SIZE(apbcp_mux_clks));
+	mmp_register_gate_clks(unit, apbcp_gate_clks, pxa_unit->base,
+			ARRAY_SIZE(apbcp_gate_clks));
+}
+
+static int pxa1908_apbcp_probe(struct platform_device *pdev)
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
+	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APBCP_NR_CLKS);
+
+	pxa1908_apb_p_periph_clk_init(pxa_unit);
+
+	return 0;
+}
+
+static const struct of_device_id pxa1908_apbcp_match_table[] = {
+	{ .compatible = "marvell,pxa1908-apbcp" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pxa1908_apbcp_match_table);
+
+static struct platform_driver pxa1908_apbcp_driver = {
+	.probe = pxa1908_apbcp_probe,
+	.driver = {
+		.name = "pxa1908-apbcp",
+		.of_match_table = pxa1908_apbcp_match_table
+	}
+};
+module_platform_driver(pxa1908_apbcp_driver);
+
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Marvell PXA1908 APBCP Clock Driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2



