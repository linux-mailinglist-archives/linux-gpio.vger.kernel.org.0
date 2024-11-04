Return-Path: <linux-gpio+bounces-12534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C179BBAC1
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCCA1F22516
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85C11C6F66;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNiyWbWg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF51C32EC;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=jrUg44wWIiGoHcwUVnx6+x0eiMSlSjHmOYel5epZYymXgRcFOvGAFSyPeJBJSOJAofdqE/MmNIhiazRehvxl+NsYttlvkPIE5fJCSjL13ylVex6wTCKEXFo1E0+rd/aYex3zNF0dHQxqU/WcO5l83vI/cqyRQX/TyEcGKvXjb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=OVdxlEusBayaZnA8e1V0NB4Les3M/39auOm7/XojuJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qd2H7W1k1IiYVIZ9xMZ5JO9Fl+VJ1bfa4tkBILBuw2zVlUS8XlQr3rn9dczQy2QGTX7UDhtyODvDiGEzyiS6qz0UsfxeOsYXdiQ7Rt2gL6A4GszJ5HTw/EOuMxKFu3idKIPcKTdVbukjgG3q1Ky48v/eQOPgCFoL7IEgpIKQ4A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNiyWbWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20FE1C4CEE0;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=OVdxlEusBayaZnA8e1V0NB4Les3M/39auOm7/XojuJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gNiyWbWgPjsFr4lJkpI5vLJyriTjOOau7iRV5TsXWb1KtzATtMXmK5514zeeeEGYy
	 gXSOAAiooikv90zie9m41EznqgvMW3KuLpQtYDjXpJqUiTvn9MLuVKXxNX7uJqqsN1
	 exg8YS9sjR04Ks0up02BahvaSB+JXvVQ1bsprrXI8myOpMKxQDw1OlVv2s8w1pTTxY
	 stizL0rWhBs7lzoo1zjdFGJzF6mzmVm7PId3oiEhHt4NN0XB7UC0epNCWiRVYEmNiO
	 /XTEIhlLpeAM8CRl7qYQtpjM93MWOE3fSZt95zzXiaH6uXomTkl5XrvV7E+o7e9X73
	 kzSsDs5+2FJpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15296D1BDCB;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:07 +0100
Subject: [PATCH RESEND v13 05/12] clk: mmp: Add Marvell PXA1908 APBC driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-5-e050609b8d6c@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6363;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=esvlB0Bzh7IvkoxWQuAbs5uVRVzSFGp5CGW6Y/XKvP8=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0OvLUjRyn2aG3RnYldO6s5X/VXWVe81PwQlfX/hE
 LT7TXhBRykLgxgXg6yYIkvuf8drvJ9Ftm7PXmYAM4eVCWQIAxenAEzkWTXDf6f5V44Lh6kozT73
 9fCnGbXOe3u6tb+uZLMIFanN7z8p9Jnhv9/VGk195uv3j7zcp/tC9vX6u6etvLtCbwWxLTN//+T
 YXB4A
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add driver for the APBC controller block found on Marvell's PXA1908 SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/clk/mmp/Makefile           |   2 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c | 130 +++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
index 441bf83080a12b89dd8afca11236ba2a2199795e..685bb80f8ae1f16d967dc4f6f5a6ce4e3f52d2bd 100644
--- a/drivers/clk/mmp/Makefile
+++ b/drivers/clk/mmp/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_MACH_MMP_DT) += clk-of-pxa168.o clk-of-pxa910.o
 obj-$(CONFIG_COMMON_CLK_MMP2) += clk-of-mmp2.o clk-pll.o pwr-island.o
 obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) += clk-audio.o
 
-obj-y += clk-of-pxa1928.o
+obj-$(CONFIG_ARCH_MMP) += clk-of-pxa1928.o clk-pxa1908-apbc.o
diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
new file mode 100644
index 0000000000000000000000000000000000000000..b93d08466198569a975f580a1a3c27aae2b838c2
--- /dev/null
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -0,0 +1,130 @@
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
2.47.0



