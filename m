Return-Path: <linux-gpio+bounces-29704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71986CC7F07
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 14:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB840312D164
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 13:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB20535A92C;
	Wed, 17 Dec 2025 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BrkoqiPX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FA358D1C;
	Wed, 17 Dec 2025 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978593; cv=none; b=B7KPeNu6rDCF68FeVsHhNOzDXNOsYnxmkpU8mhhW6xnbys/0BsTo3SX8iAtfn9nlrAGVMifgNIb9Jp07L5JcP7V+QW0Y1hfHtvnL7bCZW+gqJaKLeqsnmmkolAjidTVefHgmeUyCk82A07/HWxiHx35e2Qg9ZQ7DtcxQfmR5GzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978593; c=relaxed/simple;
	bh=YU5RxSuW2iVVmscLFcURiLvqEZkv94yIjNlMYYev82M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZQm4yETRlKIUcCH8ZKK6OurYJIhXBDsZpS3X4wtOY8OnMy7KimQdWQt9exEMLvtgiofkL1kk5k/TB6z9xWgD3WfCufndk9xSSTay6WEjtHvtp5hu3tZl8WC06kD06EV2ayghL9HCboSI74722KQ5AqyibvtQYmuU5Z9X79FqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BrkoqiPX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C6151A2285;
	Wed, 17 Dec 2025 13:36:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12ABC6072F;
	Wed, 17 Dec 2025 13:36:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6824102F0ACB;
	Wed, 17 Dec 2025 14:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EH8rYAmhJ47awiMD1tWjLL/LEcg7N7ZexU7I3RgfR78=;
	b=BrkoqiPXE4tRE6eH73YWwa4nYvawp8xyWUaXzHSGWf2jriS/3ekWGatgJw9LPMig48qE7C
	e944/Azx5LzebJo2QXa47DdVhzYXOAaJT+SEbwx/DM9grNjKff3aWrBpUxR9aKYy7SZExG
	7AU+rXfqhSFC/OykLIQF39BQgD9yY4s8RUL57I0qbGxhEmkAmHbkwKxgiBAcI64P4MALio
	+7bWWOoREhBj8LQdkp/4MqhWtTxQsqxxDxRbKXwmDKxLpnc+NVlGxtQgTygTtjl/qyANyH
	5YUGxD5fzTGFzLWRhnw5Uw/pN0K0Wtf/5RnBJIhlUIo+sAJJN1sepFn7svoa5w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:35:59 +0100
Subject: [PATCH 09/13] clk: eyeq: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-9-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Declare the PLLs and fixed factors found in the EyeQ6Lplus OLB as part
of the match data for the "mobileye,eyeq6lplus-olb" compatible.

The PLL and fixed factor of the CPU are registered in early init as they
are required during the boot by the GIC timer.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/Kconfig    |  4 +--
 drivers/clk/clk-eyeq.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3a1611008e48..418c8f526279 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -236,9 +236,9 @@ config COMMON_CLK_EP93XX
 
 config COMMON_CLK_EYEQ
 	bool "Clock driver for the Mobileye EyeQ platform"
-	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
+	depends on MACH_EYEQ5 || MACH_EYEQ6H || MACH_EYEQ6LPLUS || COMPILE_TEST
 	select AUXILIARY_BUS
-	default MACH_EYEQ5 || MACH_EYEQ6H
+	default MACH_EYEQ5 || MACH_EYEQ6H || MACH_EYEQ6LPLUS
 	help
 	  This driver provides clocks found on Mobileye EyeQ5, EyeQ6L and Eye6H
 	  SoCs. Controllers live in shared register regions called OLB. Driver
diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 8fb32f365f3d..239ddcb59383 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -45,6 +45,7 @@
 #include <linux/types.h>
 
 #include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+#include <dt-bindings/clock/mobileye,eyeq6lplus-clk.h>
 
 /* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
 #define PCSR0_DAC_EN			BIT(0)
@@ -571,6 +572,68 @@ static const struct eqc_match_data eqc_eyeq6l_match_data = {
 	.reset_auxdev_name = "reset",
 };
 
+static const struct eqc_pll eqc_eyeq6lplus_early_plls[] = {
+	{ .index = EQ6LPC_PLL_CPU, .name = "pll-cpu", .reg64 = 0x058 },
+};
+
+static const struct eqc_pll eqc_eyeq6lplus_plls[] = {
+	{ .index = EQ6LPC_PLL_DDR, .name = "pll-ddr", .reg64 = 0x02C },
+	{ .index = EQ6LPC_PLL_ACC, .name = "pll-acc", .reg64 = 0x034 },
+	{ .index = EQ6LPC_PLL_PER, .name = "pll-per", .reg64 = 0x03C },
+	{ .index = EQ6LPC_PLL_VDI, .name = "pll-vdi", .reg64 = 0x044 },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq6lplus_early_fixed_factors[] = {
+	{ EQ6LPC_CPU_OCC,	"occ-cpu",	1, 1,	EQ6LPC_PLL_CPU },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq6lplus_fixed_factors[] = {
+	{ EQ6LPC_DDR_OCC,	"occ-ddr",	1, 1,	EQ6LPC_PLL_DDR },
+
+	{ EQ6LPC_ACC_VDI,	"vdi-div",	1, 10,	EQ6LPC_PLL_ACC },
+	{ EQ6LPC_ACC_OCC,	"occ-acc",	1, 1,	EQ6LPC_PLL_ACC },
+	{ EQ6LPC_ACC_FCMU,	"fcmu-a-clk",	1, 10,	EQ6LPC_ACC_OCC },
+
+	{ EQ6LPC_PER_OCC,	"occ-per",	1, 1,	EQ6LPC_PLL_PER },
+	{ EQ6LPC_PER_I2C_SER,	"i2c-ser-clk",	1, 10,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_PCLK,	"pclk",		1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_TSU,	"tsu-clk",	1, 8,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_OSPI,	"ospi-ref-clk",	1, 10,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_GPIO,	"gpio-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_TIMER,	"timer-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_I2C,	"i2c-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_UART,	"uart-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_SPI,	"spi-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_PERIPH,	"periph-clk",	1, 1,	EQ6LPC_PER_OCC },
+
+	{ EQ6LPC_VDI_OCC,	"occ-vdi",	1, 1,	EQ6LPC_PLL_VDI },
+};
+
+static const struct eqc_early_match_data eqc_eyeq6lplus_early_match_data __initconst = {
+	.early_pll_count        = ARRAY_SIZE(eqc_eyeq6lplus_early_plls),
+	.early_plls             = eqc_eyeq6lplus_early_plls,
+
+	.early_fixed_factor_count       = ARRAY_SIZE(eqc_eyeq6lplus_early_fixed_factors),
+	.early_fixed_factors            = eqc_eyeq6lplus_early_fixed_factors,
+
+	.late_clk_count         = ARRAY_SIZE(eqc_eyeq6lplus_plls) +
+	ARRAY_SIZE(eqc_eyeq6lplus_fixed_factors),
+};
+
+static const struct eqc_match_data eqc_eyeq6lplus_match_data = {
+	.pll_count      = ARRAY_SIZE(eqc_eyeq6lplus_plls),
+	.plls           = eqc_eyeq6lplus_plls,
+
+	.fixed_factor_count     = ARRAY_SIZE(eqc_eyeq6lplus_fixed_factors),
+	.fixed_factors          = eqc_eyeq6lplus_fixed_factors,
+
+	.reset_auxdev_name = "reset",
+	.pinctrl_auxdev_name = "pinctrl",
+
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq6lplus_early_plls) +
+	ARRAY_SIZE(eqc_eyeq6lplus_early_fixed_factors),
+};
+
 static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
 	.reset_auxdev_name = "reset_west",
 };
@@ -672,6 +735,7 @@ static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
 static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
+	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
 	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },
@@ -855,3 +919,9 @@ static void __init eqc_eyeq6h_west_early_init(struct device_node *np)
 }
 CLK_OF_DECLARE_DRIVER(eqc_eyeq6h_west, "mobileye,eyeq6h-west-olb",
 		      eqc_eyeq6h_west_early_init);
+
+static void __init eqc_eyeq6lplus_early_init(struct device_node *np)
+{
+	eqc_early_init(np, &eqc_eyeq6lplus_early_match_data);
+}
+CLK_OF_DECLARE_DRIVER(eqc_eyeq6lplus, "mobileye,eyeq6lplus-olb", eqc_eyeq6lplus_early_init);

-- 
2.52.0


