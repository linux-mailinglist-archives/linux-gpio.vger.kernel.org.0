Return-Path: <linux-gpio+bounces-37661-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA0qBek9GWpVtAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37661-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:19:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 845795FE6B2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47DFB3037DF4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236B42E736F;
	Fri, 29 May 2026 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNR9zCK0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C203ACA5C
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038871; cv=none; b=cgbOTaHLuBKJhZ4HSTEkS/pSmgNMiIOZ2Gz/2JxMbTyGL2pRft3xoBiOn5uTl5kZGSzC08Wj7h4C1wJZdG9nASPH2rV+Q7PSTaSiv7ZQ89rspk0zNFduDpqOS0eMuriXX24n9ZU3vvNES7bGFq5R6PtahoHRr1XgtikkJp0gFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038871; c=relaxed/simple;
	bh=oJNhjWV/+uk35l4NShVvd9PPlcT/LHnMBhpdlpEvzSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o82mw7uTCdsvA4y+zzFvxgnreN0du06dHszHo39xsFCagQDSTu1+ppLB8QyId/6Nz8ZPs6xzZjxc3uJmHLrtzSwJ+rsS6k9yx3hYfxftqf5a3xmZo8fqnSvkSswEC9YaoePFFC79FOfaxu/ceQS1MG/5Atd3lB9wrQTHJWOmBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNR9zCK0; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137bd9ed2b1so419716c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780038869; x=1780643669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ehr5A2spRRQLM6AkQvxbsShMePVQtTYUHFq4y4sUq0=;
        b=VNR9zCK0fcgg7jWdUaQxgqelWrIDisXJt7fBqqX4AR/OZAJ+l/Hs8SpMnVb1iXg2xo
         ohVXCuGi4LcWgI88VoO0LH8x1LWs/L6sHik51RgIk2uNcR0qZrngjBUyjNxyEb1OlUQs
         Z8O1SJ7WZtoj5ygFrzkn/KhIL+cgiW8CXtLo4Ruf/cijb5ZVdMGJUleDo2zjc8Bjzzgm
         KGFWiJDja3BVJMPP7RsS/6bluBTksHEYJNpT2nw0MQFpRYselGQnrF2KvWWfXrXGCFnE
         VnB151yiNFDsKwm7/ctL35rAgf0GGDXouAMq1r15dtghUYUzAhM7BFHr/c+sBmh1aLKK
         wEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038869; x=1780643669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ehr5A2spRRQLM6AkQvxbsShMePVQtTYUHFq4y4sUq0=;
        b=r3+6snTDu+Le/7tD8C4okndrmWt9p6+WchUyJbftCP3+Fvgj7VwZUzwBeS5Z4uDulr
         iSPtH+VI5uJis0EN5i6A7uUWZy9z95idQJ1TTdxWlkRX2XLuRUwXl64GL8BNjkCmClTZ
         jH3S9aq9nv3b3bFBp+4htdtXv8m1qBDdaLjwxQnFh1ylBaHOODZ6k5opl+1bZ0kWMMuQ
         L0rYrxm40A0FkZzZegvfgFNnJlJYWx0WAfU/+HYxScL5dv6iPMrbbscC4utsdu9BQ3+S
         EwQWXBY1z2Iuhlsdf9FI2Xf1ax5wYwyn2cttA90FHqkXKIbZrlZzGO8bo+7CT3NWZoVl
         uGkg==
X-Forwarded-Encrypted: i=1; AFNElJ9z2TCNY6RYy0SbMspJ/k2eEOyzO+m0ZtKUBhTgXcgJaIQnyAi2jpeVwmN14eYtBejo1TSiNwJW7ZSW@vger.kernel.org
X-Gm-Message-State: AOJu0YzapZiqxRRHG+YHqCJdqMXOeqncZp3LkCzGThAIUvsLZuew9hZr
	yzubLfGwU1N3R0Ejq1NMnDqvNJqKeLMuK+9CdpjY5Wn2EPMe9YWRG8WU
X-Gm-Gg: Acq92OFVN22Xg7WKyd6uEza0ZBF7x0aNE1Kihsq01/jHuPUWEv1PAbokWTKW/HvYY0i
	VaGrU7Zyg4wWhnGqf0Csoaw83L5MUf4CpSEgaT60C/8nOYkDZHs6xR9BIr7MZbFFZr2WrMfrHyK
	DiyLqovoseeGg6hdNOBjnECn1RqDS54zemO8vB/p6FHla0fOVg94jz6AOx4kGz64vvAQZBxOCOk
	XSNFqnRKB7gnmgsyo8gqD+YR+w+zTxlRzFTwJa8WirGB8n5I2MCfFhL980k6e116yZY2A3CnZ1d
	wdyE29fg2AL/xR3oO9KFvdpKVYYFQ0RcKoPRZ7OOCoA48yuiFZtbPLOcZQYssRQmGnXEoQqeRs+
	002j1VBh/YsZK0Yq+E1sxzZdvWgt0TF5ZEkECR7P5UN9JoV3lhiNq6w9rzpMb8Gw9fAa2bOs3cH
	/IBkZn+WEhSMC8F84zgb0E2UQxjnosgBSZL8LexQYaYPCH16aJxWsXfmSImiYi6b9puwLpagCdm
	o622HnJErqnfkMClJc8fEhBweGu6dWKvwHNRZDc5WHOgoanjZEjGNvF
X-Received: by 2002:a05:7023:b86:b0:12a:68cc:3efb with SMTP id a92af1059eb24-137aea9a20bmr708048c88.16.1780038868473;
        Fri, 29 May 2026 00:14:28 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b2d04287sm950680c88.0.2026.05.29.00.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:14:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM)
Subject: [PATCH] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
Date: Fri, 29 May 2026 00:14:08 -0700
Message-ID: <20260529071408.38689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37661-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Queue-Id: 845795FE6B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
drivers/gpio/gpio-ppc44x.c. The driver follows the same pattern as
other PowerPC GPIO drivers already in drivers/gpio/ (e.g.
gpio-mpc8xxx, gpio-mpc5200).

- Replace PPC-specific clrbits32()/setbits32() with local helpers
  using ioread32be()/iowrite32be() so the driver can be built on
  any architecture with COMPILE_TEST
- Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC44X (40x was
  removed in 47d13a269bbd, only 44x remains)
- Rename symbols in the driver with 44x instead of 4xx to reflect the
  absense of 40x.
- Changed dependency to depends on 44x || COMPILE_TEST
- Updated ppc44x_defconfig and warp_defconfig to use the new symbol
- Marked the new option as tristate (was bool) since the driver
  supports module build via module_platform_driver()

Assisted-by: OpenCode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: COMPILE_TEST everywhere
 arch/powerpc/configs/44x/warp_defconfig       |  2 +-
 arch/powerpc/configs/ppc44x_defconfig         |  2 +-
 arch/powerpc/platforms/44x/Kconfig            |  8 --
 arch/powerpc/platforms/44x/Makefile           |  1 -
 drivers/gpio/Kconfig                          |  7 ++
 drivers/gpio/Makefile                         |  1 +
 .../44x/gpio.c => drivers/gpio/gpio-ppc44x.c  | 88 +++++++++++--------
 7 files changed, 62 insertions(+), 47 deletions(-)
 rename arch/powerpc/platforms/44x/gpio.c => drivers/gpio/gpio-ppc44x.c (61%)

diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
index 5757625469c4..d6014b9c5708 100644
--- a/arch/powerpc/configs/44x/warp_defconfig
+++ b/arch/powerpc/configs/44x/warp_defconfig
@@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_EBONY is not set
 CONFIG_WARP=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC44X=y
 CONFIG_HZ_1000=y
 CONFIG_CMDLINE="ip=on"
 # CONFIG_PCI is not set
diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
index 41c930f74ed4..b0c7ad8c6d9b 100644
--- a/arch/powerpc/configs/ppc44x_defconfig
+++ b/arch/powerpc/configs/ppc44x_defconfig
@@ -22,7 +22,7 @@ CONFIG_GLACIER=y
 CONFIG_REDWOOD=y
 CONFIG_EIGER=y
 CONFIG_YOSEMITE=y
-CONFIG_PPC4xx_GPIO=y
+CONFIG_GPIO_PPC44X=y
 CONFIG_MATH_EMULATION=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index d9717bf04a3f..150813cea945 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -227,14 +227,6 @@ config PPC44x_SIMPLE
 	help
 	  This option enables the simple PowerPC 44x platform support.

-config PPC4xx_GPIO
-	bool "PPC4xx GPIO support"
-	depends on 44x
-	select GPIO_GENERIC
-	select GPIOLIB
-	help
-	  Enable gpiolib support for ppc440 based boards
-
 # 44x specific CPU modules, selected based on the board above.
 config 440EP
 	bool
diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index ca7b1bb442d9..179468a00f5e 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -15,4 +15,3 @@ obj-$(CONFIG_FSP2)	+= fsp2.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
 obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
-obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 89c77ec6c205..7374f82b7040 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -593,6 +593,13 @@ config GPIO_POLARFIRE_SOC
 	help
 	  Say yes here to support the GPIO controllers on Microchip FPGAs.

+config GPIO_PPC44X
+	tristate "PPC44x GPIO support"
+	depends on 44x || COMPILE_TEST
+	select GPIO_GENERIC
+	help
+	  Enable gpiolib support for ppc440 based boards.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 8ec03c9aec20..9e8c9ca1d3fb 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
+obj-$(CONFIG_GPIO_PPC44X)		+= gpio-ppc44x.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc44x.c
similarity index 61%
rename from arch/powerpc/platforms/44x/gpio.c
rename to drivers/gpio/gpio-ppc44x.c
index 6b4814ed12b5..cc7796e0cfbd 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * PPC4xx gpio driver
+ * PPC44x gpio driver
  *
  * Copyright (c) 2008 Harris Corporation
  * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
@@ -22,7 +22,7 @@
 #define GPIO_MASK2(gpio)	(0xc0000000 >> ((gpio) * 2))

 /* Physical GPIO register layout */
-struct ppc4xx_gpio {
+struct ppc44x_gpio {
 	__be32 or;
 	__be32 tcr;
 	__be32 osrl;
@@ -43,11 +43,27 @@ struct ppc4xx_gpio {
 	__be32 isr3h;
 };

-struct ppc4xx_gpio_chip {
+struct ppc44x_gpio_chip {
 	struct gpio_generic_chip chip;
 	void __iomem *regs;
 };

+static inline void ppc44x_clrbits32(void __iomem *addr, u32 mask)
+{
+	u32 val = ioread32be(addr);
+
+	val &= ~mask;
+	iowrite32be(val, addr);
+}
+
+static inline void ppc44x_setbits32(void __iomem *addr, u32 mask)
+{
+	u32 val = ioread32be(addr);
+
+	val |= mask;
+	iowrite32be(val, addr);
+}
+
 /*
  * GPIO LIB API implementation for GPIOs
  *
@@ -55,9 +71,9 @@ struct ppc4xx_gpio_chip {
  */

 static inline void
-__ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+__ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	struct gpio_generic_chip *gen_gc = &chip->chip;

 	if (val)
@@ -68,29 +84,29 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
 }

-static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
+static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	struct gpio_generic_chip *gen_gc = &chip->chip;
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 	unsigned long flags;

 	gpio_generic_chip_lock_irqsave(gen_gc, flags);

 	/* Disable open-drain function */
-	clrbits32(&regs->odr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));

 	/* Float the pin */
-	clrbits32(&regs->tcr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir &= ~GPIO_MASK(gpio);

 	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
 	if (gpio < 16) {
-		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
 	} else {
-		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}

 	gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
@@ -99,32 +115,32 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 }

 static int
-ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	struct gpio_generic_chip *gen_gc = &chip->chip;
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 	unsigned long flags;

 	gpio_generic_chip_lock_irqsave(gen_gc, flags);

 	/* First set initial value */
-	__ppc4xx_gpio_set(gc, gpio, val);
+	__ppc44x_gpio_set(gc, gpio, val);

 	/* Disable open-drain function */
-	clrbits32(&regs->odr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));

 	/* Drive the pin */
-	setbits32(&regs->tcr, GPIO_MASK(gpio));
+	ppc44x_setbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir |= GPIO_MASK(gpio);

 	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
 	if (gpio < 16) {
-		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
 	} else {
-		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}

 	gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
@@ -134,14 +150,14 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }

-static int ppc4xx_gpio_probe(struct platform_device *ofdev)
+static int ppc44x_gpio_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
-	struct ppc4xx_gpio_chip *chip;
+	struct ppc44x_gpio_chip *chip;
 	struct gpio_generic_chip_config config;
 	struct gpio_chip *gc;
-	struct ppc4xx_gpio __iomem *regs;
+	struct ppc44x_gpio __iomem *regs;
 	int ret;

 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -169,8 +185,8 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)

 	gc = &chip->chip.gc;
 	gc->fwnode = dev_fwnode(dev);
-	gc->direction_input = ppc4xx_gpio_dir_in;
-	gc->direction_output = ppc4xx_gpio_dir_out;
+	gc->direction_input = ppc44x_gpio_dir_in;
+	gc->direction_output = ppc44x_gpio_dir_out;

 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 	if (!gc->label)
@@ -179,20 +195,20 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	return devm_gpiochip_add_data(dev, gc, chip);
 }

-static const struct of_device_id ppc4xx_gpio_match[] = {
+static const struct of_device_id ppc44x_gpio_match[] = {
 	{
 		.compatible = "ibm,ppc4xx-gpio",
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(of, ppc4xx_gpio_match);
+MODULE_DEVICE_TABLE(of, ppc44x_gpio_match);

-static struct platform_driver ppc4xx_gpio_driver = {
-	.probe		= ppc4xx_gpio_probe,
+static struct platform_driver ppc44x_gpio_driver = {
+	.probe		= ppc44x_gpio_probe,
 	.driver		= {
-		.name	= "ppc4xx-gpio",
-		.of_match_table	= ppc4xx_gpio_match,
+		.name	= "ppc44x-gpio",
+		.of_match_table	= ppc44x_gpio_match,
 	},
 };

-module_platform_driver(ppc4xx_gpio_driver);
+module_platform_driver(ppc44x_gpio_driver);
--
2.54.0


