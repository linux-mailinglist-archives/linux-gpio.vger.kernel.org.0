Return-Path: <linux-gpio+bounces-17214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D225A55B4D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 01:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6581F177B63
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 00:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADA828152D;
	Thu,  6 Mar 2025 23:58:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC5428136E;
	Thu,  6 Mar 2025 23:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305533; cv=none; b=NEgM+sevet+PCEM922izbvkqcxHJM34MMqHWB25iHp7e4byX+zIuer9c1Sqjv9EALmesvc+hkePPDIhdxGa8JMD13tCE3QrMapoVFlIg/jDO8lbJUnDxSK+8nX0w8YdFRcHsZ+qlawy0cYyizivO0kTIoAY/PxPA7q8ErPphIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305533; c=relaxed/simple;
	bh=Um5IfbD735MZAR0kncrcKD4JbWb8JEH4EMmhAjtc4Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKejGQSGLL7eb/J0x83l6JQ89f+eWAjR2LI9xLJMYQSXAbHWI/pyBP51XvVtZD+P8iXipu9Q4nKJeVVeZxuRvVOfKqRBfjUMKTnW8OYF2mjjSJ/OjfAEgr5OcBSKfum0+u7AuaAO8Z/M6zZZuMMMq3PfhF8OHvQPpz8UJPGPHnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D370169E;
	Thu,  6 Mar 2025 15:59:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4E173F673;
	Thu,  6 Mar 2025 15:58:49 -0800 (PST)
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
Subject: [PATCH v4 8/8] pinctrl: sunxi: Add support for the secondary A523 GPIO ports
Date: Thu,  6 Mar 2025 23:58:27 +0000
Message-ID: <20250306235827.4895-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
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
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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


