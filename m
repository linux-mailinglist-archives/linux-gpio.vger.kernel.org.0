Return-Path: <linux-gpio+bounces-17213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7466A55B4A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 01:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C22B177C6A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 00:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9540281372;
	Thu,  6 Mar 2025 23:58:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1331C280CEA;
	Thu,  6 Mar 2025 23:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305531; cv=none; b=WONy9Ja+Wnb1uKAygCjoays2OqorlRbU+a4vFRjHxY2BoFGxDH0BXVjDGdAYObjNPCJKFGTxd34Vlo5bT6Mhp46teba07pVAWLxGNEPcmRzv8DSjkgNKC5FDCVgcNLda3Qc1nUekhr+zgEi+GZwfr+MTvatZRw8/FM2zPFrH/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305531; c=relaxed/simple;
	bh=ImDlUeNHfN0v8Zu8kOIpzkOcvuBowuzrrm5oGJ/6Kmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCpATtbNNLIRvLcLpEqmNiMza8WQPJQJLrGWmS3hqc8e3t+uxemVcb2IvyLhhiLk+Ezov37DcP68oEdDJCc+3s5D7hSX4MpduL7u0zfvYMn6HcDmNE+W0Poq5/R6I09KVz8oPxdOSBe8XKf0tlmHd2PBF8tELV4abiRNtuK4zVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E6D1BC0;
	Thu,  6 Mar 2025 15:59:02 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFF1B3F673;
	Thu,  6 Mar 2025 15:58:47 -0800 (PST)
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
Subject: [PATCH v4 7/8] pinctrl: sunxi: Add support for the Allwinner A523
Date: Thu,  6 Mar 2025 23:58:26 +0000
Message-ID: <20250306235827.4895-8-andre.przywara@arm.com>
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

The Allwinner A523 contains pins in 10 out of the 11 possible pin banks;
it just skips port A.
Use the newly introduced DT based pinctrl driver to describe just the
generic pinctrl properties, so advertise the number of pins per bank
and the interrupt capabilities. The actual function/mux assignment is
taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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
index 0000000000000..7d2308c37d29e
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
+	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
+
+static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+
+static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
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
2.46.3


