Return-Path: <linux-gpio+bounces-17967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72FA70352
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 15:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3F8416970A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36B025A2B9;
	Tue, 25 Mar 2025 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="k1kNmZB6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148025A354
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912015; cv=none; b=Drkdd+k1mnwJfLyXMwTL5+UTkshMf0YOHXikyKNfH9Aw1wh+UljIBBeEDmNVreYWpmp3In9DSfdwaSZFKmpIJ9CytEaeJ061V/ROrwAw72lBNtNkHwag99IjUyLE7NsFkVXhirFOYBjj3VVs/O4MIDSuHVGLY1NDs1eXA9vqujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912015; c=relaxed/simple;
	bh=xaKTDkOfCahm8e2JZCD/0CMc7G0Ec7AiDaNnRLRrwAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1QEDtbwnxW/zeNcmoTHzq2szbk0ogHdfUA4UyBRM5lrpHIH0bdLbIPuc4s+gpXj9eivm3uVd5G9Jdu7r/zA23W5u0Zy5b8HCOUpdzwmBkFXw+wELGfXDy05BGrpFBFjP0XdC3NDCDnfUfc25FaerrBvFNpCWs9XRlkMIslQCRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=k1kNmZB6; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C3225403ED
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742911998;
	bh=2Li0e/Vjl5RvJZmNxU8xZ4tfRullDGhSOTeKCg0vy+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=k1kNmZB6mMUueKxazt4YZ1/q+bbs/RfHuaBF/bPyDiTZfbhVGY9B6rCbczyPz7aIN
	 aQOwUKCTTY822vgyP2rT4htYp9qviyDm968blgYPEMawlAC2NHRG1hVRmp/El0xWGQ
	 4LjdjN+cUiV+D6wATWVruMVNA0hazlbiU0nOJ3rTf6b92EG1m8NEX9Eu6tH9PZKEvb
	 uJlfbsk+cnqPGwrhzfcsWYmhjmZRhGbtQj42MRf2Je7ETjczKbegcLZy9R9hwkGSsW
	 OGvR8NOKmTpP2w7iVZsPQHSF9tF8pmuAsumSxfoZc78ya4peThtjKzVBvREawwEYgm
	 1a97svCbDCfGw==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391459c0395so2493359f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 07:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911997; x=1743516797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Li0e/Vjl5RvJZmNxU8xZ4tfRullDGhSOTeKCg0vy+k=;
        b=s/wCtSORuNPTiwHSryVxlCpqS647f1Zq1FnhNd3JzvWEokyt+BQayFt3ITR1SvX6XP
         KjZ1PueCiSX4HNszIrxIoh30CiNjWaJxbUq8S/1mqEb6X3G1wGzvQZkhXg4rCKb3bumd
         LgI15dSPTbGwb2ONmA7sX9XtTUi5V7VFSgAuIl2jgTREKkPCN3IHVThxKhJ0Jf9kfLpX
         Ai4mziA8VLPxl50CF1Aqtu18E0AqPf0S+Ev+gyPAd64jXuKffublyzFFXqYgpvSjtuYH
         4Zw4HuAM+PyvXX1JDdvCJ7Rmyf0xDYYP79VuIHma7StlPKY76OLLys7/UM4rbxPTacoy
         Vsig==
X-Forwarded-Encrypted: i=1; AJvYcCUzK2iYzwcdXhccSczxmvJUyZ74UueuF0WDuHaFgU9a8ED08I2XiJlVWf0nNxqPMNiHjQIo/VejWgYr@vger.kernel.org
X-Gm-Message-State: AOJu0YysaHdZd8/x+xN70lFtAU/ABcjywr72Z6cSeoTAjwUrYTC4I94b
	u6RkDdJM/uFMWQI1u83CfmOIxHlxDUObjE5beqLViZcf04I5aj/HbJMja0OnM9thqQrtJrJUeDQ
	nX7RgAcq2yPIRAFDyMQlUiHAh92R4BTMCPeWbsbvIpMgqfG7yjljJn5xQw8/YHb/v5F3rC3y7JG
	Q=
X-Gm-Gg: ASbGnct99NTyWZ1nIFUq2D9mhMlOiAJEeIi4z4M2om/xZqRhdDfqulRnT9cQ7JlxRvQ
	8L8ZB8PwVzqpnKY5qJmWfwRPR1Z63fbc9qxS14fKI80nMirc592FaYmyD8cCEqKGzifgkJiLNVv
	o3qfrkV5S7xnlVmIThnlmPAPoCyUNY1NbN4GML5IGqe5jjcIrn2R9WKA02EZWjhmsxNEvlYqRG4
	vjtKb6AAo/rJcLYcc2WkPmfs0wT6IIcyrCpMwZhmR+NQQJ6H/ypDG7lFBo1aO3GNOUH3SqACKWq
	Lex6Vphk+22u2/ms+9FGwOhJgsMFcQ==
X-Received: by 2002:adf:9c8c:0:b0:39a:c9cb:669d with SMTP id ffacd0b85a97d-39ac9cb6720mr1597208f8f.24.1742911996289;
        Tue, 25 Mar 2025 07:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkCRLcPwav1mvrhLGQKFcgZwp2xj9vQAjHQKAOe0IRlxzD3VbHafkb6SmYAZRiaz/4QUsWuA==
X-Received: by 2002:adf:9c8c:0:b0:39a:c9cb:669d with SMTP id ffacd0b85a97d-39ac9cb6720mr1597132f8f.24.1742911995616;
        Tue, 25 Mar 2025 07:13:15 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:15 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 2/4] pinctrl: Add driver for the ESWIN EIC7700 RISC-V SoC
Date: Tue, 25 Mar 2025 15:13:04 +0100
Message-ID: <20250325141311.758787-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pin control driver for the ESWIN EIC7700 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/pinctrl/Kconfig           |  14 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-eic7700.c | 802 ++++++++++++++++++++++++++++++
 3 files changed, 817 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 95a8e2b9a614..3847dd3d0833 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -194,6 +194,20 @@ config PINCTRL_DIGICOLOR
 	select PINMUX
 	select GENERIC_PINCONF
 
+config PINCTRL_EIC7700
+	tristate "Pinctrl driver for the ESWIN EIC7700 SoC"
+	depends on ARCH_ESWIN || COMPILE_TEST
+	depends on OF
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select PINMUX
+	help
+	  This is the driver for the pin controller blocks on the
+	  ESWIN EIC7700 SoC.
+
+	  This driver is needed for RISC-V development boards like
+	  the HiFive Premier P550 and Milk-V Megrez.
+
 config PINCTRL_EP93XX
 	bool
 	depends on ARCH_EP93XX || COMPILE_TEST
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index fba1c56624c0..da5fb21c95a7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_PINCTRL_CY8C95X0)	+= pinctrl-cy8c95x0.o
 obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
 obj-$(CONFIG_PINCTRL_DA9062)	+= pinctrl-da9062.o
 obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
+obj-$(CONFIG_PINCTRL_EIC7700)	+= pinctrl-eic7700.o
 obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
 obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
diff --git a/drivers/pinctrl/pinctrl-eic7700.c b/drivers/pinctrl/pinctrl-eic7700.c
new file mode 100644
index 000000000000..955a862d7316
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-eic7700.c
@@ -0,0 +1,802 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pinctrl driver for the ESWIN EIC7700 SoC
+ *
+ * Copyright (C) 2025 Emil Renner Berthing <emil.renner.berthing@canonical.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "core.h"
+#include "pinmux.h"
+#include "pinconf.h"
+
+#define EIC7700_PWDATA_FUNCSEL	GENMASK(18, 16)
+#define EIC7700_PWDATA_ST	BIT(7)
+#define EIC7700_PWDATA_DS	GENMASK(6, 3)
+#define EIC7700_PWDATA_PD	BIT(2)
+#define EIC7700_PWDATA_PU	BIT(1)
+#define EIC7700_PWDATA_IE	BIT(0)
+
+#define EIC7700_PULLDOWN_OHM	22000
+#define EIC7700_PULLUP_OHM	25000
+#define EIC7700_STRONGUP_OHM	3500
+
+struct eic7700_pinctrl {
+	struct pinctrl_desc desc;
+	struct mutex mutex;	/* serialize adding functions */
+	raw_spinlock_t lock;	/* serialize register access */
+	void __iomem *base;
+	struct pinctrl_dev *pctl;
+};
+
+static void __iomem *eic7700_pwdata(struct eic7700_pinctrl *ep,
+				    unsigned int pin)
+{
+	return ep->base + 4 * pin;
+}
+
+enum eic7700_muxtype {
+	EIC7700_MUX_____,
+	EIC7700_MUX_CSI,
+	EIC7700_MUX_DBG,
+	EIC7700_MUX_DDR,
+	EIC7700_MUX_FAN,
+	EIC7700_MUX_GPIO,
+	EIC7700_MUX_HDMI,
+	EIC7700_MUX_I2C,
+	EIC7700_MUX_I2S,
+	EIC7700_MUX_JTAG,
+	EIC7700_MUX_MIPI,
+	EIC7700_MUX_MODE,
+	EIC7700_MUX_OSC,
+	EIC7700_MUX_PCI,
+	EIC7700_MUX_PWM,
+	EIC7700_MUX_RGMI,
+	EIC7700_MUX_RST,
+	EIC7700_MUX_SATA,
+	EIC7700_MUX_SPI,
+	EIC7700_MUX_SDIO,
+	EIC7700_MUX_UART,
+	EIC7700_MUX_USB,
+};
+
+static const char *const eic7700_muxtype_string[] = {
+	[EIC7700_MUX_CSI]  = "csi",
+	[EIC7700_MUX_DBG]  = "debug",
+	[EIC7700_MUX_DDR]  = "ddr",
+	[EIC7700_MUX_FAN]  = "fan",
+	[EIC7700_MUX_GPIO] = "gpio",
+	[EIC7700_MUX_HDMI] = "hdmi",
+	[EIC7700_MUX_I2C]  = "i2c",
+	[EIC7700_MUX_I2S]  = "i2s",
+	[EIC7700_MUX_JTAG] = "jtag",
+	[EIC7700_MUX_MIPI] = "mipi",
+	[EIC7700_MUX_MODE] = "mode",
+	[EIC7700_MUX_OSC]  = "oscillator",
+	[EIC7700_MUX_PCI]  = "pci",
+	[EIC7700_MUX_PWM]  = "pwm",
+	[EIC7700_MUX_RGMI] = "rgmii",
+	[EIC7700_MUX_RST]  = "reset",
+	[EIC7700_MUX_SATA] = "sata",
+	[EIC7700_MUX_SPI]  = "spi",
+	[EIC7700_MUX_SDIO] = "sdio",
+	[EIC7700_MUX_UART] = "uart",
+	[EIC7700_MUX_USB]  = "usb",
+};
+
+static enum eic7700_muxtype eic7700_muxtype_get(const char *str)
+{
+	enum eic7700_muxtype mt;
+
+	for (mt = EIC7700_MUX_CSI; mt < ARRAY_SIZE(eic7700_muxtype_string); mt++) {
+		if (!strcmp(str, eic7700_muxtype_string[mt]))
+			return mt;
+	}
+	return EIC7700_MUX_____;
+}
+
+#define EIC7700_PAD(_nr, _name, m0, m1, m2, m3, m6, _flags) \
+	{ .number = _nr, .name = #_name, .drv_data = (void *)((_flags) | \
+		(EIC7700_MUX_##m0 <<  0) | (EIC7700_MUX_##m1 <<  5) | (EIC7700_MUX_##m2 << 10) | \
+		(EIC7700_MUX_##m3 << 15) | (EIC7700_MUX_##m6 << 20)) }
+
+static unsigned long eic7700_pad_muxdata(void *drv_data)
+{
+	return (uintptr_t)drv_data & GENMASK(24, 0);
+}
+
+static bool eic7700_pad_is_oscillator(void *drv_data)
+{
+	return ((uintptr_t)drv_data & GENMASK(4, 0)) == EIC7700_MUX_OSC;
+}
+
+static const struct pinctrl_pin_desc eic7700_pins[] = {
+	EIC7700_PAD(0,   CHIP_MODE,       MODE, ____, ____, ____, ____, 0),
+	EIC7700_PAD(1,   MODE_SET0,       SDIO, ____, GPIO, ____, ____, 0), /* GPIO13  */
+	EIC7700_PAD(2,   MODE_SET1,       SDIO, ____, GPIO, ____, ____, 0), /* GPIO14  */
+	EIC7700_PAD(3,   MODE_SET2,       SDIO, ____, GPIO, ____, ____, 0), /* GPIO15  */
+	EIC7700_PAD(4,   MODE_SET3,       SDIO, ____, GPIO, ____, ____, 0), /* GPIO16  */
+	EIC7700_PAD(5,   XIN,             OSC,  ____, ____, ____, ____, 0),
+	EIC7700_PAD(6,   RTC_XIN,         OSC,  ____, ____, ____, ____, 0),
+	EIC7700_PAD(7,   RST_OUT_N,       RST,  ____, ____, ____, ____, 0),
+	EIC7700_PAD(8,   KEY_RESET_N,     RST,  ____, ____, ____, ____, 0),
+	/* skip 9, 10 and 11 so we can calculate register offsets from the pin number */
+	EIC7700_PAD(12,  GPIO0,           GPIO, ____, ____, ____, ____, 0), /* GPIO0   */
+	EIC7700_PAD(13,  POR_SEL,         MODE, ____, ____, ____, ____, 0),
+	EIC7700_PAD(14,  JTAG0_TCK,       JTAG, SPI,  GPIO, ____, ____, 0), /* GPIO1   */
+	EIC7700_PAD(15,  JTAG0_TMS,       JTAG, SPI,  GPIO, ____, ____, 0), /* GPIO2   */
+	EIC7700_PAD(16,  JTAG0_TDI,       JTAG, SPI,  GPIO, ____, ____, 0), /* GPIO3   */
+	EIC7700_PAD(17,  JTAG0_TDO,       JTAG, SPI,  GPIO, ____, ____, 0), /* GPIO4   */
+	EIC7700_PAD(18,  GPIO5,           GPIO, SPI,  ____, ____, ____, 0), /* GPIO5   */
+	EIC7700_PAD(19,  SPI2_CS0_N,      SPI,  ____, GPIO, ____, ____, 0), /* GPIO6   */
+	EIC7700_PAD(20,  JTAG1_TCK,       JTAG, ____, GPIO, ____, ____, 0), /* GPIO7   */
+	EIC7700_PAD(21,  JTAG1_TMS,       JTAG, ____, GPIO, ____, ____, 0), /* GPIO8   */
+	EIC7700_PAD(22,  JTAG1_TDI,       JTAG, ____, GPIO, ____, ____, 0), /* GPIO9   */
+	EIC7700_PAD(23,  JTAG1_TDO,       JTAG, ____, GPIO, ____, ____, 0), /* GPIO10  */
+	EIC7700_PAD(24,  GPIO11,          GPIO, ____, ____, ____, ____, 0), /* GPIO11  */
+	EIC7700_PAD(25,  SPI2_CS1_N,      SPI,  ____, GPIO, ____, ____, 0), /* GPIO12  */
+	EIC7700_PAD(26,  PCIE_CLKREQ_N,   PCI,  ____, ____, ____, ____, 0),
+	EIC7700_PAD(27,  PCIE_WAKE_N,     PCI,  ____, ____, ____, ____, 0),
+	EIC7700_PAD(28,  PCIE_PERST_N,    PCI,  ____, ____, ____, ____, 0),
+	EIC7700_PAD(29,  HDMI_SCL,        HDMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(30,  HDMI_SDA,        HDMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(31,  HDMI_CEC,        HDMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(32,  JTAG2_TRST,      JTAG, ____, GPIO, ____, CSI,  0), /* GPIO17  */
+	EIC7700_PAD(33,  RGMII0_CLK_125,  RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(34,  RGMII0_TXEN,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(35,  RGMII0_TXCLK,    RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(36,  RGMII0_TXD0,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(37,  RGMII0_TXD1,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(38,  RGMII0_TXD2,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(39,  RGMII0_TXD3,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(40,  I2S0_BCLK,       I2S,  ____, GPIO, ____, CSI,  0), /* GPIO18  */
+	EIC7700_PAD(41,  I2S0_WCLK,       I2S,  ____, GPIO, ____, CSI,  0), /* GPIO19  */
+	EIC7700_PAD(42,  I2S0_SDI,        I2S,  ____, GPIO, ____, CSI,  0), /* GPIO20  */
+	EIC7700_PAD(43,  I2S0_SDO,        I2S,  ____, GPIO, ____, CSI,  0), /* GPIO21  */
+	EIC7700_PAD(44,  I2S_MCLK,        I2S,  ____, GPIO, ____, CSI,  0), /* GPIO22  */
+	EIC7700_PAD(45,  RGMII0_RXCLK,    RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(46,  RGMII0_RXDV,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(47,  RGMII0_RXD0,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(48,  RGMII0_RXD1,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(49,  RGMII0_RXD2,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(50,  RGMII0_RXD3,     RGMI, ____, ____, ____, CSI,  0),
+	EIC7700_PAD(51,  I2S2_BCLK,       I2S,  ____, GPIO, ____, CSI,  0), /* GPIO23  */
+	EIC7700_PAD(52,  I2S2_WCLK,       I2S,  ____, GPIO, ____, CSI,  0), /* GPIO24  */
+	EIC7700_PAD(53,  I2S2_SDI,        I2S,  ____, GPIO, ____, CSI,  0), /* GPIO25  */
+	EIC7700_PAD(54,  I2S2_SDO,        I2S,  ____, GPIO, ____, CSI,  0), /* GPIO26  */
+	EIC7700_PAD(55,  GPIO27,          GPIO, SATA, ____, ____, CSI,  0), /* GPIO27  */
+	EIC7700_PAD(56,  GPIO28,          GPIO, ____, ____, ____, ____, 0), /* GPIO28  */
+	EIC7700_PAD(57,  GPIO29,          MODE, SDIO, GPIO, ____, ____, 0), /* GPIO29  */
+	EIC7700_PAD(58,  RGMII0_MDC,      RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(59,  RGMII0_MDIO,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(60,  RGMII0_INTB,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(61,  RGMII1_CLK_125,  RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(62,  RGMII1_TXEN,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(63,  RGMII1_TXCLK,    RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(64,  RGMII1_TXD0,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(65,  RGMII1_TXD1,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(66,  RGMII1_TXD2,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(67,  RGMII1_TXD3,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(68,  I2S1_BCLK,       I2S,  ____, GPIO, ____, ____, 0), /* GPIO30  */
+	EIC7700_PAD(69,  I2S1_WCLK,       I2S,  ____, GPIO, ____, ____, 0), /* GPIO31  */
+	EIC7700_PAD(70,  I2S1_SDI,        I2S,  ____, GPIO, ____, ____, 0), /* GPIO32  */
+	EIC7700_PAD(71,  I2S1_SDO,        I2S,  ____, GPIO, ____, ____, 0), /* GPIO33  */
+	EIC7700_PAD(72,  GPIO34,          MODE, SDIO, GPIO, ____, ____, 0), /* GPIO34  */
+	EIC7700_PAD(73,  RGMII1_RXCLK,    RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(74,  RGMII2_RXDV,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(75,  RGMII2_RXD0,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(76,  RGMII2_RXD1,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(77,  RGMII2_RXD2,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(78,  RGMII2_RXD3,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(79,  SPI1_CS0_N,      SPI,  ____, GPIO, ____, ____, 0), /* GPIO35  */
+	EIC7700_PAD(80,  SPI1_CLK,        SPI,  ____, GPIO, ____, ____, 0), /* GPIO36  */
+	EIC7700_PAD(81,  SPI1_D0,         SPI,  I2C,  GPIO, UART, ____, 0), /* GPIO37  */
+	EIC7700_PAD(82,  SPI1_D1,         SPI,  I2C,  GPIO, UART, ____, 0), /* GPIO38  */
+	EIC7700_PAD(83,  SPI1_D2,         SPI,  SDIO, GPIO, ____, ____, 0), /* GPIO39  */
+	EIC7700_PAD(84,  SPI1_D3,         SPI,  PWM,  GPIO, ____, ____, 0), /* GPIO40  */
+	EIC7700_PAD(85,  SPI1_CS1_N,      SPI,  PWM,  GPIO, ____, ____, 0), /* GPIO41  */
+	EIC7700_PAD(86,  RGMII1_MDC,      RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(87,  RGMII1_MDIO,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(88,  RGMII1_INTB,     RGMI, ____, ____, ____, ____, 0),
+	EIC7700_PAD(89,  USB0_PWREN,      USB,  ____, GPIO, ____, ____, 0), /* GPIO42  */
+	EIC7700_PAD(90,  USB1_PWREN,      USB,  ____, GPIO, ____, ____, 0), /* GPIO43  */
+	EIC7700_PAD(91,  I2C0_SCL,        I2C,  ____, GPIO, ____, ____, 0), /* GPIO44  */
+	EIC7700_PAD(92,  I2C0_SDA,        I2C,  ____, GPIO, ____, ____, 0), /* GPIO45  */
+	EIC7700_PAD(93,  I2C1_SCL,        I2C,  ____, GPIO, ____, ____, 0), /* GPIO46  */
+	EIC7700_PAD(94,  I2C1_SDA,        I2C,  ____, GPIO, ____, ____, 0), /* GPIO47  */
+	EIC7700_PAD(95,  I2C2_SCL,        I2C,  ____, GPIO, ____, ____, 0), /* GPIO48  */
+	EIC7700_PAD(96,  I2C2_SDA,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO49  */
+	EIC7700_PAD(97,  I2C3_SCL,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO50  */
+	EIC7700_PAD(98,  I2C3_SDA,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO51  */
+	EIC7700_PAD(99,  I2C4_SCL,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO52  */
+	EIC7700_PAD(100, I2C4_SDA,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO53  */
+	EIC7700_PAD(101, I2C5_SCL,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO54  */
+	EIC7700_PAD(102, I2C5_SDA,        I2C,  ____, GPIO, ____, CSI,  0), /* GPIO55  */
+	EIC7700_PAD(103, UART0_TX,        UART, ____, GPIO, ____, ____, 0), /* GPIO56  */
+	EIC7700_PAD(104, UART0_RX,        UART, ____, GPIO, ____, ____, 0), /* GPIO57  */
+	EIC7700_PAD(105, UART1_TX,        UART, ____, GPIO, ____, ____, 0), /* GPIO58  */
+	EIC7700_PAD(106, UART1_RX,        UART, ____, GPIO, ____, ____, 0), /* GPIO59  */
+	EIC7700_PAD(107, UART1_CTS,       UART, I2C,  GPIO, ____, ____, 0), /* GPIO60  */
+	EIC7700_PAD(108, UART1_RTS,       UART, I2C,  GPIO, ____, ____, 0), /* GPIO61  */
+	EIC7700_PAD(109, UART2_TX,        UART, I2C,  GPIO, ____, CSI,  0), /* GPIO62  */
+	EIC7700_PAD(110, UART2_RX,        UART, I2C,  GPIO, ____, DBG,  0), /* GPIO63  */
+	EIC7700_PAD(111, JTAG2_TCK,       JTAG, ____, GPIO, ____, DBG,  0), /* GPIO64  */
+	EIC7700_PAD(112, JTAG2_TMS,       JTAG, ____, GPIO, ____, DBG,  0), /* GPIO65  */
+	EIC7700_PAD(113, JTAG2_TDI,       JTAG, ____, GPIO, ____, DBG,  0), /* GPIO66  */
+	EIC7700_PAD(114, JTAG2_TDO,       JTAG, ____, GPIO, ____, DBG,  0), /* GPIO67  */
+	EIC7700_PAD(115, FAN_PWM,         FAN,  ____, GPIO, ____, DBG,  0), /* GPIO68  */
+	EIC7700_PAD(116, FAN_TACH,        FAN,  ____, GPIO, ____, DBG,  0), /* GPIO69  */
+	EIC7700_PAD(117, MIPI_CSI0_XVS,   MIPI, ____, GPIO, ____, DBG,  0), /* GPIO70  */
+	EIC7700_PAD(118, MIPI_CSI0_XHS,   MIPI, ____, GPIO, ____, DBG,  0), /* GPIO71  */
+	EIC7700_PAD(119, MIPI_CSI0_MCLK,  MIPI, ____, GPIO, ____, DBG,  0), /* GPIO72  */
+	EIC7700_PAD(120, MIPI_CSI1_XVS,   MIPI, ____, GPIO, ____, DBG,  0), /* GPIO73  */
+	EIC7700_PAD(121, MIPI_CSI1_XHS,   MIPI, ____, GPIO, ____, DBG,  0), /* GPIO74  */
+	EIC7700_PAD(122, MIPI_CSI1_MCLK,  MIPI, ____, GPIO, ____, DBG,  0), /* GPIO75  */
+	EIC7700_PAD(123, MIPI_CSI2_XVS,   MIPI, ____, GPIO, ____, DBG,  0), /* GPIO76  */
+	EIC7700_PAD(124, MIPI_CSI2_XHS,   MIPI, ____, GPIO, ____, DBG,  0), /* GPIO77  */
+	EIC7700_PAD(125, MIPI_CSI2_MCLK,  MIPI, ____, GPIO, ____, DBG,  0), /* GPIO78  */
+	EIC7700_PAD(126, MIPI_CSI3_XVS,   MIPI, ____, GPIO, ____, SATA, 0), /* GPIO79  */
+	EIC7700_PAD(127, MIPI_CSI3_XHS,   MIPI, ____, GPIO, ____, SATA, 0), /* GPIO80  */
+	EIC7700_PAD(128, MIPI_CSI3_MCLK,  MIPI, ____, GPIO, ____, SATA, 0), /* GPIO81  */
+	EIC7700_PAD(129, MIPI_CSI4_XVS,   MIPI, ____, GPIO, ____, CSI,  0), /* GPIO82  */
+	EIC7700_PAD(130, MIPI_CSI4_XHS,   MIPI, ____, GPIO, ____, CSI,  0), /* GPIO83  */
+	EIC7700_PAD(131, MIPI_CSI4_MCLK,  MIPI, ____, GPIO, ____, CSI,  0), /* GPIO84  */
+	EIC7700_PAD(132, MIPI_CSI5_XVS,   MIPI, ____, GPIO, ____, CSI,  0), /* GPIO85  */
+	EIC7700_PAD(133, MIPI_CSI5_XHS,   MIPI, ____, GPIO, ____, CSI,  0), /* GPIO86  */
+	EIC7700_PAD(134, MIPI_CSI5_MCLK,  MIPI, ____, GPIO, ____, CSI,  0), /* GPIO87  */
+	EIC7700_PAD(135, SPI3_CS_N,       SPI,  ____, GPIO, ____, ____, 0), /* GPIO88  */
+	EIC7700_PAD(136, SPI3_CLK,        SPI,  ____, GPIO, ____, ____, 0), /* GPIO89  */
+	EIC7700_PAD(137, SPI3_DI,         SPI,  ____, GPIO, ____, ____, 0), /* GPIO90  */
+	EIC7700_PAD(138, SPI3_DO,         SPI,  ____, GPIO, ____, ____, 0), /* GPIO91  */
+	EIC7700_PAD(139, GPIO92,          I2C,  MIPI, GPIO, UART, ____, 0), /* GPIO92  */
+	EIC7700_PAD(140, GPIO93,          I2C,  MIPI, GPIO, UART, ____, 0), /* GPIO93  */
+	EIC7700_PAD(141, S_MODE,          MODE, ____, GPIO, ____, ____, 0), /* GPIO94  */
+	EIC7700_PAD(142, GPIO95,          MODE, ____, GPIO, ____, ____, 0), /* GPIO95  */
+	EIC7700_PAD(143, SPI0_CS_N,       SPI,  ____, GPIO, ____, ____, 0), /* GPIO96  */
+	EIC7700_PAD(144, SPI0_CLK,        SPI,  ____, GPIO, ____, ____, 0), /* GPIO97  */
+	EIC7700_PAD(145, SPI0_D0,         SPI,  ____, GPIO, ____, ____, 0), /* GPIO98  */
+	EIC7700_PAD(146, SPI0_D1,         SPI,  ____, GPIO, ____, ____, 0), /* GPIO99  */
+	EIC7700_PAD(147, SPI0_D2,         SPI,  ____, GPIO, ____, ____, 0), /* GPIO100 */
+	EIC7700_PAD(148, SPI0_D3,         SPI,  ____, GPIO, ____, ____, 0), /* GPIO101 */
+	EIC7700_PAD(149, I2C10_SCL,       I2C,  ____, GPIO, ____, ____, 0), /* GPIO102 */
+	EIC7700_PAD(150, I2C10_SDA,       I2C,  ____, GPIO, ____, ____, 0), /* GPIO103 */
+	EIC7700_PAD(151, I2C11_SCL,       I2C,  ____, GPIO, ____, ____, 0), /* GPIO104 */
+	EIC7700_PAD(152, I2C11_SDA,       I2C,  ____, GPIO, ____, ____, 0), /* GPIO105 */
+	EIC7700_PAD(153, GPIO106,         GPIO, ____, ____, ____, ____, 0), /* GPIO106 */
+	EIC7700_PAD(154, BOOT_SEL0,       MODE, ____, GPIO, ____, ____, 0), /* GPIO107 */
+	EIC7700_PAD(155, BOOT_SEL1,       MODE, ____, GPIO, ____, ____, 0), /* GPIO108 */
+	EIC7700_PAD(156, BOOT_SEL2,       MODE, ____, GPIO, ____, ____, 0), /* GPIO109 */
+	EIC7700_PAD(157, BOOT_SEL3,       MODE, ____, GPIO, ____, ____, 0), /* GPIO110 */
+	EIC7700_PAD(158, GPIO111,         GPIO, ____, ____, ____, ____, 0), /* GPIO111 */
+	/* skip 159, 160, 161 and 162 */
+	EIC7700_PAD(163, LPDDR_REF_CLK,   DDR,  ____, ____, ____, ____, 0),
+};
+
+static int eic7700_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+
+	return ep->desc.npins;
+}
+
+static const char *eic7700_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						  unsigned int gsel)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+
+	return ep->desc.pins[gsel].name;
+}
+
+static int eic7700_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					  unsigned int gsel,
+					  const unsigned int **pins,
+					  unsigned int *npins)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &ep->desc.pins[gsel].number;
+	*npins = 1;
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void eic7700_pin_dbg_show(struct pinctrl_dev *pctldev,
+				 struct seq_file *s, unsigned int pin)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *pwdata = eic7700_pwdata(ep, pin);
+	u32 value;
+
+	scoped_guard(raw_spinlock_irqsave, &ep->lock) {
+		value = readl_relaxed(pwdata);
+	}
+
+	seq_printf(s, "[pwdata:0x%x=0x%05x]", 0x80 + 4 * pin, value);
+}
+#else
+#define eic7700_pin_dbg_show NULL
+#endif
+
+static void eic7700_pinctrl_dt_free_map(struct pinctrl_dev *pctldev,
+					struct pinctrl_map *map,
+					unsigned int nmaps)
+{
+	unsigned long *seen = NULL;
+	unsigned int i;
+
+	for (i = 0; i < nmaps; i++) {
+		if (map[i].type == PIN_MAP_TYPE_CONFIGS_PIN &&
+		    map[i].data.configs.configs != seen) {
+			seen = map[i].data.configs.configs;
+			kfree(seen);
+		}
+	}
+
+	kfree(map);
+}
+
+static int eic7700_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	struct pinctrl_map *map;
+	unsigned long *configs;
+	unsigned int nconfigs;
+	unsigned int nmaps;
+	int ret;
+
+	nmaps = 0;
+	for_each_available_child_of_node_scoped(np, child) {
+		int npins = of_property_count_strings(child, "pins");
+
+		if (npins <= 0) {
+			dev_err(ep->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
+				np, child);
+			return -EINVAL;
+		}
+		nmaps += npins;
+		if (of_property_present(child, "function"))
+			nmaps += npins;
+	}
+
+	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	nmaps = 0;
+	guard(mutex)(&ep->mutex);
+	for_each_available_child_of_node_scoped(np, child) {
+		unsigned int rollback = nmaps;
+		enum eic7700_muxtype muxtype;
+		struct property *prop;
+		const char *funcname;
+		const char **pgnames;
+		const char *pinname;
+		int npins;
+
+		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
+		if (ret) {
+			dev_err(ep->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
+				np, child);
+			goto free_map;
+		}
+
+		if (!of_property_read_string(child, "function", &funcname)) {
+			muxtype = eic7700_muxtype_get(funcname);
+			if (!muxtype) {
+				dev_err(ep->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
+					np, child, funcname);
+				ret = -EINVAL;
+				goto free_configs;
+			}
+
+			funcname = devm_kasprintf(ep->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
+						  np, child);
+			if (!funcname) {
+				ret = -ENOMEM;
+				goto free_configs;
+			}
+
+			npins = of_property_count_strings(child, "pins");
+			pgnames = devm_kcalloc(ep->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
+			if (!pgnames) {
+				ret = -ENOMEM;
+				goto free_configs;
+			}
+		} else {
+			funcname = NULL;
+		}
+
+		npins = 0;
+		of_property_for_each_string(child, "pins", prop, pinname) {
+			unsigned int i;
+
+			for (i = 0; i < ep->desc.npins; i++) {
+				if (!strcmp(pinname, ep->desc.pins[i].name))
+					break;
+			}
+			if (i == ep->desc.npins) {
+				nmaps = rollback;
+				dev_err(ep->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
+					np, child, pinname);
+				ret = -EINVAL;
+				goto free_configs;
+			}
+
+			if (nconfigs) {
+				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
+				map[nmaps].data.configs.group_or_pin = ep->desc.pins[i].name;
+				map[nmaps].data.configs.configs = configs;
+				map[nmaps].data.configs.num_configs = nconfigs;
+				nmaps += 1;
+			}
+			if (funcname) {
+				pgnames[npins++] = ep->desc.pins[i].name;
+				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+				map[nmaps].data.mux.function = funcname;
+				map[nmaps].data.mux.group = ep->desc.pins[i].name;
+				nmaps += 1;
+			}
+		}
+
+		if (funcname) {
+			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
+							  npins, (void *)muxtype);
+			if (ret < 0) {
+				dev_err(ep->pctl->dev, "error adding function %s\n", funcname);
+				goto free_map;
+			}
+		}
+	}
+
+	*maps = map;
+	*num_maps = nmaps;
+	return 0;
+
+free_configs:
+	kfree(configs);
+free_map:
+	eic7700_pinctrl_dt_free_map(pctldev, map, nmaps);
+	return ret;
+}
+
+static const struct pinctrl_ops eic7700_pinctrl_ops = {
+	.get_groups_count = eic7700_pinctrl_get_groups_count,
+	.get_group_name = eic7700_pinctrl_get_group_name,
+	.get_group_pins = eic7700_pinctrl_get_group_pins,
+	.pin_dbg_show = eic7700_pin_dbg_show,
+	.dt_node_to_map = eic7700_pinctrl_dt_node_to_map,
+	.dt_free_map = eic7700_pinctrl_dt_free_map,
+};
+
+static const u16 eic7700_drive_strength_in_uA[8] = {
+	3100, 6700, 9600, 12900, 18000, 20900, 23200, 25900,
+};
+
+static u32 eic7700_drive_strength_from_uA(u32 arg)
+{
+	u32 ds;
+
+	for (ds = 0; ds < ARRAY_SIZE(eic7700_drive_strength_in_uA); ds++) {
+		if (arg <= eic7700_drive_strength_in_uA[ds])
+			return ds;
+	}
+	return ARRAY_SIZE(eic7700_drive_strength_in_uA);
+}
+
+static int eic7700_pwdata_rmw(struct eic7700_pinctrl *ep, unsigned int pin,
+			      u32 mask, u32 value)
+{
+	void __iomem *pwdata = eic7700_pwdata(ep, pin);
+	u32 tmp;
+
+	scoped_guard(raw_spinlock_irqsave, &ep->lock) {
+		tmp = readl_relaxed(pwdata);
+		tmp = (tmp & ~mask) | value;
+		writel_relaxed(tmp, pwdata);
+	}
+	return 0;
+}
+
+static int eic7700_pinconf_get(struct pinctrl_dev *pctldev,
+			       unsigned int pin, unsigned long *config)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	const struct pin_desc *desc = pin_desc_get(pctldev, pin);
+	u32 value = readl_relaxed(eic7700_pwdata(ep, pin));
+	int param = pinconf_to_config_param(*config);
+	bool enabled;
+	u32 arg;
+
+	if (eic7700_pad_is_oscillator(desc->drv_data))
+		return -ENOTSUPP;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		enabled = !(value & (EIC7700_PWDATA_PD | EIC7700_PWDATA_PU));
+		arg = 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		enabled = value & EIC7700_PWDATA_PD;
+		arg = EIC7700_PULLDOWN_OHM;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enabled = value & EIC7700_PWDATA_PU;
+		arg = EIC7700_PULLUP_OHM;
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		enabled = true;
+		arg = FIELD_GET(EIC7700_PWDATA_DS, value);
+		if (arg < ARRAY_SIZE(eic7700_drive_strength_in_uA))
+			arg = eic7700_drive_strength_in_uA[arg];
+		else
+			arg = 0;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		enabled = value & EIC7700_PWDATA_IE;
+		arg = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		enabled = value & EIC7700_PWDATA_ST;
+		arg = enabled ? 1 : 0;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int eic7700_pinconf_group_get(struct pinctrl_dev *pctldev,
+				     unsigned int gsel, unsigned long *config)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int pin = ep->desc.pins[gsel].number;
+
+	return eic7700_pinconf_get(pctldev, pin, config);
+}
+
+static int eic7700_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			       unsigned long *configs, unsigned int num_configs)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	const struct pin_desc *desc = pin_desc_get(pctldev, pin);
+	unsigned int i;
+	u32 value = 0;
+	u32 mask = 0;
+
+	if (eic7700_pad_is_oscillator(desc->drv_data))
+		return -ENOTSUPP;
+
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			mask |= EIC7700_PWDATA_PU | EIC7700_PWDATA_PD;
+			value &= ~(EIC7700_PWDATA_PU | EIC7700_PWDATA_PD);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (arg == 0)
+				return -ENOTSUPP;
+			mask |= EIC7700_PWDATA_PU | EIC7700_PWDATA_PD;
+			value &= ~EIC7700_PWDATA_PU;
+			value |= EIC7700_PWDATA_PD;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (arg == 0)
+				return -ENOTSUPP;
+			mask |= EIC7700_PWDATA_PU | EIC7700_PWDATA_PD;
+			value &= ~EIC7700_PWDATA_PD;
+			value |= EIC7700_PWDATA_PU;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			mask |= EIC7700_PWDATA_DS;
+			value &= ~EIC7700_PWDATA_DS;
+			value |= FIELD_PREP(EIC7700_PWDATA_DS,
+					eic7700_drive_strength_from_uA(arg));
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			mask |= EIC7700_PWDATA_IE;
+			if (arg)
+				value |= EIC7700_PWDATA_IE;
+			else
+				value &= ~EIC7700_PWDATA_IE;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			mask |= EIC7700_PWDATA_ST;
+			if (arg)
+				value |= EIC7700_PWDATA_ST;
+			else
+				value &= ~EIC7700_PWDATA_ST;
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	return eic7700_pwdata_rmw(ep, pin, mask, value);
+}
+
+static int eic7700_pinconf_group_set(struct pinctrl_dev *pctldev,
+				     unsigned int gsel,
+				     unsigned long *configs,
+				     unsigned int num_configs)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int pin = ep->desc.pins[gsel].number;
+
+	return eic7700_pinconf_set(pctldev, pin, configs, num_configs);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void eic7700_pinconf_dbg_show(struct pinctrl_dev *pctldev,
+				     struct seq_file *s, unsigned int pin)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	u32 value = readl_relaxed(eic7700_pwdata(ep, pin));
+
+	seq_printf(s, " [0x%02lx]", value & GENMASK(7, 0));
+}
+#else
+#define eic7700_pinconf_dbg_show NULL
+#endif
+
+static const struct pinconf_ops eic7700_pinconf_ops = {
+	.pin_config_get = eic7700_pinconf_get,
+	.pin_config_group_get = eic7700_pinconf_group_get,
+	.pin_config_set = eic7700_pinconf_set,
+	.pin_config_group_set = eic7700_pinconf_group_set,
+	.pin_config_dbg_show = eic7700_pinconf_dbg_show,
+	.is_generic = true,
+};
+
+static int eic7700_pinmux_set(struct eic7700_pinctrl *ep, unsigned int pin,
+			      unsigned long muxdata, enum eic7700_muxtype muxtype)
+{
+	u32 value;
+
+	for (value = 0; muxdata; muxdata >>= 5, value++) {
+		if ((muxdata & GENMASK(4, 0)) == muxtype)
+			break;
+	}
+	if (!muxdata) {
+		dev_err(ep->pctl->dev, "invalid mux %s for pin %s\n",
+			eic7700_muxtype_string[muxtype], pin_get_name(ep->pctl, pin));
+		return -EINVAL;
+	}
+
+	/* only pwdata[18:16] = 0, 1, 2, 3 and 6 are used */
+	if (value == 4)
+		value = 6;
+
+	return eic7700_pwdata_rmw(ep, pin, EIC7700_PWDATA_FUNCSEL,
+				  FIELD_PREP(EIC7700_PWDATA_FUNCSEL, value));
+}
+
+static int eic7700_pinmux_set_mux(struct pinctrl_dev *pctldev,
+				  unsigned int fsel, unsigned int gsel)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
+	enum eic7700_muxtype muxtype;
+
+	if (!func)
+		return -EINVAL;
+
+	muxtype = (uintptr_t)func->data;
+	return eic7700_pinmux_set(ep, ep->desc.pins[gsel].number,
+				  eic7700_pad_muxdata(ep->desc.pins[gsel].drv_data),
+				  muxtype);
+}
+
+static int eic7700_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned int offset)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+	const struct pin_desc *desc = pin_desc_get(pctldev, offset);
+
+	return eic7700_pinmux_set(ep, offset,
+				  eic7700_pad_muxdata(desc->drv_data),
+				  EIC7700_MUX_GPIO);
+}
+
+static int eic7700_gpio_set_direction(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int offset, bool input)
+{
+	struct eic7700_pinctrl *ep = pinctrl_dev_get_drvdata(pctldev);
+
+	return eic7700_pwdata_rmw(ep, offset, EIC7700_PWDATA_IE,
+				  input ? EIC7700_PWDATA_IE : 0);
+}
+
+static const struct pinmux_ops eic7700_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = eic7700_pinmux_set_mux,
+	.gpio_request_enable = eic7700_gpio_request_enable,
+	.gpio_set_direction = eic7700_gpio_set_direction,
+	.strict = true,
+};
+
+static int eic7700_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct eic7700_pinctrl *ep;
+	int ret;
+
+	ep = devm_kzalloc(dev, sizeof(*ep), GFP_KERNEL);
+	if (!ep)
+		return -ENOMEM;
+
+	ep->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ep->base))
+		return PTR_ERR(ep->base);
+
+	ep->desc.name = "eic7700";
+	ep->desc.pins = eic7700_pins;
+	ep->desc.npins = ARRAY_SIZE(eic7700_pins);
+	ep->desc.pctlops = &eic7700_pinctrl_ops;
+	ep->desc.pmxops = &eic7700_pinmux_ops;
+	ep->desc.confops = &eic7700_pinconf_ops;
+	ep->desc.owner = THIS_MODULE;
+	raw_spin_lock_init(&ep->lock);
+
+	ret = devm_mutex_init(dev, &ep->mutex);
+	if (ret)
+		return ret;
+
+	ret = devm_pinctrl_register_and_init(dev, &ep->desc, ep, &ep->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not register pinctrl driver\n");
+
+	return pinctrl_enable(ep->pctl);
+}
+
+static const struct of_device_id eic7700_pinctrl_of_match[] = {
+	{ .compatible = "eswin,eic7700-pinctrl"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, eic7700_pinctrl_of_match);
+
+static struct platform_driver eic7700_pinctrl_driver = {
+	.probe = eic7700_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-eic7700",
+		.of_match_table = eic7700_pinctrl_of_match,
+	},
+};
+module_platform_driver(eic7700_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the ESWIN EIC7700 SoC");
+MODULE_AUTHOR("Emil Renner Berthing <emil.renner.berthing@canonical.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


