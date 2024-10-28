Return-Path: <linux-gpio+bounces-12250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8E9B32C7
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06C60B22A65
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDFA1DED68;
	Mon, 28 Oct 2024 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RZ4qt8zU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C121DE2C6
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124455; cv=none; b=PtopIitoftDyR2vX/FpCwTG892mmSvrSfYLzTOoINo8Kc0ipJFJMUewEoaxcUDHi0JZvJJct5uqut1iUBlH+yAk586s0jFdQJLXLAbMs/PVBQN+WvBhJTx6Xug6up+XAWmky4POYoJ2uRTmpJPxOkR8wqZdksUhLzsfVd0jEOPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124455; c=relaxed/simple;
	bh=vEKlRB7UU9s+r7IHJZc/+uAJAmi554y7MCo3uXNoh/g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qicc1AX82N/m9P2Iq8j3I6oQk8moOjMJLNg3J4Yzdn8t8onRh9aBJEwyeigrRwJ1TN0QnpVU+bsH3Xseyo2yTJhvKxYZWnG8We7b4VTEoOyPr1/X1MHGWa8r0E6+EmBvJ/szKxZrbsA2pZn3EaJ3heSMaUVLm+AnhReW3sBVvgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RZ4qt8zU; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a9a16b310f5so677865466b.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124442; x=1730729242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFveGfF8+WaDlbdVcjxcI792cAnYoMAh+Ajzj4ISmgA=;
        b=RZ4qt8zU/dISKPWOAXwYjx28o+dnqYc+CV9QDNTkiJffsKdp6r7WehNyCtk8V121U/
         rY9YJbP3IW9DWNDNVL/89zrQvSAygv8Fj44Tq4kNHaBAX3LOBAwqnFWM7zsUU8jVHjIS
         PFUG1JNI5eF4k3M1w4GZC46ejXjXvFR+l3eLu9hyM8rienH/bdhEJl5rKNnCS1kJQMGK
         DkYNRIo3fs+h2q3ZPrHfhb0tGDaHP4iSHIhZ+BxtGCKqqBwfBCsXQ58zKLi7MId5eSz7
         w5MgtmZHaWQG2enlrcL42XDWTTIyZs5vd+rqTq/Cx+7C9j3Xh/7EdyqtbtS6afBV0Emo
         WXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124442; x=1730729242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFveGfF8+WaDlbdVcjxcI792cAnYoMAh+Ajzj4ISmgA=;
        b=WhSR/xfI0Iyigy9rIOV8T8HjpzLTvSN2jDMbEYyDctmYGBeGTEPIX/NaNkKDF9AEck
         pjGHaLFBnnv7aIF17ug8HHjTE1ZDDLoVERr3Q2pxwg3vv0EagNEDpKEkTuojhhU3JnxL
         s75MruKZUCt04Zt5YXVFBfFxhJe9LDC+zEBkSnSLRySZmXI76nfi+F4D+GEOkiF1M5UV
         m3XXVs0vcy16LxKhpdnJeeMuXTKkTC3vOq8CWBRRhFKz5Q+CGqU0fT+8ORU0A4POgzmk
         QhHMGMLBh+6ji1KLdU8xssW+5+hYcGmP4pD7SvH0Hz6LI3jzcdCRGp/wviZWwM4Bj57n
         TM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfA52Oe90FPkpnFolDvbehUP7EakQEoMZq72VU8t0x+Sg/HUwWwwUmiUfbLq9gpMvpg1QPwKaQ9+sG@vger.kernel.org
X-Gm-Message-State: AOJu0YwfvOYUuVloDPDtgpgRZ8C0Kci1W7YrrvBduNRkYl/7g/ftiokY
	wTVsqT8VEs1D+eLXaPuT29G6mByI9pFpyy1s6qITJxAc8Ozkv+sQMcbFRZr/tFg=
X-Google-Smtp-Source: AGHT+IGdyws+KRux024/cSIOD0MqnGLMxWdEiA9p8Zif1vqY/2dg/YCpcoKqWWfMqrgWbCiAhrNz2w==
X-Received: by 2002:a17:906:dacd:b0:a9a:59f:dfb9 with SMTP id a640c23a62f3a-a9de5cfedb1mr883597266b.5.1730124442333;
        Mon, 28 Oct 2024 07:07:22 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0298fdsm382615066b.54.2024.10.28.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:21 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 07/12] clk: rp1: Add support for clocks provided by RP1
Date: Mon, 28 Oct 2024 15:07:24 +0100
Message-ID: <c20e3d6d87c71691b149cdeeafc94009953346b2.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RaspberryPi RP1 is an MFD providing, among other peripherals, several
clock generators and PLLs that drives the sub-peripherals.
Add the driver to support the clock providers.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS           |    1 +
 drivers/clk/Kconfig   |    8 +
 drivers/clk/Makefile  |    1 +
 drivers/clk/clk-rp1.c | 1540 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1550 insertions(+)
 create mode 100644 drivers/clk/clk-rp1.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2aea5a6166bd..dc064cd4b6b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19387,6 +19387,7 @@ F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
+F:	drivers/clk/clk-rp1.c
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
 
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 299bc678ed1b..f67ce3a3fb35 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -88,6 +88,14 @@ config COMMON_CLK_RK808
 	  These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
 	  Clkout1 is always on, Clkout2 can off by control register.
 
+config COMMON_CLK_RP1
+	tristate "Raspberry Pi RP1-based clock support"
+	depends on MISC_RP1 || COMPILE_TEST
+	help
+	  Enable common clock framework support for Raspberry Pi RP1.
+	  This multi-function device has 3 main PLLs and several clock
+	  generators to drive the internal sub-peripherals.
+
 config COMMON_CLK_HI655X
 	tristate "Clock driver for Hi655x" if EXPERT
 	depends on (MFD_HI655X_PMIC || COMPILE_TEST)
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index fb8878a5d7d9..2ab97f36c800 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_CLK_LS1028A_PLLDIG)	+= clk-plldig.o
 obj-$(CONFIG_COMMON_CLK_PWM)		+= clk-pwm.o
 obj-$(CONFIG_CLK_QORIQ)			+= clk-qoriq.o
 obj-$(CONFIG_COMMON_CLK_RK808)		+= clk-rk808.o
+obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
 obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
 obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
new file mode 100644
index 000000000000..69b9cf037cb2
--- /dev/null
+++ b/drivers/clk/clk-rp1.c
@@ -0,0 +1,1540 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Raspberry Pi Ltd.
+ *
+ * Clock driver for RP1 PCIe multifunction chip.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/units.h>
+
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+#define PLL_SYS_OFFSET			0x08000
+#define PLL_SYS_CS			(PLL_SYS_OFFSET + 0x00)
+#define PLL_SYS_PWR			(PLL_SYS_OFFSET + 0x04)
+#define PLL_SYS_FBDIV_INT		(PLL_SYS_OFFSET + 0x08)
+#define PLL_SYS_FBDIV_FRAC		(PLL_SYS_OFFSET + 0x0c)
+#define PLL_SYS_PRIM			(PLL_SYS_OFFSET + 0x10)
+#define PLL_SYS_SEC			(PLL_SYS_OFFSET + 0x14)
+
+#define PLL_AUDIO_OFFSET		0x0c000
+#define PLL_AUDIO_CS			(PLL_AUDIO_OFFSET + 0x00)
+#define PLL_AUDIO_PWR			(PLL_AUDIO_OFFSET + 0x04)
+#define PLL_AUDIO_FBDIV_INT		(PLL_AUDIO_OFFSET + 0x08)
+#define PLL_AUDIO_FBDIV_FRAC		(PLL_AUDIO_OFFSET + 0x0c)
+#define PLL_AUDIO_PRIM			(PLL_AUDIO_OFFSET + 0x10)
+#define PLL_AUDIO_SEC			(PLL_AUDIO_OFFSET + 0x14)
+#define PLL_AUDIO_TERN			(PLL_AUDIO_OFFSET + 0x18)
+
+#define PLL_VIDEO_OFFSET		0x10000
+#define PLL_VIDEO_CS			(PLL_VIDEO_OFFSET + 0x00)
+#define PLL_VIDEO_PWR			(PLL_VIDEO_OFFSET + 0x04)
+#define PLL_VIDEO_FBDIV_INT		(PLL_VIDEO_OFFSET + 0x08)
+#define PLL_VIDEO_FBDIV_FRAC		(PLL_VIDEO_OFFSET + 0x0c)
+#define PLL_VIDEO_PRIM			(PLL_VIDEO_OFFSET + 0x10)
+#define PLL_VIDEO_SEC			(PLL_VIDEO_OFFSET + 0x14)
+
+#define GPCLK_OE_CTRL			0x00000
+
+#define CLK_SYS_OFFSET			0x00014
+#define CLK_SYS_CTRL			(CLK_SYS_OFFSET + 0x00)
+#define CLK_SYS_DIV_INT			(CLK_SYS_OFFSET + 0x04)
+#define CLK_SYS_SEL			(CLK_SYS_OFFSET + 0x0c)
+
+#define CLK_SLOW_OFFSET			0x00024
+#define CLK_SLOW_SYS_CTRL		(CLK_SLOW_OFFSET + 0x00)
+#define CLK_SLOW_SYS_DIV_INT		(CLK_SLOW_OFFSET + 0x04)
+#define CLK_SLOW_SYS_SEL		(CLK_SLOW_OFFSET + 0x0c)
+
+#define CLK_DMA_OFFSET			0x00044
+#define CLK_DMA_CTRL			(CLK_DMA_OFFSET + 0x00)
+#define CLK_DMA_DIV_INT			(CLK_DMA_OFFSET + 0x04)
+#define CLK_DMA_SEL			(CLK_DMA_OFFSET + 0x0c)
+
+#define CLK_UART_OFFSET			0x00054
+#define CLK_UART_CTRL			(CLK_UART_OFFSET + 0x00)
+#define CLK_UART_DIV_INT		(CLK_UART_OFFSET + 0x04)
+#define CLK_UART_SEL			(CLK_UART_OFFSET + 0x0c)
+
+#define CLK_ETH_OFFSET			0x00064
+#define CLK_ETH_CTRL			(CLK_ETH_OFFSET + 0x00)
+#define CLK_ETH_DIV_INT			(CLK_ETH_OFFSET + 0x04)
+#define CLK_ETH_SEL			(CLK_ETH_OFFSET + 0x0c)
+
+#define CLK_PWM0_OFFSET			0x00074
+#define CLK_PWM0_CTRL			(CLK_PWM0_OFFSET + 0x00)
+#define CLK_PWM0_DIV_INT		(CLK_PWM0_OFFSET + 0x04)
+#define CLK_PWM0_DIV_FRAC		(CLK_PWM0_OFFSET + 0x08)
+#define CLK_PWM0_SEL			(CLK_PWM0_OFFSET + 0x0c)
+
+#define CLK_PWM1_OFFSET			0x00084
+#define CLK_PWM1_CTRL			(CLK_PWM1_OFFSET + 0x00)
+#define CLK_PWM1_DIV_INT		(CLK_PWM1_OFFSET + 0x04)
+#define CLK_PWM1_DIV_FRAC		(CLK_PWM1_OFFSET + 0x08)
+#define CLK_PWM1_SEL			(CLK_PWM1_OFFSET + 0x0c)
+
+#define CLK_AUDIO_IN_OFFSET		0x00094
+#define CLK_AUDIO_IN_CTRL		(CLK_AUDIO_IN_OFFSET + 0x00)
+#define CLK_AUDIO_IN_DIV_INT		(CLK_AUDIO_IN_OFFSET + 0x04)
+#define CLK_AUDIO_IN_SEL		(CLK_AUDIO_IN_OFFSET + 0x0c)
+
+#define CLK_AUDIO_OUT_OFFSET		0x000a4
+#define CLK_AUDIO_OUT_CTRL		(CLK_AUDIO_OUT_OFFSET + 0x00)
+#define CLK_AUDIO_OUT_DIV_INT		(CLK_AUDIO_OUT_OFFSET + 0x04)
+#define CLK_AUDIO_OUT_SEL		(CLK_AUDIO_OUT_OFFSET + 0x0c)
+
+#define CLK_I2S_OFFSET			0x000b4
+#define CLK_I2S_CTRL			(CLK_I2S_OFFSET + 0x00)
+#define CLK_I2S_DIV_INT			(CLK_I2S_OFFSET + 0x04)
+#define CLK_I2S_SEL			(CLK_I2S_OFFSET + 0x0c)
+
+#define CLK_MIPI0_CFG_OFFSET		0x000c4
+#define CLK_MIPI0_CFG_CTRL		(CLK_MIPI0_CFG_OFFSET + 0x00)
+#define CLK_MIPI0_CFG_DIV_INT		(CLK_MIPI0_CFG_OFFSET + 0x04)
+#define CLK_MIPI0_CFG_SEL		(CLK_MIPI0_CFG_OFFSET + 0x0c)
+
+#define CLK_MIPI1_CFG_OFFSET		0x000d4
+#define CLK_MIPI1_CFG_CTRL		(CLK_MIPI1_CFG_OFFSET + 0x00)
+#define CLK_MIPI1_CFG_DIV_INT		(CLK_MIPI1_CFG_OFFSET + 0x04)
+#define CLK_MIPI1_CFG_SEL		(CLK_MIPI1_CFG_OFFSET + 0x0c)
+
+#define CLK_PCIE_AUX_OFFSET		0x000e4
+#define CLK_PCIE_AUX_CTRL		(CLK_PCIE_AUX_OFFSET + 0x00)
+#define CLK_PCIE_AUX_DIV_INT		(CLK_PCIE_AUX_OFFSET + 0x04)
+#define CLK_PCIE_AUX_SEL		(CLK_PCIE_AUX_OFFSET + 0x0c)
+
+#define CLK_USBH0_MICROFRAME_OFFSET	0x000f4
+#define CLK_USBH0_MICROFRAME_CTRL	(CLK_USBH0_MICROFRAME_OFFSET + 0x00)
+#define CLK_USBH0_MICROFRAME_DIV_INT	(CLK_USBH0_MICROFRAME_OFFSET + 0x04)
+#define CLK_USBH0_MICROFRAME_SEL	(CLK_USBH0_MICROFRAME_OFFSET + 0x0c)
+
+#define CLK_USBH1_MICROFRAME_OFFSET	0x00104
+#define CLK_USBH1_MICROFRAME_CTRL	(CLK_USBH1_MICROFRAME_OFFSET + 0x00)
+#define CLK_USBH1_MICROFRAME_DIV_INT	(CLK_USBH1_MICROFRAME_OFFSET + 0x04)
+#define CLK_USBH1_MICROFRAME_SEL	(CLK_USBH1_MICROFRAME_OFFSET + 0x0c)
+
+#define CLK_USBH0_SUSPEND_OFFSET	0x00114
+#define CLK_USBH0_SUSPEND_CTRL		(CLK_USBH0_SUSPEND_OFFSET + 0x00)
+#define CLK_USBH0_SUSPEND_DIV_INT	(CLK_USBH0_SUSPEND_OFFSET + 0x04)
+#define CLK_USBH0_SUSPEND_SEL		(CLK_USBH0_SUSPEND_OFFSET + 0x0c)
+
+#define CLK_USBH1_SUSPEND_OFFSET	0x00124
+#define CLK_USBH1_SUSPEND_CTRL		(CLK_USBH1_SUSPEND_OFFSET + 0x00)
+#define CLK_USBH1_SUSPEND_DIV_INT	(CLK_USBH1_SUSPEND_OFFSET + 0x04)
+#define CLK_USBH1_SUSPEND_SEL		(CLK_USBH1_SUSPEND_OFFSET + 0x0c)
+
+#define CLK_ETH_TSU_OFFSET		0x00134
+#define CLK_ETH_TSU_CTRL		(CLK_ETH_TSU_OFFSET + 0x00)
+#define CLK_ETH_TSU_DIV_INT		(CLK_ETH_TSU_OFFSET + 0x04)
+#define CLK_ETH_TSU_SEL			(CLK_ETH_TSU_OFFSET + 0x0c)
+
+#define CLK_ADC_OFFSET			0x00144
+#define CLK_ADC_CTRL			(CLK_ADC_OFFSET + 0x00)
+#define CLK_ADC_DIV_INT			(CLK_ADC_OFFSET + 0x04)
+#define CLK_ADC_SEL			(CLK_ADC_OFFSET + 0x0c)
+
+#define CLK_SDIO_TIMER_OFFSET		0x00154
+#define CLK_SDIO_TIMER_CTRL		(CLK_SDIO_TIMER_OFFSET + 0x00)
+#define CLK_SDIO_TIMER_DIV_INT		(CLK_SDIO_TIMER_OFFSET + 0x04)
+#define CLK_SDIO_TIMER_SEL		(CLK_SDIO_TIMER_OFFSET + 0x0c)
+
+#define CLK_SDIO_ALT_SRC_OFFSET		0x00164
+#define CLK_SDIO_ALT_SRC_CTRL		(CLK_SDIO_ALT_SRC_OFFSET + 0x00)
+#define CLK_SDIO_ALT_SRC_DIV_INT	(CLK_SDIO_ALT_SRC_OFFSET + 0x04)
+#define CLK_SDIO_ALT_SRC_SEL		(CLK_SDIO_ALT_SRC_OFFSET + 0x0c)
+
+#define CLK_GP0_OFFSET			0x00174
+#define CLK_GP0_CTRL			(CLK_GP0_OFFSET + 0x00)
+#define CLK_GP0_DIV_INT			(CLK_GP0_OFFSET + 0x04)
+#define CLK_GP0_DIV_FRAC		(CLK_GP0_OFFSET + 0x08)
+#define CLK_GP0_SEL			(CLK_GP0_OFFSET + 0x0c)
+
+#define CLK_GP1_OFFSET			0x00184
+#define CLK_GP1_CTRL			(CLK_GP1_OFFSET + 0x00)
+#define CLK_GP1_DIV_INT			(CLK_GP1_OFFSET + 0x04)
+#define CLK_GP1_DIV_FRAC		(CLK_GP1_OFFSET + 0x08)
+#define CLK_GP1_SEL			(CLK_GP1_OFFSET + 0x0c)
+
+#define CLK_GP2_OFFSET			0x00194
+#define CLK_GP2_CTRL			(CLK_GP2_OFFSET + 0x00)
+#define CLK_GP2_DIV_INT			(CLK_GP2_OFFSET + 0x04)
+#define CLK_GP2_DIV_FRAC		(CLK_GP2_OFFSET + 0x08)
+#define CLK_GP2_SEL			(CLK_GP2_OFFSET + 0x0c)
+
+#define CLK_GP3_OFFSET			0x001a4
+#define CLK_GP3_CTRL			(CLK_GP3_OFFSET + 0x00)
+#define CLK_GP3_DIV_INT			(CLK_GP3_OFFSET + 0x04)
+#define CLK_GP3_DIV_FRAC		(CLK_GP3_OFFSET + 0x08)
+#define CLK_GP3_SEL			(CLK_GP3_OFFSET + 0x0c)
+
+#define CLK_GP4_OFFSET			0x001b4
+#define CLK_GP4_CTRL			(CLK_GP4_OFFSET + 0x00)
+#define CLK_GP4_DIV_INT			(CLK_GP4_OFFSET + 0x04)
+#define CLK_GP4_DIV_FRAC		(CLK_GP4_OFFSET + 0x08)
+#define CLK_GP4_SEL			(CLK_GP4_OFFSET + 0x0c)
+
+#define CLK_GP5_OFFSET			0x001c4
+#define CLK_GP5_CTRL			(CLK_GP5_OFFSET + 0x00)
+#define CLK_GP5_DIV_INT			(CLK_GP5_OFFSET + 0x04)
+#define CLK_GP5_DIV_FRAC		(CLK_GP5_OFFSET + 0x08)
+#define CLK_GP5_SEL			(CLK_GP5_OFFSET + 0x0c)
+
+#define CLK_SYS_RESUS_CTRL		0x0020c
+
+#define CLK_SLOW_SYS_RESUS_CTRL		0x00214
+
+#define FC0_OFFSET			0x0021c
+#define FC0_REF_KHZ			(FC0_OFFSET + 0x00)
+#define FC0_MIN_KHZ			(FC0_OFFSET + 0x04)
+#define FC0_MAX_KHZ			(FC0_OFFSET + 0x08)
+#define FC0_DELAY			(FC0_OFFSET + 0x0c)
+#define FC0_INTERVAL			(FC0_OFFSET + 0x10)
+#define FC0_SRC				(FC0_OFFSET + 0x14)
+#define FC0_STATUS			(FC0_OFFSET + 0x18)
+#define FC0_RESULT			(FC0_OFFSET + 0x1c)
+#define FC_SIZE				0x20
+#define FC_COUNT			8
+#define FC_NUM(idx, off)		((idx) * 32 + (off))
+
+#define AUX_SEL				1
+
+#define VIDEO_CLOCKS_OFFSET		0x4000
+#define VIDEO_CLK_VEC_CTRL		(VIDEO_CLOCKS_OFFSET + 0x0000)
+#define VIDEO_CLK_VEC_DIV_INT		(VIDEO_CLOCKS_OFFSET + 0x0004)
+#define VIDEO_CLK_VEC_SEL		(VIDEO_CLOCKS_OFFSET + 0x000c)
+#define VIDEO_CLK_DPI_CTRL		(VIDEO_CLOCKS_OFFSET + 0x0010)
+#define VIDEO_CLK_DPI_DIV_INT		(VIDEO_CLOCKS_OFFSET + 0x0014)
+#define VIDEO_CLK_DPI_SEL		(VIDEO_CLOCKS_OFFSET + 0x001c)
+#define VIDEO_CLK_MIPI0_DPI_CTRL	(VIDEO_CLOCKS_OFFSET + 0x0020)
+#define VIDEO_CLK_MIPI0_DPI_DIV_INT	(VIDEO_CLOCKS_OFFSET + 0x0024)
+#define VIDEO_CLK_MIPI0_DPI_DIV_FRAC	(VIDEO_CLOCKS_OFFSET + 0x0028)
+#define VIDEO_CLK_MIPI0_DPI_SEL		(VIDEO_CLOCKS_OFFSET + 0x002c)
+#define VIDEO_CLK_MIPI1_DPI_CTRL	(VIDEO_CLOCKS_OFFSET + 0x0030)
+#define VIDEO_CLK_MIPI1_DPI_DIV_INT	(VIDEO_CLOCKS_OFFSET + 0x0034)
+#define VIDEO_CLK_MIPI1_DPI_DIV_FRAC	(VIDEO_CLOCKS_OFFSET + 0x0038)
+#define VIDEO_CLK_MIPI1_DPI_SEL		(VIDEO_CLOCKS_OFFSET + 0x003c)
+
+#define DIV_INT_8BIT_MAX		GENMASK(7, 0)	/* max divide for most clocks */
+#define DIV_INT_16BIT_MAX		GENMASK(15, 0)	/* max divide for GPx, PWM */
+#define DIV_INT_24BIT_MAX               GENMASK(23, 0)	/* max divide for CLK_SYS */
+
+#define FC0_STATUS_DONE			BIT(4)
+#define FC0_STATUS_RUNNING		BIT(8)
+#define FC0_RESULT_FRAC_SHIFT		5
+
+#define PLL_PRIM_DIV1_SHIFT		16
+#define PLL_PRIM_DIV1_WIDTH		3
+#define PLL_PRIM_DIV1_MASK		GENMASK(PLL_PRIM_DIV1_SHIFT + \
+						PLL_PRIM_DIV1_WIDTH - 1, \
+						PLL_PRIM_DIV1_SHIFT)
+#define PLL_PRIM_DIV2_SHIFT		12
+#define PLL_PRIM_DIV2_WIDTH		3
+#define PLL_PRIM_DIV2_MASK		GENMASK(PLL_PRIM_DIV2_SHIFT + \
+						PLL_PRIM_DIV2_WIDTH - 1, \
+						PLL_PRIM_DIV2_SHIFT)
+
+#define PLL_SEC_DIV_SHIFT		8
+#define PLL_SEC_DIV_WIDTH		5
+#define PLL_SEC_DIV_MASK		GENMASK(PLL_SEC_DIV_SHIFT + \
+						PLL_SEC_DIV_WIDTH - 1, \
+						PLL_SEC_DIV_SHIFT)
+
+#define PLL_CS_LOCK			BIT(31)
+#define PLL_CS_REFDIV_SHIFT		0
+
+#define PLL_PWR_PD			BIT(0)
+#define PLL_PWR_DACPD			BIT(1)
+#define PLL_PWR_DSMPD			BIT(2)
+#define PLL_PWR_POSTDIVPD		BIT(3)
+#define PLL_PWR_4PHASEPD		BIT(4)
+#define PLL_PWR_VCOPD			BIT(5)
+#define PLL_PWR_MASK			GENMASK(5, 0)
+
+#define PLL_SEC_RST			BIT(16)
+#define PLL_SEC_IMPL			BIT(31)
+
+/* PLL phase output for both PRI and SEC */
+#define PLL_PH_EN			BIT(4)
+#define PLL_PH_PHASE_SHIFT		0
+
+#define RP1_PLL_PHASE_0			0
+#define RP1_PLL_PHASE_90		1
+#define RP1_PLL_PHASE_180		2
+#define RP1_PLL_PHASE_270		3
+
+/* Clock fields for all clocks */
+#define CLK_CTRL_ENABLE			BIT(11)
+#define CLK_CTRL_AUXSRC_SHIFT		5
+#define CLK_CTRL_AUXSRC_WIDTH		5
+#define CLK_CTRL_AUXSRC_MASK		GENMASK(CLK_CTRL_AUXSRC_SHIFT + \
+						CLK_CTRL_AUXSRC_WIDTH - 1, \
+						CLK_CTRL_AUXSRC_SHIFT)
+#define CLK_CTRL_SRC_SHIFT		0
+#define CLK_DIV_FRAC_BITS		16
+
+#define LOCK_TIMEOUT_US			100000
+#define LOCK_POLL_DELAY_US		5
+
+#define MAX_CLK_PARENTS			16
+
+/*
+ * Secondary PLL channel output divider table.
+ * Divider values range from 8 to 19.
+ * Invalid values default to 19
+ */
+static const struct clk_div_table pll_sec_div_table[] = {
+	{ 0x00, 19 },
+	{ 0x01, 19 },
+	{ 0x02, 19 },
+	{ 0x03, 19 },
+	{ 0x04, 19 },
+	{ 0x05, 19 },
+	{ 0x06, 19 },
+	{ 0x07, 19 },
+	{ 0x08,  8 },
+	{ 0x09,  9 },
+	{ 0x0a, 10 },
+	{ 0x0b, 11 },
+	{ 0x0c, 12 },
+	{ 0x0d, 13 },
+	{ 0x0e, 14 },
+	{ 0x0f, 15 },
+	{ 0x10, 16 },
+	{ 0x11, 17 },
+	{ 0x12, 18 },
+	{ 0x13, 19 },
+	{ 0x14, 19 },
+	{ 0x15, 19 },
+	{ 0x16, 19 },
+	{ 0x17, 19 },
+	{ 0x18, 19 },
+	{ 0x19, 19 },
+	{ 0x1a, 19 },
+	{ 0x1b, 19 },
+	{ 0x1c, 19 },
+	{ 0x1d, 19 },
+	{ 0x1e, 19 },
+	{ 0x1f, 19 },
+	{ 0 }
+};
+
+struct rp1_clockman {
+	struct device *dev;
+	void __iomem *regs;
+	struct regmap *regmap;
+	spinlock_t regs_lock; /* spinlock for all clocks */
+
+	/* Must be last */
+	struct clk_hw_onecell_data onecell;
+};
+
+struct rp1_pll_core_data {
+	const char *name;
+	u32 cs_reg;
+	u32 pwr_reg;
+	u32 fbdiv_int_reg;
+	u32 fbdiv_frac_reg;
+	unsigned long flags;
+	u32 fc0_src;
+};
+
+struct rp1_pll_data {
+	const char *name;
+	u32 ctrl_reg;
+	unsigned long flags;
+	u32 fc0_src;
+};
+
+struct rp1_pll_ph_data {
+	const char *name;
+	unsigned int phase;
+	unsigned int fixed_divider;
+	u32 ph_reg;
+	unsigned long flags;
+	u32 fc0_src;
+};
+
+struct rp1_pll_divider_data {
+	const char *name;
+	u32 sec_reg;
+	unsigned long flags;
+	u32 fc0_src;
+};
+
+struct rp1_clock_data {
+	const char *name;
+	int num_std_parents;
+	int num_aux_parents;
+	unsigned long flags;
+	u32 oe_mask;
+	u32 clk_src_mask;
+	u32 ctrl_reg;
+	u32 div_int_reg;
+	u32 div_frac_reg;
+	u32 sel_reg;
+	u32 div_int_max;
+	unsigned long max_freq;
+	u32 fc0_src;
+};
+
+struct rp1_clk_desc {
+	struct clk_hw *(*clk_register)(struct rp1_clockman *clockman,
+				       struct rp1_clk_desc *desc);
+	const void *data;
+	struct clk_hw hw;
+	struct rp1_clockman *clockman;
+	unsigned long cached_rate;
+	struct clk_divider div;
+};
+
+#define FIELD_SET(_reg, _mask, _val)		\
+do {						\
+	u32 mask = (_mask);			\
+	(_reg) &= ~mask;			\
+	(_reg) |= FIELD_PREP(mask, (_val));	\
+} while (0)
+
+static inline
+void clockman_write(struct rp1_clockman *clockman, u32 reg, u32 val)
+{
+	regmap_write(clockman->regmap, reg, val);
+}
+
+static inline u32 clockman_read(struct rp1_clockman *clockman, u32 reg)
+{
+	u32 val;
+
+	regmap_read(clockman->regmap, reg, &val);
+
+	return val;
+}
+
+static int rp1_pll_core_is_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_core->clockman;
+	const struct rp1_pll_core_data *data = pll_core->data;
+
+	u32 pwr = clockman_read(clockman, data->pwr_reg);
+
+	return (pwr & PLL_PWR_PD) || (pwr & PLL_PWR_POSTDIVPD);
+}
+
+static int rp1_pll_core_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_core->clockman;
+	const struct rp1_pll_core_data *data = pll_core->data;
+
+	u32 fbdiv_frac, val;
+	int ret;
+
+	spin_lock(&clockman->regs_lock);
+
+	if (!(clockman_read(clockman, data->cs_reg) & PLL_CS_LOCK)) {
+		/* Reset to a known state. */
+		clockman_write(clockman, data->pwr_reg, PLL_PWR_MASK);
+		clockman_write(clockman, data->fbdiv_int_reg, 20);
+		clockman_write(clockman, data->fbdiv_frac_reg, 0);
+		clockman_write(clockman, data->cs_reg, 1 << PLL_CS_REFDIV_SHIFT);
+	}
+
+	/* Come out of reset. */
+	fbdiv_frac = clockman_read(clockman, data->fbdiv_frac_reg);
+	clockman_write(clockman, data->pwr_reg, fbdiv_frac ? 0 : PLL_PWR_DSMPD);
+	spin_unlock(&clockman->regs_lock);
+
+	/* Wait for the PLL to lock. */
+	ret = regmap_read_poll_timeout(clockman->regmap, data->cs_reg, val,
+				       val & PLL_CS_LOCK,
+				       LOCK_POLL_DELAY_US, LOCK_TIMEOUT_US);
+	if (ret)
+		dev_err(clockman->dev, "%s: can't lock PLL\n",
+			clk_hw_get_name(hw));
+
+	return ret;
+}
+
+static void rp1_pll_core_off(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_core->clockman;
+	const struct rp1_pll_core_data *data = pll_core->data;
+
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->pwr_reg, 0);
+	spin_unlock(&clockman->regs_lock);
+}
+
+static inline unsigned long get_pll_core_divider(struct clk_hw *hw,
+						 unsigned long rate,
+						 unsigned long parent_rate,
+						 u32 *div_int, u32 *div_frac)
+{
+	u32 fbdiv_int, fbdiv_frac;
+	unsigned long calc_rate;
+	u64 shifted_fbdiv_int;
+	u64 div_fp64; /* 32.32 fixed point fraction. */
+
+	/* Factor of reference clock to VCO frequency. */
+	div_fp64 = (u64)(rate) << 32;
+	div_fp64 = DIV_ROUND_CLOSEST_ULL(div_fp64, parent_rate);
+
+	/* Round the fractional component at 24 bits. */
+	div_fp64 += 1 << (32 - 24 - 1);
+
+	fbdiv_int = div_fp64 >> 32;
+	fbdiv_frac = (div_fp64 >> (32 - 24)) & 0xffffff;
+
+	shifted_fbdiv_int = (u64)fbdiv_int << 24;
+	calc_rate = (u64)parent_rate * (shifted_fbdiv_int + fbdiv_frac);
+	calc_rate += BIT(23);
+	calc_rate >>= 24;
+
+	*div_int = fbdiv_int;
+	*div_frac = fbdiv_frac;
+
+	return calc_rate;
+}
+
+static int rp1_pll_core_set_rate(struct clk_hw *hw,
+				 unsigned long rate, unsigned long parent_rate)
+{
+	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_core->clockman;
+	const struct rp1_pll_core_data *data = pll_core->data;
+
+	unsigned long calc_rate;
+	u32 fbdiv_int, fbdiv_frac;
+
+	/* Disable dividers to start with. */
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->fbdiv_int_reg, 0);
+	clockman_write(clockman, data->fbdiv_frac_reg, 0);
+	spin_unlock(&clockman->regs_lock);
+
+	calc_rate = get_pll_core_divider(hw, rate, parent_rate,
+					 &fbdiv_int, &fbdiv_frac);
+
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->pwr_reg, fbdiv_frac ? 0 : PLL_PWR_DSMPD);
+	clockman_write(clockman, data->fbdiv_int_reg, fbdiv_int);
+	clockman_write(clockman, data->fbdiv_frac_reg, fbdiv_frac);
+	spin_unlock(&clockman->regs_lock);
+
+	/* Check that reference frequency is no greater than VCO / 16. */
+	if (WARN_ON_ONCE(parent_rate > (rate / 16)))
+		return -ERANGE;
+
+	pll_core->cached_rate = calc_rate;
+
+	spin_lock(&clockman->regs_lock);
+	/* Don't need to divide ref unless parent_rate > (output freq / 16) */
+	clockman_write(clockman, data->cs_reg,
+		       clockman_read(clockman, data->cs_reg) |
+				     (1 << PLL_CS_REFDIV_SHIFT));
+	spin_unlock(&clockman->regs_lock);
+
+	return 0;
+}
+
+static unsigned long rp1_pll_core_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_core->clockman;
+	const struct rp1_pll_core_data *data = pll_core->data;
+
+	u32 fbdiv_int, fbdiv_frac;
+	unsigned long calc_rate;
+	u64 shifted_fbdiv_int;
+
+	fbdiv_int = clockman_read(clockman, data->fbdiv_int_reg);
+	fbdiv_frac = clockman_read(clockman, data->fbdiv_frac_reg);
+
+	shifted_fbdiv_int = (u64)fbdiv_int << 24;
+	calc_rate = (u64)parent_rate * (shifted_fbdiv_int + fbdiv_frac);
+	calc_rate += BIT(23);
+	calc_rate >>= 24;
+
+	return calc_rate;
+}
+
+static long rp1_pll_core_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	u32 fbdiv_int, fbdiv_frac;
+
+	return get_pll_core_divider(hw, rate, *parent_rate,
+				    &fbdiv_int, &fbdiv_frac);
+}
+
+static void get_pll_prim_dividers(unsigned long rate, unsigned long parent_rate,
+				  u32 *divider1, u32 *divider2)
+{
+	unsigned int div1, div2;
+	unsigned int best_div1 = 7, best_div2 = 7;
+	unsigned long best_rate_diff =
+		abs_diff(DIV_ROUND_CLOSEST(parent_rate, best_div1 * best_div2), rate);
+	unsigned long rate_diff, calc_rate;
+
+	for (div1 = 1; div1 <= 7; div1++) {
+		for (div2 = 1; div2 <= div1; div2++) {
+			calc_rate = DIV_ROUND_CLOSEST(parent_rate, div1 * div2);
+			rate_diff = abs_diff(calc_rate, rate);
+
+			if (calc_rate == rate) {
+				best_div1 = div1;
+				best_div2 = div2;
+				goto done;
+			} else if (rate_diff < best_rate_diff) {
+				best_div1 = div1;
+				best_div2 = div2;
+				best_rate_diff = rate_diff;
+			}
+		}
+	}
+
+done:
+	*divider1 = best_div1;
+	*divider2 = best_div2;
+}
+
+static int rp1_pll_set_rate(struct clk_hw *hw,
+			    unsigned long rate, unsigned long parent_rate)
+{
+	struct rp1_clk_desc *pll = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll->clockman;
+	const struct rp1_pll_data *data = pll->data;
+
+	u32 prim, prim_div1, prim_div2;
+
+	get_pll_prim_dividers(rate, parent_rate, &prim_div1, &prim_div2);
+
+	spin_lock(&clockman->regs_lock);
+	prim = clockman_read(clockman, data->ctrl_reg);
+	FIELD_SET(prim, PLL_PRIM_DIV1_MASK, prim_div1);
+	FIELD_SET(prim, PLL_PRIM_DIV2_MASK, prim_div2);
+	clockman_write(clockman, data->ctrl_reg, prim);
+	spin_unlock(&clockman->regs_lock);
+
+	return 0;
+}
+
+static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct rp1_clk_desc *pll = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll->clockman;
+	const struct rp1_pll_data *data = pll->data;
+	u32 prim, prim_div1, prim_div2;
+
+	prim = clockman_read(clockman, data->ctrl_reg);
+	prim_div1 = (prim & PLL_PRIM_DIV1_MASK) >> PLL_PRIM_DIV1_SHIFT;
+	prim_div2 = (prim & PLL_PRIM_DIV2_MASK) >> PLL_PRIM_DIV2_SHIFT;
+
+	if (!prim_div1 || !prim_div2) {
+		dev_err(clockman->dev, "%s: (%s) zero divider value\n",
+			__func__, data->name);
+		return 0;
+	}
+
+	return DIV_ROUND_CLOSEST(parent_rate, prim_div1 * prim_div2);
+}
+
+static long rp1_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	u32 div1, div2;
+
+	get_pll_prim_dividers(rate, *parent_rate, &div1, &div2);
+
+	return DIV_ROUND_CLOSEST(*parent_rate, div1 * div2);
+}
+
+static int rp1_pll_ph_is_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_ph->clockman;
+	const struct rp1_pll_ph_data *data = pll_ph->data;
+
+	return !!(clockman_read(clockman, data->ph_reg) & PLL_PH_EN);
+}
+
+static int rp1_pll_ph_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_ph->clockman;
+	const struct rp1_pll_ph_data *data = pll_ph->data;
+	u32 ph_reg;
+
+	/* TODO: ensure pri/sec is enabled! */
+	spin_lock(&clockman->regs_lock);
+	ph_reg = clockman_read(clockman, data->ph_reg);
+	ph_reg |= data->phase << PLL_PH_PHASE_SHIFT;
+	ph_reg |= PLL_PH_EN;
+	clockman_write(clockman, data->ph_reg, ph_reg);
+	spin_unlock(&clockman->regs_lock);
+
+	return 0;
+}
+
+static void rp1_pll_ph_off(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = pll_ph->clockman;
+	const struct rp1_pll_ph_data *data = pll_ph->data;
+
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->ph_reg,
+		       clockman_read(clockman, data->ph_reg) & ~PLL_PH_EN);
+	spin_unlock(&clockman->regs_lock);
+}
+
+static unsigned long rp1_pll_ph_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
+	const struct rp1_pll_ph_data *data = pll_ph->data;
+
+	return parent_rate / data->fixed_divider;
+}
+
+static long rp1_pll_ph_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	struct rp1_clk_desc *pll_ph = container_of(hw, struct rp1_clk_desc, hw);
+	const struct rp1_pll_ph_data *data = pll_ph->data;
+
+	return *parent_rate / data->fixed_divider;
+}
+
+static int rp1_pll_divider_is_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
+	struct rp1_clockman *clockman = divider->clockman;
+	const struct rp1_pll_data *data = divider->data;
+
+	return !(clockman_read(clockman, data->ctrl_reg) & PLL_SEC_RST);
+}
+
+static int rp1_pll_divider_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
+	struct rp1_clockman *clockman = divider->clockman;
+	const struct rp1_pll_data *data = divider->data;
+
+	spin_lock(&clockman->regs_lock);
+	/* Check the implementation bit is set! */
+	WARN_ON(!(clockman_read(clockman, data->ctrl_reg) & PLL_SEC_IMPL));
+	clockman_write(clockman, data->ctrl_reg,
+		       clockman_read(clockman, data->ctrl_reg) & ~PLL_SEC_RST);
+	spin_unlock(&clockman->regs_lock);
+
+	return 0;
+}
+
+static void rp1_pll_divider_off(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
+	struct rp1_clockman *clockman = divider->clockman;
+	const struct rp1_pll_data *data = divider->data;
+
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->ctrl_reg, PLL_SEC_RST);
+	spin_unlock(&clockman->regs_lock);
+}
+
+static int rp1_pll_divider_set_rate(struct clk_hw *hw,
+				    unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct rp1_clk_desc *divider = container_of(hw, struct rp1_clk_desc, div.hw);
+	struct rp1_clockman *clockman = divider->clockman;
+	const struct rp1_pll_data *data = divider->data;
+	u32 div, sec;
+
+	div = DIV_ROUND_UP_ULL(parent_rate, rate);
+	div = clamp(div, 8u, 19u);
+
+	spin_lock(&clockman->regs_lock);
+	sec = clockman_read(clockman, data->ctrl_reg);
+	FIELD_SET(sec, PLL_SEC_DIV_MASK, div);
+
+	/* Must keep the divider in reset to change the value. */
+	sec |= PLL_SEC_RST;
+	clockman_write(clockman, data->ctrl_reg, sec);
+
+	/* TODO: must sleep 10 pll vco cycles */
+	sec &= ~PLL_SEC_RST;
+	clockman_write(clockman, data->ctrl_reg, sec);
+	spin_unlock(&clockman->regs_lock);
+
+	return 0;
+}
+
+static unsigned long rp1_pll_divider_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	return clk_divider_ops.recalc_rate(hw, parent_rate);
+}
+
+static long rp1_pll_divider_round_rate(struct clk_hw *hw,
+				       unsigned long rate,
+				       unsigned long *parent_rate)
+{
+	return clk_divider_ops.round_rate(hw, rate, parent_rate);
+}
+
+static int rp1_clock_is_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+
+	return !!(clockman_read(clockman, data->ctrl_reg) & CLK_CTRL_ENABLE);
+}
+
+static unsigned long rp1_clock_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+	u64 calc_rate;
+	u64 div;
+
+	u32 frac;
+
+	div = clockman_read(clockman, data->div_int_reg);
+	frac = (data->div_frac_reg != 0) ?
+		clockman_read(clockman, data->div_frac_reg) : 0;
+
+	/* If the integer portion of the divider is 0, treat it as 2^16 */
+	if (!div)
+		div = 1 << 16;
+
+	div = (div << CLK_DIV_FRAC_BITS) | (frac >> (32 - CLK_DIV_FRAC_BITS));
+
+	calc_rate = (u64)parent_rate << CLK_DIV_FRAC_BITS;
+	calc_rate = div64_u64(calc_rate, div);
+
+	return calc_rate;
+}
+
+static int rp1_clock_on(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->ctrl_reg,
+		       clockman_read(clockman, data->ctrl_reg) | CLK_CTRL_ENABLE);
+	/* If this is a GPCLK, turn on the output-enable */
+	if (data->oe_mask)
+		clockman_write(clockman, GPCLK_OE_CTRL,
+			       clockman_read(clockman, GPCLK_OE_CTRL) | data->oe_mask);
+	spin_unlock(&clockman->regs_lock);
+
+	return 0;
+}
+
+static void rp1_clock_off(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+
+	spin_lock(&clockman->regs_lock);
+	clockman_write(clockman, data->ctrl_reg,
+		       clockman_read(clockman, data->ctrl_reg) & ~CLK_CTRL_ENABLE);
+	/* If this is a GPCLK, turn off the output-enable */
+	if (data->oe_mask)
+		clockman_write(clockman, GPCLK_OE_CTRL,
+			       clockman_read(clockman, GPCLK_OE_CTRL) & ~data->oe_mask);
+	spin_unlock(&clockman->regs_lock);
+}
+
+static u32 rp1_clock_choose_div(unsigned long rate, unsigned long parent_rate,
+				const struct rp1_clock_data *data)
+{
+	u64 div;
+
+	/*
+	 * Due to earlier rounding, calculated parent_rate may differ from
+	 * expected value. Don't fail on a small discrepancy near unity divide.
+	 */
+	if (!rate || rate > parent_rate + (parent_rate >> CLK_DIV_FRAC_BITS))
+		return 0;
+
+	/*
+	 * Always express div in fixed-point format for fractional division;
+	 * If no fractional divider is present, the fraction part will be zero.
+	 */
+	if (data->div_frac_reg) {
+		div = (u64)parent_rate << CLK_DIV_FRAC_BITS;
+		div = DIV_ROUND_CLOSEST_ULL(div, rate);
+	} else {
+		div = DIV_ROUND_CLOSEST_ULL(parent_rate, rate);
+		div <<= CLK_DIV_FRAC_BITS;
+	}
+
+	div = clamp(div,
+		    1ull << CLK_DIV_FRAC_BITS,
+		    (u64)data->div_int_max << CLK_DIV_FRAC_BITS);
+
+	return div;
+}
+
+static u8 rp1_clock_get_parent(struct clk_hw *hw)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+	u32 sel, ctrl;
+	u8 parent;
+
+	/* Sel is one-hot, so find the first bit set */
+	sel = clockman_read(clockman, data->sel_reg);
+	parent = ffs(sel) - 1;
+
+	/* sel == 0 implies the parent clock is not enabled yet. */
+	if (!sel) {
+		/* Read the clock src from the CTRL register instead */
+		ctrl = clockman_read(clockman, data->ctrl_reg);
+		parent = (ctrl & data->clk_src_mask) >> CLK_CTRL_SRC_SHIFT;
+	}
+
+	if (parent >= data->num_std_parents)
+		parent = AUX_SEL;
+
+	if (parent == AUX_SEL) {
+		/*
+		 * Clock parent is an auxiliary source, so get the parent from
+		 * the AUXSRC register field.
+		 */
+		ctrl = clockman_read(clockman, data->ctrl_reg);
+		parent = (ctrl & CLK_CTRL_AUXSRC_MASK) >> CLK_CTRL_AUXSRC_SHIFT;
+		parent += data->num_std_parents;
+	}
+
+	return parent;
+}
+
+static int rp1_clock_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+	u32 ctrl, sel;
+
+	spin_lock(&clockman->regs_lock);
+	ctrl = clockman_read(clockman, data->ctrl_reg);
+
+	if (index >= data->num_std_parents) {
+		/* This is an aux source request */
+		if (index >= data->num_std_parents + data->num_aux_parents) {
+			spin_unlock(&clockman->regs_lock);
+			return -EINVAL;
+		}
+
+		/* Select parent from aux list */
+		FIELD_SET(ctrl, CLK_CTRL_AUXSRC_MASK, index - data->num_std_parents);
+		/* Set src to aux list */
+		ctrl &= ~data->clk_src_mask;
+		ctrl |= (AUX_SEL << CLK_CTRL_SRC_SHIFT) & data->clk_src_mask;
+	} else {
+		ctrl &= ~data->clk_src_mask;
+		ctrl |= (index << CLK_CTRL_SRC_SHIFT) & data->clk_src_mask;
+	}
+
+	clockman_write(clockman, data->ctrl_reg, ctrl);
+	spin_unlock(&clockman->regs_lock);
+
+	sel = rp1_clock_get_parent(hw);
+	WARN(sel != index, "(%s): Parent index req %u returned back %u\n",
+	     data->name, index, sel);
+
+	return 0;
+}
+
+static int rp1_clock_set_rate_and_parent(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long parent_rate,
+					 u8 parent)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	struct rp1_clockman *clockman = clock->clockman;
+	const struct rp1_clock_data *data = clock->data;
+	u32 div = rp1_clock_choose_div(rate, parent_rate, data);
+
+	WARN(rate > 4000000000ll, "rate is -ve (%d)\n", (int)rate);
+
+	if (WARN(!div,
+		 "clk divider calculated as 0! (%s, rate %ld, parent rate %ld)\n",
+		 data->name, rate, parent_rate))
+		div = 1 << CLK_DIV_FRAC_BITS;
+
+	spin_lock(&clockman->regs_lock);
+
+	clockman_write(clockman, data->div_int_reg, div >> CLK_DIV_FRAC_BITS);
+	if (data->div_frac_reg)
+		clockman_write(clockman, data->div_frac_reg, div << (32 - CLK_DIV_FRAC_BITS));
+
+	spin_unlock(&clockman->regs_lock);
+
+	if (parent != 0xff)
+		rp1_clock_set_parent(hw, parent);
+
+	return 0;
+}
+
+static int rp1_clock_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	return rp1_clock_set_rate_and_parent(hw, rate, parent_rate, 0xff);
+}
+
+static void rp1_clock_choose_div_and_prate(struct clk_hw *hw,
+					   int parent_idx,
+					   unsigned long rate,
+					   unsigned long *prate,
+					   unsigned long *calc_rate)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+	const struct rp1_clock_data *data = clock->data;
+	struct clk_hw *parent;
+	u32 div;
+	u64 tmp;
+
+	parent = clk_hw_get_parent_by_index(hw, parent_idx);
+
+	*prate = clk_hw_get_rate(parent);
+	div = rp1_clock_choose_div(rate, *prate, data);
+
+	if (!div) {
+		*calc_rate = 0;
+		return;
+	}
+
+	/* Recalculate to account for rounding errors */
+	tmp = (u64)*prate << CLK_DIV_FRAC_BITS;
+	tmp = div_u64(tmp, div);
+
+	/*
+	 * Prevent overclocks - if all parent choices result in
+	 * a downstream clock in excess of the maximum, then the
+	 * call to set the clock will fail.
+	 */
+	if (tmp > data->max_freq)
+		*calc_rate = 0;
+	else
+		*calc_rate = tmp;
+}
+
+static int rp1_clock_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct clk_hw *parent, *best_parent = NULL;
+	unsigned long best_rate = 0;
+	unsigned long best_prate = 0;
+	unsigned long best_rate_diff = ULONG_MAX;
+	unsigned long prate, calc_rate;
+	size_t i;
+
+	/*
+	 * If the NO_REPARENT flag is set, try to use existing parent.
+	 */
+	if ((clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT)) {
+		i = rp1_clock_get_parent(hw);
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (parent) {
+			rp1_clock_choose_div_and_prate(hw, i, req->rate, &prate,
+						       &calc_rate);
+			if (calc_rate > 0) {
+				req->best_parent_hw = parent;
+				req->best_parent_rate = prate;
+				req->rate = calc_rate;
+				return 0;
+			}
+		}
+	}
+
+	/*
+	 * Select parent clock that results in the closest rate (lower or
+	 * higher)
+	 */
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (!parent)
+			continue;
+
+		rp1_clock_choose_div_and_prate(hw, i, req->rate, &prate,
+					       &calc_rate);
+
+		if (abs_diff(calc_rate, req->rate) < best_rate_diff) {
+			best_parent = parent;
+			best_prate = prate;
+			best_rate = calc_rate;
+			best_rate_diff = abs_diff(calc_rate, req->rate);
+
+			if (best_rate_diff == 0)
+				break;
+		}
+	}
+
+	if (best_rate == 0)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent;
+	req->best_parent_rate = best_prate;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static const struct clk_ops rp1_pll_core_ops = {
+	.is_prepared = rp1_pll_core_is_on,
+	.prepare = rp1_pll_core_on,
+	.unprepare = rp1_pll_core_off,
+	.set_rate = rp1_pll_core_set_rate,
+	.recalc_rate = rp1_pll_core_recalc_rate,
+	.round_rate = rp1_pll_core_round_rate,
+};
+
+static const struct clk_ops rp1_pll_ops = {
+	.set_rate = rp1_pll_set_rate,
+	.recalc_rate = rp1_pll_recalc_rate,
+	.round_rate = rp1_pll_round_rate,
+};
+
+static const struct clk_ops rp1_pll_ph_ops = {
+	.is_prepared = rp1_pll_ph_is_on,
+	.prepare = rp1_pll_ph_on,
+	.unprepare = rp1_pll_ph_off,
+	.recalc_rate = rp1_pll_ph_recalc_rate,
+	.round_rate = rp1_pll_ph_round_rate,
+};
+
+static const struct clk_ops rp1_pll_divider_ops = {
+	.is_prepared = rp1_pll_divider_is_on,
+	.prepare = rp1_pll_divider_on,
+	.unprepare = rp1_pll_divider_off,
+	.set_rate = rp1_pll_divider_set_rate,
+	.recalc_rate = rp1_pll_divider_recalc_rate,
+	.round_rate = rp1_pll_divider_round_rate,
+};
+
+static const struct clk_ops rp1_clk_ops = {
+	.is_prepared = rp1_clock_is_on,
+	.prepare = rp1_clock_on,
+	.unprepare = rp1_clock_off,
+	.recalc_rate = rp1_clock_recalc_rate,
+	.get_parent = rp1_clock_get_parent,
+	.set_parent = rp1_clock_set_parent,
+	.set_rate_and_parent = rp1_clock_set_rate_and_parent,
+	.set_rate = rp1_clock_set_rate,
+	.determine_rate = rp1_clock_determine_rate,
+};
+
+static struct clk_hw *rp1_register_pll_core(struct rp1_clockman *clockman,
+					    struct rp1_clk_desc *desc)
+{
+	const struct rp1_pll_core_data *pll_core_data = desc->data;
+	struct clk_init_data init = { };
+	int ret;
+
+	/* All of the PLL cores derive from the external oscillator. */
+	init.parent_data = desc->hw.init->parent_data;
+	init.num_parents = desc->hw.init->num_parents;
+	init.name = pll_core_data->name;
+	init.ops = &rp1_pll_core_ops;
+	init.flags = pll_core_data->flags | CLK_IGNORE_UNUSED | CLK_IS_CRITICAL;
+
+	desc->clockman = clockman;
+	desc->hw.init = &init;
+
+	ret = devm_clk_hw_register(clockman->dev, &desc->hw);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &desc->hw;
+}
+
+static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,
+				       struct rp1_clk_desc *desc)
+{
+	const struct rp1_pll_data *pll_data = desc->data;
+	struct clk_init_data init = { };
+	int ret;
+
+	init.parent_data = desc->hw.init->parent_data;
+	init.num_parents = desc->hw.init->num_parents;
+	init.name = pll_data->name;
+	init.ops = &rp1_pll_ops;
+	init.flags = pll_data->flags | CLK_IGNORE_UNUSED | CLK_IS_CRITICAL;
+
+	desc->clockman = clockman;
+	desc->hw.init = &init;
+
+	ret = devm_clk_hw_register(clockman->dev, &desc->hw);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &desc->hw;
+}
+
+static struct clk_hw *rp1_register_pll_ph(struct rp1_clockman *clockman,
+					  struct rp1_clk_desc *desc)
+{
+	const struct rp1_pll_ph_data *ph_data = desc->data;
+	struct clk_init_data init = { };
+	int ret;
+
+	init.parent_data = desc->hw.init->parent_data;
+	init.num_parents = desc->hw.init->num_parents;
+	init.name = ph_data->name;
+	init.ops = &rp1_pll_ph_ops;
+	init.flags = ph_data->flags | CLK_IGNORE_UNUSED;
+
+	desc->clockman = clockman;
+	desc->hw.init = &init;
+
+	ret = devm_clk_hw_register(clockman->dev, &desc->hw);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &desc->hw;
+}
+
+static struct clk_hw *rp1_register_pll_divider(struct rp1_clockman *clockman,
+					       struct rp1_clk_desc *desc)
+{
+	const struct rp1_pll_data *divider_data = desc->data;
+	struct clk_init_data init = { };
+	int ret;
+
+	init.parent_data = desc->hw.init->parent_data;
+	init.num_parents = desc->hw.init->num_parents;
+	init.name = divider_data->name;
+	init.ops = &rp1_pll_divider_ops;
+	init.flags = divider_data->flags | CLK_IGNORE_UNUSED | CLK_IS_CRITICAL;
+
+	desc->div.reg = clockman->regs + divider_data->ctrl_reg;
+	desc->div.shift = PLL_SEC_DIV_SHIFT;
+	desc->div.width = PLL_SEC_DIV_WIDTH;
+	desc->div.flags = CLK_DIVIDER_ROUND_CLOSEST;
+	desc->div.flags |= CLK_IS_CRITICAL;
+	desc->div.lock = &clockman->regs_lock;
+	desc->div.hw.init = &init;
+	desc->div.table = pll_sec_div_table;
+
+	desc->clockman = clockman;
+
+	ret = devm_clk_hw_register(clockman->dev, &desc->div.hw);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &desc->div.hw;
+}
+
+static struct clk_hw *rp1_register_clock(struct rp1_clockman *clockman,
+					 struct rp1_clk_desc *desc)
+{
+	const struct rp1_clock_data *clock_data = desc->data;
+	struct clk_init_data init = { };
+	int ret;
+
+	if (WARN_ON_ONCE(MAX_CLK_PARENTS <
+	       clock_data->num_std_parents + clock_data->num_aux_parents))
+		return NULL;
+
+	/* There must be a gap for the AUX selector */
+	if (WARN_ON_ONCE(clock_data->num_std_parents > AUX_SEL &&
+			 desc->hw.init->parent_data[AUX_SEL].index != -1))
+		return NULL;
+
+	init.parent_data = desc->hw.init->parent_data;
+	init.num_parents = desc->hw.init->num_parents;
+	init.name = clock_data->name;
+	init.flags = clock_data->flags | CLK_IGNORE_UNUSED;
+	init.ops = &rp1_clk_ops;
+
+	desc->clockman = clockman;
+	desc->hw.init = &init;
+
+	ret = devm_clk_hw_register(clockman->dev, &desc->hw);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &desc->hw;
+}
+
+/* Assignment helper macros for different clock types. */
+#define _REGISTER(f, ...)	{ .clk_register = f, __VA_ARGS__ }
+
+#define PARENT_CLK(pnum, ...)	.hw.init = &(const struct clk_init_data) { \
+				.parent_data = (const struct		   \
+						clk_parent_data[]) {	   \
+							__VA_ARGS__	   \
+						},			   \
+				.num_parents = pnum }
+
+#define CLK_DATA(type, ...)	.data = &(struct type) { __VA_ARGS__ }
+
+#define REGISTER_PLL_CORE(...)	_REGISTER(&rp1_register_pll_core,	\
+					  __VA_ARGS__)
+
+#define REGISTER_PLL(...)	_REGISTER(&rp1_register_pll,		\
+					  __VA_ARGS__)
+
+#define REGISTER_PLL_PH(...)	_REGISTER(&rp1_register_pll_ph,		\
+					  __VA_ARGS__)
+
+#define REGISTER_PLL_DIV(...)	_REGISTER(&rp1_register_pll_divider,	\
+					  __VA_ARGS__)
+
+#define REGISTER_CLK(...)	_REGISTER(&rp1_register_clock,		\
+					  __VA_ARGS__)
+
+static struct rp1_clk_desc clk_desc_array[] = {
+	[RP1_PLL_SYS_CORE] = REGISTER_PLL_CORE(PARENT_CLK(1, { .index = 0 }),
+				CLK_DATA(rp1_pll_core_data,
+					 .name = "pll_sys_core",
+					 .cs_reg = PLL_SYS_CS,
+					 .pwr_reg = PLL_SYS_PWR,
+					 .fbdiv_int_reg = PLL_SYS_FBDIV_INT,
+					 .fbdiv_frac_reg = PLL_SYS_FBDIV_FRAC,
+				)),
+
+	[RP1_PLL_AUDIO_CORE] = REGISTER_PLL_CORE(PARENT_CLK(1, { .index = 0 }),
+				CLK_DATA(rp1_pll_core_data,
+					 .name = "pll_audio_core",
+					 .cs_reg = PLL_AUDIO_CS,
+					 .pwr_reg = PLL_AUDIO_PWR,
+					 .fbdiv_int_reg = PLL_AUDIO_FBDIV_INT,
+					 .fbdiv_frac_reg = PLL_AUDIO_FBDIV_FRAC,
+				)),
+
+	[RP1_PLL_VIDEO_CORE] = REGISTER_PLL_CORE(PARENT_CLK(1, { .index = 0 }),
+				CLK_DATA(rp1_pll_core_data,
+					 .name = "pll_video_core",
+					 .cs_reg = PLL_VIDEO_CS,
+					 .pwr_reg = PLL_VIDEO_PWR,
+					 .fbdiv_int_reg = PLL_VIDEO_FBDIV_INT,
+					 .fbdiv_frac_reg = PLL_VIDEO_FBDIV_FRAC,
+				)),
+
+	[RP1_PLL_SYS] = REGISTER_PLL(PARENT_CLK(1,
+				{ .hw = &clk_desc_array[RP1_PLL_SYS_CORE].hw }
+				),
+				CLK_DATA(rp1_pll_data,
+					 .name = "pll_sys",
+					 .ctrl_reg = PLL_SYS_PRIM,
+					 .fc0_src = FC_NUM(0, 2),
+				)),
+
+	[RP1_CLK_ETH_TSU] = REGISTER_CLK(PARENT_CLK(1, { .index = 0 }),
+				CLK_DATA(rp1_clock_data,
+					 .name = "clk_eth_tsu",
+					 .num_std_parents = 0,
+					 .num_aux_parents = 1,
+					 .ctrl_reg = CLK_ETH_TSU_CTRL,
+					 .div_int_reg = CLK_ETH_TSU_DIV_INT,
+					 .sel_reg = CLK_ETH_TSU_SEL,
+					 .div_int_max = DIV_INT_8BIT_MAX,
+					 .max_freq = 50 * HZ_PER_MHZ,
+					 .fc0_src = FC_NUM(5, 7),
+				)),
+
+	[RP1_CLK_SYS] = REGISTER_CLK(PARENT_CLK(3,
+				{ .index = 0 },
+				{ .index = -1 },
+				{ .hw = &clk_desc_array[RP1_PLL_SYS].hw }
+				),
+				CLK_DATA(rp1_clock_data,
+					 .name = "clk_sys",
+					 .num_std_parents = 3,
+					 .num_aux_parents = 0,
+					 .ctrl_reg = CLK_SYS_CTRL,
+					 .div_int_reg = CLK_SYS_DIV_INT,
+					 .sel_reg = CLK_SYS_SEL,
+					 .div_int_max = DIV_INT_24BIT_MAX,
+					 .max_freq = 200 * HZ_PER_MHZ,
+					 .fc0_src = FC_NUM(0, 4),
+					 .clk_src_mask = 0x3,
+				)),
+
+	[RP1_PLL_SYS_PRI_PH] = REGISTER_PLL_PH(PARENT_CLK(1,
+				{ .hw = &clk_desc_array[RP1_PLL_SYS].hw }
+				),
+				CLK_DATA(rp1_pll_ph_data,
+					 .name = "pll_sys_pri_ph",
+					 .ph_reg = PLL_SYS_PRIM,
+					 .fixed_divider = 2,
+					 .phase = RP1_PLL_PHASE_0,
+					 .fc0_src = FC_NUM(1, 2),
+				)),
+
+	[RP1_PLL_SYS_SEC] = REGISTER_PLL_DIV(PARENT_CLK(1,
+				{ .hw = &clk_desc_array[RP1_PLL_SYS_CORE].hw }
+				),
+				CLK_DATA(rp1_pll_data,
+					 .name = "pll_sys_sec",
+					 .ctrl_reg = PLL_SYS_SEC,
+					 .fc0_src = FC_NUM(2, 2),
+				)),
+};
+
+static const struct regmap_range rp1_reg_ranges[] = {
+	regmap_reg_range(PLL_SYS_CS, PLL_SYS_SEC),
+	regmap_reg_range(PLL_AUDIO_CS, PLL_AUDIO_TERN),
+	regmap_reg_range(PLL_VIDEO_CS, PLL_VIDEO_SEC),
+	regmap_reg_range(GPCLK_OE_CTRL, GPCLK_OE_CTRL),
+	regmap_reg_range(CLK_SYS_CTRL, CLK_SYS_DIV_INT),
+	regmap_reg_range(CLK_SYS_SEL, CLK_SYS_SEL),
+	regmap_reg_range(CLK_SLOW_SYS_CTRL, CLK_SLOW_SYS_DIV_INT),
+	regmap_reg_range(CLK_SLOW_SYS_SEL, CLK_SLOW_SYS_SEL),
+	regmap_reg_range(CLK_DMA_CTRL, CLK_DMA_DIV_INT),
+	regmap_reg_range(CLK_DMA_SEL, CLK_DMA_SEL),
+	regmap_reg_range(CLK_UART_CTRL, CLK_UART_DIV_INT),
+	regmap_reg_range(CLK_UART_SEL, CLK_UART_SEL),
+	regmap_reg_range(CLK_ETH_CTRL, CLK_ETH_DIV_INT),
+	regmap_reg_range(CLK_ETH_SEL, CLK_ETH_SEL),
+	regmap_reg_range(CLK_PWM0_CTRL, CLK_PWM0_SEL),
+	regmap_reg_range(CLK_PWM1_CTRL, CLK_PWM1_SEL),
+	regmap_reg_range(CLK_AUDIO_IN_CTRL, CLK_AUDIO_IN_DIV_INT),
+	regmap_reg_range(CLK_AUDIO_IN_SEL, CLK_AUDIO_IN_SEL),
+	regmap_reg_range(CLK_AUDIO_OUT_CTRL, CLK_AUDIO_OUT_DIV_INT),
+	regmap_reg_range(CLK_AUDIO_OUT_SEL, CLK_AUDIO_OUT_SEL),
+	regmap_reg_range(CLK_I2S_CTRL, CLK_I2S_DIV_INT),
+	regmap_reg_range(CLK_I2S_SEL, CLK_I2S_SEL),
+	regmap_reg_range(CLK_MIPI0_CFG_CTRL, CLK_MIPI0_CFG_DIV_INT),
+	regmap_reg_range(CLK_MIPI0_CFG_SEL, CLK_MIPI0_CFG_SEL),
+	regmap_reg_range(CLK_MIPI1_CFG_CTRL, CLK_MIPI1_CFG_DIV_INT),
+	regmap_reg_range(CLK_MIPI1_CFG_SEL, CLK_MIPI1_CFG_SEL),
+	regmap_reg_range(CLK_PCIE_AUX_CTRL, CLK_PCIE_AUX_DIV_INT),
+	regmap_reg_range(CLK_PCIE_AUX_SEL, CLK_PCIE_AUX_SEL),
+	regmap_reg_range(CLK_USBH0_MICROFRAME_CTRL, CLK_USBH0_MICROFRAME_DIV_INT),
+	regmap_reg_range(CLK_USBH0_MICROFRAME_SEL, CLK_USBH0_MICROFRAME_SEL),
+	regmap_reg_range(CLK_USBH1_MICROFRAME_CTRL, CLK_USBH1_MICROFRAME_DIV_INT),
+	regmap_reg_range(CLK_USBH1_MICROFRAME_SEL, CLK_USBH1_MICROFRAME_SEL),
+	regmap_reg_range(CLK_USBH0_SUSPEND_CTRL, CLK_USBH0_SUSPEND_DIV_INT),
+	regmap_reg_range(CLK_USBH0_SUSPEND_SEL, CLK_USBH0_SUSPEND_SEL),
+	regmap_reg_range(CLK_USBH1_SUSPEND_CTRL, CLK_USBH1_SUSPEND_DIV_INT),
+	regmap_reg_range(CLK_USBH1_SUSPEND_SEL, CLK_USBH1_SUSPEND_SEL),
+	regmap_reg_range(CLK_ETH_TSU_CTRL, CLK_ETH_TSU_DIV_INT),
+	regmap_reg_range(CLK_ETH_TSU_SEL, CLK_ETH_TSU_SEL),
+	regmap_reg_range(CLK_ADC_CTRL, CLK_ADC_DIV_INT),
+	regmap_reg_range(CLK_ADC_SEL, CLK_ADC_SEL),
+	regmap_reg_range(CLK_SDIO_TIMER_CTRL, CLK_SDIO_TIMER_DIV_INT),
+	regmap_reg_range(CLK_SDIO_TIMER_SEL, CLK_SDIO_TIMER_SEL),
+	regmap_reg_range(CLK_SDIO_ALT_SRC_CTRL, CLK_SDIO_ALT_SRC_DIV_INT),
+	regmap_reg_range(CLK_SDIO_ALT_SRC_SEL, CLK_SDIO_ALT_SRC_SEL),
+	regmap_reg_range(CLK_GP0_CTRL, CLK_GP0_SEL),
+	regmap_reg_range(CLK_GP1_CTRL, CLK_GP1_SEL),
+	regmap_reg_range(CLK_GP2_CTRL, CLK_GP2_SEL),
+	regmap_reg_range(CLK_GP3_CTRL, CLK_GP3_SEL),
+	regmap_reg_range(CLK_GP4_CTRL, CLK_GP4_SEL),
+	regmap_reg_range(CLK_GP5_CTRL, CLK_GP5_SEL),
+	regmap_reg_range(CLK_SYS_RESUS_CTRL, CLK_SYS_RESUS_CTRL),
+	regmap_reg_range(CLK_SLOW_SYS_RESUS_CTRL, CLK_SLOW_SYS_RESUS_CTRL),
+	regmap_reg_range(FC0_REF_KHZ, FC0_RESULT),
+	regmap_reg_range(VIDEO_CLK_VEC_CTRL, VIDEO_CLK_VEC_DIV_INT),
+	regmap_reg_range(VIDEO_CLK_VEC_SEL, VIDEO_CLK_DPI_DIV_INT),
+	regmap_reg_range(VIDEO_CLK_DPI_SEL, VIDEO_CLK_MIPI1_DPI_SEL),
+};
+
+static const struct regmap_access_table rp1_reg_table = {
+	.yes_ranges = rp1_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rp1_reg_ranges),
+};
+
+static const struct regmap_config rp1_clk_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = PLL_VIDEO_SEC,
+	.name = "rp1-clk",
+	.rd_table = &rp1_reg_table,
+};
+
+static int rp1_clk_probe(struct platform_device *pdev)
+{
+	const size_t asize = ARRAY_SIZE(clk_desc_array);
+	struct rp1_clk_desc *desc;
+	struct device *dev = &pdev->dev;
+	struct rp1_clockman *clockman;
+	struct clk_hw **hws;
+	unsigned int i;
+
+	clockman = devm_kzalloc(dev, struct_size(clockman, onecell.hws, asize),
+				GFP_KERNEL);
+	if (!clockman)
+		return -ENOMEM;
+
+	spin_lock_init(&clockman->regs_lock);
+	clockman->dev = dev;
+
+	clockman->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(clockman->regs))
+		return PTR_ERR(clockman->regs);
+
+	clockman->regmap = devm_regmap_init_mmio(dev, clockman->regs,
+						 &rp1_clk_regmap_cfg);
+	if (IS_ERR(clockman->regmap)) {
+		dev_err(dev, "could not init clock regmap\n");
+		return PTR_ERR(clockman->regmap);
+	}
+
+	clockman->onecell.num = asize;
+	hws = clockman->onecell.hws;
+
+	for (i = 0; i < asize; i++) {
+		desc = &clk_desc_array[i];
+		if (desc->clk_register && desc->data) {
+			hws[i] = desc->clk_register(clockman, desc);
+			if (IS_ERR_OR_NULL(hws[i]))
+				dev_err_probe(dev, PTR_ERR(hws[i]),
+					      "Unable to register clock: %s\n",
+					      clk_hw_get_name(hws[i]));
+		}
+	}
+
+	platform_set_drvdata(pdev, clockman);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   &clockman->onecell);
+}
+
+static const struct of_device_id rp1_clk_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-clocks" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rp1_clk_of_match);
+
+static struct platform_driver rp1_clk_driver = {
+	.driver = {
+		.name = "rp1-clk",
+		.of_match_table = rp1_clk_of_match,
+	},
+	.probe = rp1_clk_probe,
+};
+
+module_platform_driver(rp1_clk_driver);
+
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("RP1 clock driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3


