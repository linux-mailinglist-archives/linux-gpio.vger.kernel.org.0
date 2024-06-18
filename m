Return-Path: <linux-gpio+bounces-7536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA990CB9D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1775EB270FA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C9E13E04F;
	Tue, 18 Jun 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrzWqdbb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84213C667;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712556; cv=none; b=G8VuR/4P3PLNCkAxwNWYVsR+riiFIpwrvlko5TP4+yIp6xVb0jipYhBCxdzn06Nl6e84cuzMqy5NcLRkxAWegD/8+MNCHS5Mt1JCTugmrYlh4FB8KgIGyjqOcxLBhT+RWsQgCU4yJ6oFz9MrVrnY+JiNX/eA+7UJnT4tkltBQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712556; c=relaxed/simple;
	bh=AEWNeN+JICR4EcZxZthCK+HHrZK9kPhdty3g+UJ4U+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REt64IqsbE0vGHFqX3ceG7MAvy3FhPT6XS5X/fpLZBa0Lon/Yqcjy2yRo/3f82Myu1ujy9/9RqedynGcjaz1hRgnLuEjxCOhjbUSAxsHY6eH81hqXo5Kiu4FfQhMK9aVLMJp5RKfMbJB5hOMi+DkxrXMz6lwF4oXVA+AGjwJUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrzWqdbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44567C4AF48;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=AEWNeN+JICR4EcZxZthCK+HHrZK9kPhdty3g+UJ4U+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SrzWqdbbXquPYyhhffltbMAZCksFRQGwoTkMpBcn7tdBAb39iJXlG2dkwAd/SZZrP
	 oksciw/jbafS3HBrt7WRrSdZcb2yKGiKRp35vfloqkabenhomn1EydAopOUMz/m0xX
	 WqQFLRXyMfRztHpua1jBYZsJ36MgIFzvsLDTOZJE+efKxW9rRf7ME/iObHJP9FvJH3
	 Ca574yJLP5xTsZZmJsl8yNGCwiiTpOpX4HMp9SG8IuoIsJqsZS68jw8wfgv+aaMANL
	 83ug1eKWggxXR7GFylXt7yZ1U7C9wWNKeQn6GMgQBuveoaGOoGPJq+ibCL6aXr/4Up
	 mECnwmPv35QPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD38C27C4F;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:16 +0200
Subject: [PATCH RESEND v10 05/12] clk: mmp: Add Marvell PXA1908 APBC driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-5-754e5ece9078@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6279;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=LjTRA+snmoaVUrrzBhCFmFBGgt+UrcvoIXtSXsRi8aE=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjR5rmciXps2m/nnHKO8pjAa0izLTEA7DKDG
 Em/J2pNQ3mJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40QAKCRCaEZ6wQi2W
 4eUxEACYWS3JDbJxpq1WGeFf3e/Kw0N9eP0L40wafS0URSgOE3y6ae443Unz2f9lQqGlIv56nzc
 141FRv3Y4PTiRCmlCMS4wnz5XH1HPG7mA9my5zh0aAdycPQk6bdsCk96Wlm6zBsFwqBmuXRosrG
 R/sZk9ftrXxWFOnHjDfi5pwQwRmp07gJJj0ws5f6/tQZHMwIarCTo3ll+aPSbc6IuW1Y3flwanU
 HJue1ZeLYnnzU7Fvy2aNjsXFFknQvvLFo72xbZCE2v8S2MTgO7EubwFRD+BDSPRv98dLW6v1pgw
 Zt//EZmSGlEC+7sAXvWeDEfEG7d1ywIaBUqCrS3ekGeEVpYq5zH6RgJthxfQmNWv9GVGtI3TTdI
 j2Rhb4sZwYhyNdrB5rH7QMeCtgY1ETaWLI0Fr6cy988XckiytFGphCiv/MKsXas0TnYh/FXrZul
 rV9yPvOHUnXJnBZm70Xjoy26I7WN33RVA+1d2VaNvqTvTwK50pTt3r+sT7Rt5cDqOdE9oLjrwhc
 Kq2hkRTJQwyaJ+j36IAbCu6FSw1p32O8QlvrktjrB80GwF/HUylI4fjf5ckzi7KQ9pdDwiTFQYW
 YZcI/38H8BWqEIC8mZqvaopiJmcsC5gmuxfqAxOZ9aCd/Rz8aaX/GvSo0ARKQrWc041oU9ers7I
 xqXZDAMcbYnY3eQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add driver for the APBC controller block found on Marvell's PXA1908 SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/clk/mmp/Makefile           |   2 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c | 131 +++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index 441bf83080a1..685bb80f8ae1 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-y += clk-of-pxa1928.o
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o
diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
new file mode 100644
index 000000000000..a418b9f895c1
--- /dev/null
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/marvell,pxa1908.h>
+
+#include "clk.h"
+
+#define APBC_UART0		0x0
+#define APBC_UART1		0x4
+#define APBC_GPIO		0x8
+#define APBC_PWM0		0xc
+#define APBC_PWM1		0x10
+#define APBC_PWM2		0x14
+#define APBC_PWM3		0x18
+#define APBC_SSP0		0x1c
+#define APBC_SSP1		0x20
+#define APBC_IPC_RST		0x24
+#define APBC_RTC		0x28
+#define APBC_TWSI0		0x2c
+#define APBC_KPC		0x30
+#define APBC_SWJTAG		0x40
+#define APBC_SSP2		0x4c
+#define APBC_TWSI1		0x60
+#define APBC_THERMAL		0x6c
+#define APBC_TWSI3		0x70
+
+#define APBC_NR_CLKS		19
+
+struct pxa1908_clk_unit {
+	struct mmp_clk_unit unit;
+	void __iomem *base;
+};
+
+static DEFINE_SPINLOCK(pwm0_lock);
+static DEFINE_SPINLOCK(pwm2_lock);
+
+static DEFINE_SPINLOCK(uart0_lock);
+static DEFINE_SPINLOCK(uart1_lock);
+
+static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
+static const char * const ssp_parent_names[] = {"pll1_d16", "pll1_d48", "pll1_d24", "pll1_d12"};
+
+static struct mmp_param_gate_clk apbc_gate_clks[] = {
+	{PXA1908_CLK_TWSI0, "twsi0_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_TWSI1, "twsi1_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_TWSI3, "twsi3_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI3, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_KPC, "kpc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_KPC, 0x7, 3, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x87, 0x83, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_PWM0, "pwm0_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM0, 0x2, 2, 0, 0, &pwm0_lock},
+	{PXA1908_CLK_PWM1, "pwm1_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM1, 0x6, 2, 0, 0, NULL},
+	{PXA1908_CLK_PWM2, "pwm2_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM2, 0x2, 2, 0, 0, NULL},
+	{PXA1908_CLK_PWM3, "pwm3_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM3, 0x6, 2, 0, 0, NULL},
+	{PXA1908_CLK_UART0, "uart0_clk", "uart0_mux", CLK_SET_RATE_PARENT, APBC_UART0, 0x7, 3, 0, 0, &uart0_lock},
+	{PXA1908_CLK_UART1, "uart1_clk", "uart1_mux", CLK_SET_RATE_PARENT, APBC_UART1, 0x7, 3, 0, 0, &uart1_lock},
+	{PXA1908_CLK_THERMAL, "thermal_clk", NULL, 0, APBC_THERMAL, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_IPC_RST, "ipc_clk", NULL, 0, APBC_IPC_RST, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_SSP0, "ssp0_clk", "ssp0_mux", 0, APBC_SSP0, 0x7, 3, 0, 0, NULL},
+	{PXA1908_CLK_SSP2, "ssp2_clk", "ssp2_mux", 0, APBC_SSP2, 0x7, 3, 0, 0, NULL},
+};
+
+static struct mmp_param_mux_clk apbc_mux_clks[] = {
+	{0, "uart0_mux", uart_parent_names, ARRAY_SIZE(uart_parent_names), CLK_SET_RATE_PARENT, APBC_UART0, 4, 3, 0, &uart0_lock},
+	{0, "uart1_mux", uart_parent_names, ARRAY_SIZE(uart_parent_names), CLK_SET_RATE_PARENT, APBC_UART1, 4, 3, 0, &uart1_lock},
+	{0, "ssp0_mux", ssp_parent_names, ARRAY_SIZE(ssp_parent_names), 0, APBC_SSP0, 4, 3, 0, NULL},
+	{0, "ssp2_mux", ssp_parent_names, ARRAY_SIZE(ssp_parent_names), 0, APBC_SSP2, 4, 3, 0, NULL},
+};
+
+static void pxa1908_apb_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_unit *unit = &pxa_unit->unit;
+	struct clk *clk;
+
+	mmp_clk_register_gate(NULL, "pwm01_apb_share", "pll1_d48",
+			CLK_SET_RATE_PARENT,
+			pxa_unit->base + APBC_PWM0,
+			0x5, 1, 0, 0, &pwm0_lock);
+	mmp_clk_register_gate(NULL, "pwm23_apb_share", "pll1_d48",
+			CLK_SET_RATE_PARENT,
+			pxa_unit->base + APBC_PWM2,
+			0x5, 1, 0, 0, &pwm2_lock);
+	clk = mmp_clk_register_apbc("swjtag", NULL,
+			pxa_unit->base + APBC_SWJTAG, 10, 0, NULL);
+	mmp_clk_add(unit, PXA1908_CLK_SWJTAG, clk);
+	mmp_register_mux_clks(unit, apbc_mux_clks, pxa_unit->base,
+			ARRAY_SIZE(apbc_mux_clks));
+	mmp_register_gate_clks(unit, apbc_gate_clks, pxa_unit->base,
+			ARRAY_SIZE(apbc_gate_clks));
+}
+
+static int pxa1908_apbc_probe(struct platform_device *pdev)
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
+	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APBC_NR_CLKS);
+
+	pxa1908_apb_periph_clk_init(pxa_unit);
+
+	return 0;
+}
+
+static const struct of_device_id pxa1908_apbc_match_table[] = {
+	{ .compatible = "marvell,pxa1908-apbc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pxa1908_apbc_match_table);
+
+static struct platform_driver pxa1908_apbc_driver = {
+	.probe = pxa1908_apbc_probe,
+	.driver = {
+		.name = "pxa1908-apbc",
+		.of_match_table = pxa1908_apbc_match_table
+	}
+};
+module_platform_driver(pxa1908_apbc_driver);
+
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Marvell PXA1908 APBC Clock Driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2



