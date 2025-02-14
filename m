Return-Path: <linux-gpio+bounces-15982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3597A35321
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 01:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 434C97A49F8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67B915198F;
	Fri, 14 Feb 2025 00:40:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF291487FA;
	Fri, 14 Feb 2025 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493616; cv=none; b=JqTGngirpOnyVDuQTXAz7SEFjEvG4J7hxeFwTond1zTzB6jimf0DC0IGKNeIdobJsOSQZaoRn03fr0Lil6MluBObWFsXg0jNFAtbDHWyZUa5rWAdTPmGfYOnJBoJJXWHHJ+ZJmZ6cB6cTFFaNwYl0yrjWdmqidPXHY2w4noMl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493616; c=relaxed/simple;
	bh=9DJX4GeezJm5XmMAY97rH2s9kYvmm6DkOakDepGm7+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1xJefPUoa9SeSo+joji7NHEaM21MjBmDTb73eFQWt3MYXUbjU5DPEFAQJJVS4QQsFg7/bPnbiQTGR6A2NVanjmTwitOwiDasV2HzuvKLClOeyoLWt3QRojb6FjTbMmNH7G0umVcRztZ8ytyqLeoa9L2jpccYZ0XPiwBbXVugw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C5F6113E;
	Thu, 13 Feb 2025 16:40:35 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBE353F5A1;
	Thu, 13 Feb 2025 16:40:12 -0800 (PST)
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
Subject: [PATCH v2 8/8] pinctrl: sunxi: Add support for the secondary A523 GPIO ports
Date: Fri, 14 Feb 2025 00:37:34 +0000
Message-ID: <20250214003734.14944-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250214003734.14944-1-andre.przywara@arm.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As most other Allwinner SoCs before, the A523 chip contains a second
GPIO controller, managing banks PL and PM.
Use the newly introduced DT based pinctrl driver to describe just the
generic pinctrl properties, so advertise the number of pins per bank
and the interrupt capabilities. The actual function/mux assignment is
taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig                 |  5 ++
 drivers/pinctrl/sunxi/Makefile                |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 54 +++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 0cbe466683650..dc62eba96348e 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -136,4 +136,9 @@ config PINCTRL_SUN55I_A523
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN55I_A523_R
+	bool "Support for the Allwinner A523 R-PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 4e55508ff7f76..951b3f1e4b4f1 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -28,5 +28,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523)	+= pinctrl-sun55i-a523.o
+obj-$(CONFIG_PINCTRL_SUN55I_A523_R)	+= pinctrl-sun55i-a523-r.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
new file mode 100644
index 0000000000000..69cd2b4ebd7d7
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A523 SoC r-pinctrl driver.
+ *
+ * Copyright (C) 2024 Arm Ltd.
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
+static const u8 a523_r_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PL  PM */
+	{ 14,  6 };
+
+static const unsigned int a523_r_irq_bank_map[] = { 0, 1 };
+
+static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PL  PM */
+	{ 14, 14 };
+
+static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.pin_base = PL_BASE,
+};
+
+static int a523_r_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
+					   a523_r_irq_bank_muxes,
+					   &a523_r_pinctrl_data,
+					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
+}
+
+static const struct of_device_id a523_r_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
+	{}
+};
+
+static struct platform_driver a523_r_pinctrl_driver = {
+	.probe	= a523_r_pinctrl_probe,
+	.driver	= {
+		.name		= "sun55i-a523-r-pinctrl",
+		.of_match_table	= a523_r_pinctrl_match,
+	},
+};
+builtin_platform_driver(a523_r_pinctrl_driver);
-- 
2.46.3


