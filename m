Return-Path: <linux-gpio+bounces-23322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD6B0660B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CD64566CB1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88D32BE7DC;
	Tue, 15 Jul 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RlTvdNsd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153A2BE64E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604212; cv=none; b=uCvIZnkmRtbnJa3Z0GUyeYrrvsNHHceDR/W2EoaR6HQ/Cx3QoC96FqcH0BD5NalKKTmmUrNN7u+BoPPqqQepWtQUnLJqi36GPP4DSStAIGOxKOII8zLbiObLbn+lT8cOmQ9xaYZi8zL/VAfuEPd8k9jBi7PBkNmtCR2AWvJ5DcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604212; c=relaxed/simple;
	bh=PayarsFKHpBDU3/NqUTz6658EatOgoWKqKzryCXYCDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsQMuXEhpvLoIiyHa9d3kdUu7b0BMIJRWRKjIoV4+Go+3nPSa/XW6MS3IaHY9ahSo6HqLuH19iITnA2c2ztU8VvHuXQRSyNxQkD1GIZkq2xzp3GJnQ3oTDwvdlF5OkWKNSppyn6kdIg5JN3uQnMLJ8Qno2p5XK62gdAx9yON/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RlTvdNsd; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so10222478a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604206; x=1753209006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErTYC03PlDmyo9UYN1MFdCBJtYF3YqWNwobdQFtAubM=;
        b=RlTvdNsdvt9ZuVcV47A8ZwtP+QdbtEJJfBR6E+hZEEiIdIku0mzP86FEhPX6I5EuZw
         WI18TNy4HDuMZKdojwbpn0MSxfxclY0z3eoVZ/SHgcVjjzv0ldtpxKHvpRHIYvzLMaGQ
         7WBNZLJ8gitfjZRA7jtRCvPPfKSIaq7pfz+/zSEeqWKNX3D4V0L6KqUZ137ndE0Qg9rW
         IF3hW67a2DAcrUY0tzekHYh5urlSPlIKsHmMU81DRZ1Ut6kwyIus+X0PKhzLTq4bEO++
         y6kH652kjdHLXWeZhYVkrTyrERcy0+V13hAPvfLlR90uZAgg4uhwyp55/FdA6oaf76Qi
         VNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604206; x=1753209006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErTYC03PlDmyo9UYN1MFdCBJtYF3YqWNwobdQFtAubM=;
        b=CgAHFfRDI97AcUjpfcT6vV4cS3RjXZ4bb99XQoK/DtUDN7ybyLyrqNSXRZL7NVPdLe
         NEp4YKM7/K3EtU4GQ+YGijgozJL1Oi1q4n3W9+5AQ+AokRyfD8VP5IQTLBZwBm6A8tXz
         XiRzlHDfcgazfy3CUmuMq1lF4zbt6bMXDf+MRkS+//6D2eD2aldiTwZbnCS6QYXh0Wfk
         0nqCekCqdXfZkSNUIcyPwjApbh3eJajCK4N5SgpKjLDTLWUsVGgXR+AfzZLAMXD1U4w0
         E0qIpdqbGaleF+9OtgvYfoNQ5ml0QIWBV3IVVANstv3CxbU3hYFBvKSMiFRIdtzVh4fX
         Gs3A==
X-Forwarded-Encrypted: i=1; AJvYcCVG1In1zutidAZbWkdQdIY0k8OG88AXMvpvxa/arm0G5HnA+EcZZPURMCE+YTT0OtVK9aak0kJPJSrI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vInFg4B4EXSUZITDh5RgaF5mU979dI4tNwV4lsikZ/hIr9J6
	bVlpvpgfxJ/sZWL+hDpjrJqNgpTw+4rzB0lmm/mc15UkOQOqw5PX73KMQdP7v2fT/jg=
X-Gm-Gg: ASbGncuQ3gF9t21OT0J+XDfG09UB56SbEvC2Yh+ojJEBGkJEQov5VehSJjV+1uBpaZa
	uMAH2bW7fmtBrWbSs0nWR9NkEf5GsQ7M6BMPNsy+s4C2i3J70/pb3QHYvkjEotAmlk0a9kahibI
	W1ZH0cMIW+qnd4gbG5RFX5lYZgEb49RVZFgAr9DchUFQnCrenghQdsL9eKqids75wlgIJV+jbeY
	h6lrrIByxRBgUQCm4ejLJCSdxabpZ0gLXT6qfTjLBm9+VrugMy4C7GlGbxBjl6KeRDe9RdwALZl
	GrYr83ZSHV0cgfXwWx17gP9cTyHEiL95iMZXOAdJb45uwbDkIDCMz7KHy5RArpc6wyhLvGYwXjn
	VZWe8mmWZiHtw2gmHQiMZvkftgpmKXROqqrz9Kasgh1z8iZRppbxzps+yeZ0o2v0id//2
X-Google-Smtp-Source: AGHT+IFlkY+LBKw26HimvNPVthWYqvHMzEkKQgvQQAFWZQnMXbYp3SwpxjvAbZeVs6TGKgV8trIf7Q==
X-Received: by 2002:aa7:c052:0:b0:60c:3c23:2935 with SMTP id 4fb4d7f45d1cf-612823c4ae9mr232646a12.29.1752604205796;
        Tue, 15 Jul 2025 11:30:05 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d50d6715sm7206846a12.6.2025.07.15.11.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:05 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 2/7] pinctrl: bcm: Add STB family pin controller driver
Date: Tue, 15 Jul 2025 20:31:39 +0200
Message-ID: <6b7554588232107b21049d1a2d7a620d85bebab9.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Ivan T. Ivanov" <iivanov@suse.de>

This driver provide pin muxing and configuration functionality
for BCM2712 SoC used by RPi5. According to [1] this chip is an
instance of the one used in Broadcom STB  product line.

[1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/

Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 drivers/pinctrl/bcm/Kconfig           |   13 +
 drivers/pinctrl/bcm/Makefile          |    1 +
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1195 +++++++++++++++++++++++++
 3 files changed, 1209 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 35b51ce4298e..2e1b8d444f58 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -3,6 +3,19 @@
 # Broadcom pinctrl drivers
 #
 
+config PINCTRL_BRCMSTB
+	tristate "Broadcom STB product line pin controller driver"
+	depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	help
+	  This driver provide pin muxing and configuration functionality
+	  for Broadcom STB product line chipsets. BCM2712 SoC is one of these
+	  chipsets.
+
+	  If M is selected the module will be called pinctrl-brcmstb.
+
 config PINCTRL_BCM281XX
 	bool "Broadcom BCM281xx pinctrl driver"
 	depends on OF && (ARCH_BCM_MOBILE || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 82b868ec1471..5f790c14cc4c 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_BCM6358)		+= pinctrl-bcm6358.o
 obj-$(CONFIG_PINCTRL_BCM6362)		+= pinctrl-bcm6362.o
 obj-$(CONFIG_PINCTRL_BCM6368)		+= pinctrl-bcm6368.o
 obj-$(CONFIG_PINCTRL_BCM63268)		+= pinctrl-bcm63268.o
+obj-$(CONFIG_PINCTRL_BRCMSTB)		+= pinctrl-brcmstb.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
new file mode 100644
index 000000000000..bf9773c3c3ac
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
@@ -0,0 +1,1195 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Broadcom brcmstb GPIO units (pinctrl only)
+ *
+ * Copyright (C) 2024-2025 Ivan T. Ivanov, Andrea della Porta
+ * Copyright (C) 2021-3 Raspberry Pi Ltd.
+ * Copyright (C) 2012 Chris Boot, Simon Arlott, Stephen Warren
+ *
+ * Based heavily on the BCM2835 GPIO & pinctrl driver, which was inspired by:
+ * pinctrl-nomadik.c, please see original file for copyright information
+ * pinctrl-tegra.c, please see original file for copyright information
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define BRCMSTB_PULL_NONE	0
+#define BRCMSTB_PULL_DOWN	1
+#define BRCMSTB_PULL_UP		2
+#define BRCMSTB_PULL_MASK	0x3
+
+#define BRCMSTB_FSEL_COUNT	9
+#define BRCMSTB_FSEL_MASK	0xf
+
+#define FUNC(f) \
+	[func_##f] = #f
+
+#define PIN(i, f1, f2, f3, f4, f5, f6, f7, f8) \
+	[i] = { \
+		.funcs = { \
+			func_##f1, \
+			func_##f2, \
+			func_##f3, \
+			func_##f4, \
+			func_##f5, \
+			func_##f6, \
+			func_##f7, \
+			func_##f8, \
+		}, \
+	}
+
+#define MUX_BIT_VALID		0x8000
+#define PAD_BIT_INVALID		0xffff
+
+#define BIT_TO_REG(b)		(((b) >> 5) << 2)
+#define BIT_TO_SHIFT(b)		((b) & 0x1f)
+
+#define MUX_BIT(muxreg, muxshift) \
+	(MUX_BIT_VALID + ((muxreg) << 5) + ((muxshift) << 2))
+#define PAD_BIT(padreg, padshift) \
+	(((padreg) << 5) + ((padshift) << 1))
+
+#define GPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
+	[n] = { MUX_BIT(muxreg, muxshift), PAD_BIT(padreg, padshift) }
+
+#define EMMC_REGS(n, padreg, padshift) \
+	[n] = { 0, PAD_BIT(padreg, padshift) }
+
+#define AGPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
+	GPIO_REGS(n, muxreg, muxshift, padreg, padshift)
+
+#define SGPIO_REGS(n, muxreg, muxshift) \
+	[(n) + 32] = { MUX_BIT(muxreg, muxshift), PAD_BIT_INVALID }
+
+#define GPIO_PIN(n)		PINCTRL_PIN(n, "gpio" #n)
+#define AGPIO_PIN(n)		PINCTRL_PIN(n, "aon_gpio" #n)
+#define SGPIO_PIN(n)		PINCTRL_PIN((n) + 32, "aon_sgpio" #n)
+
+struct pin_regs {
+	u16 mux_bit;
+	u16 pad_bit;
+};
+
+struct brcmstb_pin_funcs {
+	u8 funcs[BRCMSTB_FSEL_COUNT - 1];
+};
+
+struct brcmstb_pinctrl {
+	struct device *dev;
+	void __iomem *base;
+	struct pinctrl_dev *pctl_dev;
+	struct pinctrl_desc pctl_desc;
+	const struct pin_regs *pin_regs;
+	const struct brcmstb_pin_funcs *pin_funcs;
+	const char *const *gpio_groups;
+	struct pinctrl_gpio_range gpio_range;
+	/* Protect FSEL registers */
+	spinlock_t fsel_lock;
+};
+
+struct brcmstb_pdata {
+	const struct pinctrl_desc *pctl_desc;
+	const struct pinctrl_gpio_range *gpio_range;
+	const struct pin_regs *pin_regs;
+	const struct brcmstb_pin_funcs *pin_funcs;
+};
+
+enum brcmstb_funcs {
+	func_gpio,
+	func_alt1,
+	func_alt2,
+	func_alt3,
+	func_alt4,
+	func_alt5,
+	func_alt6,
+	func_alt7,
+	func_alt8,
+	func_aon_cpu_standbyb,
+	func_aon_fp_4sec_resetb,
+	func_aon_gpclk,
+	func_aon_pwm,
+	func_arm_jtag,
+	func_aud_fs_clk0,
+	func_avs_pmu_bsc,
+	func_bsc_m0,
+	func_bsc_m1,
+	func_bsc_m2,
+	func_bsc_m3,
+	func_clk_observe,
+	func_ctl_hdmi_5v,
+	func_enet0,
+	func_enet0_mii,
+	func_enet0_rgmii,
+	func_ext_sc_clk,
+	func_fl0,
+	func_fl1,
+	func_gpclk0,
+	func_gpclk1,
+	func_gpclk2,
+	func_hdmi_tx0_auto_i2c,
+	func_hdmi_tx0_bsc,
+	func_hdmi_tx1_auto_i2c,
+	func_hdmi_tx1_bsc,
+	func_i2s_in,
+	func_i2s_out,
+	func_ir_in,
+	func_mtsif,
+	func_mtsif_alt,
+	func_mtsif_alt1,
+	func_pdm,
+	func_pkt,
+	func_pm_led_out,
+	func_sc0,
+	func_sd0,
+	func_sd2,
+	func_sd_card_a,
+	func_sd_card_b,
+	func_sd_card_c,
+	func_sd_card_d,
+	func_sd_card_e,
+	func_sd_card_f,
+	func_sd_card_g,
+	func_spdif_out,
+	func_spi_m,
+	func_spi_s,
+	func_sr_edm_sense,
+	func_te0,
+	func_te1,
+	func_tsio,
+	func_uart0,
+	func_uart1,
+	func_uart2,
+	func_usb_pwr,
+	func_usb_vbus,
+	func_uui,
+	func_vc_i2c0,
+	func_vc_i2c3,
+	func_vc_i2c4,
+	func_vc_i2c5,
+	func_vc_i2csl,
+	func_vc_pcm,
+	func_vc_pwm0,
+	func_vc_pwm1,
+	func_vc_spi0,
+	func_vc_spi3,
+	func_vc_spi4,
+	func_vc_spi5,
+	func_vc_uart0,
+	func_vc_uart2,
+	func_vc_uart3,
+	func_vc_uart4,
+	func__,
+	func_count = func__
+};
+
+static const struct pin_regs bcm2712_c0_gpio_pin_regs[] = {
+	GPIO_REGS(0, 0, 0, 7, 7),
+	GPIO_REGS(1, 0, 1, 7, 8),
+	GPIO_REGS(2, 0, 2, 7, 9),
+	GPIO_REGS(3, 0, 3, 7, 10),
+	GPIO_REGS(4, 0, 4, 7, 11),
+	GPIO_REGS(5, 0, 5, 7, 12),
+	GPIO_REGS(6, 0, 6, 7, 13),
+	GPIO_REGS(7, 0, 7, 7, 14),
+	GPIO_REGS(8, 1, 0, 8, 0),
+	GPIO_REGS(9, 1, 1, 8, 1),
+	GPIO_REGS(10, 1, 2, 8, 2),
+	GPIO_REGS(11, 1, 3, 8, 3),
+	GPIO_REGS(12, 1, 4, 8, 4),
+	GPIO_REGS(13, 1, 5, 8, 5),
+	GPIO_REGS(14, 1, 6, 8, 6),
+	GPIO_REGS(15, 1, 7, 8, 7),
+	GPIO_REGS(16, 2, 0, 8, 8),
+	GPIO_REGS(17, 2, 1, 8, 9),
+	GPIO_REGS(18, 2, 2, 8, 10),
+	GPIO_REGS(19, 2, 3, 8, 11),
+	GPIO_REGS(20, 2, 4, 8, 12),
+	GPIO_REGS(21, 2, 5, 8, 13),
+	GPIO_REGS(22, 2, 6, 8, 14),
+	GPIO_REGS(23, 2, 7, 9, 0),
+	GPIO_REGS(24, 3, 0, 9, 1),
+	GPIO_REGS(25, 3, 1, 9, 2),
+	GPIO_REGS(26, 3, 2, 9, 3),
+	GPIO_REGS(27, 3, 3, 9, 4),
+	GPIO_REGS(28, 3, 4, 9, 5),
+	GPIO_REGS(29, 3, 5, 9, 6),
+	GPIO_REGS(30, 3, 6, 9, 7),
+	GPIO_REGS(31, 3, 7, 9, 8),
+	GPIO_REGS(32, 4, 0, 9, 9),
+	GPIO_REGS(33, 4, 1, 9, 10),
+	GPIO_REGS(34, 4, 2, 9, 11),
+	GPIO_REGS(35, 4, 3, 9, 12),
+	GPIO_REGS(36, 4, 4, 9, 13),
+	GPIO_REGS(37, 4, 5, 9, 14),
+	GPIO_REGS(38, 4, 6, 10, 0),
+	GPIO_REGS(39, 4, 7, 10, 1),
+	GPIO_REGS(40, 5, 0, 10, 2),
+	GPIO_REGS(41, 5, 1, 10, 3),
+	GPIO_REGS(42, 5, 2, 10, 4),
+	GPIO_REGS(43, 5, 3, 10, 5),
+	GPIO_REGS(44, 5, 4, 10, 6),
+	GPIO_REGS(45, 5, 5, 10, 7),
+	GPIO_REGS(46, 5, 6, 10, 8),
+	GPIO_REGS(47, 5, 7, 10, 9),
+	GPIO_REGS(48, 6, 0, 10, 10),
+	GPIO_REGS(49, 6, 1, 10, 11),
+	GPIO_REGS(50, 6, 2, 10, 12),
+	GPIO_REGS(51, 6, 3, 10, 13),
+	GPIO_REGS(52, 6, 4, 10, 14),
+	GPIO_REGS(53, 6, 5, 11, 0),
+	EMMC_REGS(54, 11, 1), /* EMMC_CMD */
+	EMMC_REGS(55, 11, 2), /* EMMC_DS */
+	EMMC_REGS(56, 11, 3), /* EMMC_CLK */
+	EMMC_REGS(57, 11, 4), /* EMMC_DAT0 */
+	EMMC_REGS(58, 11, 5), /* EMMC_DAT1 */
+	EMMC_REGS(59, 11, 6), /* EMMC_DAT2 */
+	EMMC_REGS(60, 11, 7), /* EMMC_DAT3 */
+	EMMC_REGS(61, 11, 8), /* EMMC_DAT4 */
+	EMMC_REGS(62, 11, 9), /* EMMC_DAT5 */
+	EMMC_REGS(63, 11, 10), /* EMMC_DAT6 */
+	EMMC_REGS(64, 11, 11), /* EMMC_DAT7 */
+};
+
+static struct pin_regs bcm2712_c0_aon_gpio_pin_regs[] = {
+	AGPIO_REGS(0, 3, 0, 6, 10),
+	AGPIO_REGS(1, 3, 1, 6, 11),
+	AGPIO_REGS(2, 3, 2, 6, 12),
+	AGPIO_REGS(3, 3, 3, 6, 13),
+	AGPIO_REGS(4, 3, 4, 6, 14),
+	AGPIO_REGS(5, 3, 5, 7, 0),
+	AGPIO_REGS(6, 3, 6, 7, 1),
+	AGPIO_REGS(7, 3, 7, 7, 2),
+	AGPIO_REGS(8, 4, 0, 7, 3),
+	AGPIO_REGS(9, 4, 1, 7, 4),
+	AGPIO_REGS(10, 4, 2, 7, 5),
+	AGPIO_REGS(11, 4, 3, 7, 6),
+	AGPIO_REGS(12, 4, 4, 7, 7),
+	AGPIO_REGS(13, 4, 5, 7, 8),
+	AGPIO_REGS(14, 4, 6, 7, 9),
+	AGPIO_REGS(15, 4, 7, 7, 10),
+	AGPIO_REGS(16, 5, 0, 7, 11),
+	SGPIO_REGS(0, 0, 0),
+	SGPIO_REGS(1, 0, 1),
+	SGPIO_REGS(2, 0, 2),
+	SGPIO_REGS(3, 0, 3),
+	SGPIO_REGS(4, 1, 0),
+	SGPIO_REGS(5, 2, 0),
+};
+
+static const struct pinctrl_pin_desc bcm2712_c0_gpio_pins[] = {
+	GPIO_PIN(0),
+	GPIO_PIN(1),
+	GPIO_PIN(2),
+	GPIO_PIN(3),
+	GPIO_PIN(4),
+	GPIO_PIN(5),
+	GPIO_PIN(6),
+	GPIO_PIN(7),
+	GPIO_PIN(8),
+	GPIO_PIN(9),
+	GPIO_PIN(10),
+	GPIO_PIN(11),
+	GPIO_PIN(12),
+	GPIO_PIN(13),
+	GPIO_PIN(14),
+	GPIO_PIN(15),
+	GPIO_PIN(16),
+	GPIO_PIN(17),
+	GPIO_PIN(18),
+	GPIO_PIN(19),
+	GPIO_PIN(20),
+	GPIO_PIN(21),
+	GPIO_PIN(22),
+	GPIO_PIN(23),
+	GPIO_PIN(24),
+	GPIO_PIN(25),
+	GPIO_PIN(26),
+	GPIO_PIN(27),
+	GPIO_PIN(28),
+	GPIO_PIN(29),
+	GPIO_PIN(30),
+	GPIO_PIN(31),
+	GPIO_PIN(32),
+	GPIO_PIN(33),
+	GPIO_PIN(34),
+	GPIO_PIN(35),
+	GPIO_PIN(36),
+	GPIO_PIN(37),
+	GPIO_PIN(38),
+	GPIO_PIN(39),
+	GPIO_PIN(40),
+	GPIO_PIN(41),
+	GPIO_PIN(42),
+	GPIO_PIN(43),
+	GPIO_PIN(44),
+	GPIO_PIN(45),
+	GPIO_PIN(46),
+	GPIO_PIN(47),
+	GPIO_PIN(48),
+	GPIO_PIN(49),
+	GPIO_PIN(50),
+	GPIO_PIN(51),
+	GPIO_PIN(52),
+	GPIO_PIN(53),
+	PINCTRL_PIN(54, "emmc_cmd"),
+	PINCTRL_PIN(55, "emmc_ds"),
+	PINCTRL_PIN(56, "emmc_clk"),
+	PINCTRL_PIN(57, "emmc_dat0"),
+	PINCTRL_PIN(58, "emmc_dat1"),
+	PINCTRL_PIN(59, "emmc_dat2"),
+	PINCTRL_PIN(60, "emmc_dat3"),
+	PINCTRL_PIN(61, "emmc_dat4"),
+	PINCTRL_PIN(62, "emmc_dat5"),
+	PINCTRL_PIN(63, "emmc_dat6"),
+	PINCTRL_PIN(64, "emmc_dat7"),
+};
+
+static struct pinctrl_pin_desc bcm2712_c0_aon_gpio_pins[] = {
+	AGPIO_PIN(0),  AGPIO_PIN(1),  AGPIO_PIN(2),  AGPIO_PIN(3),
+	AGPIO_PIN(4),  AGPIO_PIN(5),  AGPIO_PIN(6),  AGPIO_PIN(7),
+	AGPIO_PIN(8),  AGPIO_PIN(9),  AGPIO_PIN(10), AGPIO_PIN(11),
+	AGPIO_PIN(12), AGPIO_PIN(13), AGPIO_PIN(14), AGPIO_PIN(15),
+	AGPIO_PIN(16), SGPIO_PIN(0),  SGPIO_PIN(1),  SGPIO_PIN(2),
+	SGPIO_PIN(3),  SGPIO_PIN(4),  SGPIO_PIN(5),
+};
+
+static const struct pin_regs bcm2712_d0_gpio_pin_regs[] = {
+	GPIO_REGS(1, 0, 0, 4, 5),
+	GPIO_REGS(2, 0, 1, 4, 6),
+	GPIO_REGS(3, 0, 2, 4, 7),
+	GPIO_REGS(4, 0, 3, 4, 8),
+	GPIO_REGS(10, 0, 4, 4, 9),
+	GPIO_REGS(11, 0, 5, 4, 10),
+	GPIO_REGS(12, 0, 6, 4, 11),
+	GPIO_REGS(13, 0, 7, 4, 12),
+	GPIO_REGS(14, 1, 0, 4, 13),
+	GPIO_REGS(15, 1, 1, 4, 14),
+	GPIO_REGS(18, 1, 2, 5, 0),
+	GPIO_REGS(19, 1, 3, 5, 1),
+	GPIO_REGS(20, 1, 4, 5, 2),
+	GPIO_REGS(21, 1, 5, 5, 3),
+	GPIO_REGS(22, 1, 6, 5, 4),
+	GPIO_REGS(23, 1, 7, 5, 5),
+	GPIO_REGS(24, 2, 0, 5, 6),
+	GPIO_REGS(25, 2, 1, 5, 7),
+	GPIO_REGS(26, 2, 2, 5, 8),
+	GPIO_REGS(27, 2, 3, 5, 9),
+	GPIO_REGS(28, 2, 4, 5, 10),
+	GPIO_REGS(29, 2, 5, 5, 11),
+	GPIO_REGS(30, 2, 6, 5, 12),
+	GPIO_REGS(31, 2, 7, 5, 13),
+	GPIO_REGS(32, 3, 0, 5, 14),
+	GPIO_REGS(33, 3, 1, 6, 0),
+	GPIO_REGS(34, 3, 2, 6, 1),
+	GPIO_REGS(35, 3, 3, 6, 2),
+	EMMC_REGS(36, 6, 3), /* EMMC_CMD */
+	EMMC_REGS(37, 6, 4), /* EMMC_DS */
+	EMMC_REGS(38, 6, 5), /* EMMC_CLK */
+	EMMC_REGS(39, 6, 6), /* EMMC_DAT0 */
+	EMMC_REGS(40, 6, 7), /* EMMC_DAT1 */
+	EMMC_REGS(41, 6, 8), /* EMMC_DAT2 */
+	EMMC_REGS(42, 6, 9), /* EMMC_DAT3 */
+	EMMC_REGS(43, 6, 10), /* EMMC_DAT4 */
+	EMMC_REGS(44, 6, 11), /* EMMC_DAT5 */
+	EMMC_REGS(45, 6, 12), /* EMMC_DAT6 */
+	EMMC_REGS(46, 6, 13), /* EMMC_DAT7 */
+};
+
+static struct pin_regs bcm2712_d0_aon_gpio_pin_regs[] = {
+	AGPIO_REGS(0, 3, 0, 5, 9),
+	AGPIO_REGS(1, 3, 1, 5, 10),
+	AGPIO_REGS(2, 3, 2, 5, 11),
+	AGPIO_REGS(3, 3, 3, 5, 12),
+	AGPIO_REGS(4, 3, 4, 5, 13),
+	AGPIO_REGS(5, 3, 5, 5, 14),
+	AGPIO_REGS(6, 3, 6, 6, 0),
+	AGPIO_REGS(8, 3, 7, 6, 1),
+	AGPIO_REGS(9, 4, 0, 6, 2),
+	AGPIO_REGS(12, 4, 1, 6, 3),
+	AGPIO_REGS(13, 4, 2, 6, 4),
+	AGPIO_REGS(14, 4, 3, 6, 5),
+	SGPIO_REGS(0, 0, 0),
+	SGPIO_REGS(1, 0, 1),
+	SGPIO_REGS(2, 0, 2),
+	SGPIO_REGS(3, 0, 3),
+	SGPIO_REGS(4, 1, 0),
+	SGPIO_REGS(5, 2, 0),
+};
+
+static const struct pinctrl_pin_desc bcm2712_d0_gpio_pins[] = {
+	GPIO_PIN(1),
+	GPIO_PIN(2),
+	GPIO_PIN(3),
+	GPIO_PIN(4),
+	GPIO_PIN(10),
+	GPIO_PIN(11),
+	GPIO_PIN(12),
+	GPIO_PIN(13),
+	GPIO_PIN(14),
+	GPIO_PIN(15),
+	GPIO_PIN(18),
+	GPIO_PIN(19),
+	GPIO_PIN(20),
+	GPIO_PIN(21),
+	GPIO_PIN(22),
+	GPIO_PIN(23),
+	GPIO_PIN(24),
+	GPIO_PIN(25),
+	GPIO_PIN(26),
+	GPIO_PIN(27),
+	GPIO_PIN(28),
+	GPIO_PIN(29),
+	GPIO_PIN(30),
+	GPIO_PIN(31),
+	GPIO_PIN(32),
+	GPIO_PIN(33),
+	GPIO_PIN(34),
+	GPIO_PIN(35),
+	PINCTRL_PIN(36, "emmc_cmd"),
+	PINCTRL_PIN(37, "emmc_ds"),
+	PINCTRL_PIN(38, "emmc_clk"),
+	PINCTRL_PIN(39, "emmc_dat0"),
+	PINCTRL_PIN(40, "emmc_dat1"),
+	PINCTRL_PIN(41, "emmc_dat2"),
+	PINCTRL_PIN(42, "emmc_dat3"),
+	PINCTRL_PIN(43, "emmc_dat4"),
+	PINCTRL_PIN(44, "emmc_dat5"),
+	PINCTRL_PIN(45, "emmc_dat6"),
+	PINCTRL_PIN(46, "emmc_dat7"),
+};
+
+static struct pinctrl_pin_desc bcm2712_d0_aon_gpio_pins[] = {
+	AGPIO_PIN(0),  AGPIO_PIN(1),  AGPIO_PIN(2), AGPIO_PIN(3), AGPIO_PIN(4),
+	AGPIO_PIN(5),  AGPIO_PIN(6),  AGPIO_PIN(8), AGPIO_PIN(9), AGPIO_PIN(12),
+	AGPIO_PIN(13), AGPIO_PIN(14), SGPIO_PIN(0), SGPIO_PIN(1), SGPIO_PIN(2),
+	SGPIO_PIN(3),  SGPIO_PIN(4),  SGPIO_PIN(5),
+};
+
+static const char * const brcmstb_func_names[] = {
+	FUNC(gpio),
+	FUNC(alt1),
+	FUNC(alt2),
+	FUNC(alt3),
+	FUNC(alt4),
+	FUNC(alt5),
+	FUNC(alt6),
+	FUNC(alt7),
+	FUNC(alt8),
+	FUNC(aon_cpu_standbyb),
+	FUNC(aon_fp_4sec_resetb),
+	FUNC(aon_gpclk),
+	FUNC(aon_pwm),
+	FUNC(arm_jtag),
+	FUNC(aud_fs_clk0),
+	FUNC(avs_pmu_bsc),
+	FUNC(bsc_m0),
+	FUNC(bsc_m1),
+	FUNC(bsc_m2),
+	FUNC(bsc_m3),
+	FUNC(clk_observe),
+	FUNC(ctl_hdmi_5v),
+	FUNC(enet0),
+	FUNC(enet0_mii),
+	FUNC(enet0_rgmii),
+	FUNC(ext_sc_clk),
+	FUNC(fl0),
+	FUNC(fl1),
+	FUNC(gpclk0),
+	FUNC(gpclk1),
+	FUNC(gpclk2),
+	FUNC(hdmi_tx0_auto_i2c),
+	FUNC(hdmi_tx0_bsc),
+	FUNC(hdmi_tx1_auto_i2c),
+	FUNC(hdmi_tx1_bsc),
+	FUNC(i2s_in),
+	FUNC(i2s_out),
+	FUNC(ir_in),
+	FUNC(mtsif),
+	FUNC(mtsif_alt),
+	FUNC(mtsif_alt1),
+	FUNC(pdm),
+	FUNC(pkt),
+	FUNC(pm_led_out),
+	FUNC(sc0),
+	FUNC(sd0),
+	FUNC(sd2),
+	FUNC(sd_card_a),
+	FUNC(sd_card_b),
+	FUNC(sd_card_c),
+	FUNC(sd_card_d),
+	FUNC(sd_card_e),
+	FUNC(sd_card_f),
+	FUNC(sd_card_g),
+	FUNC(spdif_out),
+	FUNC(spi_m),
+	FUNC(spi_s),
+	FUNC(sr_edm_sense),
+	FUNC(te0),
+	FUNC(te1),
+	FUNC(tsio),
+	FUNC(uart0),
+	FUNC(uart1),
+	FUNC(uart2),
+	FUNC(usb_pwr),
+	FUNC(usb_vbus),
+	FUNC(uui),
+	FUNC(vc_i2c0),
+	FUNC(vc_i2c3),
+	FUNC(vc_i2c4),
+	FUNC(vc_i2c5),
+	FUNC(vc_i2csl),
+	FUNC(vc_pcm),
+	FUNC(vc_pwm0),
+	FUNC(vc_pwm1),
+	FUNC(vc_spi0),
+	FUNC(vc_spi3),
+	FUNC(vc_spi4),
+	FUNC(vc_spi5),
+	FUNC(vc_uart0),
+	FUNC(vc_uart2),
+	FUNC(vc_uart3),
+	FUNC(vc_uart4),
+};
+
+static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] = {
+	PIN(0, ir_in, vc_spi0, vc_uart3, vc_i2c3, te0, vc_i2c0, _, _),
+	PIN(1, vc_pwm0, vc_spi0, vc_uart3, vc_i2c3, te1, aon_pwm, vc_i2c0, vc_pwm1),
+	PIN(2, vc_pwm0, vc_spi0, vc_uart3, ctl_hdmi_5v, fl0, aon_pwm, ir_in, vc_pwm1),
+	PIN(3, ir_in, vc_spi0, vc_uart3, aon_fp_4sec_resetb, fl1, sd_card_g, aon_gpclk, _),
+	PIN(4, gpclk0, vc_spi0, vc_i2csl, aon_gpclk, pm_led_out, aon_pwm, sd_card_g, vc_pwm0),
+	PIN(5, gpclk1, ir_in, vc_i2csl, clk_observe, aon_pwm, sd_card_g, vc_pwm0, _),
+	PIN(6, uart1, vc_uart4, gpclk2, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
+	PIN(7, uart1, vc_uart4, gpclk0, aon_pwm, vc_uart0, vc_spi3, _, _),
+	PIN(8, uart1, vc_uart4, vc_i2csl, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
+	PIN(9, uart1, vc_uart4, vc_i2csl, aon_pwm, vc_uart0, vc_spi3, _, _),
+	PIN(10, tsio, ctl_hdmi_5v, sc0, spdif_out, vc_spi5, usb_pwr, aon_gpclk, sd_card_f),
+	PIN(11, tsio, uart0, sc0, aud_fs_clk0, vc_spi5, usb_vbus, vc_uart2, sd_card_f),
+	PIN(12, tsio, uart0, vc_uart0, tsio, vc_spi5, usb_pwr, vc_uart2, sd_card_f),
+	PIN(13, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
+	PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
+	PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, aon_pwm, aon_gpclk, _),
+	PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, usb_pwr, aud_fs_clk0, _),
+};
+
+static const struct brcmstb_pin_funcs bcm2712_c0_gpio_pin_funcs[] = {
+	PIN(0, bsc_m3, vc_i2c0, gpclk0, enet0, vc_pwm1, vc_spi0, ir_in, _),
+	PIN(1, bsc_m3, vc_i2c0, gpclk1, enet0, vc_pwm1, sr_edm_sense, vc_spi0, vc_uart3),
+	PIN(2, pdm, i2s_in, gpclk2, vc_spi4, pkt, vc_spi0, vc_uart3, _),
+	PIN(3, pdm, i2s_in, vc_spi4, pkt, vc_spi0, vc_uart3, _, _),
+	PIN(4, pdm, i2s_in, arm_jtag, vc_spi4, pkt, vc_spi0, vc_uart3, _),
+	PIN(5, pdm, vc_i2c3, arm_jtag, sd_card_e, vc_spi4, pkt, vc_pcm, vc_i2c5),
+	PIN(6, pdm, vc_i2c3, arm_jtag, sd_card_e, vc_spi4, pkt, vc_pcm, vc_i2c5),
+	PIN(7, i2s_out, spdif_out, arm_jtag, sd_card_e, vc_i2c3, enet0_rgmii, vc_pcm, vc_spi4),
+	PIN(8, i2s_out, aud_fs_clk0, arm_jtag, sd_card_e, vc_i2c3, enet0_mii, vc_pcm, vc_spi4),
+	PIN(9, i2s_out, aud_fs_clk0, arm_jtag, sd_card_e, enet0_mii, sd_card_c, vc_spi4, _),
+	PIN(10, bsc_m3, mtsif_alt1, i2s_in, i2s_out, vc_spi5, enet0_mii, sd_card_c, vc_spi4),
+	PIN(11, bsc_m3, mtsif_alt1, i2s_in, i2s_out, vc_spi5, enet0_mii, sd_card_c, vc_spi4),
+	PIN(12, spi_s, mtsif_alt1, i2s_in, i2s_out, vc_spi5, vc_i2csl, sd0, sd_card_d),
+	PIN(13, spi_s, mtsif_alt1, i2s_out, usb_vbus, vc_spi5, vc_i2csl, sd0, sd_card_d),
+	PIN(14, spi_s, vc_i2csl, enet0_rgmii, arm_jtag, vc_spi5, vc_pwm0, vc_i2c4, sd_card_d),
+	PIN(15, spi_s, vc_i2csl, vc_spi3, arm_jtag, vc_pwm0, vc_i2c4, gpclk0, _),
+	PIN(16, sd_card_b, i2s_out, vc_spi3, i2s_in, sd0, enet0_rgmii, gpclk1, _),
+	PIN(17, sd_card_b, i2s_out, vc_spi3, i2s_in, ext_sc_clk, sd0, enet0_rgmii, gpclk2),
+	PIN(18, sd_card_b, i2s_out, vc_spi3, i2s_in, sd0, enet0_rgmii, vc_pwm1, _),
+	PIN(19, sd_card_b, usb_pwr, vc_spi3, pkt, spdif_out, sd0, ir_in, vc_pwm1),
+	PIN(20, sd_card_b, uui, vc_uart0, arm_jtag, uart2, usb_pwr, vc_pcm, vc_uart4),
+	PIN(21, usb_pwr, uui, vc_uart0, arm_jtag, uart2, sd_card_b, vc_pcm, vc_uart4),
+	PIN(22, usb_pwr, enet0, vc_uart0, mtsif, uart2, usb_vbus, vc_pcm, vc_i2c5),
+	PIN(23, usb_vbus, enet0, vc_uart0, mtsif, uart2, i2s_out, vc_pcm, vc_i2c5),
+	PIN(24, mtsif, pkt, uart0, enet0_rgmii, enet0_rgmii, vc_i2c4, vc_uart3, _),
+	PIN(25, mtsif, pkt, sc0, uart0, enet0_rgmii, enet0_rgmii, vc_i2c4, vc_uart3),
+	PIN(26, mtsif, pkt, sc0, uart0, enet0_rgmii, vc_uart4, vc_spi5, _),
+	PIN(27, mtsif, pkt, sc0, uart0, enet0_rgmii, vc_uart4, vc_spi5, _),
+	PIN(28, mtsif, pkt, sc0, enet0_rgmii, vc_uart4, vc_spi5, _, _),
+	PIN(29, mtsif, pkt, sc0, enet0_rgmii, vc_uart4, vc_spi5, _, _),
+	PIN(30, mtsif, pkt, sc0, sd2, enet0_rgmii, gpclk0, vc_pwm0, _),
+	PIN(31, mtsif, pkt, sc0, sd2, enet0_rgmii, vc_spi3, vc_pwm0, _),
+	PIN(32, mtsif, pkt, sc0, sd2, enet0_rgmii, vc_spi3, vc_uart3, _),
+	PIN(33, mtsif, pkt, sd2, enet0_rgmii, vc_spi3, vc_uart3, _, _),
+	PIN(34, mtsif, pkt, ext_sc_clk, sd2, enet0_rgmii, vc_spi3, vc_i2c5, _),
+	PIN(35, mtsif, pkt, sd2, enet0_rgmii, vc_spi3, vc_i2c5, _, _),
+	PIN(36, sd0, mtsif, sc0, i2s_in, vc_uart3, vc_uart2, _, _),
+	PIN(37, sd0, mtsif, sc0, vc_spi0, i2s_in, vc_uart3, vc_uart2, _),
+	PIN(38, sd0, mtsif_alt, sc0, vc_spi0, i2s_in, vc_uart3, vc_uart2, _),
+	PIN(39, sd0, mtsif_alt, sc0, vc_spi0, vc_uart3, vc_uart2, _, _),
+	PIN(40, sd0, mtsif_alt, sc0, vc_spi0, bsc_m3, _, _, _),
+	PIN(41, sd0, mtsif_alt, sc0, vc_spi0, bsc_m3, _, _, _),
+	PIN(42, vc_spi0, mtsif_alt, vc_i2c0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
+	PIN(43, vc_spi0, mtsif_alt, vc_i2c0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
+	PIN(44, vc_spi0, mtsif_alt, enet0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
+	PIN(45, vc_spi0, mtsif_alt, enet0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
+	PIN(46, vc_spi0, mtsif_alt, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m, _),
+	PIN(47, enet0, mtsif_alt, i2s_out, mtsif_alt1, arm_jtag, _, _, _),
+	PIN(48, sc0, usb_pwr, spdif_out, mtsif, _, _, _, _),
+	PIN(49, sc0, usb_pwr, aud_fs_clk0, mtsif, _, _, _, _),
+	PIN(50, sc0, usb_vbus, sc0, _, _, _, _, _),
+	PIN(51, sc0, enet0, sc0, sr_edm_sense, _, _, _, _),
+	PIN(52, sc0, enet0, vc_pwm1, _, _, _, _, _),
+	PIN(53, sc0, enet0_rgmii, ext_sc_clk, _, _, _, _, _),
+};
+
+static const struct brcmstb_pin_funcs bcm2712_d0_aon_gpio_pin_funcs[] = {
+	PIN(0, ir_in, vc_spi0, vc_uart0, vc_i2c3, uart0, vc_i2c0, _, _),
+	PIN(1, vc_pwm0, vc_spi0, vc_uart0, vc_i2c3, uart0, aon_pwm, vc_i2c0, vc_pwm1),
+	PIN(2, vc_pwm0, vc_spi0, vc_uart0, ctl_hdmi_5v, uart0, aon_pwm, ir_in, vc_pwm1),
+	PIN(3, ir_in, vc_spi0, vc_uart0, uart0, sd_card_g, aon_gpclk, _, _),
+	PIN(4, gpclk0, vc_spi0, pm_led_out, aon_pwm, sd_card_g, vc_pwm0, _, _),
+	PIN(5, gpclk1, ir_in, aon_pwm, sd_card_g, vc_pwm0, _, _, _),
+	PIN(6, uart1, vc_uart2, ctl_hdmi_5v, gpclk2, vc_spi3, _, _, _),
+	PIN(7, _, _, _, _, _, _, _, _), /* non-existent on D0 silicon */
+	PIN(8, uart1, vc_uart2, ctl_hdmi_5v, vc_spi0, vc_spi3, _, _, _),
+	PIN(9, uart1, vc_uart2, vc_uart0, aon_pwm, vc_spi0, vc_uart2, vc_spi3, _),
+	PIN(10, _, _, _, _, _, _, _, _), /* non-existent on D0 silicon */
+	PIN(11, _, _, _, _, _, _, _, _), /* non-existent on D0 silicon */
+	PIN(12, uart1, vc_uart2, vc_uart0, vc_spi0, usb_pwr, vc_uart2, vc_spi3, _),
+	PIN(13, bsc_m1, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3, _),
+	PIN(14, bsc_m1, aon_gpclk, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3),
+};
+
+static const struct brcmstb_pin_funcs bcm2712_d0_gpio_pin_funcs[] = {
+	PIN(1, vc_i2c0, usb_pwr, gpclk0, sd_card_e, vc_spi3, sr_edm_sense, vc_spi0, vc_uart0),
+	PIN(2, vc_i2c0, usb_pwr, gpclk1, sd_card_e, vc_spi3, clk_observe, vc_spi0, vc_uart0),
+	PIN(3, vc_i2c3, usb_vbus, gpclk2, sd_card_e, vc_spi3, vc_spi0, vc_uart0, _),
+	PIN(4, vc_i2c3, vc_pwm1, vc_spi3, sd_card_e, vc_spi3, vc_spi0, vc_uart0, _),
+	PIN(10, bsc_m3, vc_pwm1, vc_spi3, sd_card_e, vc_spi3, gpclk0, _, _),
+	PIN(11, bsc_m3, vc_spi3, clk_observe, sd_card_c, gpclk1, _, _, _),
+	PIN(12, spi_s, vc_spi3, sd_card_c, sd_card_d, _, _, _, _),
+	PIN(13, spi_s, vc_spi3, sd_card_c, sd_card_d, _, _, _, _),
+	PIN(14, spi_s, uui, arm_jtag, vc_pwm0, vc_i2c0, sd_card_d, _, _),
+	PIN(15, spi_s, uui, arm_jtag, vc_pwm0, vc_i2c0, gpclk0, _, _),
+	PIN(18, sd_card_f, vc_pwm1, _, _, _, _, _, _),
+	PIN(19, sd_card_f, usb_pwr, vc_pwm1, _, _, _, _, _),
+	PIN(20, vc_i2c3, uui, vc_uart0, arm_jtag, vc_uart2, _, _, _),
+	PIN(21, vc_i2c3, uui, vc_uart0, arm_jtag, vc_uart2, _, _, _),
+	PIN(22, sd_card_f, vc_uart0, vc_i2c3, _, _, _, _, _),
+	PIN(23, vc_uart0, vc_i2c3, _, _, _, _, _, _),
+	PIN(24, sd_card_b, vc_spi0, arm_jtag, uart0, usb_pwr, vc_uart2, vc_uart0, _),
+	PIN(25, sd_card_b, vc_spi0, arm_jtag, uart0, usb_pwr, vc_uart2, vc_uart0, _),
+	PIN(26, sd_card_b, vc_spi0, arm_jtag, uart0, usb_vbus, vc_uart2, vc_spi0, _),
+	PIN(27, sd_card_b, vc_spi0, arm_jtag, uart0, vc_uart2, vc_spi0, _, _),
+	PIN(28, sd_card_b, vc_spi0, arm_jtag, vc_i2c0, vc_spi0, _, _, _),
+	PIN(29, arm_jtag, vc_i2c0, vc_spi0, _, _, _, _, _),
+	PIN(30, sd2, gpclk0, vc_pwm0, _, _, _, _, _),
+	PIN(31, sd2, vc_spi3, vc_pwm0, _, _, _, _, _),
+	PIN(32, sd2, vc_spi3, vc_uart3, _, _, _, _, _),
+	PIN(33, sd2, vc_spi3, vc_uart3, _, _, _, _, _),
+	PIN(34, sd2, vc_spi3, vc_i2c5, _, _, _, _, _),
+	PIN(35, sd2, vc_spi3, vc_i2c5, _, _, _, _, _),
+};
+
+static inline u32 brcmstb_reg_rd(struct brcmstb_pinctrl *pc, unsigned int reg)
+{
+	return readl(pc->base + reg);
+}
+
+static inline void brcmstb_reg_wr(struct brcmstb_pinctrl *pc, unsigned int reg,
+				  u32 val)
+{
+	writel(val, pc->base + reg);
+}
+
+static enum brcmstb_funcs brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
+						   unsigned int pin)
+{
+	u32 bit = pc->pin_regs[pin].mux_bit;
+	enum brcmstb_funcs func;
+	int fsel;
+	u32 val;
+
+	if (!bit)
+		return func_gpio;
+
+	bit &= ~MUX_BIT_VALID;
+
+	val = brcmstb_reg_rd(pc, BIT_TO_REG(bit));
+	fsel = (val >> BIT_TO_SHIFT(bit)) & BRCMSTB_FSEL_MASK;
+	func = pc->pin_funcs[pin].funcs[fsel];
+
+	if (func >= func_count)
+		func = (enum brcmstb_funcs)fsel;
+
+	dev_dbg(pc->dev, "get %04x: %08x (%u => %s)\n",
+		BIT_TO_REG(bit), val, pin,
+		brcmstb_func_names[func]);
+
+	return func;
+}
+
+static int brcmstb_pinctrl_fsel_set(struct brcmstb_pinctrl *pc,
+				    unsigned int pin, enum brcmstb_funcs func)
+{
+	u32 bit = pc->pin_regs[pin].mux_bit, val;
+	const u8 *pin_funcs;
+	unsigned long flags;
+	int fsel;
+	int cur;
+	int i;
+
+	if (!bit || func >= func_count)
+		return -EINVAL;
+
+	bit &= ~MUX_BIT_VALID;
+
+	fsel = BRCMSTB_FSEL_COUNT;
+
+	if (func >= BRCMSTB_FSEL_COUNT) {
+		/* Convert to an fsel number */
+		pin_funcs = pc->pin_funcs[pin].funcs;
+		for (i = 1; i < BRCMSTB_FSEL_COUNT; i++) {
+			if (pin_funcs[i - 1] == func) {
+				fsel = i;
+				break;
+			}
+		}
+	} else {
+		fsel = (enum brcmstb_funcs)func;
+	}
+
+	if (fsel >= BRCMSTB_FSEL_COUNT)
+		return -EINVAL;
+
+	spin_lock_irqsave(&pc->fsel_lock, flags);
+
+	val = brcmstb_reg_rd(pc, BIT_TO_REG(bit));
+	cur = (val >> BIT_TO_SHIFT(bit)) & BRCMSTB_FSEL_MASK;
+
+	dev_dbg(pc->dev, "read %04x: %08x (%u => %s)\n",
+		BIT_TO_REG(bit), val, pin,
+		brcmstb_func_names[cur]);
+
+	if (cur != fsel) {
+		val &= ~(BRCMSTB_FSEL_MASK << BIT_TO_SHIFT(bit));
+		val |= fsel << BIT_TO_SHIFT(bit);
+
+		dev_dbg(pc->dev, "write %04x: %08x (%u <= %s)\n",
+			BIT_TO_REG(bit), val, pin,
+			brcmstb_func_names[fsel]);
+		brcmstb_reg_wr(pc, BIT_TO_REG(bit), val);
+	}
+
+	spin_unlock_irqrestore(&pc->fsel_lock, flags);
+
+	return 0;
+}
+
+static int brcmstb_pctl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	return pc->pctl_desc.npins;
+}
+
+static const char *brcmstb_pctl_get_group_name(struct pinctrl_dev *pctldev,
+					       unsigned int selector)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	return pc->gpio_groups[selector];
+}
+
+static int brcmstb_pctl_get_group_pins(struct pinctrl_dev *pctldev,
+				       unsigned int selector,
+				       const unsigned int **pins,
+				       unsigned int *num_pins)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &pc->pctl_desc.pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
+				      struct seq_file *s, unsigned int offset)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	enum brcmstb_funcs fsel = brcmstb_pinctrl_fsel_get(pc, offset);
+	const char *fname = brcmstb_func_names[fsel];
+
+	seq_printf(s, "function %s", fname);
+}
+
+static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
+				     struct pinctrl_map *maps,
+				     unsigned int num_maps)
+{
+	int i;
+
+	for (i = 0; i < num_maps; i++)
+		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
+			kfree(maps[i].data.configs.configs);
+
+	kfree(maps);
+}
+
+static const struct pinctrl_ops brcmstb_pctl_ops = {
+	.get_groups_count = brcmstb_pctl_get_groups_count,
+	.get_group_name = brcmstb_pctl_get_group_name,
+	.get_group_pins = brcmstb_pctl_get_group_pins,
+	.pin_dbg_show = brcmstb_pctl_pin_dbg_show,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = brcmstb_pctl_dt_free_map,
+};
+
+static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable by setting to GPIO */
+	return brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
+}
+
+static int brcmstb_pmx_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return func_count;
+}
+
+static const char *brcmstb_pmx_get_function_name(struct pinctrl_dev *pctldev,
+						 unsigned int selector)
+{
+	return (selector < func_count) ? brcmstb_func_names[selector] : NULL;
+}
+
+static int brcmstb_pmx_get_function_groups(struct pinctrl_dev *pctldev,
+					   unsigned int selector,
+					   const char *const **groups,
+					   unsigned *const num_groups)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pc->gpio_groups;
+	*num_groups = pc->pctl_desc.npins;
+
+	return 0;
+}
+
+static int brcmstb_pmx_set(struct pinctrl_dev *pctldev,
+			   unsigned int func_selector,
+			   unsigned int group_selector)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	const struct pinctrl_desc *pctldesc = &pc->pctl_desc;
+	const struct pinctrl_pin_desc *pindesc;
+
+	if (group_selector >= pctldesc->npins)
+		return -EINVAL;
+
+	pindesc = &pctldesc->pins[group_selector];
+	return brcmstb_pinctrl_fsel_set(pc, pindesc->number, func_selector);
+}
+
+static int brcmstb_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
+					   struct pinctrl_gpio_range *range,
+					   unsigned int pin)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	return brcmstb_pinctrl_fsel_set(pc, pin, func_gpio);
+}
+
+static void brcmstb_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
+					  struct pinctrl_gpio_range *range,
+					  unsigned int offset)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable by setting to GPIO */
+	(void)brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
+}
+
+static const struct pinmux_ops brcmstb_pmx_ops = {
+	.free = brcmstb_pmx_free,
+	.get_functions_count = brcmstb_pmx_get_functions_count,
+	.get_function_name = brcmstb_pmx_get_function_name,
+	.get_function_groups = brcmstb_pmx_get_function_groups,
+	.set_mux = brcmstb_pmx_set,
+	.gpio_request_enable = brcmstb_pmx_gpio_request_enable,
+	.gpio_disable_free = brcmstb_pmx_gpio_disable_free,
+};
+
+static unsigned int brcmstb_pull_config_get(struct brcmstb_pinctrl *pc,
+					    unsigned int pin)
+{
+	u32 bit = pc->pin_regs[pin].pad_bit, val;
+
+	if (bit == PAD_BIT_INVALID)
+		return BRCMSTB_PULL_NONE;
+
+	val = brcmstb_reg_rd(pc, BIT_TO_REG(bit));
+	return (val >> BIT_TO_SHIFT(bit)) & BRCMSTB_PULL_MASK;
+}
+
+static int brcmstb_pull_config_set(struct brcmstb_pinctrl *pc,
+				   unsigned int pin, unsigned int arg)
+{
+	u32 bit = pc->pin_regs[pin].pad_bit, val;
+	unsigned long flags;
+
+	if (bit == PAD_BIT_INVALID) {
+		dev_warn(pc->dev, "Can't set pulls for %s\n",
+			 pc->gpio_groups[pin]);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&pc->fsel_lock, flags);
+
+	val = brcmstb_reg_rd(pc, BIT_TO_REG(bit));
+	val &= ~(BRCMSTB_PULL_MASK << BIT_TO_SHIFT(bit));
+	val |= (arg << BIT_TO_SHIFT(bit));
+	brcmstb_reg_wr(pc, BIT_TO_REG(bit), val);
+
+	spin_unlock_irqrestore(&pc->fsel_lock, flags);
+
+	return 0;
+}
+
+static int brcmstb_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			       unsigned long *config)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u32 arg;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_NONE);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_DOWN);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = (brcmstb_pull_config_get(pc, pin) == BRCMSTB_PULL_UP);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int brcmstb_pinconf_set(struct pinctrl_dev *pctldev,
+			       unsigned int pin, unsigned long *configs,
+			       unsigned int num_configs)
+{
+	struct brcmstb_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	int ret = 0;
+	u32 param;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			ret = brcmstb_pull_config_set(pc, pin, BRCMSTB_PULL_NONE);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			ret = brcmstb_pull_config_set(pc, pin, BRCMSTB_PULL_DOWN);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			ret = brcmstb_pull_config_set(pc, pin, BRCMSTB_PULL_UP);
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	return ret;
+}
+
+static const struct pinconf_ops brcmstb_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = brcmstb_pinconf_get,
+	.pin_config_set = brcmstb_pinconf_set,
+};
+
+static const struct pinctrl_desc bcm2712_c0_pinctrl_desc = {
+	.name = "pinctrl-bcm2712",
+	.pins = bcm2712_c0_gpio_pins,
+	.npins = ARRAY_SIZE(bcm2712_c0_gpio_pins),
+	.pctlops = &brcmstb_pctl_ops,
+	.pmxops = &brcmstb_pmx_ops,
+	.confops = &brcmstb_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static const struct pinctrl_desc bcm2712_c0_aon_pinctrl_desc = {
+	.name = "aon-pinctrl-bcm2712",
+	.pins = bcm2712_c0_aon_gpio_pins,
+	.npins = ARRAY_SIZE(bcm2712_c0_aon_gpio_pins),
+	.pctlops = &brcmstb_pctl_ops,
+	.pmxops = &brcmstb_pmx_ops,
+	.confops = &brcmstb_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static const struct pinctrl_desc bcm2712_d0_pinctrl_desc = {
+	.name = "pinctrl-bcm2712",
+	.pins = bcm2712_d0_gpio_pins,
+	.npins = ARRAY_SIZE(bcm2712_d0_gpio_pins),
+	.pctlops = &brcmstb_pctl_ops,
+	.pmxops = &brcmstb_pmx_ops,
+	.confops = &brcmstb_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static const struct pinctrl_desc bcm2712_d0_aon_pinctrl_desc = {
+	.name = "aon-pinctrl-bcm2712",
+	.pins = bcm2712_d0_aon_gpio_pins,
+	.npins = ARRAY_SIZE(bcm2712_d0_aon_gpio_pins),
+	.pctlops = &brcmstb_pctl_ops,
+	.pmxops = &brcmstb_pmx_ops,
+	.confops = &brcmstb_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static const struct pinctrl_gpio_range bcm2712_c0_pinctrl_gpio_range = {
+	.name = "pinctrl-bcm2712",
+	.npins = ARRAY_SIZE(bcm2712_c0_gpio_pins),
+};
+
+static const struct pinctrl_gpio_range bcm2712_c0_aon_pinctrl_gpio_range = {
+	.name = "aon-pinctrl-bcm2712",
+	.npins = ARRAY_SIZE(bcm2712_c0_aon_gpio_pins),
+};
+
+static const struct pinctrl_gpio_range bcm2712_d0_pinctrl_gpio_range = {
+	.name = "pinctrl-bcm2712",
+	.npins = ARRAY_SIZE(bcm2712_d0_gpio_pins),
+};
+
+static const struct pinctrl_gpio_range bcm2712_d0_aon_pinctrl_gpio_range = {
+	.name = "aon-pinctrl-bcm2712",
+	.npins = ARRAY_SIZE(bcm2712_d0_aon_gpio_pins),
+};
+
+static const struct brcmstb_pdata bcm2712_c0_pdata = {
+	.pctl_desc = &bcm2712_c0_pinctrl_desc,
+	.gpio_range = &bcm2712_c0_pinctrl_gpio_range,
+	.pin_regs = bcm2712_c0_gpio_pin_regs,
+	.pin_funcs = bcm2712_c0_gpio_pin_funcs,
+};
+
+static const struct brcmstb_pdata bcm2712_c0_aon_pdata = {
+	.pctl_desc = &bcm2712_c0_aon_pinctrl_desc,
+	.gpio_range = &bcm2712_c0_aon_pinctrl_gpio_range,
+	.pin_regs = bcm2712_c0_aon_gpio_pin_regs,
+	.pin_funcs = bcm2712_c0_aon_gpio_pin_funcs,
+};
+
+static const struct brcmstb_pdata bcm2712_d0_pdata = {
+	.pctl_desc = &bcm2712_d0_pinctrl_desc,
+	.gpio_range = &bcm2712_d0_pinctrl_gpio_range,
+	.pin_regs = bcm2712_d0_gpio_pin_regs,
+	.pin_funcs = bcm2712_d0_gpio_pin_funcs,
+};
+
+static const struct brcmstb_pdata bcm2712_d0_aon_pdata = {
+	.pctl_desc = &bcm2712_d0_aon_pinctrl_desc,
+	.gpio_range = &bcm2712_d0_aon_pinctrl_gpio_range,
+	.pin_regs = bcm2712_d0_aon_gpio_pin_regs,
+	.pin_funcs = bcm2712_d0_aon_gpio_pin_funcs,
+};
+
+static const struct of_device_id brcmstb_pinctrl_match[] = {
+	{
+		.compatible = "brcm,bcm2712c0-pinctrl",
+		.data = &bcm2712_c0_pdata
+	},
+	{
+		.compatible = "brcm,bcm2712c0-aon-pinctrl",
+		.data = &bcm2712_c0_aon_pdata
+	},
+
+	{
+		.compatible = "brcm,bcm2712d0-pinctrl",
+		.data = &bcm2712_d0_pdata
+	},
+	{
+		.compatible = "brcm,bcm2712d0-aon-pinctrl",
+		.data = &bcm2712_d0_aon_pdata
+	},
+	{ /* sentinel */ }
+};
+
+static int brcmstb_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct brcmstb_pdata *pdata;
+	const struct of_device_id *match;
+	struct brcmstb_pinctrl *pc;
+	const char **names;
+	int num_pins, i;
+
+	match = of_match_node(brcmstb_pinctrl_match, np);
+	pdata = match->data;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pc);
+	pc->dev = dev;
+	spin_lock_init(&pc->fsel_lock);
+
+	pc->base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(pc->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pc->base),
+				     "Could not get IO memory\n");
+
+	pc->pctl_desc = *pdata->pctl_desc;
+	num_pins = pc->pctl_desc.npins;
+	names = devm_kmalloc_array(dev, num_pins, sizeof(const char *),
+				   GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pins; i++)
+		names[i] = pc->pctl_desc.pins[i].name;
+
+	pc->gpio_groups = names;
+	pc->pin_regs = pdata->pin_regs;
+	pc->pin_funcs = pdata->pin_funcs;
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pc->pctl_dev),
+				     "Failed to register pinctrl device\n");
+
+	pc->gpio_range = *pdata->gpio_range;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	return 0;
+}
+
+static struct platform_driver brcmstb_pinctrl_driver = {
+	.probe = brcmstb_pinctrl_probe,
+	.driver = {
+		.name = "pinctrl-brcmstb",
+		.of_match_table = brcmstb_pinctrl_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(brcmstb_pinctrl_driver);
+
+MODULE_AUTHOR("Phil Elwell");
+MODULE_AUTHOR("Jonathan Bell");
+MODULE_AUTHOR("Ivan T. Ivanov");
+MODULE_AUTHOR("Andrea della Porta");
+MODULE_DESCRIPTION("Broadcom brcmstb pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3


