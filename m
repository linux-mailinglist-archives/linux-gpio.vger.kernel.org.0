Return-Path: <linux-gpio+bounces-12799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE709C35C1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 01:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9921C21B08
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 00:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50F21482F2;
	Mon, 11 Nov 2024 00:58:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1908D140E34;
	Mon, 11 Nov 2024 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731286692; cv=none; b=mXie1BPCfHPyhmLg9wrxwJXRKKptvqzVvMYmyFhEyVsKApJHP/ADOl2mZVEEbnNnx4INK/mYcmoqWVxf/eRU5QFDXk0vHsKqJd7OVQ9vmmLLiHhbtMf+y3LH+4y26gnr8Yrk178yN6igc9qaDCQ9lJsOl8jHxjTS4Euocxgd+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731286692; c=relaxed/simple;
	bh=uXqwAiOdJ4axt6YYpd8JlG971JP67RtJk1JhEVOHpb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUUIpXDRElCF9w5FUh5HlE7UmjsabAe7gKB02DU9fe+9eJd2yJnXjus4+TflooLEyI9qOd7I6nkykmmxoPi4rgyxSFQdnZlp9EzXGWJjhkWe5i1eD01p1V62nUvj+e0TYDLbTBVeiYNYd+d1HOWEjss3i3vURExUrMx04N1DaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BF821CDD;
	Sun, 10 Nov 2024 16:58:40 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83A03F66E;
	Sun, 10 Nov 2024 16:58:08 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] pinctrl: sunxi: Add support for the Allwinner A523
Date: Mon, 11 Nov 2024 00:57:49 +0000
Message-ID: <20241111005750.13071-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111005750.13071-1-andre.przywara@arm.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 contains pins in 10 out of the 11 possible pin banks;
it just skips port A.
Use the newly introduced DT based pinctrl driver to describe just the
generic pinctrl properties, so advertise the number of pins per bank
and the interrupt capabilities. The actual function/mux assignment is
taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig               |  5 ++
 drivers/pinctrl/sunxi/Makefile              |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 54 +++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index a78fdbbdfc0c7..0cbe466683650 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -131,4 +131,9 @@ config PINCTRL_SUN50I_H616_R
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN55I_A523
+	bool "Support for the Allwinner A523 PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index f5bad7a529519..4e55508ff7f76 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -27,5 +27,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
+obj-$(CONFIG_PINCTRL_SUN55I_A523)	+= pinctrl-sun55i-a523.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
new file mode 100644
index 0000000000000..8f6bb3fc315c5
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A523 SoC pinctrl driver.
+ *
+ * Copyright (C) 2023 Arm Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 18, 24 };
+
+static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+
+static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
+
+static struct sunxi_pinctrl_desc a523_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
+	.irq_bank_map = a523_irq_bank_map,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int a523_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
+					   a523_irq_bank_muxes,
+					   &a523_pinctrl_data,
+					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_ELEVEN_BANKS);
+}
+
+static const struct of_device_id a523_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-pinctrl", },
+	{}
+};
+
+static struct platform_driver a523_pinctrl_driver = {
+	.probe	= a523_pinctrl_probe,
+	.driver	= {
+		.name		= "sun55i-a523-pinctrl",
+		.of_match_table	= a523_pinctrl_match,
+	},
+};
+builtin_platform_driver(a523_pinctrl_driver);
-- 
2.46.2


