Return-Path: <linux-gpio+bounces-24694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D665B2E9A3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B167B93BA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC571B4F0E;
	Thu, 21 Aug 2025 00:46:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814D11B423B;
	Thu, 21 Aug 2025 00:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737163; cv=none; b=DKBhCnlwIMLPUpyURC2kw2kxTa79HRAYldCdwS4SoUd9r5Ni3YzVtWGwf3uhBqGl/7RL7Xmbn7KBJpEcvsaJ0EWLge5ByGU6Nvxbr5/xPliD0iHYDuJLFhZgjvgAT1a9vWAYT0ocHxDLrw4s1q3WIkryc5YOb9/TkGu/Gj7fi1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737163; c=relaxed/simple;
	bh=lmvN+PIx41sGMMSHZVzOz18gMEdYBoA31KC2+1JFtjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXrPae+NZwBiTjF1Rs1f3jJZHlkoQOsFmr7x/znnrKBBpARsC5sPuabu0DBSQYf9kU2HbIUbbZUIAXfryJn1OqucEDWCFoGBNQ3Wkw1wh9jeonStBS7y+1RKCXtTAUOYKo4fs82xi0SeJQfgAApscWsXODIeL5qBfPg3nwq4wkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59FE12FC;
	Wed, 20 Aug 2025 17:45:52 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 310E43F63F;
	Wed, 20 Aug 2025 17:45:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 9/9] pinctrl: sunxi: Add support for the Allwinner A733
Date: Thu, 21 Aug 2025 01:42:32 +0100
Message-ID: <20250821004232.8134-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A733 changes the layout of the pinctrl MMIO register
frame, but stays otherwise rather close to the previous IP.
The main PIO looks similar to the one in the A523, with ports B-K being
implemented, each also with the same number of pins per port as on the
A523.

Use the DT based pinctrl driver to describe just the generic pinctrl
properties, so advertise the number of pins per bank, interrupt
capabilities and the new quirks. The actual function/mux assignment will
be taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig               |  5 ++
 drivers/pinctrl/sunxi/Makefile              |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 51 +++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348e..831bb1dc93738 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -141,4 +141,9 @@ config PINCTRL_SUN55I_A523_R
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN60I_A733
+	bool "Support for the Allwinner A733 PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f1..3658c9d06b498 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -29,5 +29,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523)	+= pinctrl-sun55i-a523.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523_R)	+= pinctrl-sun55i-a523-r.o
+obj-$(CONFIG_PINCTRL_SUN60I_A733)	+= pinctrl-sun60i-a733.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
new file mode 100644
index 0000000000000..1eafbf2ab3c97
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A733 SoC pinctrl driver.
+ *
+ * Copyright (C) 2025 Arm Ltd.
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
+static const u8 a733_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 11, 17, 24, 16,  7, 15, 20, 17, 28, 26 };
+
+static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
+
+static struct sunxi_pinctrl_desc a733_pinctrl_data = {
+	.irq_banks = 10,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int a733_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, a733_nr_bank_pins,
+					   a733_irq_bank_muxes,
+					   &a733_pinctrl_data,
+					   SUNXI_PINCTRL_NCAT3_REG_LAYOUT |
+					   SUNXI_PINCTRL_HAS_SET_CLEAR_REGS);
+}
+
+static const struct of_device_id a733_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun60i-a733-pinctrl", },
+	{}
+};
+
+static struct platform_driver a733_pinctrl_driver = {
+	.probe	= a733_pinctrl_probe,
+	.driver	= {
+		.name		= "sun60i-a733-pinctrl",
+		.of_match_table	= a733_pinctrl_match,
+	},
+};
+builtin_platform_driver(a733_pinctrl_driver);
-- 
2.46.3


