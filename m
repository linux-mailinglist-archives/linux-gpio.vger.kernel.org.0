Return-Path: <linux-gpio+bounces-1045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5B806459
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 02:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB3291F21700
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 01:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D861E2105;
	Wed,  6 Dec 2023 01:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGVtiVy0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EBED4D;
	Tue,  5 Dec 2023 17:46:31 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ce6d926f76so291904b3a.1;
        Tue, 05 Dec 2023 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701827190; x=1702431990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kXu/UPxVKmDhF7qMSok5hl4RMufr9c58lvSU1Ok2Xo=;
        b=bGVtiVy0zqCXUX727WqiSU5PdgUWwe7DMqYUMua85oKTGfirzIVNcT6skPI3Qb/4LN
         Wofnx5GhMBEUPPREwtQjNgpX5LUQuxyP4g8MhLxO4RPqIlrNc+5c73nG3HmG41x+SR4w
         gTuVFJwHdSZlwKibmSl3xVyElrLXgl6Z7ZPbKrZ81UC6ftn5vm/szDP4Nt2NV+X/lZs9
         55Lou+Tsc2GqXCxHtA0v6LE5KECr1xeSYlfnwDyx74xCMFfd1Nn9YDw0HKtm1FjFxXZY
         HlzUiSkt/ZIkVnmSVoapuC8aDEZvccP9jmH1fN+vqaDN6F4z3lHu49i5rhbQw/rE+0QP
         dhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701827190; x=1702431990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kXu/UPxVKmDhF7qMSok5hl4RMufr9c58lvSU1Ok2Xo=;
        b=kz9gdp+uzq1XY9whj4WVl5k7ccQxR67jFvjHZnw6CSk2vySJ2OK5p5LBu/UPkRkQxA
         pWqnCr1iX/ErNzV3OQCJ+FN3F1ALMjBQv4Yj5HBq2vkeDBEYIAI2j7fR8nl2URbByIq4
         xXB9LSNKMCwDeG67+I8IN4KBxEi4KXC0LDKRTDFijW1wJAiccn5hZ/XXBNDCRGNc54Z9
         v5V/IlXVzKlONiXC1+ZflHdbWp/sj5xxZJUl4dsBJrF/kMV4dadAyUr3x2HmBuoNzLaO
         PTlWROyylld4gjEKfAYZ+tl23tQMp5S0gQ4LUAkxTh1hG/utY8MLB3+zx3seIM8Xusju
         9uQQ==
X-Gm-Message-State: AOJu0Yw9cbbLY4A4VJVSTFB6LZ8aSKoPE/+gPqNUSaW0vkvvAL+F8kYr
	OXL+/NHXfL9xqkBIiXcR6irFZs1x3ts/QQ==
X-Google-Smtp-Source: AGHT+IG3o3pANiNo3Stj5ypDYPFm4LFflhojSHczab21ch/6r16GOSNBbj3Hzr5aQZJkAjpfYksJfA==
X-Received: by 2002:a05:6a20:3cab:b0:187:a9b0:434b with SMTP id b43-20020a056a203cab00b00187a9b0434bmr167638pzj.4.1701827190447;
        Tue, 05 Dec 2023 17:46:30 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.69])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006ce781f6f85sm1250956pfo.43.2023.12.05.17.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 17:46:30 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	andy@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v8 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Date: Wed,  6 Dec 2023 09:45:30 +0800
Message-Id: <20231206014530.1600151-4-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206014530.1600151-1-jim.t90615@gmail.com>
References: <20231206014530.1600151-1-jim.t90615@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Nuvoton BMC NPCM7xx/NPCM8xx sgpio driver support.
Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
and parallel to serial IC (HC165), and use APB3 clock to control it.
This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
BMC can use this driver to increase 64 GPI pins and 64 GPO pins to use.

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v8:
   - Remove OF_GPIO/GPIO_GENERIC and redundant assignments
   - Use GENMASK() and BIT()
   - Use dev_WARN and dev_err_probe
   - Check indentation issue
   - Use raw_spinlock_t
Changes for v7:
   - Remove unused variable
   - Remove return in bank_reg function
   - Fix warning for const issue
---
 drivers/gpio/Kconfig           |   7 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-npcm-sgpio.c | 637 +++++++++++++++++++++++++++++++++
 3 files changed, 645 insertions(+)
 create mode 100644 drivers/gpio/gpio-npcm-sgpio.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b3a133ed31ee..efbdc93819d4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -478,6 +478,13 @@ config GPIO_MXS
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
+config GPIO_NPCM_SGPIO
+	bool "Nuvoton SGPIO support"
+	depends on ARCH_NPCM || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Nuvoton NPCM7XX/NPCM8XX SGPIO functionality.
+
 config GPIO_OCTEON
 	tristate "Cavium OCTEON GPIO"
 	depends on CAVIUM_OCTEON_SOC
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index eb73b5d633eb..373aa2943de5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
new file mode 100644
index 000000000000..52dde726f175
--- /dev/null
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -0,0 +1,637 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM Serial GPIO Driver
+ *
+ * Copyright (C) 2021 Nuvoton Technologies
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/hashtable.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#define MAX_NR_HW_SGPIO		64
+
+#define  NPCM_IOXCFG1		0x2A
+#define  NPCM_IOXCFG1_SFT_CLK	GENMASK(3, 0)
+#define  NPCM_IOXCFG1_SCLK_POL	BIT(4)
+#define  NPCM_IOXCFG1_LDSH_POL	BIT(5)
+
+#define  NPCM_IOXCTS			0x28
+#define  NPCM_IOXCTS_IOXIF_EN		BIT(7)
+#define  NPCM_IOXCTS_RD_MODE		GENMASK(2, 1)
+#define  NPCM_IOXCTS_RD_MODE_PERIODIC	BIT(2)
+
+#define  NPCM_IOXCFG2		0x2B
+#define  NPCM_IOXCFG2_PORT	GENMASK(3, 0)
+
+#define  NPCM_IXOEVCFG_MASK	GENMASK(1, 0)
+#define  NPCM_IXOEVCFG_FALLING	BIT(1)
+#define  NPCM_IXOEVCFG_RISING	BIT(0)
+#define  NPCM_IXOEVCFG_BOTH	(NPCM_IXOEVCFG_FALLING | NPCM_IXOEVCFG_RISING)
+
+#define NPCM_CLK_MHZ	8000000
+
+#define GPIO_BANK(x)    ((x) / 8)
+#define GPIO_BIT(x)     ((x) % 8)
+
+/*
+ * Select the frequency of shift clock.
+ * The shift clock is a division of the APB clock.
+ */
+struct npcm_clk_cfg {
+	unsigned int	*sft_clk;
+	unsigned int	*clk_sel;
+	unsigned int	cfg_opt;
+};
+
+struct npcm_sgpio {
+	struct gpio_chip chip;
+	struct clk *pclk;
+	struct irq_chip intc;
+	raw_spinlock_t lock;	/*protect event config*/
+	void __iomem *base;
+	int irq;
+	u8 nin_sgpio;
+	u8 nout_sgpio;
+	u8 in_port;
+	u8 out_port;
+	u8 int_type[MAX_NR_HW_SGPIO];
+};
+
+struct npcm_sgpio_bank {
+	u8 rdata_reg;
+	u8 wdata_reg;
+	u8 event_config;
+	u8 event_status;
+};
+
+enum npcm_sgpio_reg {
+	READ_DATA,
+	WRITE_DATA,
+	EVENT_CFG,
+	EVENT_STS,
+};
+
+static const struct npcm_sgpio_bank npcm_sgpio_banks[] = {
+	{
+		.wdata_reg = 0x00,
+		.rdata_reg = 0x08,
+		.event_config = 0x10,
+		.event_status = 0x20,
+	},
+	{
+		.wdata_reg = 0x01,
+		.rdata_reg = 0x09,
+		.event_config = 0x12,
+		.event_status = 0x21,
+	},
+	{
+		.wdata_reg = 0x02,
+		.rdata_reg = 0x0a,
+		.event_config = 0x14,
+		.event_status = 0x22,
+	},
+	{
+		.wdata_reg = 0x03,
+		.rdata_reg = 0x0b,
+		.event_config = 0x16,
+		.event_status = 0x23,
+	},
+	{
+		.wdata_reg = 0x04,
+		.rdata_reg = 0x0c,
+		.event_config = 0x18,
+		.event_status = 0x24,
+	},
+	{
+		.wdata_reg = 0x05,
+		.rdata_reg = 0x0d,
+		.event_config = 0x1a,
+		.event_status = 0x25,
+	},
+	{
+		.wdata_reg = 0x06,
+		.rdata_reg = 0x0e,
+		.event_config = 0x1c,
+		.event_status = 0x26,
+	},
+	{
+		.wdata_reg = 0x07,
+		.rdata_reg = 0x0f,
+		.event_config = 0x1e,
+		.event_status = 0x27,
+	},
+
+};
+
+static void __iomem *bank_reg(struct npcm_sgpio *gpio,
+			      const struct npcm_sgpio_bank *bank,
+			      const enum npcm_sgpio_reg reg)
+{
+	switch (reg) {
+	case READ_DATA:
+		return gpio->base + bank->rdata_reg;
+	case WRITE_DATA:
+		return gpio->base + bank->wdata_reg;
+	case EVENT_CFG:
+		return gpio->base + bank->event_config;
+	case EVENT_STS:
+		return gpio->base + bank->event_status;
+	default:
+		/* actually if code runs to here, it's an error case */
+		dev_WARN(true, "Getting here is an error condition");
+	}
+	return 0;
+}
+
+static const struct npcm_sgpio_bank *offset_to_bank(unsigned int offset)
+{
+	unsigned int bank = GPIO_BANK(offset);
+
+	return &npcm_sgpio_banks[bank];
+}
+
+static void irqd_to_npcm_sgpio_data(struct irq_data *d,
+				    struct npcm_sgpio **gpio,
+				    const struct npcm_sgpio_bank **bank,
+				    u8 *bit, unsigned int *offset)
+{
+	struct npcm_sgpio *internal;
+
+	*offset = irqd_to_hwirq(d);
+	internal = irq_data_get_irq_chip_data(d);
+
+	*gpio = internal;
+	*offset -= internal->nout_sgpio;
+	*bank = offset_to_bank(*offset);
+	*bit = GPIO_BIT(*offset);
+}
+
+static int npcm_sgpio_init_port(struct npcm_sgpio *gpio)
+{
+	u8 in_port, out_port, set_port, reg;
+
+	in_port = GPIO_BANK(gpio->nin_sgpio);
+	if (GPIO_BIT(gpio->nin_sgpio) > 0)
+		in_port += 1;
+
+	out_port = GPIO_BANK(gpio->nout_sgpio);
+	if (GPIO_BIT(gpio->nout_sgpio) > 0)
+		out_port += 1;
+
+	gpio->in_port = in_port;
+	gpio->out_port = out_port;
+	set_port = ((out_port & NPCM_IOXCFG2_PORT) << 4) | (in_port & NPCM_IOXCFG2_PORT);
+	iowrite8(set_port, gpio->base + NPCM_IOXCFG2);
+
+	reg = ioread8(gpio->base + NPCM_IOXCFG2);
+
+	return reg == set_port ? 0 : -EINVAL;
+
+}
+
+static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	return offset <	gpio->nout_sgpio ? -EINVAL : 0;
+
+}
+
+static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	gc->set(gc, offset, val);
+
+	return 0;
+
+}
+
+static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+
+	if (offset > gpio->chip.ngpio)
+		return -EINVAL;
+
+	if (offset < gpio->nout_sgpio)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
+	void __iomem *addr;
+	u8 reg = 0;
+
+	addr = bank_reg(gpio, bank, WRITE_DATA);
+	reg = ioread8(addr);
+
+	if (val)
+		reg |= (val << GPIO_BIT(offset));
+	else
+		reg &= ~(1 << GPIO_BIT(offset));
+
+	iowrite8(reg, addr);
+}
+
+static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	const struct  npcm_sgpio_bank *bank;
+	void __iomem *addr;
+	u8 reg;
+	int dir;
+
+	dir = npcm_sgpio_get_direction(gc, offset);
+	if (dir == 0) {
+		bank = offset_to_bank(offset);
+
+		addr = bank_reg(gpio, bank, WRITE_DATA);
+		reg = ioread8(addr);
+		reg = !!(reg & GPIO_BIT(offset));
+	} else {
+		offset -= gpio->nout_sgpio;
+		bank = offset_to_bank(offset);
+
+		addr = bank_reg(gpio, bank, READ_DATA);
+		reg = ioread8(addr);
+		reg = !!(reg & GPIO_BIT(offset));
+	}
+
+	return reg;
+}
+
+static void npcm_sgpio_setup_enable(struct npcm_sgpio *gpio, bool enable)
+{
+	u8 reg = 0;
+
+	reg = ioread8(gpio->base + NPCM_IOXCTS);
+	reg = reg & ~NPCM_IOXCTS_RD_MODE;
+	reg = reg | NPCM_IOXCTS_RD_MODE_PERIODIC;
+
+	if (enable) {
+		reg |= NPCM_IOXCTS_IOXIF_EN;
+		iowrite8(reg, gpio->base + NPCM_IOXCTS);
+	} else {
+		reg &= ~NPCM_IOXCTS_IOXIF_EN;
+		iowrite8(reg, gpio->base + NPCM_IOXCTS);
+	}
+}
+
+static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
+				const struct npcm_clk_cfg *clk_cfg)
+{
+	unsigned long apb_freq;
+	u32 val;
+	u8 tmp;
+	int i;
+
+	apb_freq = clk_get_rate(gpio->pclk);
+	tmp = ioread8(gpio->base + NPCM_IOXCFG1) & ~NPCM_IOXCFG1_SFT_CLK;
+
+	for (i = 0; i < clk_cfg->cfg_opt; i++) {
+		val = apb_freq / clk_cfg->sft_clk[i];
+		if ((NPCM_CLK_MHZ < val) && (i != 0) ) {
+			iowrite8(clk_cfg->clk_sel[i-1] | tmp, gpio->base + NPCM_IOXCFG1);
+			return 0;
+		} else if (i == (clk_cfg->cfg_opt-1) && (NPCM_CLK_MHZ > val)) {
+			iowrite8(clk_cfg->clk_sel[i] | tmp, gpio->base + NPCM_IOXCFG1);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static void npcm_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
+					   unsigned long *valid_mask, unsigned int ngpios)
+{
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	int n = gpio->nin_sgpio;
+
+	/* input GPIOs in the high range */
+	bitmap_set(valid_mask, gpio->nout_sgpio, n);
+	bitmap_clear(valid_mask, 0, gpio->nout_sgpio);
+}
+
+static void npcm_sgpio_irq_set_mask(struct irq_data *d, bool set)
+{
+	const struct npcm_sgpio_bank *bank;
+	struct npcm_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	unsigned int offset;
+	u16 reg, type;
+	u8 bit;
+
+	irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	addr = bank_reg(gpio, bank, EVENT_CFG);
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	npcm_sgpio_setup_enable(gpio, false);
+
+	reg = ioread16(addr);
+	if (set) {
+		reg &= ~(NPCM_IXOEVCFG_MASK << (bit * 2));
+	} else {
+		type = gpio->int_type[offset];
+		reg |= (type << (bit * 2));
+	}
+
+	iowrite16(reg, addr);
+
+	npcm_sgpio_setup_enable(gpio, true);
+
+	addr = bank_reg(gpio, bank, EVENT_STS);
+	reg = ioread8(addr);
+	reg |= BIT(bit);
+	iowrite8(reg, addr);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void npcm_sgpio_irq_ack(struct irq_data *d)
+{
+	const struct npcm_sgpio_bank *bank;
+	struct npcm_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *status_addr;
+	unsigned int offset;
+	u8 bit;
+
+	irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	status_addr = bank_reg(gpio, bank, EVENT_STS);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+	iowrite8(BIT(bit), status_addr);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void npcm_sgpio_irq_mask(struct irq_data *d)
+{
+	npcm_sgpio_irq_set_mask(d, true);
+}
+
+static void npcm_sgpio_irq_unmask(struct irq_data *d)
+{
+	npcm_sgpio_irq_set_mask(d, false);
+}
+
+static int npcm_sgpio_set_type(struct irq_data *d, unsigned int type)
+{
+	const struct npcm_sgpio_bank *bank;
+	irq_flow_handler_t handler;
+	struct npcm_sgpio *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	unsigned int offset;
+	u16 reg, val;
+	u8 bit;
+
+	irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		val = NPCM_IXOEVCFG_BOTH;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		val = NPCM_IXOEVCFG_RISING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		val = NPCM_IXOEVCFG_FALLING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		val = NPCM_IXOEVCFG_RISING;
+		handler = handle_level_irq;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		val = NPCM_IXOEVCFG_FALLING;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	gpio->int_type[offset] = val;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+	npcm_sgpio_setup_enable(gpio, false);
+	addr = bank_reg(gpio, bank, EVENT_CFG);
+	reg = ioread16(addr);
+
+	reg |= (val << (bit * 2));
+
+	iowrite16(reg, addr);
+	npcm_sgpio_setup_enable(gpio, true);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	irq_set_handler_locked(d, handler);
+
+	return 0;
+}
+
+static void npcm_sgpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
+	unsigned int i, j, girq;
+	unsigned long reg;
+
+	chained_irq_enter(ic, desc);
+
+	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
+		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
+
+		reg = ioread8(bank_reg(gpio, bank, EVENT_STS));
+		for_each_set_bit(j, &reg, 8) {
+			girq = irq_find_mapping(gc->irq.domain, i * 8 + gpio->nout_sgpio + j);
+			generic_handle_irq(girq);
+		}
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static const struct irq_chip sgpio_irq_chip = {
+	.name = "sgpio-irq",
+	.irq_ack = npcm_sgpio_irq_ack,
+	.irq_mask = npcm_sgpio_irq_mask,
+	.irq_unmask = npcm_sgpio_irq_unmask,
+	.irq_set_type = npcm_sgpio_set_type,
+	.flags	= IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int npcm_sgpio_setup_irqs(struct npcm_sgpio *gpio,
+				 struct platform_device *pdev)
+{
+	int rc, i;
+	struct gpio_irq_chip *irq;
+
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
+
+	gpio->irq = rc;
+
+	npcm_sgpio_setup_enable(gpio, false);
+
+	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
+	for (i = 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
+		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
+
+		iowrite16(0x0000, bank_reg(gpio, bank, EVENT_CFG));
+		iowrite8(0xff, bank_reg(gpio, bank, EVENT_STS));
+	}
+
+	irq = &gpio->chip.irq;
+	gpio_irq_chip_set_chip(irq, &sgpio_irq_chip);
+	irq->init_valid_mask = npcm_sgpio_irq_init_valid_mask;
+	irq->handler = handle_bad_irq;
+	irq->default_type = IRQ_TYPE_NONE;
+	irq->parent_handler = npcm_sgpio_irq_handler;
+	irq->parent_handler_data = gpio;
+	irq->parents = &gpio->irq;
+	irq->num_parents = 1;
+
+	return 0;
+}
+
+static const unsigned int npcm750_SFT_CLK[] = {
+	1024, 32, 8, 4, 3, 2,
+};
+
+static const unsigned int npcm750_CLK_SEL[] = {
+	0x00, 0x05, 0x07, 0x0C, 0x0D, 0x0E,
+};
+
+static const unsigned int npcm845_SFT_CLK[] = {
+	1024, 32, 16, 8, 4,
+};
+
+static const unsigned int npcm845_CLK_SEL[] = {
+	0x00, 0x05, 0x06, 0x07, 0x0C,
+};
+
+static const struct npcm_clk_cfg npcm750_sgpio_pdata = {
+	.sft_clk = npcm750_SFT_CLK,
+	.clk_sel = npcm750_CLK_SEL,
+	.cfg_opt = 6,
+};
+
+static const struct npcm_clk_cfg npcm845_sgpio_pdata = {
+	.sft_clk = npcm845_SFT_CLK,
+	.clk_sel = npcm845_CLK_SEL,
+	.cfg_opt = 5,
+};
+
+static const struct of_device_id npcm_sgpio_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-sgpio", .data = &npcm750_sgpio_pdata, },
+	{ .compatible = "nuvoton,npcm845-sgpio", .data = &npcm845_sgpio_pdata, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);
+
+static int npcm_sgpio_probe(struct platform_device *pdev)
+{
+	struct npcm_sgpio *gpio;
+	const struct npcm_clk_cfg *clk_cfg;
+	int rc;
+	u32 nin_gpios, nout_gpios;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
+
+	clk_cfg = device_get_match_data(&pdev->dev);
+	if (!clk_cfg)
+		return -EINVAL;
+
+	rc = device_property_read_u32(&pdev->dev, "nuvoton,input-ngpios", &nin_gpios);
+	if (rc < 0)
+		return dev_err_probe(&pdev->dev, rc, "Could not read ngpios property\n");
+
+	rc = device_property_read_u32(&pdev->dev, "nuvoton,output-ngpios", &nout_gpios);
+	if (rc < 0)
+		return dev_err_probe(&pdev->dev, rc, "Could not read ngpios property\n");
+
+	gpio->nin_sgpio = nin_gpios;
+	gpio->nout_sgpio = nout_gpios;
+	if (gpio->nin_sgpio > MAX_NR_HW_SGPIO || gpio->nout_sgpio > MAX_NR_HW_SGPIO) {
+		dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: input: %d output: %d\n",
+			MAX_NR_HW_SGPIO, nin_gpios, nout_gpios);
+		return -EINVAL;
+	}
+
+	gpio->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(gpio->pclk)) {
+		dev_err(&pdev->dev, "Could not get pclk\n");
+		return PTR_ERR(gpio->pclk);
+	}
+
+	rc = npcm_sgpio_setup_clk(gpio, clk_cfg);
+	if (rc < 0)
+		return dev_err_probe(&pdev->dev, rc, "Failed to setup clock\n");
+
+	raw_spin_lock_init(&gpio->lock);
+	gpio->chip.parent = &pdev->dev;
+	gpio->chip.ngpio = gpio->nin_sgpio + gpio->nout_sgpio;
+	gpio->chip.direction_input = npcm_sgpio_dir_in;
+	gpio->chip.direction_output = npcm_sgpio_dir_out;
+	gpio->chip.get_direction = npcm_sgpio_get_direction;
+	gpio->chip.get = npcm_sgpio_get;
+	gpio->chip.set = npcm_sgpio_set;
+	gpio->chip.label = dev_name(&pdev->dev);
+	gpio->chip.base = -1;
+
+	rc = npcm_sgpio_init_port(gpio);
+	if (rc < 0)
+		return rc;
+
+	rc = npcm_sgpio_setup_irqs(gpio, pdev);
+	if (rc < 0)
+		return rc;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	npcm_sgpio_setup_enable(gpio, true);
+
+	return 0;
+}
+
+static struct platform_driver npcm_sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = npcm_sgpio_of_table,
+	},
+	.probe	= npcm_sgpio_probe,
+};
+module_platform_driver(npcm_sgpio_driver);
+
+MODULE_AUTHOR("Jim Liu <jjliu0@nuvoton.com>");
+MODULE_AUTHOR("Joseph Liu <kwliu@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM Serial GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1


