Return-Path: <linux-gpio+bounces-6489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE9D8CA5BD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 03:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A397B21111
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 01:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2598495;
	Tue, 21 May 2024 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNMMacDZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2018036;
	Tue, 21 May 2024 01:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716254708; cv=none; b=Ju6X1jXcHwX/K9WF5ray1rIjqssVpH/0zGWeIcwsNUGDFz8JTbXsfF5d91AeQR8zfs/13Tjuupkq7gu2zrFajLZM5bHP1xTdVcg4ytg6j15BT/YUTwcbD8c1DpVDgVeM9OY2618Tuzj3xQ1NX4X/gzAABGgnTurCmGAy37Tom5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716254708; c=relaxed/simple;
	bh=JHSLdvO8/A1li3oVQTCl2Oyrxw6709/PbGn1iFOMVd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LxBrhsbtd3q30eUWeKYp6T9PBKq6qctvUZ20tV4y70aTckQyQ2KG8srzSR1rB4JgIB/eb2icVNQtvDxArQ5k1K+j4pRgTT9BwqEMBVHnQxRi8GrW7LsXcbGzbyDmBRPXj3NNVqOiO4936ftkfBG6q2DIIW33s5tNkvCrW5X9NZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNMMacDZ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6f137f3d733so2074487a34.2;
        Mon, 20 May 2024 18:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716254703; x=1716859503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNfKrbBqIDSUmwy1SjAsT8/PSbYW5lGrs8pgrN3oyTw=;
        b=DNMMacDZRC2ETseplz5btvIIpwfM/+MbUOQFGqgquIVnbhFcxpE3n1SmqJBMPAxyLs
         WTGm2yycCQSyRV9oL4GjjYle3A/5jV0Avkx9KYUWS/MAxOeo4/7E3OlAA+p2C61qeEy1
         Yr7AhKlq2s2c1HWQJab2OcE6Ll3I1LV+RBdSFbHk4AMu+svJBCQ/l+qZPQEJNDRyV+Be
         YFtFyHMF/0ZsCvyLW0N+wuGwE2Rm7AI3iopPOxFE5NQhMSo+Trh9g283WnZ3hSiBll69
         3rA3UcVZzVxd7mKmKv2ZX/M9jgQlxMQ0iCWiWfQsATjFwGQ+6JpHxO0NfWgBvYSqL09A
         agRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716254703; x=1716859503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNfKrbBqIDSUmwy1SjAsT8/PSbYW5lGrs8pgrN3oyTw=;
        b=pdJgW2JgbiRHlYwcASZ8ryHOV1up8AyXhtqokcgtAi2myoA9NKl3tIafq2qVQRdZVF
         MR6OE00FIJkyiv8pOiCuHQ680xlpdL6q9f05z03DhdtBoNEc8YbrM1cPFVARnF8WZfMi
         cw3Yh65kLLZsJORoA/CPS/u0pbBv3pZJT1oRbaaHvCZ4+feQz5elOySDcjz0JVmJxooD
         J0pILHxJ1X+x683vtS644u1EQ1isGgc3nfWvi7DAJ0XlT2FyDB0ffJqmmd9CndusmkIV
         tRojGnPz6hejDYe/1Jp6P+fHSZCVlpKNeacsGbLDf+ic5ApvqzWnMx6ooZ1wi8BkHC71
         UapQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDYkISgg2RfHvv5YqI0xdjCO9wwnYSGekntHnmGcDevMPF218S1MKZN7fEicHjFLQ1sx8eH/ahzeBVD/SZjU3bDMqTALk39659fISDjCFG+OBBJoI6/FAK7ZmM8DiW3VhwfB2f3cQyWw1s7PsmKxIqdG9N5/WLa7JdNyunJMk6Tqa3l8E=
X-Gm-Message-State: AOJu0YzIvrkZnxoiPhW5Hu6r2pWiu6Ab74zWVHuUmr5WQau4uTfk18h3
	CMXNnqW47CDUWmvi34sUpG/OeGR4rHftUMno6ubmSiTMUrcOML1M
X-Google-Smtp-Source: AGHT+IF8xslt4FvUStuvHUYeX0aNeR/WgFESAPP0SRQYu4hKUY2AJMbiwPGTip7UPm9GP6RccbWnMg==
X-Received: by 2002:a9d:6c82:0:b0:6f1:4414:14bc with SMTP id 46e09a7af769-6f144141813mr7834801a34.3.1716254702599;
        Mon, 20 May 2024 18:25:02 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65e149dd925sm6477563a12.58.2024.05.20.18.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 18:25:02 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com
Subject: [PATCH v9 3/3] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver
Date: Tue, 21 May 2024 01:24:47 +0000
Message-Id: <20240521012447.42211-4-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521012447.42211-1-ychuang570808@gmail.com>
References: <20240521012447.42211-1-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add common pinctrl and GPIO driver for Nuvoton MA35 series SoC, and
add support for ma35d1 pinctrl.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 drivers/pinctrl/nuvoton/Kconfig          |   19 +
 drivers/pinctrl/nuvoton/Makefile         |    2 +
 drivers/pinctrl/nuvoton/pinctrl-ma35.c   | 1187 ++++++++++++++
 drivers/pinctrl/nuvoton/pinctrl-ma35.h   |   52 +
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c | 1799 ++++++++++++++++++++++
 5 files changed, 3059 insertions(+)
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.c
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.h
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c

diff --git a/drivers/pinctrl/nuvoton/Kconfig b/drivers/pinctrl/nuvoton/Kconfig
index 2abbfcec1fae..7eadaaf48d6e 100644
--- a/drivers/pinctrl/nuvoton/Kconfig
+++ b/drivers/pinctrl/nuvoton/Kconfig
@@ -45,3 +45,22 @@ config PINCTRL_NPCM8XX
 	  Say Y or M here to enable pin controller and GPIO support for
 	  the Nuvoton NPCM8XX SoC. This is strongly recommended when
 	  building a kernel that will run on this chip.
+
+config PINCTRL_MA35
+	bool
+	depends on (ARCH_MA35 || COMPILE_TEST) && OF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select GPIOLIB
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	select MFD_SYSCON
+
+config PINCTRL_MA35D1
+	bool "Pinctrl and GPIO driver for Nuvoton MA35D1"
+	depends on (ARCH_MA35 || COMPILE_TEST) && OF
+	select PINCTRL_MA35
+	help
+	  Say Y here to enable pin controller and GPIO support
+	  for Nuvoton MA35D1 SoC.
diff --git a/drivers/pinctrl/nuvoton/Makefile b/drivers/pinctrl/nuvoton/Makefile
index 08031eab0af6..346c5082bc60 100644
--- a/drivers/pinctrl/nuvoton/Makefile
+++ b/drivers/pinctrl/nuvoton/Makefile
@@ -4,3 +4,5 @@
 obj-$(CONFIG_PINCTRL_WPCM450)	+= pinctrl-wpcm450.o
 obj-$(CONFIG_PINCTRL_NPCM7XX)	+= pinctrl-npcm7xx.o
 obj-$(CONFIG_PINCTRL_NPCM8XX)	+= pinctrl-npcm8xx.o
+obj-$(CONFIG_PINCTRL_MA35)	+= pinctrl-ma35.o
+obj-$(CONFIG_PINCTRL_MA35D1)	+= pinctrl-ma35d1.o
diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
new file mode 100644
index 000000000000..fb933cddde91
--- /dev/null
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -0,0 +1,1187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ * *       Jacky Huang <ychuang3@nuvoton.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include "../core.h"
+#include "../pinconf.h"
+#include "pinctrl-ma35.h"
+
+#define MA35_MFP_REG_BASE		0x80
+#define MA35_MFP_REG_SZ_PER_BANK	8
+#define MA35_MFP_BITS_PER_PORT		4
+
+#define MA35_GPIO_BANK_MAX		14
+#define MA35_GPIO_PORT_MAX		16
+
+/* GPIO control registers */
+#define MA35_GP_REG_MODE		0x00
+#define MA35_GP_REG_DINOFF		0x04
+#define MA35_GP_REG_DOUT		0x08
+#define MA35_GP_REG_DATMSK		0x0c
+#define MA35_GP_REG_PIN			0x10
+#define MA35_GP_REG_DBEN		0x14
+#define MA35_GP_REG_INTTYPE		0x18
+#define MA35_GP_REG_INTEN		0x1c
+#define MA35_GP_REG_INTSRC		0x20
+#define MA35_GP_REG_SMTEN		0x24
+#define MA35_GP_REG_SLEWCTL		0x28
+#define MA35_GP_REG_SPW			0x2c
+#define MA35_GP_REG_PUSEL		0x30
+#define MA35_GP_REG_DSL			0x38
+#define MA35_GP_REG_DSH			0x3c
+
+/* GPIO mode control */
+#define MA35_GP_MODE_INPUT		0x0
+#define MA35_GP_MODE_OUTPUT		0x1
+#define MA35_GP_MODE_OPEN_DRAIN		0x2
+#define MA35_GP_MODE_QUASI		0x3
+#define MA35_GP_MODE_MASK(n)		GENMASK(n * 2 + 1, n * 2)
+
+#define MA35_GP_SLEWCTL_MASK(n)		GENMASK(n * 2 + 1, n * 2)
+
+/* GPIO pull-up and pull-down selection control */
+#define MA35_GP_PUSEL_DISABLE		0x0
+#define MA35_GP_PUSEL_PULL_UP		0x1
+#define MA35_GP_PUSEL_PULL_DOWN		0x2
+#define MA35_GP_PUSEL_MASK(n)		GENMASK(n * 2 + 1, n * 2)
+
+/*
+ * The MA35_GP_REG_INTEN bits 0 ~ 15 control low-level or falling edge trigger,
+ * while bits 16 ~ 31 control high-level or rising edge trigger.
+ */
+#define MA35_GP_INTEN_L(n)		BIT(n)
+#define MA35_GP_INTEN_H(n)		BIT(n + 16)
+#define MA35_GP_INTEN_BOTH(n)		(MA35_GP_INTEN_H(n) | MA35_GP_INTEN_L(n))
+
+/*
+ * The MA35_GP_REG_DSL register controls ports 0 to 7, while the MA35_GP_REG_DSH
+ * register controls ports 8 to 15. Each port occupies a width of 4 bits, with 3
+ * bits being effective.
+ */
+#define MA35_GP_DS_REG(n)		(n < 8 ? MA35_GP_REG_DSL : MA35_GP_REG_DSH)
+#define MA35_GP_DS_MASK(n)		GENMASK((n % 8) * 4 + 3, (n % 8) * 4)
+
+#define MVOLT_1800			0
+#define MVOLT_3300			1
+
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
+static const char * const gpio_group_name[] = {
+	"gpioa", "gpiob", "gpioc", "gpiod", "gpioe", "gpiof", "gpiog",
+	"gpioh", "gpioi", "gpioj", "gpiok", "gpiol", "gpiom", "gpion",
+};
+
+static const u32 ds_1800mv_tbl[] = {
+	2900, 4400, 5800, 7300, 8600, 10100, 11500, 13000,
+};
+
+static const u32 ds_3300mv_tbl[] = {
+	17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000,
+};
+
+struct ma35_pin_func {
+	const char		*name;
+	const char		**groups;
+	u32			ngroups;
+};
+
+struct ma35_pin_setting {
+	u32			offset;
+	u32			shift;
+	u32			muxval;
+	unsigned long		*configs;
+	unsigned int		nconfigs;
+};
+
+struct ma35_pin_group {
+	const char		*name;
+	unsigned int		npins;
+	unsigned int		*pins;
+	struct ma35_pin_setting	*settings;
+};
+
+struct ma35_pin_bank {
+	void __iomem		*reg_base;
+	struct clk		*clk;
+	int			irq;
+	u8			bank_num;
+	u8			nr_pins;
+	bool			valid;
+	const char		*name;
+	struct fwnode_handle	*fwnode;
+	struct gpio_chip	chip;
+	u32			irqtype;
+	u32			irqinten;
+	struct regmap		*regmap;
+	struct device		*dev;
+};
+
+struct ma35_pin_ctrl {
+	struct ma35_pin_bank	*pin_banks;
+	u32			nr_banks;
+	u32			nr_pins;
+};
+
+struct ma35_pinctrl {
+	struct device		*dev;
+	struct ma35_pin_ctrl	*ctrl;
+	struct pinctrl_dev	*pctl;
+	const struct ma35_pinctrl_soc_info *info;
+	struct regmap		*regmap;
+	struct ma35_pin_group	*groups;
+	unsigned int		ngroups;
+	struct ma35_pin_func	*functions;
+	unsigned int		nfunctions;
+};
+
+static DEFINE_RAW_SPINLOCK(ma35_lock);
+
+static int ma35_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return npctl->ngroups;
+}
+
+static const char *ma35_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return npctl->groups[selector].name;
+}
+
+static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+			       const unsigned int **pins, unsigned int *npins)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+
+	if (selector >= npctl->ngroups)
+		return -EINVAL;
+
+	*pins = npctl->groups[selector].pins;
+	*npins = npctl->groups[selector].npins;
+
+	return 0;
+}
+
+static struct ma35_pin_group *ma35_pinctrl_find_group_by_name(
+			      const struct ma35_pinctrl *npctl, const char *name)
+{
+	int i;
+
+	for (i = 0; i < npctl->ngroups; i++) {
+		if (!strcmp(npctl->groups[i].name, name))
+			return &npctl->groups[i];
+	}
+	return NULL;
+}
+
+static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
+					    struct device_node *np,
+					    struct pinctrl_map **map,
+					    unsigned int *num_maps)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+	struct ma35_pin_group *grp;
+	struct pinctrl_map *new_map;
+	struct device_node *parent;
+	int map_num = 1;
+	int i;
+
+	/*
+	 * first find the group of this node and check if we need create
+	 * config maps for pins
+	 */
+	grp = ma35_pinctrl_find_group_by_name(npctl, np->name);
+	if (!grp) {
+		dev_err(npctl->dev, "unable to find group for node %s\n", np->name);
+		return -EINVAL;
+	}
+
+	map_num += grp->npins;
+	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+
+	*map = new_map;
+	*num_maps = map_num;
+	/* create mux map */
+	parent = of_get_parent(np);
+	if (!parent)
+		return -EINVAL;
+
+	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
+	new_map[0].data.mux.function = parent->name;
+	new_map[0].data.mux.group = np->name;
+	of_node_put(parent);
+
+	new_map++;
+	for (i = 0; i < grp->npins; i++) {
+		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
+		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->pins[i]);
+		new_map[i].data.configs.configs = grp->settings[i].configs;
+		new_map[i].data.configs.num_configs = grp->settings[i].nconfigs;
+	}
+	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
+		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
+
+	return 0;
+}
+
+static const struct pinctrl_ops ma35_pctrl_ops = {
+	.get_groups_count = ma35_get_groups_count,
+	.get_group_name = ma35_get_group_name,
+	.get_group_pins = ma35_get_group_pins,
+	.dt_node_to_map = ma35_pinctrl_dt_node_to_map_func,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int ma35_pinmux_get_func_count(struct pinctrl_dev *pctldev)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return npctl->nfunctions;
+}
+
+static const char *ma35_pinmux_get_func_name(struct pinctrl_dev *pctldev,
+					     unsigned int selector)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return npctl->functions[selector].name;
+}
+
+static int ma35_pinmux_get_func_groups(struct pinctrl_dev *pctldev,
+				       unsigned int function,
+				       const char *const **groups,
+				       unsigned int *const num_groups)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = npctl->functions[function].groups;
+	*num_groups = npctl->functions[function].ngroups;
+
+	return 0;
+}
+
+static int ma35_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
+			       unsigned int group)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+	struct ma35_pin_group *grp = &npctl->groups[group];
+	struct ma35_pin_setting *setting = grp->settings;
+	u32 i, regval;
+
+	dev_dbg(npctl->dev, "enable function %s group %s\n",
+		npctl->functions[selector].name, npctl->groups[group].name);
+
+	for (i = 0; i < grp->npins; i++) {
+		regmap_read(npctl->regmap, setting->offset, &regval);
+		regval &= ~GENMASK(setting->shift + MA35_MFP_BITS_PER_PORT - 1,
+				   setting->shift);
+		regval |= setting->muxval << setting->shift;
+		regmap_write(npctl->regmap, setting->offset, regval);
+		setting++;
+	}
+	return 0;
+}
+
+static const struct pinmux_ops ma35_pmx_ops = {
+	.get_functions_count = ma35_pinmux_get_func_count,
+	.get_function_name = ma35_pinmux_get_func_name,
+	.get_function_groups = ma35_pinmux_get_func_groups,
+	.set_mux = ma35_pinmux_set_mux,
+	.strict = true,
+};
+
+static void ma35_gpio_set_mode(void __iomem *reg_mode, unsigned int gpio, u32 mode)
+{
+	u32 regval = readl(reg_mode);
+
+	regval &= ~MA35_GP_MODE_MASK(gpio);
+	regval |= field_prep(MA35_GP_MODE_MASK(gpio), mode);
+
+	writel(regval, reg_mode);
+}
+
+static u32 ma35_gpio_get_mode(void __iomem *reg_mode, unsigned int gpio)
+{
+	u32 regval = readl(reg_mode);
+
+	return field_get(MA35_GP_MODE_MASK(gpio), regval);
+}
+
+static int ma35_gpio_core_direction_in(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg_mode = bank->reg_base + MA35_GP_REG_MODE;
+
+	guard(raw_spinlock_irqsave)(&ma35_lock);
+
+	ma35_gpio_set_mode(reg_mode, gpio, MA35_GP_MODE_INPUT);
+
+	return 0;
+}
+
+static int ma35_gpio_core_direction_out(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg_dout = bank->reg_base + MA35_GP_REG_DOUT;
+	void __iomem *reg_mode = bank->reg_base + MA35_GP_REG_MODE;
+	unsigned int regval;
+
+	guard(raw_spinlock_irqsave)(&ma35_lock);
+
+	regval = readl(reg_dout);
+	if (val)
+		regval |= BIT(gpio);
+	else
+		regval &= ~BIT(gpio);
+	writel(regval, reg_dout);
+
+	ma35_gpio_set_mode(reg_mode, gpio, MA35_GP_MODE_OUTPUT);
+
+	return 0;
+}
+
+static int ma35_gpio_core_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg_pin = bank->reg_base + MA35_GP_REG_PIN;
+
+	return !!(readl(reg_pin) & BIT(gpio));
+}
+
+static void ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg_dout = bank->reg_base + MA35_GP_REG_DOUT;
+	u32 regval;
+
+	if (val)
+		regval = readl(reg_dout) | BIT(gpio);
+	else
+		regval = readl(reg_dout) & ~BIT(gpio);
+
+	writel(regval, reg_dout);
+}
+
+static int ma35_gpio_core_to_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
+	u32 reg_offs, bit_offs, regval;
+
+	if (gpio < 8) {
+		/* The MFP low register controls port 0 ~ 7 */
+		reg_offs = bank->bank_num * MA35_MFP_REG_SZ_PER_BANK;
+		bit_offs = gpio * MA35_MFP_BITS_PER_PORT;
+	} else {
+		/* The MFP high register controls port 8 ~ 15 */
+		reg_offs = bank->bank_num * MA35_MFP_REG_SZ_PER_BANK + 4;
+		bit_offs = (gpio - 8) * MA35_MFP_BITS_PER_PORT;
+	}
+
+	regmap_read(bank->regmap, MA35_MFP_REG_BASE + reg_offs, &regval);
+	regval &= ~GENMASK(bit_offs + MA35_MFP_BITS_PER_PORT - 1, bit_offs);
+	regmap_write(bank->regmap, MA35_MFP_REG_BASE + reg_offs, regval);
+
+	return 0;
+}
+
+static void ma35_irq_gpio_ack(struct irq_data *d)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	void __iomem *reg_intsrc = bank->reg_base + MA35_GP_REG_INTSRC;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	writel(BIT(hwirq), reg_intsrc);
+}
+
+static void ma35_irq_gpio_mask(struct irq_data *d)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	void __iomem *reg_ien = bank->reg_base + MA35_GP_REG_INTEN;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 regval;
+
+	regval = readl(reg_ien);
+
+	regval &= ~MA35_GP_INTEN_BOTH(hwirq);
+
+	writel(regval, reg_ien);
+}
+
+static void ma35_irq_gpio_unmask(struct irq_data *d)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	void __iomem *reg_itype = bank->reg_base + MA35_GP_REG_INTTYPE;
+	void __iomem *reg_ien = bank->reg_base + MA35_GP_REG_INTEN;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bval, regval;
+
+	bval = bank->irqtype & BIT(hwirq);
+	regval = readl(reg_itype);
+	regval &= ~BIT(hwirq);
+	writel(regval | bval, reg_itype);
+
+	bval = bank->irqinten & MA35_GP_INTEN_BOTH(hwirq);
+	regval = readl(reg_ien);
+	regval &= ~MA35_GP_INTEN_BOTH(hwirq);
+	writel(regval | bval, reg_ien);
+}
+
+static int ma35_irq_irqtype(struct irq_data *d, unsigned int type)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_set_handler_locked(d, handle_edge_irq);
+		bank->irqtype &= ~BIT(hwirq);
+		bank->irqinten |= MA35_GP_INTEN_BOTH(hwirq);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_handler_locked(d, handle_edge_irq);
+		bank->irqtype &= ~BIT(hwirq);
+		bank->irqinten |= MA35_GP_INTEN_H(hwirq);
+		bank->irqinten &= ~MA35_GP_INTEN_L(hwirq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_set_handler_locked(d, handle_edge_irq);
+		bank->irqtype &= ~BIT(hwirq);
+		bank->irqinten |= MA35_GP_INTEN_L(hwirq);
+		bank->irqinten &= ~MA35_GP_INTEN_H(hwirq);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	writel(bank->irqtype, bank->reg_base + MA35_GP_REG_INTTYPE);
+	writel(bank->irqinten, bank->reg_base + MA35_GP_REG_INTEN);
+
+	return 0;
+}
+
+static struct irq_chip ma35_gpio_irqchip = {
+	.name = "MA35-GPIO-IRQ",
+	.irq_disable = ma35_irq_gpio_mask,
+	.irq_enable = ma35_irq_gpio_unmask,
+	.irq_ack = ma35_irq_gpio_ack,
+	.irq_mask = ma35_irq_gpio_mask,
+	.irq_unmask = ma35_irq_gpio_unmask,
+	.irq_set_type = ma35_irq_irqtype,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void ma35_irq_demux_intgroup(struct irq_desc *desc)
+{
+	struct ma35_pin_bank *bank = gpiochip_get_data(irq_desc_get_handler_data(desc));
+	struct irq_domain *irqdomain = bank->chip.irq.domain;
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	unsigned long isr;
+	int offset;
+
+	chained_irq_enter(irqchip, desc);
+
+	isr = readl(bank->reg_base + MA35_GP_REG_INTSRC);
+
+	for_each_set_bit(offset, &isr, bank->nr_pins)
+		generic_handle_irq(irq_find_mapping(irqdomain, offset));
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinctrl *npctl)
+{
+	struct ma35_pin_ctrl *ctrl = npctl->ctrl;
+	struct ma35_pin_bank *bank = ctrl->pin_banks;
+	int ret;
+	int i;
+
+	for (i = 0; i < ctrl->nr_banks; i++, bank++) {
+		if (!bank->valid) {
+			dev_warn(&pdev->dev, "%pfw: bank is not valid\n", bank->fwnode);
+			continue;
+		}
+		bank->irqtype = 0;
+		bank->irqinten = 0;
+		bank->chip.label = bank->name;
+		bank->chip.of_gpio_n_cells = 2;
+		bank->chip.parent = &pdev->dev;
+		bank->chip.request = ma35_gpio_core_to_request;
+		bank->chip.direction_input = ma35_gpio_core_direction_in;
+		bank->chip.direction_output = ma35_gpio_core_direction_out;
+		bank->chip.get = ma35_gpio_core_get;
+		bank->chip.set = ma35_gpio_core_set;
+		bank->chip.base = -1;
+		bank->chip.ngpio = bank->nr_pins;
+		bank->chip.can_sleep = false;
+
+		if (bank->irq > 0) {
+			struct gpio_irq_chip *girq;
+
+			girq = &bank->chip.irq;
+			gpio_irq_chip_set_chip(girq, &ma35_gpio_irqchip);
+			girq->parent_handler = ma35_irq_demux_intgroup;
+			girq->num_parents = 1;
+
+			girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+						     sizeof(*girq->parents), GFP_KERNEL);
+			if (!girq->parents)
+				return -ENOMEM;
+
+			girq->parents[0] = bank->irq;
+			girq->default_type = IRQ_TYPE_NONE;
+			girq->handler = handle_bad_irq;
+		}
+
+		ret = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
+				bank->chip.label, ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int ma35_get_bank_data(struct ma35_pin_bank *bank)
+{
+	bank->reg_base = fwnode_iomap(bank->fwnode, 0);
+	if (IS_ERR(bank->reg_base))
+		return PTR_ERR(bank->reg_base);
+
+	bank->irq = fwnode_irq_get(bank->fwnode, 0);
+
+	bank->nr_pins = MA35_GPIO_PORT_MAX;
+
+	bank->clk = of_clk_get(to_of_node(bank->fwnode), 0);
+	if (IS_ERR(bank->clk))
+		return PTR_ERR(bank->clk);
+
+	return clk_prepare_enable(bank->clk);
+}
+
+static int ma35_pinctrl_get_soc_data(struct ma35_pinctrl *pctl, struct platform_device *pdev)
+{
+	struct fwnode_handle *child;
+	struct ma35_pin_ctrl *ctrl;
+	struct ma35_pin_bank *bank;
+	int i, id = 0;
+
+	ctrl = pctl->ctrl;
+	ctrl->nr_banks = MA35_GPIO_BANK_MAX;
+
+	ctrl->pin_banks = devm_kcalloc(&pdev->dev, ctrl->nr_banks,
+				       sizeof(*ctrl->pin_banks), GFP_KERNEL);
+	if (!ctrl->pin_banks)
+		return -ENOMEM;
+
+	for (i = 0; i < ctrl->nr_banks; i++) {
+		ctrl->pin_banks[i].bank_num = i;
+		ctrl->pin_banks[i].name = gpio_group_name[i];
+	}
+
+	for_each_gpiochip_node(&pdev->dev, child) {
+		bank = &ctrl->pin_banks[id];
+		bank->fwnode = child;
+		bank->regmap = pctl->regmap;
+		bank->dev = &pdev->dev;
+		if (!ma35_get_bank_data(bank))
+			bank->valid = true;
+		id++;
+	}
+	return 0;
+}
+
+static void ma35_gpio_cla_port(unsigned int gpio_num, unsigned int *group,
+			       unsigned int *num)
+{
+	*group = gpio_num / MA35_GPIO_PORT_MAX;
+	*num = gpio_num % MA35_GPIO_PORT_MAX;
+}
+
+static int ma35_pinconf_set_pull(struct ma35_pinctrl *npctl, unsigned int pin,
+				 int pull_up)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval, pull_sel = MA35_GP_PUSEL_DISABLE;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_PUSEL);
+	regval &= ~MA35_GP_PUSEL_MASK(port);
+
+	switch (pull_up) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		pull_sel = MA35_GP_PUSEL_PULL_UP;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		pull_sel = MA35_GP_PUSEL_PULL_DOWN;
+		break;
+
+	case PIN_CONFIG_BIAS_DISABLE:
+		pull_sel = MA35_GP_PUSEL_DISABLE;
+		break;
+	}
+
+	regval |= field_prep(MA35_GP_PUSEL_MASK(port), pull_sel);
+	writel(regval, base + MA35_GP_REG_PUSEL);
+
+	return 0;
+}
+
+static int ma35_pinconf_get_output(struct ma35_pinctrl *npctl, unsigned int pin)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 mode;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	mode = ma35_gpio_get_mode(base + MA35_GP_REG_MODE, port);
+	if (mode == MA35_GP_MODE_OUTPUT)
+		return 1;
+
+	return 0;
+}
+
+static int ma35_pinconf_get_pull(struct ma35_pinctrl *npctl, unsigned int pin)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval, pull_sel;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_PUSEL);
+
+	pull_sel = field_get(MA35_GP_PUSEL_MASK(port), regval);
+
+	switch (pull_sel) {
+	case MA35_GP_PUSEL_PULL_UP:
+		return PIN_CONFIG_BIAS_PULL_UP;
+
+	case MA35_GP_PUSEL_PULL_DOWN:
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+
+	case MA35_GP_PUSEL_DISABLE:
+		return PIN_CONFIG_BIAS_DISABLE;
+	}
+
+	return PIN_CONFIG_BIAS_DISABLE;
+}
+
+static int ma35_pinconf_set_output(struct ma35_pinctrl *npctl, unsigned int pin, bool out)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	ma35_gpio_set_mode(base + MA35_GP_REG_MODE, port, MA35_GP_MODE_OUTPUT);
+
+	return 0;
+}
+
+static int ma35_pinconf_get_power_source(struct ma35_pinctrl *npctl, unsigned int pin)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_SPW);
+
+	if (regval & BIT(port))
+		return MVOLT_3300;
+	else
+		return MVOLT_1800;
+}
+
+static int ma35_pinconf_set_power_source(struct ma35_pinctrl *npctl,
+					 unsigned int pin, int arg)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval;
+
+	if ((arg != MVOLT_1800) && (arg != MVOLT_3300))
+		return -EINVAL;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_SPW);
+
+	if (arg == MVOLT_1800)
+		regval &= ~BIT(port);
+	else
+		regval |= BIT(port);
+
+	writel(regval, base + MA35_GP_REG_SPW);
+
+	return 0;
+}
+
+static int ma35_pinconf_get_drive_strength(struct ma35_pinctrl *npctl, unsigned int pin,
+					   u32 *strength)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval, ds_val;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_DS_REG(port));
+	ds_val = field_get(MA35_GP_DS_MASK(port), regval);
+
+	if (ma35_pinconf_get_power_source(npctl, pin) == MVOLT_1800)
+		*strength = ds_1800mv_tbl[ds_val];
+	else
+		*strength = ds_3300mv_tbl[ds_val];
+
+	return 0;
+}
+
+static int ma35_pinconf_set_drive_strength(struct ma35_pinctrl *npctl, unsigned int pin,
+					   int strength)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	int i, ds_val = -1;
+	u32 regval;
+
+	if (ma35_pinconf_get_power_source(npctl, pin) == MVOLT_1800) {
+		for (i = 0; i < ARRAY_SIZE(ds_1800mv_tbl); i++) {
+			if (ds_1800mv_tbl[i] == strength) {
+				ds_val = i;
+				break;
+			}
+		}
+	} else {
+		for (i = 0; i < ARRAY_SIZE(ds_3300mv_tbl); i++) {
+			if (ds_3300mv_tbl[i] == strength) {
+				ds_val = i;
+				break;
+			}
+		}
+	}
+	if (ds_val == -1)
+		return -EINVAL;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_DS_REG(port));
+	regval &= ~MA35_GP_DS_MASK(port);
+	regval |= field_prep(MA35_GP_DS_MASK(port), ds_val);
+
+	writel(regval, base + MA35_GP_DS_REG(port));
+
+	return 0;
+}
+
+static int ma35_pinconf_get_schmitt_enable(struct ma35_pinctrl *npctl, unsigned int pin)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_SMTEN);
+
+	return !!(regval & BIT(port));
+}
+
+static int ma35_pinconf_set_schmitt(struct ma35_pinctrl *npctl, unsigned int pin, int enable)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_SMTEN);
+
+	if (enable)
+		regval |= BIT(port);
+	else
+		regval &= ~BIT(port);
+
+	writel(regval, base + MA35_GP_REG_SMTEN);
+
+	return 0;
+}
+
+static int ma35_pinconf_get_slew_rate(struct ma35_pinctrl *npctl, unsigned int pin)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_SLEWCTL);
+
+	return field_get(MA35_GP_SLEWCTL_MASK(port), regval);
+}
+
+static int ma35_pinconf_set_slew_rate(struct ma35_pinctrl *npctl, unsigned int pin, int rate)
+{
+	unsigned int port, group_num;
+	void __iomem *base;
+	u32 regval;
+
+	ma35_gpio_cla_port(pin, &group_num, &port);
+	base = npctl->ctrl->pin_banks[group_num].reg_base;
+
+	regval = readl(base + MA35_GP_REG_SLEWCTL);
+	regval &= ~MA35_GP_SLEWCTL_MASK(port);
+	regval |= field_prep(MA35_GP_SLEWCTL_MASK(port), rate);
+
+	writel(regval, base + MA35_GP_REG_SLEWCTL);
+
+	return 0;
+}
+
+static int ma35_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin, unsigned long *config)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u32 arg;
+	int ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (ma35_pinconf_get_pull(npctl, pin) != param)
+			return -EINVAL;
+		arg = 1;
+		break;
+
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		ret = ma35_pinconf_get_drive_strength(npctl, pin, &arg);
+		if (ret)
+			return ret;
+		break;
+
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		arg = ma35_pinconf_get_schmitt_enable(npctl, pin);
+		break;
+
+	case PIN_CONFIG_SLEW_RATE:
+		arg = ma35_pinconf_get_slew_rate(npctl, pin);
+		break;
+
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		arg = ma35_pinconf_get_output(npctl, pin);
+		break;
+
+	case PIN_CONFIG_POWER_SOURCE:
+		arg = ma35_pinconf_get_power_source(npctl, pin);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int ma35_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			    unsigned long *configs, unsigned int num_configs)
+{
+	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	unsigned int arg = 0;
+	int i, ret = 0;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			ret = ma35_pinconf_set_pull(npctl, pin, param);
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			ret = ma35_pinconf_set_drive_strength(npctl, pin, arg);
+			break;
+
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			ret = ma35_pinconf_set_schmitt(npctl, pin, 1);
+			break;
+
+		case PIN_CONFIG_INPUT_SCHMITT:
+			ret = ma35_pinconf_set_schmitt(npctl, pin, arg);
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			ret = ma35_pinconf_set_slew_rate(npctl, pin, arg);
+			break;
+
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			ret = ma35_pinconf_set_output(npctl, pin, arg);
+			break;
+
+		case PIN_CONFIG_POWER_SOURCE:
+			ret = ma35_pinconf_set_power_source(npctl, pin, arg);
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
+static const struct pinconf_ops ma35_pinconf_ops = {
+	.pin_config_get = ma35_pinconf_get,
+	.pin_config_set = ma35_pinconf_set,
+	.is_generic = true,
+};
+
+static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_group *grp,
+				     struct ma35_pinctrl *npctl, u32 index)
+{
+	struct ma35_pin_setting *pin;
+	unsigned long *configs;
+	unsigned int nconfigs;
+	int i, j, count, ret;
+	u32 *elems;
+
+	grp->name = np->name;
+
+	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &nconfigs);
+	if (ret)
+		return ret;
+
+	count = of_property_count_elems_of_size(np, "nuvoton,pins", sizeof(u32));
+	if (!count || count % 3)
+		return -EINVAL;
+
+	elems = devm_kmalloc_array(npctl->dev, count, sizeof(u32), GFP_KERNEL);
+	if (!elems)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "nuvoton,pins", elems, count);
+	if (ret)
+		return -EINVAL;
+
+	grp->npins = count / 3;
+
+	grp->pins = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
+	if (!grp->pins)
+		return -ENOMEM;
+
+	grp->settings = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->settings), GFP_KERNEL);
+	if (!grp->settings)
+		return -ENOMEM;
+
+	pin = grp->settings;
+
+	for (i = 0, j = 0; i < count; i += 3, j++) {
+		pin->offset = elems[i] * MA35_MFP_REG_SZ_PER_BANK + MA35_MFP_REG_BASE;
+		pin->shift = (elems[i + 1] * MA35_MFP_BITS_PER_PORT) % 32;
+		pin->muxval = elems[i + 2];
+		pin->configs = configs;
+		pin->nconfigs = nconfigs;
+		grp->pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
+		pin++;
+	}
+	return 0;
+}
+
+static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinctrl *npctl,
+					u32 index)
+{
+	struct device_node *child;
+	struct ma35_pin_func *func;
+	struct ma35_pin_group *grp;
+	static u32 grp_index;
+	u32 ret, i = 0;
+
+	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
+
+	func = &npctl->functions[index];
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+
+	if (func->ngroups <= 0)
+		return 0;
+
+	func->groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(char *), GFP_KERNEL);
+	if (!func->groups)
+		return -ENOMEM;
+
+	for_each_child_of_node(np, child) {
+		func->groups[i] = child->name;
+		grp = &npctl->groups[grp_index++];
+		ret = ma35_pinctrl_parse_groups(child, grp, npctl, i++);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinctrl *npctl)
+{
+	struct fwnode_handle *child;
+	u32 idx = 0;
+	int ret;
+
+	device_for_each_child_node(&pdev->dev, child) {
+		if (fwnode_property_present(child, "gpio-controller"))
+			continue;
+		npctl->nfunctions++;
+		npctl->ngroups += of_get_child_count(to_of_node(child));
+	}
+
+	if (!npctl->nfunctions)
+		return -EINVAL;
+
+	npctl->functions = devm_kcalloc(&pdev->dev, npctl->nfunctions,
+					sizeof(*npctl->functions), GFP_KERNEL);
+	if (!npctl->functions)
+		return -ENOMEM;
+
+	npctl->groups = devm_kcalloc(&pdev->dev, npctl->ngroups,
+				     sizeof(*npctl->groups), GFP_KERNEL);
+	if (!npctl->groups)
+		return -ENOMEM;
+
+	device_for_each_child_node(&pdev->dev, child) {
+		if (fwnode_property_present(child, "gpio-controller"))
+			continue;
+
+		ret = ma35_pinctrl_parse_functions(to_of_node(child), npctl, idx++);
+		if (ret) {
+			fwnode_handle_put(child);
+			dev_err(&pdev->dev, "failed to parse function\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
+int ma35_pinctrl_probe(struct platform_device *pdev, const struct ma35_pinctrl_soc_info *info)
+{
+	struct pinctrl_desc *ma35_pinctrl_desc;
+	struct device *dev = &pdev->dev;
+	struct ma35_pinctrl *npctl;
+	int ret;
+
+	if (!info || !info->pins || !info->npins) {
+		dev_err(&pdev->dev, "wrong pinctrl info\n");
+		return -EINVAL;
+	}
+
+	npctl = devm_kzalloc(&pdev->dev, sizeof(*npctl), GFP_KERNEL);
+	if (!npctl)
+		return -ENOMEM;
+
+	ma35_pinctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*ma35_pinctrl_desc), GFP_KERNEL);
+	if (!ma35_pinctrl_desc)
+		return -ENOMEM;
+
+	npctl->ctrl = devm_kzalloc(&pdev->dev, sizeof(*npctl->ctrl), GFP_KERNEL);
+	if (!npctl->ctrl)
+		return -ENOMEM;
+
+	ma35_pinctrl_desc->name = dev_name(&pdev->dev);
+	ma35_pinctrl_desc->pins = info->pins;
+	ma35_pinctrl_desc->npins = info->npins;
+	ma35_pinctrl_desc->pctlops = &ma35_pctrl_ops;
+	ma35_pinctrl_desc->pmxops = &ma35_pmx_ops;
+	ma35_pinctrl_desc->confops = &ma35_pinconf_ops;
+	ma35_pinctrl_desc->owner = THIS_MODULE;
+
+	npctl->info = info;
+	npctl->dev = &pdev->dev;
+
+	npctl->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
+	if (IS_ERR(npctl->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(npctl->regmap),
+				     "No syscfg phandle specified\n");
+
+	ret = ma35_pinctrl_get_soc_data(npctl, pdev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "fail to get soc data\n");
+
+	platform_set_drvdata(pdev, npctl);
+
+	ret = ma35_pinctrl_probe_dt(pdev, npctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "fail to probe MA35 pinctrl dt\n");
+
+	ret = devm_pinctrl_register_and_init(dev, ma35_pinctrl_desc, npctl, &npctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "fail to register MA35 pinctrl\n");
+
+	ret = pinctrl_enable(npctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "fail to enable MA35 pinctrl\n");
+
+	return ma35_gpiolib_register(pdev, npctl);
+}
+
+int ma35_pinctrl_suspend(struct device *dev)
+{
+	struct ma35_pinctrl *npctl = dev_get_drvdata(dev);
+
+	return pinctrl_force_sleep(npctl->pctl);
+}
+
+int ma35_pinctrl_resume(struct device *dev)
+{
+	struct ma35_pinctrl *npctl = dev_get_drvdata(dev);
+
+	return pinctrl_force_default(npctl->pctl);
+}
diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.h b/drivers/pinctrl/nuvoton/pinctrl-ma35.h
new file mode 100644
index 000000000000..218084100541
--- /dev/null
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ * *       Jacky Huang <ychuang3@nuvoton.com>
+ */
+#ifndef __PINCTRL_MA35_H
+#define __PINCTRL_MA35_H
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+
+struct ma35_mux_desc {
+	const char *name;
+	u32 muxval;
+};
+
+struct ma35_pin_data {
+	u32 offset;
+	u32 shift;
+	struct ma35_mux_desc *muxes;
+};
+
+struct ma35_pinctrl_soc_info {
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	int (*get_pin_num)(int offset, int shift);
+};
+
+#define MA35_PIN(num, n, o, s, ...) {			\
+	.number = num,					\
+	.name = #n,					\
+	.drv_data = &(struct ma35_pin_data) {		\
+		.offset = o,				\
+		.shift = s,				\
+		.muxes = (struct ma35_mux_desc[]) {	\
+			 __VA_ARGS__, { } },		\
+	},						\
+}
+
+#define MA35_MUX(_val, _name) {				\
+	.name = _name,					\
+	.muxval = _val,					\
+}
+
+int ma35_pinctrl_probe(struct platform_device *pdev, const struct ma35_pinctrl_soc_info *info);
+int ma35_pinctrl_suspend(struct device *dev);
+int ma35_pinctrl_resume(struct device *dev);
+
+#endif /* __PINCTRL_MA35_H */
diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c b/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
new file mode 100644
index 000000000000..8bb9a5a35954
--- /dev/null
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
@@ -0,0 +1,1799 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ * *       Jacky Huang <ychuang3@nuvoton.com>
+ */
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-ma35.h"
+
+static const struct pinctrl_pin_desc ma35d1_pins[] = {
+	MA35_PIN(0, PA0, 0x80, 0x0,
+		MA35_MUX(0x0, "GPA0"),
+		MA35_MUX(0x2, "UART1_nCTS"),
+		MA35_MUX(0x3, "UART16_RXD"),
+		MA35_MUX(0x6, "NAND_DATA0"),
+		MA35_MUX(0x7, "EBI_AD0"),
+		MA35_MUX(0x9, "EBI_ADR0")),
+	MA35_PIN(1, PA1, 0x80, 0x4,
+		MA35_MUX(0x0, "GPA1"),
+		MA35_MUX(0x2, "UART1_nRTS"),
+		MA35_MUX(0x3, "UART16_TXD"),
+		MA35_MUX(0x6, "NAND_DATA1"),
+		MA35_MUX(0x7, "EBI_AD1"),
+		MA35_MUX(0x9, "EBI_ADR1")),
+	MA35_PIN(2, PA2, 0x80, 0x8,
+		MA35_MUX(0x0, "GPA2"),
+		MA35_MUX(0x2, "UART1_RXD"),
+		MA35_MUX(0x6, "NAND_DATA2"),
+		MA35_MUX(0x7, "EBI_AD2"),
+		MA35_MUX(0x9, "EBI_ADR2")),
+	MA35_PIN(3, PA3, 0x80, 0xc,
+		MA35_MUX(0x0, "GPA3"),
+		MA35_MUX(0x2, "UART1_TXD"),
+		MA35_MUX(0x6, "NAND_DATA3"),
+		MA35_MUX(0x7, "EBI_AD3"),
+		MA35_MUX(0x9, "EBI_ADR3")),
+	MA35_PIN(4, PA4, 0x80, 0x10,
+		MA35_MUX(0x0, "GPA4"),
+		MA35_MUX(0x2, "UART3_nCTS"),
+		MA35_MUX(0x3, "UART2_RXD"),
+		MA35_MUX(0x6, "NAND_DATA4"),
+		MA35_MUX(0x7, "EBI_AD4"),
+		MA35_MUX(0x9, "EBI_ADR4")),
+	MA35_PIN(5, PA5, 0x80, 0x14,
+		MA35_MUX(0x0, "GPA5"),
+		MA35_MUX(0x2, "UART3_nRTS"),
+		MA35_MUX(0x3, "UART2_TXD"),
+		MA35_MUX(0x6, "NAND_DATA5"),
+		MA35_MUX(0x7, "EBI_AD5"),
+		MA35_MUX(0x9, "EBI_ADR5")),
+	MA35_PIN(6, PA6, 0x80, 0x18,
+		MA35_MUX(0x0, "GPA6"),
+		MA35_MUX(0x2, "UART3_RXD"),
+		MA35_MUX(0x6, "NAND_DATA6"),
+		MA35_MUX(0x7, "EBI_AD6"),
+		MA35_MUX(0x9, "EBI_ADR6")),
+	MA35_PIN(7, PA7, 0x80, 0x1c,
+		MA35_MUX(0x0, "GPA7"),
+		MA35_MUX(0x2, "UART3_TXD"),
+		MA35_MUX(0x6, "NAND_DATA7"),
+		MA35_MUX(0x7, "EBI_AD7"),
+		MA35_MUX(0x9, "EBI_ADR7")),
+	MA35_PIN(8, PA8, 0x84, 0x0,
+		MA35_MUX(0x0, "GPA8"),
+		MA35_MUX(0x2, "UART5_nCTS"),
+		MA35_MUX(0x3, "UART4_RXD"),
+		MA35_MUX(0x6, "NAND_RDY0"),
+		MA35_MUX(0x7, "EBI_AD8"),
+		MA35_MUX(0x9, "EBI_ADR8")),
+	MA35_PIN(9, PA9, 0x84, 0x4,
+		MA35_MUX(0x0, "GPA9"),
+		MA35_MUX(0x2, "UART5_nRTS"),
+		MA35_MUX(0x3, "UART4_TXD"),
+		MA35_MUX(0x6, "NAND_nRE"),
+		MA35_MUX(0x7, "EBI_AD9"),
+		MA35_MUX(0x9, "EBI_ADR9")),
+	MA35_PIN(10, PA10, 0x84, 0x8,
+		MA35_MUX(0x0, "GPA10"),
+		MA35_MUX(0x2, "UART5_RXD"),
+		MA35_MUX(0x6, "NAND_nWE"),
+		MA35_MUX(0x7, "EBI_AD10"),
+		MA35_MUX(0x9, "EBI_ADR10")),
+	MA35_PIN(11, PA11, 0x84, 0xc,
+		MA35_MUX(0x0, "GPA11"),
+		MA35_MUX(0x2, "UART5_TXD"),
+		MA35_MUX(0x6, "NAND_CLE"),
+		MA35_MUX(0x7, "EBI_AD11"),
+		MA35_MUX(0x9, "EBI_ADR11")),
+	MA35_PIN(12, PA12, 0x84, 0x10,
+		MA35_MUX(0x0, "GPA12"),
+		MA35_MUX(0x2, "UART7_nCTS"),
+		MA35_MUX(0x3, "UART8_RXD"),
+		MA35_MUX(0x6, "NAND_ALE"),
+		MA35_MUX(0x7, "EBI_AD12"),
+		MA35_MUX(0x9, "EBI_ADR12")),
+	MA35_PIN(13, PA13, 0x84, 0x14,
+		MA35_MUX(0x0, "GPA13"),
+		MA35_MUX(0x2, "UART7_nRTS"),
+		MA35_MUX(0x3, "UART8_TXD"),
+		MA35_MUX(0x6, "NAND_nCS0"),
+		MA35_MUX(0x7, "EBI_AD13"),
+		MA35_MUX(0x9, "EBI_ADR13")),
+	MA35_PIN(14, PA14, 0x84, 0x18,
+		MA35_MUX(0x0, "GPA14"),
+		MA35_MUX(0x2, "UART7_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x6, "NAND_nWP"),
+		MA35_MUX(0x7, "EBI_AD14"),
+		MA35_MUX(0x9, "EBI_ADR14")),
+	MA35_PIN(15, PA15, 0x84, 0x1c,
+		MA35_MUX(0x0, "GPA15"),
+		MA35_MUX(0x1, "EPWM0_CH2"),
+		MA35_MUX(0x2, "UART9_nCTS"),
+		MA35_MUX(0x3, "UART6_RXD"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x5, "CAN2_RXD"),
+		MA35_MUX(0x7, "EBI_ALE"),
+		MA35_MUX(0x9, "QEI0_A"),
+		MA35_MUX(0xb, "TM1"),
+		MA35_MUX(0xe, "RGMII0_PPS"),
+		MA35_MUX(0xf, "RMII0_PPS")),
+	MA35_PIN(16, PB0, 0x88, 0x0,
+		MA35_MUX(0x0, "GPB0"),
+		MA35_MUX(0x8, "EADC0_CH0")),
+	MA35_PIN(17, PB1, 0x88, 0x4,
+		MA35_MUX(0x0, "GPB1"),
+		MA35_MUX(0x8, "EADC0_CH1")),
+	MA35_PIN(18, PB2, 0x88, 0x8,
+		MA35_MUX(0x0, "GPB2"),
+		MA35_MUX(0x8, "EADC0_CH2")),
+	MA35_PIN(19, PB3, 0x88, 0xc,
+		MA35_MUX(0x0, "GPB3"),
+		MA35_MUX(0x8, "EADC0_CH3")),
+	MA35_PIN(20, PB4, 0x88, 0x10,
+		MA35_MUX(0x0, "GPB4"),
+		MA35_MUX(0x8, "EADC0_CH4")),
+	MA35_PIN(21, PB5, 0x88, 0x14,
+		MA35_MUX(0x0, "GPB5"),
+		MA35_MUX(0x8, "EADC0_CH5")),
+	MA35_PIN(22, PB6, 0x88, 0x18,
+		MA35_MUX(0x0, "GPB6"),
+		MA35_MUX(0x8, "EADC0_CH6")),
+	MA35_PIN(23, PB7, 0x88, 0x1c,
+		MA35_MUX(0x0, "GPB7"),
+		MA35_MUX(0x8, "EADC0_CH7")),
+	MA35_PIN(24, PB8, 0x8c, 0x0,
+		MA35_MUX(0x0, "GPB8"),
+		MA35_MUX(0x1, "EPWM2_BRAKE0"),
+		MA35_MUX(0x2, "UART2_nCTS"),
+		MA35_MUX(0x3, "UART1_RXD"),
+		MA35_MUX(0x4, "I2C2_SDA"),
+		MA35_MUX(0x5, "SPI0_SS1"),
+		MA35_MUX(0x6, "SPI0_I2SMCLK"),
+		MA35_MUX(0x8, "ADC0_CH0"),
+		MA35_MUX(0x9, "EBI_nCS0"),
+		MA35_MUX(0xb, "TM4"),
+		MA35_MUX(0xe, "QEI2_INDEX"),
+		MA35_MUX(0xf, "KPI_ROW6")),
+	MA35_PIN(25, PB9, 0x8c, 0x4,
+		MA35_MUX(0x0, "GPB9"),
+		MA35_MUX(0x1, "EPWM2_CH4"),
+		MA35_MUX(0x2, "UART2_nRTS"),
+		MA35_MUX(0x3, "UART1_TXD"),
+		MA35_MUX(0x4, "I2C2_SCL"),
+		MA35_MUX(0x5, "SPI0_CLK"),
+		MA35_MUX(0x6, "I2S0_MCLK"),
+		MA35_MUX(0x7, "CCAP1_HSYNC"),
+		MA35_MUX(0x8, "ADC0_CH1"),
+		MA35_MUX(0x9, "EBI_ALE"),
+		MA35_MUX(0xa, "EBI_AD13"),
+		MA35_MUX(0xb, "TM0_EXT"),
+		MA35_MUX(0xc, "I2S1_MCLK"),
+		MA35_MUX(0xd, "SC0_nCD"),
+		MA35_MUX(0xe, "QEI2_A"),
+		MA35_MUX(0xf, "KPI_ROW7")),
+	MA35_PIN(26, PB10, 0x8c, 0x8,
+		MA35_MUX(0x0, "GPB10"),
+		MA35_MUX(0x1, "EPWM2_CH5"),
+		MA35_MUX(0x2, "UART2_RXD"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x5, "SPI0_MOSI"),
+		MA35_MUX(0x6, "EBI_MCLK"),
+		MA35_MUX(0x7, "CCAP1_VSYNC"),
+		MA35_MUX(0x8, "ADC0_CH2"),
+		MA35_MUX(0x9, "EBI_ADR15"),
+		MA35_MUX(0xa, "EBI_AD14"),
+		MA35_MUX(0xb, "TM5"),
+		MA35_MUX(0xc, "I2C1_SDA"),
+		MA35_MUX(0xd, "INT1"),
+		MA35_MUX(0xe, "QEI2_B")),
+	MA35_PIN(27, PB11, 0x8c, 0xc,
+		MA35_MUX(0x0, "GPB11"),
+		MA35_MUX(0x1, "EPWM2_BRAKE1"),
+		MA35_MUX(0x2, "UART2_TXD"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x5, "SPI0_MISO"),
+		MA35_MUX(0x6, "I2S1_MCLK"),
+		MA35_MUX(0x7, "CCAP1_SFIELD"),
+		MA35_MUX(0x8, "ADC0_CH3"),
+		MA35_MUX(0x9, "EBI_nCS2"),
+		MA35_MUX(0xa, "EBI_ALE"),
+		MA35_MUX(0xb, "TM5_EXT"),
+		MA35_MUX(0xc, "I2C1_SCL"),
+		MA35_MUX(0xd, "INT2"),
+		MA35_MUX(0xe, "QEI2_INDEX")),
+	MA35_PIN(28, PB12, 0x8c, 0x10,
+		MA35_MUX(0x0, "GPB12"),
+		MA35_MUX(0x1, "EPWM2_CH0"),
+		MA35_MUX(0x2, "UART4_nCTS"),
+		MA35_MUX(0x3, "UART3_RXD"),
+		MA35_MUX(0x4, "I2C3_SDA"),
+		MA35_MUX(0x5, "CAN2_RXD"),
+		MA35_MUX(0x6, "I2S1_LRCK"),
+		MA35_MUX(0x8, "ADC0_CH4"),
+		MA35_MUX(0x9, "EBI_ADR16"),
+		MA35_MUX(0xe, "ECAP2_IC0")),
+	MA35_PIN(29, PB13, 0x8c, 0x14,
+		MA35_MUX(0x0, "GPB13"),
+		MA35_MUX(0x1, "EPWM2_CH1"),
+		MA35_MUX(0x2, "UART4_nRTS"),
+		MA35_MUX(0x3, "UART3_TXD"),
+		MA35_MUX(0x4, "I2C3_SCL"),
+		MA35_MUX(0x5, "CAN2_TXD"),
+		MA35_MUX(0x6, "I2S1_BCLK"),
+		MA35_MUX(0x8, "ADC0_CH5"),
+		MA35_MUX(0x9, "EBI_ADR17"),
+		MA35_MUX(0xe, "ECAP2_IC1")),
+	MA35_PIN(30, PB14, 0x8c, 0x18,
+		MA35_MUX(0x0, "GPB14"),
+		MA35_MUX(0x1, "EPWM2_CH2"),
+		MA35_MUX(0x2, "UART4_RXD"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x5, "I2C4_SDA"),
+		MA35_MUX(0x6, "I2S1_DI"),
+		MA35_MUX(0x8, "ADC0_CH6"),
+		MA35_MUX(0x9, "EBI_ADR18"),
+		MA35_MUX(0xe, "ECAP2_IC2")),
+	MA35_PIN(31, PB15, 0x8c, 0x1c,
+		MA35_MUX(0x0, "GPB15"),
+		MA35_MUX(0x1, "EPWM2_CH3"),
+		MA35_MUX(0x2, "UART4_TXD"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x5, "I2C4_SCL"),
+		MA35_MUX(0x6, "I2S1_DO"),
+		MA35_MUX(0x8, "ADC0_CH7"),
+		MA35_MUX(0x9, "EBI_ADR19")),
+	MA35_PIN(32, PC0, 0x90, 0x0,
+		MA35_MUX(0x0, "GPC0"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x6, "SD0_CMD/eMMC0_CMD")),
+	MA35_PIN(33, PC1, 0x90, 0x4,
+		MA35_MUX(0x0, "GPC1"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x6, "SD0_CLK/eMMC0_CLK")),
+	MA35_PIN(34, PC2, 0x90, 0x8,
+		MA35_MUX(0x0, "GPC2"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x6, "SD0_DAT0/eMMC0_DAT0")),
+	MA35_PIN(35, PC3, 0x90, 0xc,
+		MA35_MUX(0x0, "GPC3"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x6, "SD0_DAT1/eMMC0_DAT1")),
+	MA35_PIN(36, PC4, 0x90, 0x10,
+		MA35_MUX(0x0, "GPC4"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x6, "SD0_DAT2/eMMC0_DAT2")),
+	MA35_PIN(37, PC5, 0x90, 0x14,
+		MA35_MUX(0x0, "GPC5"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x6, "SD0_DAT3/eMMC0_DAT3")),
+	MA35_PIN(38, PC6, 0x90, 0x18,
+		MA35_MUX(0x0, "GPC6"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x6, "SD0_nCD")),
+	MA35_PIN(39, PC7, 0x90, 0x1c,
+		MA35_MUX(0x0, "GPC7"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x6, "SD0_WP")),
+	MA35_PIN(40, PC12, 0x94, 0x10,
+		MA35_MUX(0x0, "GPC12"),
+		MA35_MUX(0x2, "UART12_nCTS"),
+		MA35_MUX(0x3, "UART11_RXD"),
+		MA35_MUX(0x6, "LCM_DATA16")),
+	MA35_PIN(41, PC13, 0x94, 0x14,
+		MA35_MUX(0x0, "GPC13"),
+		MA35_MUX(0x2, "UART12_nRTS"),
+		MA35_MUX(0x3, "UART11_TXD"),
+		MA35_MUX(0x6, "LCM_DATA17")),
+	MA35_PIN(42, PC14, 0x94, 0x18,
+		MA35_MUX(0x0, "GPC14"),
+		MA35_MUX(0x2, "UART12_RXD"),
+		MA35_MUX(0x6, "LCM_DATA18")),
+	MA35_PIN(43, PC15, 0x94, 0x1c,
+		MA35_MUX(0x0, "GPC15"),
+		MA35_MUX(0x2, "UART12_TXD"),
+		MA35_MUX(0x6, "LCM_DATA19"),
+		MA35_MUX(0x7, "LCM_MPU_TE"),
+		MA35_MUX(0x8, "LCM_MPU_VSYNC")),
+	MA35_PIN(44, PD0, 0x98, 0x0,
+		MA35_MUX(0x0, "GPD0"),
+		MA35_MUX(0x2, "UART3_nCTS"),
+		MA35_MUX(0x3, "UART4_RXD"),
+		MA35_MUX(0x5, "QSPI0_SS0")),
+	MA35_PIN(45, PD1, 0x98, 0x4,
+		MA35_MUX(0x0, "GPD1"),
+		MA35_MUX(0x2, "UART3_nRTS"),
+		MA35_MUX(0x3, "UART4_TXD"),
+		MA35_MUX(0x5, "QSPI0_CLK")),
+	MA35_PIN(46, PD2, 0x98, 0x8,
+		MA35_MUX(0x0, "GPD2"),
+		MA35_MUX(0x2, "UART3_RXD"),
+		MA35_MUX(0x5, "QSPI0_MOSI0")),
+	MA35_PIN(47, PD3, 0x98, 0xc,
+		MA35_MUX(0x0, "GPD3"),
+		MA35_MUX(0x2, "UART3_TXD"),
+		MA35_MUX(0x5, "QSPI0_MISO0")),
+	MA35_PIN(48, PD4, 0x98, 0x10,
+		MA35_MUX(0x0, "GPD4"),
+		MA35_MUX(0x2, "UART1_nCTS"),
+		MA35_MUX(0x3, "UART2_RXD"),
+		MA35_MUX(0x4, "I2C2_SDA"),
+		MA35_MUX(0x5, "QSPI0_MOSI1")),
+	MA35_PIN(49, PD5, 0x98, 0x14,
+		MA35_MUX(0x0, "GPD5"),
+		MA35_MUX(0x2, "UART1_nRTS"),
+		MA35_MUX(0x3, "UART2_TXD"),
+		MA35_MUX(0x4, "I2C2_SCL"),
+		MA35_MUX(0x5, "QSPI0_MISO1")),
+	MA35_PIN(50, PD6, 0x98, 0x18,
+		MA35_MUX(0x0, "GPD6"),
+		MA35_MUX(0x1, "EPWM0_SYNC_IN"),
+		MA35_MUX(0x2, "UART1_RXD"),
+		MA35_MUX(0x5, "QSPI1_MOSI1"),
+		MA35_MUX(0x6, "I2C0_SDA"),
+		MA35_MUX(0x7, "I2S0_MCLK"),
+		MA35_MUX(0x8, "EPWM0_CH0"),
+		MA35_MUX(0x9, "EBI_AD5"),
+		MA35_MUX(0xa, "SPI3_SS1"),
+		MA35_MUX(0xb, "TRACE_CLK")),
+	MA35_PIN(51, PD7, 0x98, 0x1c,
+		MA35_MUX(0x0, "GPD7"),
+		MA35_MUX(0x1, "EPWM0_SYNC_OUT"),
+		MA35_MUX(0x2, "UART1_TXD"),
+		MA35_MUX(0x5, "QSPI1_MISO1"),
+		MA35_MUX(0x6, "I2C0_SCL"),
+		MA35_MUX(0x7, "I2S1_MCLK"),
+		MA35_MUX(0x8, "EPWM0_CH1"),
+		MA35_MUX(0x9, "EBI_AD6"),
+		MA35_MUX(0xa, "SC1_nCD"),
+		MA35_MUX(0xb, "EADC0_ST")),
+	MA35_PIN(52, PD8, 0x9c, 0x0,
+		MA35_MUX(0x0, "GPD8"),
+		MA35_MUX(0x1, "EPWM0_BRAKE0"),
+		MA35_MUX(0x2, "UART16_nCTS"),
+		MA35_MUX(0x3, "UART15_RXD"),
+		MA35_MUX(0x5, "QSPI1_SS0"),
+		MA35_MUX(0x7, "I2S1_LRCK"),
+		MA35_MUX(0x8, "EPWM0_CH2"),
+		MA35_MUX(0x9, "EBI_AD7"),
+		MA35_MUX(0xa, "SC1_CLK"),
+		MA35_MUX(0xb, "TM0")),
+	MA35_PIN(53, PD9, 0x9c, 0x4,
+		MA35_MUX(0x0, "GPD9"),
+		MA35_MUX(0x1, "EPWM0_BRAKE1"),
+		MA35_MUX(0x2, "UART16_nRTS"),
+		MA35_MUX(0x3, "UART15_TXD"),
+		MA35_MUX(0x5, "QSPI1_CLK"),
+		MA35_MUX(0x7, "I2S1_BCLK"),
+		MA35_MUX(0x8, "EPWM0_CH3"),
+		MA35_MUX(0x9, "EBI_AD8"),
+		MA35_MUX(0xa, "SC1_DAT"),
+		MA35_MUX(0xb, "TM0_EXT")),
+	MA35_PIN(54, PD10, 0x9c, 0x8,
+		MA35_MUX(0x0, "GPD10"),
+		MA35_MUX(0x1, "EPWM1_BRAKE0"),
+		MA35_MUX(0x2, "UART16_RXD"),
+		MA35_MUX(0x5, "QSPI1_MOSI0"),
+		MA35_MUX(0x7, "I2S1_DI"),
+		MA35_MUX(0x8, "EPWM0_CH4"),
+		MA35_MUX(0x9, "EBI_AD9"),
+		MA35_MUX(0xa, "SC1_RST"),
+		MA35_MUX(0xb, "TM2")),
+	MA35_PIN(55, PD11, 0x9c, 0xc,
+		MA35_MUX(0x0, "GPD11"),
+		MA35_MUX(0x1, "EPWM1_BRAKE1"),
+		MA35_MUX(0x2, "UART16_TXD"),
+		MA35_MUX(0x5, "QSPI1_MISO0"),
+		MA35_MUX(0x7, "I2S1_DO"),
+		MA35_MUX(0x8, "EPWM0_CH5"),
+		MA35_MUX(0x9, "EBI_AD10"),
+		MA35_MUX(0xa, "SC1_PWR"),
+		MA35_MUX(0xb, "TM2_EXT")),
+	MA35_PIN(56, PD12, 0x9c, 0x10,
+		MA35_MUX(0x0, "GPD12"),
+		MA35_MUX(0x1, "EPWM0_BRAKE0"),
+		MA35_MUX(0x2, "UART11_TXD"),
+		MA35_MUX(0x3, "UART10_RXD"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x6, "TRACE_DATA0"),
+		MA35_MUX(0x7, "EBI_nCS1"),
+		MA35_MUX(0x8, "EBI_AD4"),
+		MA35_MUX(0x9, "QEI0_INDEX"),
+		MA35_MUX(0xb, "TM5"),
+		MA35_MUX(0xc, "I2S1_LRCK"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(57, PD13, 0x9c, 0x14,
+		MA35_MUX(0x0, "GPD13"),
+		MA35_MUX(0x1, "EPWM0_BRAKE1"),
+		MA35_MUX(0x2, "UART11_RXD"),
+		MA35_MUX(0x3, "UART10_TXD"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x6, "TRACE_DATA1"),
+		MA35_MUX(0x7, "EBI_nCS2"),
+		MA35_MUX(0x8, "EBI_AD5"),
+		MA35_MUX(0x9, "ECAP0_IC0"),
+		MA35_MUX(0xb, "TM5_EXT"),
+		MA35_MUX(0xc, "I2S1_BCLK")),
+	MA35_PIN(58, PD14, 0x9c, 0x18,
+		MA35_MUX(0x0, "GPD14"),
+		MA35_MUX(0x1, "EPWM0_SYNC_IN"),
+		MA35_MUX(0x2, "UART11_nCTS"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x6, "TRACE_DATA2"),
+		MA35_MUX(0x7, "EBI_MCLK"),
+		MA35_MUX(0x8, "EBI_AD6"),
+		MA35_MUX(0x9, "ECAP0_IC1"),
+		MA35_MUX(0xb, "TM6"),
+		MA35_MUX(0xc, "I2S1_DI"),
+		MA35_MUX(0xd, "INT3")),
+	MA35_PIN(59, PD15, 0x9c, 0x1c,
+		MA35_MUX(0x0, "GPD15"),
+		MA35_MUX(0x1, "EPWM0_SYNC_OUT"),
+		MA35_MUX(0x2, "UART11_nRTS"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x6, "TRACE_DATA3"),
+		MA35_MUX(0x7, "EBI_ALE"),
+		MA35_MUX(0x8, "EBI_AD7"),
+		MA35_MUX(0x9, "ECAP0_IC2"),
+		MA35_MUX(0xb, "TM6_EXT"),
+		MA35_MUX(0xc, "I2S1_DO")),
+	MA35_PIN(60, PE0, 0xa0, 0x0,
+		MA35_MUX(0x0, "GPE0"),
+		MA35_MUX(0x2, "UART9_nCTS"),
+		MA35_MUX(0x3, "UART8_RXD"),
+		MA35_MUX(0x7, "CCAP1_DATA0"),
+		MA35_MUX(0x8, "RGMII0_MDC"),
+		MA35_MUX(0x9, "RMII0_MDC")),
+	MA35_PIN(61, PE1, 0xa0, 0x4,
+		MA35_MUX(0x0, "GPE1"),
+		MA35_MUX(0x2, "UART9_nRTS"),
+		MA35_MUX(0x3, "UART8_TXD"),
+		MA35_MUX(0x7, "CCAP1_DATA1"),
+		MA35_MUX(0x8, "RGMII0_MDIO"),
+		MA35_MUX(0x9, "RMII0_MDIO")),
+	MA35_PIN(62, PE2, 0xa0, 0x8,
+		MA35_MUX(0x0, "GPE2"),
+		MA35_MUX(0x2, "UART9_RXD"),
+		MA35_MUX(0x7, "CCAP1_DATA2"),
+		MA35_MUX(0x8, "RGMII0_TXCTL"),
+		MA35_MUX(0x9, "RMII0_TXEN")),
+	MA35_PIN(63, PE3, 0xa0, 0xc,
+		MA35_MUX(0x0, "GPE3"),
+		MA35_MUX(0x2, "UART9_TXD"),
+		MA35_MUX(0x7, "CCAP1_DATA3"),
+		MA35_MUX(0x8, "RGMII0_TXD0"),
+		MA35_MUX(0x9, "RMII0_TXD0")),
+	MA35_PIN(64, PE4, 0xa0, 0x10,
+		MA35_MUX(0x0, "GPE4"),
+		MA35_MUX(0x2, "UART4_nCTS"),
+		MA35_MUX(0x3, "UART3_RXD"),
+		MA35_MUX(0x7, "CCAP1_DATA4"),
+		MA35_MUX(0x8, "RGMII0_TXD1"),
+		MA35_MUX(0x9, "RMII0_TXD1")),
+	MA35_PIN(65, PE5, 0xa0, 0x14,
+		MA35_MUX(0x0, "GPE5"),
+		MA35_MUX(0x2, "UART4_nRTS"),
+		MA35_MUX(0x3, "UART3_TXD"),
+		MA35_MUX(0x7, "CCAP1_DATA5"),
+		MA35_MUX(0x8, "RGMII0_RXCLK"),
+		MA35_MUX(0x9, "RMII0_REFCLK")),
+	MA35_PIN(66, PE6, 0xa0, 0x18,
+		MA35_MUX(0x0, "GPE6"),
+		MA35_MUX(0x2, "UART4_RXD"),
+		MA35_MUX(0x7, "CCAP1_DATA6"),
+		MA35_MUX(0x8, "RGMII0_RXCTL"),
+		MA35_MUX(0x9, "RMII0_CRSDV")),
+	MA35_PIN(67, PE7, 0xa0, 0x1c,
+		MA35_MUX(0x0, "GPE7"),
+		MA35_MUX(0x2, "UART4_TXD"),
+		MA35_MUX(0x7, "CCAP1_DATA7"),
+		MA35_MUX(0x8, "RGMII0_RXD0"),
+		MA35_MUX(0x9, "RMII0_RXD0")),
+	MA35_PIN(68, PE8, 0xa4, 0x0,
+		MA35_MUX(0x0, "GPE8"),
+		MA35_MUX(0x2, "UART13_nCTS"),
+		MA35_MUX(0x3, "UART12_RXD"),
+		MA35_MUX(0x7, "CCAP1_SCLK"),
+		MA35_MUX(0x8, "RGMII0_RXD1"),
+		MA35_MUX(0x9, "RMII0_RXD1")),
+	MA35_PIN(69, PE9, 0xa4, 0x4,
+		MA35_MUX(0x0, "GPE9"),
+		MA35_MUX(0x2, "UART13_nRTS"),
+		MA35_MUX(0x3, "UART12_TXD"),
+		MA35_MUX(0x7, "CCAP1_PIXCLK"),
+		MA35_MUX(0x8, "RGMII0_RXD2"),
+		MA35_MUX(0x9, "RMII0_RXERR")),
+	MA35_PIN(70, PE10, 0xa4, 0x8,
+		MA35_MUX(0x0, "GPE10"),
+		MA35_MUX(0x2, "UART15_nCTS"),
+		MA35_MUX(0x3, "UART14_RXD"),
+		MA35_MUX(0x5, "SPI1_SS0"),
+		MA35_MUX(0x7, "CCAP1_HSYNC"),
+		MA35_MUX(0x8, "RGMII0_RXD3")),
+	MA35_PIN(71, PE11, 0xa4, 0xc,
+		MA35_MUX(0x0, "GPE11"),
+		MA35_MUX(0x2, "UART15_nRTS"),
+		MA35_MUX(0x3, "UART14_TXD"),
+		MA35_MUX(0x5, "SPI1_CLK"),
+		MA35_MUX(0x7, "CCAP1_VSYNC"),
+		MA35_MUX(0x8, "RGMII0_TXCLK")),
+	MA35_PIN(72, PE12, 0xa4, 0x10,
+		MA35_MUX(0x0, "GPE12"),
+		MA35_MUX(0x2, "UART15_RXD"),
+		MA35_MUX(0x5, "SPI1_MOSI"),
+		MA35_MUX(0x7, "CCAP1_DATA8"),
+		MA35_MUX(0x8, "RGMII0_TXD2")),
+	MA35_PIN(73, PE13, 0xa4, 0x14,
+		MA35_MUX(0x0, "GPE13"),
+		MA35_MUX(0x2, "UART15_TXD"),
+		MA35_MUX(0x5, "SPI1_MISO"),
+		MA35_MUX(0x7, "CCAP1_DATA9"),
+		MA35_MUX(0x8, "RGMII0_TXD3")),
+	MA35_PIN(74, PE14, 0xa4, 0x18,
+		MA35_MUX(0x0, "GPE14"),
+		MA35_MUX(0x1, "UART0_TXD")),
+	MA35_PIN(75, PE15, 0xa4, 0x1c,
+		MA35_MUX(0x0, "GPE15"),
+		MA35_MUX(0x1, "UART0_RXD")),
+	MA35_PIN(76, PF0, 0xa8, 0x0,
+		MA35_MUX(0x0, "GPF0"),
+		MA35_MUX(0x2, "UART2_nCTS"),
+		MA35_MUX(0x3, "UART1_RXD"),
+		MA35_MUX(0x6, "RGMII0_RXD3"),
+		MA35_MUX(0x8, "RGMII1_MDC"),
+		MA35_MUX(0x9, "RMII1_MDC"),
+		MA35_MUX(0xe, "KPI_COL0")),
+	MA35_PIN(77, PF1, 0xa8, 0x4,
+		MA35_MUX(0x0, "GPF1"),
+		MA35_MUX(0x2, "UART2_nRTS"),
+		MA35_MUX(0x3, "UART1_TXD"),
+		MA35_MUX(0x6, "RGMII0_TXCLK"),
+		MA35_MUX(0x8, "RGMII1_MDIO"),
+		MA35_MUX(0x9, "RMII1_MDIO"),
+		MA35_MUX(0xe, "KPI_COL1")),
+	MA35_PIN(78, PF2, 0xa8, 0x8,
+		MA35_MUX(0x0, "GPF2"),
+		MA35_MUX(0x2, "UART2_RXD"),
+		MA35_MUX(0x6, "RGMII0_TXD2"),
+		MA35_MUX(0x8, "RGMII1_TXCTL"),
+		MA35_MUX(0x9, "RMII1_TXEN"),
+		MA35_MUX(0xe, "KPI_COL2")),
+	MA35_PIN(79, PF3, 0xa8, 0xc,
+		MA35_MUX(0x0, "GPF3"),
+		MA35_MUX(0x2, "UART2_TXD"),
+		MA35_MUX(0x6, "RGMII0_TXD3"),
+		MA35_MUX(0x8, "RGMII1_TXD0"),
+		MA35_MUX(0x9, "RMII1_TXD0"),
+		MA35_MUX(0xe, "KPI_COL3")),
+	MA35_PIN(80, PF4, 0xa8, 0x10,
+		MA35_MUX(0x0, "GPF4"),
+		MA35_MUX(0x2, "UART11_nCTS"),
+		MA35_MUX(0x3, "UART10_RXD"),
+		MA35_MUX(0x4, "I2S0_LRCK"),
+		MA35_MUX(0x5, "SPI1_SS0"),
+		MA35_MUX(0x8, "RGMII1_TXD1"),
+		MA35_MUX(0x9, "RMII1_TXD1"),
+		MA35_MUX(0xd, "CAN2_RXD"),
+		MA35_MUX(0xe, "KPI_ROW0")),
+	MA35_PIN(81, PF5, 0xa8, 0x14,
+		MA35_MUX(0x0, "GPF5"),
+		MA35_MUX(0x2, "UART11_nRTS"),
+		MA35_MUX(0x3, "UART10_TXD"),
+		MA35_MUX(0x4, "I2S0_BCLK"),
+		MA35_MUX(0x5, "SPI1_CLK"),
+		MA35_MUX(0x8, "RGMII1_RXCLK"),
+		MA35_MUX(0x9, "RMII1_REFCLK"),
+		MA35_MUX(0xd, "CAN2_TXD"),
+		MA35_MUX(0xe, "KPI_ROW1")),
+	MA35_PIN(82, PF6, 0xa8, 0x18,
+		MA35_MUX(0x0, "GPF6"),
+		MA35_MUX(0x2, "UART11_RXD"),
+		MA35_MUX(0x4, "I2S0_DI"),
+		MA35_MUX(0x5, "SPI1_MOSI"),
+		MA35_MUX(0x8, "RGMII1_RXCTL"),
+		MA35_MUX(0x9, "RMII1_CRSDV"),
+		MA35_MUX(0xa, "I2C4_SDA"),
+		MA35_MUX(0xd, "SC0_CLK"),
+		MA35_MUX(0xe, "KPI_ROW2")),
+	MA35_PIN(83, PF7, 0xa8, 0x1c,
+		MA35_MUX(0x0, "GPF7"),
+		MA35_MUX(0x2, "UART11_TXD"),
+		MA35_MUX(0x4, "I2S0_DO"),
+		MA35_MUX(0x5, "SPI1_MISO"),
+		MA35_MUX(0x8, "RGMII1_RXD0"),
+		MA35_MUX(0x9, "RMII1_RXD0"),
+		MA35_MUX(0xa, "I2C4_SCL"),
+		MA35_MUX(0xd, "SC0_DAT"),
+		MA35_MUX(0xe, "KPI_ROW3")),
+	MA35_PIN(84, PF8, 0xac, 0x0,
+		MA35_MUX(0x0, "GPF8"),
+		MA35_MUX(0x2, "UART13_RXD"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x5, "SPI0_SS0"),
+		MA35_MUX(0x8, "RGMII1_RXD1"),
+		MA35_MUX(0x9, "RMII1_RXD1"),
+		MA35_MUX(0xd, "SC0_RST"),
+		MA35_MUX(0xe, "KPI_COL4")),
+	MA35_PIN(85, PF9, 0xac, 0x4,
+		MA35_MUX(0x0, "GPF9"),
+		MA35_MUX(0x2, "UART13_TXD"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x5, "SPI0_SS1"),
+		MA35_MUX(0x8, "RGMII1_RXD2"),
+		MA35_MUX(0x9, "RMII1_RXERR"),
+		MA35_MUX(0xd, "SC0_PWR"),
+		MA35_MUX(0xe, "KPI_COL5")),
+	MA35_PIN(86, PF10, 0xac, 0x8,
+		MA35_MUX(0x0, "GPF10"),
+		MA35_MUX(0x2, "UART13_nCTS"),
+		MA35_MUX(0x5, "I2S0_LRCK"),
+		MA35_MUX(0x6, "SPI1_SS0"),
+		MA35_MUX(0x8, "RGMII1_RXD3"),
+		MA35_MUX(0x9, "SC0_CLK"),
+		MA35_MUX(0xe, "KPI_COL6")),
+	MA35_PIN(87, PF11, 0xac, 0xc,
+		MA35_MUX(0x0, "GPF11"),
+		MA35_MUX(0x2, "UART13_nRTS"),
+		MA35_MUX(0x5, "I2S0_BCLK"),
+		MA35_MUX(0x6, "SPI1_CLK"),
+		MA35_MUX(0x8, "RGMII1_TXCLK"),
+		MA35_MUX(0x9, "SC0_DAT"),
+		MA35_MUX(0xe, "KPI_COL7")),
+	MA35_PIN(88, PF12, 0xac, 0x10,
+		MA35_MUX(0x0, "GPF12"),
+		MA35_MUX(0x5, "I2S0_DI"),
+		MA35_MUX(0x6, "SPI1_MOSI"),
+		MA35_MUX(0x8, "RGMII1_TXD2"),
+		MA35_MUX(0x9, "SC0_RST"),
+		MA35_MUX(0xe, "KPI_ROW4")),
+	MA35_PIN(89, PF13, 0xac, 0x14,
+		MA35_MUX(0x0, "GPF13"),
+		MA35_MUX(0x5, "I2S0_DO"),
+		MA35_MUX(0x6, "SPI1_MISO"),
+		MA35_MUX(0x8, "RGMII1_TXD3"),
+		MA35_MUX(0x9, "SC0_PWR"),
+		MA35_MUX(0xe, "KPI_ROW5")),
+	MA35_PIN(90, PF14, 0xac, 0x18,
+		MA35_MUX(0x0, "GPF14"),
+		MA35_MUX(0x1, "EPWM2_BRAKE0"),
+		MA35_MUX(0x2, "EADC0_ST"),
+		MA35_MUX(0x3, "RGMII1_PPS"),
+		MA35_MUX(0x4, "RMII1_PPS"),
+		MA35_MUX(0x5, "SPI0_I2SMCLK"),
+		MA35_MUX(0x6, "SPI1_I2SMCLK"),
+		MA35_MUX(0x7, "CCAP1_SFIELD"),
+		MA35_MUX(0x8, "RGMII0_PPS"),
+		MA35_MUX(0x9, "RMII0_PPS"),
+		MA35_MUX(0xb, "TM0"),
+		MA35_MUX(0xc, "INT0"),
+		MA35_MUX(0xd, "SPI1_SS1"),
+		MA35_MUX(0xe, "QEI2_INDEX"),
+		MA35_MUX(0xf, "I2S0_MCLK")),
+	MA35_PIN(91, PF15, 0xac, 0x1c,
+		MA35_MUX(0x0, "GPF15"),
+		MA35_MUX(0x1, "HSUSB0_VBUSVLD")),
+	MA35_PIN(92, PG0, 0xb0, 0x0,
+		MA35_MUX(0x0, "GPG0"),
+		MA35_MUX(0x1, "EPWM0_CH0"),
+		MA35_MUX(0x2, "UART7_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "SPI0_SS0"),
+		MA35_MUX(0x6, "EADC0_ST"),
+		MA35_MUX(0x7, "EBI_AD15"),
+		MA35_MUX(0x9, "I2S1_MCLK"),
+		MA35_MUX(0xa, "QEI0_INDEX"),
+		MA35_MUX(0xb, "TM1"),
+		MA35_MUX(0xc, "CLKO"),
+		MA35_MUX(0xd, "INT0"),
+		MA35_MUX(0xf, "EBI_ADR15")),
+	MA35_PIN(93, PG1, 0xb0, 0x4,
+		MA35_MUX(0x0, "GPG1"),
+		MA35_MUX(0x1, "EPWM0_CH3"),
+		MA35_MUX(0x2, "UART9_nRTS"),
+		MA35_MUX(0x3, "UART6_TXD"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x5, "CAN2_TXD"),
+		MA35_MUX(0x7, "EBI_nCS0"),
+		MA35_MUX(0x9, "QEI0_B"),
+		MA35_MUX(0xb, "TM1_EXT"),
+		MA35_MUX(0xe, "RGMII1_PPS"),
+		MA35_MUX(0xf, "RMII1_PPS")),
+	MA35_PIN(94, PG2, 0xb0, 0x8,
+		MA35_MUX(0x0, "GPG2"),
+		MA35_MUX(0x1, "EPWM0_CH4"),
+		MA35_MUX(0x2, "UART9_RXD"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x5, "SPI0_SS1"),
+		MA35_MUX(0x7, "EBI_ADR16"),
+		MA35_MUX(0x8, "EBI_nCS2"),
+		MA35_MUX(0xa, "QEI0_A"),
+		MA35_MUX(0xb, "TM3"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(95, PG3, 0xb0, 0xc,
+		MA35_MUX(0x0, "GPG3"),
+		MA35_MUX(0x1, "EPWM0_CH5"),
+		MA35_MUX(0x2, "UART9_TXD"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x5, "SPI0_I2SMCLK"),
+		MA35_MUX(0x7, "EBI_ADR17"),
+		MA35_MUX(0x8, "EBI_nCS1"),
+		MA35_MUX(0x9, "EBI_MCLK"),
+		MA35_MUX(0xa, "QEI0_B"),
+		MA35_MUX(0xb, "TM3_EXT"),
+		MA35_MUX(0xc, "I2S1_MCLK")),
+	MA35_PIN(96, PG4, 0xb0, 0x10,
+		MA35_MUX(0x0, "GPG4"),
+		MA35_MUX(0x1, "EPWM1_CH0"),
+		MA35_MUX(0x2, "UART5_nCTS"),
+		MA35_MUX(0x3, "UART6_RXD"),
+		MA35_MUX(0x5, "SPI3_SS0"),
+		MA35_MUX(0x6, "QEI1_INDEX"),
+		MA35_MUX(0x7, "EBI_ADR18"),
+		MA35_MUX(0x8, "EBI_nCS0"),
+		MA35_MUX(0x9, "I2S1_DO"),
+		MA35_MUX(0xa, "SC1_CLK"),
+		MA35_MUX(0xb, "TM4"),
+		MA35_MUX(0xd, "INT2"),
+		MA35_MUX(0xe, "ECAP1_IC2")),
+	MA35_PIN(97, PG5, 0xb0, 0x14,
+		MA35_MUX(0x0, "GPG5"),
+		MA35_MUX(0x1, "EPWM1_CH1"),
+		MA35_MUX(0x2, "UART5_nRTS"),
+		MA35_MUX(0x3, "UART6_TXD"),
+		MA35_MUX(0x5, "SPI3_CLK"),
+		MA35_MUX(0x6, "ECAP0_IC0"),
+		MA35_MUX(0x7, "EBI_ADR19"),
+		MA35_MUX(0x8, "EBI_ALE"),
+		MA35_MUX(0x9, "I2S1_DI"),
+		MA35_MUX(0xa, "SC1_DAT"),
+		MA35_MUX(0xb, "TM4_EXT")),
+	MA35_PIN(98, PG6, 0xb0, 0x18,
+		MA35_MUX(0x0, "GPG6"),
+		MA35_MUX(0x1, "EPWM1_CH2"),
+		MA35_MUX(0x2, "UART5_RXD"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x5, "SPI3_MOSI"),
+		MA35_MUX(0x6, "ECAP0_IC1"),
+		MA35_MUX(0x7, "EBI_nRD"),
+		MA35_MUX(0x9, "I2S1_BCLK"),
+		MA35_MUX(0xa, "SC1_RST"),
+		MA35_MUX(0xb, "TM7"),
+		MA35_MUX(0xd, "INT3")),
+	MA35_PIN(99, PG7, 0xb0, 0x1c,
+		MA35_MUX(0x0, "GPG7"),
+		MA35_MUX(0x1, "EPWM1_CH3"),
+		MA35_MUX(0x2, "UART5_TXD"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x5, "SPI3_MISO"),
+		MA35_MUX(0x6, "ECAP0_IC2"),
+		MA35_MUX(0x7, "EBI_nWR"),
+		MA35_MUX(0x9, "I2S1_LRCK"),
+		MA35_MUX(0xa, "SC1_PWR"),
+		MA35_MUX(0xb, "TM7_EXT")),
+	MA35_PIN(100, PG8, 0xb4, 0x0,
+		MA35_MUX(0x0, "GPG8"),
+		MA35_MUX(0x1, "EPWM1_CH4"),
+		MA35_MUX(0x2, "UART12_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x5, "SPI2_SS0"),
+		MA35_MUX(0x6, "LCM_VSYNC"),
+		MA35_MUX(0x7, "I2C3_SDA"),
+		MA35_MUX(0xc, "EBI_AD7"),
+		MA35_MUX(0xd, "EBI_nCS0")),
+	MA35_PIN(101, PG9, 0xb4, 0x4,
+		MA35_MUX(0x0, "GPG9"),
+		MA35_MUX(0x1, "EPWM1_CH5"),
+		MA35_MUX(0x2, "UART12_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "SPI2_CLK"),
+		MA35_MUX(0x6, "LCM_HSYNC"),
+		MA35_MUX(0x7, "I2C3_SCL"),
+		MA35_MUX(0xc, "EBI_AD8"),
+		MA35_MUX(0xd, "EBI_nCS1")),
+	MA35_PIN(102, PG10, 0xb4, 0x8,
+		MA35_MUX(0x0, "GPG10"),
+		MA35_MUX(0x2, "UART12_nRTS"),
+		MA35_MUX(0x3, "UART13_TXD"),
+		MA35_MUX(0x5, "SPI2_MOSI"),
+		MA35_MUX(0x6, "LCM_CLK"),
+		MA35_MUX(0xc, "EBI_AD9"),
+		MA35_MUX(0xd, "EBI_nWRH")),
+	MA35_PIN(103, PG11, 0xb4, 0xc,
+		MA35_MUX(0x0, "GPG11"),
+		MA35_MUX(0x3, "JTAG_TDO"),
+		MA35_MUX(0x5, "I2S0_MCLK"),
+		MA35_MUX(0x6, "NAND_RDY1"),
+		MA35_MUX(0x7, "EBI_nWRH"),
+		MA35_MUX(0x8, "EBI_nCS1"),
+		MA35_MUX(0xa, "EBI_AD0")),
+	MA35_PIN(104, PG12, 0xb4, 0x10,
+		MA35_MUX(0x0, "GPG12"),
+		MA35_MUX(0x3, "JTAG_TCK/SW_CLK"),
+		MA35_MUX(0x5, "I2S0_LRCK"),
+		MA35_MUX(0x7, "EBI_nWRL"),
+		MA35_MUX(0xa, "EBI_AD1")),
+	MA35_PIN(105, PG13, 0xb4, 0x14,
+		MA35_MUX(0x0, "GPG13"),
+		MA35_MUX(0x3, "JTAG_TMS/SW_DIO"),
+		MA35_MUX(0x5, "I2S0_BCLK"),
+		MA35_MUX(0x7, "EBI_MCLK"),
+		MA35_MUX(0xa, "EBI_AD2")),
+	MA35_PIN(106, PG14, 0xb4, 0x18,
+		MA35_MUX(0x0, "GPG14"),
+		MA35_MUX(0x3, "JTAG_TDI"),
+		MA35_MUX(0x5, "I2S0_DI"),
+		MA35_MUX(0x6, "NAND_nCS1"),
+		MA35_MUX(0x7, "EBI_ALE"),
+		MA35_MUX(0xa, "EBI_AD3")),
+	MA35_PIN(107, PG15, 0xb4, 0x1c,
+		MA35_MUX(0x0, "GPG15"),
+		MA35_MUX(0x3, "JTAG_nTRST"),
+		MA35_MUX(0x5, "I2S0_DO"),
+		MA35_MUX(0x7, "EBI_nCS0"),
+		MA35_MUX(0xa, "EBI_AD4")),
+	MA35_PIN(108, PH0, 0xb8, 0x0,
+		MA35_MUX(0x0, "GPH0"),
+		MA35_MUX(0x2, "UART8_nCTS"),
+		MA35_MUX(0x3, "UART7_RXD"),
+		MA35_MUX(0x6, "LCM_DATA8")),
+	MA35_PIN(109, PH1, 0xb8, 0x4,
+		MA35_MUX(0x0, "GPH1"),
+		MA35_MUX(0x2, "UART8_nRTS"),
+		MA35_MUX(0x3, "UART7_TXD"),
+		MA35_MUX(0x6, "LCM_DATA9")),
+	MA35_PIN(110, PH2, 0xb8, 0x8,
+		MA35_MUX(0x0, "GPH2"),
+		MA35_MUX(0x2, "UART8_RXD"),
+		MA35_MUX(0x6, "LCM_DATA10")),
+	MA35_PIN(111, PH3, 0xb8, 0xc,
+		MA35_MUX(0x0, "GPH3"),
+		MA35_MUX(0x2, "UART8_TXD"),
+		MA35_MUX(0x6, "LCM_DATA11")),
+	MA35_PIN(112, PH4, 0xb8, 0x10,
+		MA35_MUX(0x0, "GPH4"),
+		MA35_MUX(0x2, "UART10_nCTS"),
+		MA35_MUX(0x3, "UART9_RXD"),
+		MA35_MUX(0x6, "LCM_DATA12")),
+	MA35_PIN(113, PH5, 0xb8, 0x14,
+		MA35_MUX(0x0, "GPH5"),
+		MA35_MUX(0x2, "UART10_nRTS"),
+		MA35_MUX(0x3, "UART9_TXD"),
+		MA35_MUX(0x6, "LCM_DATA13")),
+	MA35_PIN(114, PH6, 0xb8, 0x18,
+		MA35_MUX(0x0, "GPH6"),
+		MA35_MUX(0x2, "UART10_RXD"),
+		MA35_MUX(0x6, "LCM_DATA14")),
+	MA35_PIN(115, PH7, 0xb8, 0x1c,
+		MA35_MUX(0x0, "GPH7"),
+		MA35_MUX(0x2, "UART10_TXD"),
+		MA35_MUX(0x6, "LCM_DATA15")),
+	MA35_PIN(116, PH8, 0xbc, 0x0,
+		MA35_MUX(0x0, "GPH8"),
+		MA35_MUX(0x6, "TAMPER0")),
+	MA35_PIN(117, PH9, 0xbc, 0x4,
+		MA35_MUX(0x0, "GPH9"),
+		MA35_MUX(0x4, "CLK_32KOUT"),
+		MA35_MUX(0x6, "TAMPER1")),
+	MA35_PIN(118, PH12, 0xbc, 0x10,
+		MA35_MUX(0x0, "GPH12"),
+		MA35_MUX(0x2, "UART14_nCTS"),
+		MA35_MUX(0x3, "UART13_RXD"),
+		MA35_MUX(0x6, "LCM_DATA20")),
+	MA35_PIN(119, PH13, 0xbc, 0x14,
+		MA35_MUX(0x0, "GPH13"),
+		MA35_MUX(0x2, "UART14_nRTS"),
+		MA35_MUX(0x3, "UART13_TXD"),
+		MA35_MUX(0x6, "LCM_DATA21")),
+	MA35_PIN(120, PH14, 0xbc, 0x18,
+		MA35_MUX(0x0, "GPH14"),
+		MA35_MUX(0x2, "UART14_RXD"),
+		MA35_MUX(0x6, "LCM_DATA22")),
+	MA35_PIN(121, PH15, 0xbc, 0x1c,
+		MA35_MUX(0x0, "GPH15"),
+		MA35_MUX(0x2, "UART14_TXD"),
+		MA35_MUX(0x6, "LCM_DATA23")),
+	MA35_PIN(122, PI0, 0xc0, 0x0,
+		MA35_MUX(0x0, "GPI0"),
+		MA35_MUX(0x1, "EPWM0_CH0"),
+		MA35_MUX(0x2, "UART12_nCTS"),
+		MA35_MUX(0x3, "UART11_RXD"),
+		MA35_MUX(0x4, "I2C2_SDA"),
+		MA35_MUX(0x5, "SPI3_SS0"),
+		MA35_MUX(0x7, "SC0_nCD"),
+		MA35_MUX(0x8, "EBI_ADR0"),
+		MA35_MUX(0xb, "TM0"),
+		MA35_MUX(0xc, "ECAP1_IC0")),
+	MA35_PIN(123, PI1, 0xc0, 0x4,
+		MA35_MUX(0x0, "GPI1"),
+		MA35_MUX(0x1, "EPWM0_CH1"),
+		MA35_MUX(0x2, "UART12_nRTS"),
+		MA35_MUX(0x3, "UART11_TXD"),
+		MA35_MUX(0x4, "I2C2_SCL"),
+		MA35_MUX(0x5, "SPI3_CLK"),
+		MA35_MUX(0x7, "SC0_CLK"),
+		MA35_MUX(0x8, "EBI_ADR1"),
+		MA35_MUX(0xb, "TM0_EXT"),
+		MA35_MUX(0xc, "ECAP1_IC1")),
+	MA35_PIN(124, PI2, 0xc0, 0x8,
+		MA35_MUX(0x0, "GPI2"),
+		MA35_MUX(0x1, "EPWM0_CH2"),
+		MA35_MUX(0x2, "UART12_RXD"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x5, "SPI3_MOSI"),
+		MA35_MUX(0x7, "SC0_DAT"),
+		MA35_MUX(0x8, "EBI_ADR2"),
+		MA35_MUX(0xb, "TM1"),
+		MA35_MUX(0xc, "ECAP1_IC2")),
+	MA35_PIN(125, PI3, 0xc0, 0xc,
+		MA35_MUX(0x0, "GPI3"),
+		MA35_MUX(0x1, "EPWM0_CH3"),
+		MA35_MUX(0x2, "UART12_TXD"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x5, "SPI3_MISO"),
+		MA35_MUX(0x7, "SC0_RST"),
+		MA35_MUX(0x8, "EBI_ADR3"),
+		MA35_MUX(0xb, "TM1_EXT")),
+	MA35_PIN(126, PI4, 0xc0, 0x10,
+		MA35_MUX(0x0, "GPI4"),
+		MA35_MUX(0x1, "EPWM0_CH4"),
+		MA35_MUX(0x2, "UART14_nCTS"),
+		MA35_MUX(0x3, "UART13_RXD"),
+		MA35_MUX(0x4, "I2C3_SDA"),
+		MA35_MUX(0x5, "SPI2_SS1"),
+		MA35_MUX(0x6, "I2S1_LRCK"),
+		MA35_MUX(0x8, "EBI_ADR4"),
+		MA35_MUX(0xd, "INT0")),
+	MA35_PIN(127, PI5, 0xc0, 0x14,
+		MA35_MUX(0x0, "GPI5"),
+		MA35_MUX(0x1, "EPWM0_CH5"),
+		MA35_MUX(0x2, "UART14_nRTS"),
+		MA35_MUX(0x3, "UART13_TXD"),
+		MA35_MUX(0x4, "I2C3_SCL"),
+		MA35_MUX(0x6, "I2S1_BCLK"),
+		MA35_MUX(0x8, "EBI_ADR5"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(128, PI6, 0xc0, 0x18,
+		MA35_MUX(0x0, "GPI6"),
+		MA35_MUX(0x1, "EPWM0_BRAKE0"),
+		MA35_MUX(0x2, "UART14_RXD"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x6, "I2S1_DI"),
+		MA35_MUX(0x8, "EBI_ADR6"),
+		MA35_MUX(0xc, "QEI1_INDEX"),
+		MA35_MUX(0xd, "INT2")),
+	MA35_PIN(129, PI7, 0xc0, 0x1c,
+		MA35_MUX(0x0, "GPI7"),
+		MA35_MUX(0x1, "EPWM0_BRAKE1"),
+		MA35_MUX(0x2, "UART14_TXD"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x6, "I2S1_DO"),
+		MA35_MUX(0x8, "EBI_ADR7"),
+		MA35_MUX(0xc, "ECAP0_IC0"),
+		MA35_MUX(0xd, "INT3")),
+	MA35_PIN(130, PI8, 0xc4, 0x0,
+		MA35_MUX(0x0, "GPI8"),
+		MA35_MUX(0x2, "UART4_nCTS"),
+		MA35_MUX(0x3, "UART3_RXD"),
+		MA35_MUX(0x6, "LCM_DATA0"),
+		MA35_MUX(0xc, "EBI_AD11")),
+	MA35_PIN(131, PI9, 0xc4, 0x4,
+		MA35_MUX(0x0, "GPI9"),
+		MA35_MUX(0x2, "UART4_nRTS"),
+		MA35_MUX(0x3, "UART3_TXD"),
+		MA35_MUX(0x6, "LCM_DATA1"),
+		MA35_MUX(0xc, "EBI_AD12")),
+	MA35_PIN(132, PI10, 0xc4, 0x8,
+		MA35_MUX(0x0, "GPI10"),
+		MA35_MUX(0x2, "UART4_RXD"),
+		MA35_MUX(0x6, "LCM_DATA2"),
+		MA35_MUX(0xc, "EBI_AD13")),
+	MA35_PIN(133, PI11, 0xC4, 0xc,
+		MA35_MUX(0x0, "GPI11"),
+		MA35_MUX(0x2, "UART4_TXD"),
+		MA35_MUX(0x6, "LCM_DATA3"),
+		MA35_MUX(0xc, "EBI_AD14")),
+	MA35_PIN(134, PI12, 0xc4, 0x10,
+		MA35_MUX(0x0, "GPI12"),
+		MA35_MUX(0x2, "UART6_nCTS"),
+		MA35_MUX(0x3, "UART5_RXD"),
+		MA35_MUX(0x6, "LCM_DATA4")),
+	MA35_PIN(135, PI13, 0xc4, 0x14,
+		MA35_MUX(0x0, "GPI13"),
+		MA35_MUX(0x2, "UART6_nRTS"),
+		MA35_MUX(0x3, "UART5_TXD"),
+		MA35_MUX(0x6, "LCM_DATA5")),
+	MA35_PIN(136, PI14, 0xc4, 0x18,
+		MA35_MUX(0x0, "GPI14"),
+		MA35_MUX(0x2, "UART6_RXD"),
+		MA35_MUX(0x6, "LCM_DATA6")),
+	MA35_PIN(137, PI15, 0xc4, 0x1c,
+		MA35_MUX(0x0, "GPI15"),
+		MA35_MUX(0x2, "UART6_TXD"),
+		MA35_MUX(0x6, "LCM_DATA7")),
+	MA35_PIN(138, PJ0, 0xc8, 0x0,
+		MA35_MUX(0x0, "GPJ0"),
+		MA35_MUX(0x1, "EPWM1_BRAKE0"),
+		MA35_MUX(0x2, "UART8_nCTS"),
+		MA35_MUX(0x3, "UART7_RXD"),
+		MA35_MUX(0x4, "I2C2_SDA"),
+		MA35_MUX(0x5, "SPI2_SS0"),
+		MA35_MUX(0x6, "eMMC1_DAT4"),
+		MA35_MUX(0x7, "I2S0_LRCK"),
+		MA35_MUX(0x8, "SC0_CLK"),
+		MA35_MUX(0x9, "EBI_AD11"),
+		MA35_MUX(0xa, "EBI_ADR16"),
+		MA35_MUX(0xb, "EBI_nCS0"),
+		MA35_MUX(0xc, "EBI_AD7")),
+	MA35_PIN(139, PJ1, 0xc8, 0x4,
+		MA35_MUX(0x0, "GPJ1"),
+		MA35_MUX(0x1, "EPWM1_BRAKE1"),
+		MA35_MUX(0x2, "UART8_nRTS"),
+		MA35_MUX(0x3, "UART7_TXD"),
+		MA35_MUX(0x4, "I2C2_SCL"),
+		MA35_MUX(0x5, "SPI2_CLK"),
+		MA35_MUX(0x6, "eMMC1_DAT5"),
+		MA35_MUX(0x7, "I2S0_BCLK"),
+		MA35_MUX(0x8, "SC0_DAT"),
+		MA35_MUX(0x9, "EBI_AD12"),
+		MA35_MUX(0xa, "EBI_ADR17"),
+		MA35_MUX(0xb, "EBI_nCS1"),
+		MA35_MUX(0xc, "EBI_AD8")),
+	MA35_PIN(140, PJ2, 0xc8, 0x8,
+		MA35_MUX(0x0, "GPJ2"),
+		MA35_MUX(0x1, "EPWM1_CH4"),
+		MA35_MUX(0x2, "UART8_RXD"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x5, "SPI2_MOSI"),
+		MA35_MUX(0x6, "eMMC1_DAT6"),
+		MA35_MUX(0x7, "I2S0_DI"),
+		MA35_MUX(0x8, "SC0_RST"),
+		MA35_MUX(0x9, "EBI_AD13"),
+		MA35_MUX(0xa, "EBI_ADR18"),
+		MA35_MUX(0xb, "EBI_nWRH"),
+		MA35_MUX(0xc, "EBI_AD9")),
+	MA35_PIN(141, PJ3, 0xc8, 0xc,
+		MA35_MUX(0x0, "GPJ3"),
+		MA35_MUX(0x1, "EPWM1_CH5"),
+		MA35_MUX(0x2, "UART8_TXD"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x5, "SPI2_MISO"),
+		MA35_MUX(0x6, "eMMC1_DAT7"),
+		MA35_MUX(0x7, "I2S0_DO"),
+		MA35_MUX(0x8, "SC0_PWR"),
+		MA35_MUX(0x9, "EBI_AD14"),
+		MA35_MUX(0xa, "EBI_ADR19"),
+		MA35_MUX(0xb, "EBI_nWRL"),
+		MA35_MUX(0xc, "EBI_AD10")),
+	MA35_PIN(142, PJ4, 0xc8, 0x10,
+		MA35_MUX(0x0, "GPJ4"),
+		MA35_MUX(0x4, "I2C3_SDA"),
+		MA35_MUX(0x6, "SD1_WP")),
+	MA35_PIN(143, PJ5, 0xc8, 0x14,
+		MA35_MUX(0x0, "GPJ5"),
+		MA35_MUX(0x4, "I2C3_SCL"),
+		MA35_MUX(0x6, "SD1_nCD")),
+	MA35_PIN(144, PJ6, 0xc8, 0x18,
+		MA35_MUX(0x0, "GPJ6"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x6, "SD1_CMD/eMMC1_CMD")),
+	MA35_PIN(145, PJ7, 0xc8, 0x1c,
+		MA35_MUX(0x0, "GPJ7"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x6, "SD1_CLK/eMMC1_CLK")),
+	MA35_PIN(146, PJ8, 0xcc, 0x0,
+		MA35_MUX(0x0, "GPJ8"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x6, "SD1_DAT0/eMMC1_DAT0")),
+	MA35_PIN(147, PJ9, 0xcc, 0x4,
+		MA35_MUX(0x0, "GPJ9"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x6, "SD1_DAT1/eMMC1_DAT1")),
+	MA35_PIN(148, PJ10, 0xcc, 0x8,
+		MA35_MUX(0x0, "GPJ10"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x6, "SD1_DAT2/eMMC1_DAT2")),
+	MA35_PIN(149, PJ11, 0xcc, 0xc,
+		MA35_MUX(0x0, "GPJ11"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x6, "SD1_DAT3/eMMC1_DAT3")),
+	MA35_PIN(150, PJ12, 0xcc, 0x10,
+		MA35_MUX(0x0, "GPJ12"),
+		MA35_MUX(0x1, "EPWM1_CH2"),
+		MA35_MUX(0x2, "UART2_nCTS"),
+		MA35_MUX(0x3, "UART1_RXD"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x5, "SPI3_SS0"),
+		MA35_MUX(0x7, "SC1_CLK"),
+		MA35_MUX(0x8, "EBI_ADR12"),
+		MA35_MUX(0xb, "TM2"),
+		MA35_MUX(0xc, "QEI0_INDEX")),
+	MA35_PIN(151, PJ13, 0xcc, 0x14,
+		MA35_MUX(0x0, "GPJ13"),
+		MA35_MUX(0x1, "EPWM1_CH3"),
+		MA35_MUX(0x2, "UART2_nRTS"),
+		MA35_MUX(0x3, "UART1_TXD"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x5, "SPI3_MOSI"),
+		MA35_MUX(0x7, "SC1_DAT"),
+		MA35_MUX(0x8, "EBI_ADR13"),
+		MA35_MUX(0xb, "TM2_EXT")),
+	MA35_PIN(152, PJ14, 0xcc, 0x18,
+		MA35_MUX(0x0, "GPJ14"),
+		MA35_MUX(0x1, "EPWM1_CH4"),
+		MA35_MUX(0x2, "UART2_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x5, "SPI3_MISO"),
+		MA35_MUX(0x7, "SC1_RST"),
+		MA35_MUX(0x8, "EBI_ADR14"),
+		MA35_MUX(0xb, "TM3")),
+	MA35_PIN(153, PJ15, 0xcc, 0x1c,
+		MA35_MUX(0x0, "GPJ15"),
+		MA35_MUX(0x1, "EPWM1_CH5"),
+		MA35_MUX(0x2, "UART2_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "SPI3_CLK"),
+		MA35_MUX(0x6, "EADC0_ST"),
+		MA35_MUX(0x7, "SC1_PWR"),
+		MA35_MUX(0x8, "EBI_ADR15"),
+		MA35_MUX(0xb, "TM3_EXT"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(154, PK0, 0xd0, 0x0,
+		MA35_MUX(0x0, "GPK0"),
+		MA35_MUX(0x1, "EPWM0_SYNC_IN"),
+		MA35_MUX(0x2, "UART16_nCTS"),
+		MA35_MUX(0x3, "UART15_RXD"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x6, "I2S1_MCLK"),
+		MA35_MUX(0x8, "EBI_ADR8"),
+		MA35_MUX(0xb, "TM7"),
+		MA35_MUX(0xc, "ECAP0_IC1")),
+	MA35_PIN(155, PK1, 0xd0, 0x4,
+		MA35_MUX(0x0, "GPK1"),
+		MA35_MUX(0x1, "EPWM0_SYNC_OUT"),
+		MA35_MUX(0x2, "UART16_nRTS"),
+		MA35_MUX(0x3, "UART15_TXD"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x6, "EADC0_ST"),
+		MA35_MUX(0x8, "EBI_ADR9"),
+		MA35_MUX(0xb, "TM7_EXT"),
+		MA35_MUX(0xc, "ECAP0_IC2")),
+	MA35_PIN(156, PK2, 0xd0, 0x8,
+		MA35_MUX(0x0, "GPK2"),
+		MA35_MUX(0x1, "EPWM1_CH0"),
+		MA35_MUX(0x2, "UART16_RXD"),
+		MA35_MUX(0x3, "CAN2_RXD"),
+		MA35_MUX(0x5, "SPI3_I2SMCLK"),
+		MA35_MUX(0x7, "SC0_PWR"),
+		MA35_MUX(0x8, "EBI_ADR10"),
+		MA35_MUX(0xc, "QEI0_A")),
+	MA35_PIN(157, PK3, 0xd0, 0xc,
+		MA35_MUX(0x0, "GPK3"),
+		MA35_MUX(0x1, "EPWM1_CH1"),
+		MA35_MUX(0x2, "UART16_TXD"),
+		MA35_MUX(0x3, "CAN2_TXD"),
+		MA35_MUX(0x5, "SPI3_SS1"),
+		MA35_MUX(0x7, "SC1_nCD"),
+		MA35_MUX(0x8, "EBI_ADR11"),
+		MA35_MUX(0xc, "QEI0_B")),
+	MA35_PIN(158, PK4, 0xd0, 0x10,
+		MA35_MUX(0x0, "GPK4"),
+		MA35_MUX(0x2, "UART12_nCTS"),
+		MA35_MUX(0x3, "UART13_RXD"),
+		MA35_MUX(0x5, "SPI2_MISO"),
+		MA35_MUX(0x6, "LCM_DEN"),
+		MA35_MUX(0xc, "EBI_AD10"),
+		MA35_MUX(0xd, "EBI_nWRL")),
+	MA35_PIN(159, PK5, 0xd0, 0x14,
+		MA35_MUX(0x0, "GPK5"),
+		MA35_MUX(0x1, "EPWM1_CH1"),
+		MA35_MUX(0x2, "UART12_nRTS"),
+		MA35_MUX(0x3, "UART13_TXD"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x5, "SPI2_CLK"),
+		MA35_MUX(0x7, "I2S1_DI"),
+		MA35_MUX(0x8, "SC0_DAT"),
+		MA35_MUX(0x9, "EADC0_ST"),
+		MA35_MUX(0xb, "TM8_EXT"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(160, PK6, 0xd0, 0x18,
+		MA35_MUX(0x0, "GPK6"),
+		MA35_MUX(0x1, "EPWM1_CH2"),
+		MA35_MUX(0x2, "UART12_RXD"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x5, "SPI2_MOSI"),
+		MA35_MUX(0x7, "I2S1_BCLK"),
+		MA35_MUX(0x8, "SC0_RST"),
+		MA35_MUX(0xb, "TM6"),
+		MA35_MUX(0xd, "INT2")),
+	MA35_PIN(161, PK7, 0xd0, 0x1c,
+		MA35_MUX(0x0, "GPK7"),
+		MA35_MUX(0x1, "EPWM1_CH3"),
+		MA35_MUX(0x2, "UART12_TXD"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x5, "SPI2_MISO"),
+		MA35_MUX(0x7, "I2S1_LRCK"),
+		MA35_MUX(0x8, "SC0_PWR"),
+		MA35_MUX(0x9, "CLKO"),
+		MA35_MUX(0xb, "TM6_EXT"),
+		MA35_MUX(0xd, "INT3")),
+	MA35_PIN(162, PK8, 0xd4, 0x0,
+		MA35_MUX(0x0, "GPK8"),
+		MA35_MUX(0x1, "EPWM1_CH0"),
+		MA35_MUX(0x4, "I2C3_SDA"),
+		MA35_MUX(0x5, "SPI3_CLK"),
+		MA35_MUX(0x7, "EADC0_ST"),
+		MA35_MUX(0x8, "EBI_AD15"),
+		MA35_MUX(0x9, "EBI_MCLK"),
+		MA35_MUX(0xa, "EBI_ADR15"),
+		MA35_MUX(0xb, "TM8"),
+		MA35_MUX(0xc, "QEI1_INDEX")),
+	MA35_PIN(163, PK9, 0xd4, 0x4,
+		MA35_MUX(0x0, "GPK9"),
+		MA35_MUX(0x4, "I2C3_SCL"),
+		MA35_MUX(0x6, "CCAP0_SCLK"),
+		MA35_MUX(0x8, "EBI_AD0"),
+		MA35_MUX(0xa, "EBI_ADR0")),
+	MA35_PIN(164, PK10, 0xd4, 0x8,
+		MA35_MUX(0x0, "GPK10"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x6, "CCAP0_PIXCLK"),
+		MA35_MUX(0x8, "EBI_AD1"),
+		MA35_MUX(0xa, "EBI_ADR1")),
+	MA35_PIN(165, PK11, 0xd4, 0xc,
+		MA35_MUX(0x0, "GPK11"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x6, "CCAP0_HSYNC"),
+		MA35_MUX(0x8, "EBI_AD2"),
+		MA35_MUX(0xa, "EBI_ADR2")),
+	MA35_PIN(166, PK12, 0xd4, 0x10,
+		MA35_MUX(0x0, "GPK12"),
+		MA35_MUX(0x1, "EPWM2_CH0"),
+		MA35_MUX(0x2, "UART1_nCTS"),
+		MA35_MUX(0x3, "UART13_RXD"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x5, "I2S0_LRCK"),
+		MA35_MUX(0x6, "SPI1_SS0"),
+		MA35_MUX(0x8, "SC0_CLK"),
+		MA35_MUX(0xb, "TM10"),
+		MA35_MUX(0xd, "INT2")),
+	MA35_PIN(167, PK13, 0xd4, 0x14,
+		MA35_MUX(0x0, "GPK13"),
+		MA35_MUX(0x1, "EPWM2_CH1"),
+		MA35_MUX(0x2, "UART1_nRTS"),
+		MA35_MUX(0x3, "UART13_TXD"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x5, "I2S0_BCLK"),
+		MA35_MUX(0x6, "SPI1_CLK"),
+		MA35_MUX(0x8, "SC0_DAT"),
+		MA35_MUX(0xb, "TM10_EXT")),
+	MA35_PIN(168, PK14, 0xd4, 0x18,
+		MA35_MUX(0x0, "GPK14"),
+		MA35_MUX(0x1, "EPWM2_CH2"),
+		MA35_MUX(0x2, "UART1_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x5, "I2S0_DI"),
+		MA35_MUX(0x6, "SPI1_MOSI"),
+		MA35_MUX(0x8, "SC0_RST"),
+		MA35_MUX(0xa, "I2C5_SDA"),
+		MA35_MUX(0xb, "TM11"),
+		MA35_MUX(0xd, "INT3")),
+	MA35_PIN(169, PK15, 0xd4, 0x1c,
+		MA35_MUX(0x0, "GPK15"),
+		MA35_MUX(0x1, "EPWM2_CH3"),
+		MA35_MUX(0x2, "UART1_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "I2S0_DO"),
+		MA35_MUX(0x6, "SPI1_MISO"),
+		MA35_MUX(0x8, "SC0_PWR"),
+		MA35_MUX(0xa, "I2C5_SCL"),
+		MA35_MUX(0xb, "TM11_EXT")),
+	MA35_PIN(170, PL0, 0xd8, 0x0,
+		MA35_MUX(0x0, "GPL0"),
+		MA35_MUX(0x1, "EPWM1_CH0"),
+		MA35_MUX(0x2, "UART11_nCTS"),
+		MA35_MUX(0x3, "UART10_RXD"),
+		MA35_MUX(0x4, "I2C3_SDA"),
+		MA35_MUX(0x5, "SPI2_MOSI"),
+		MA35_MUX(0x6, "QSPI1_MOSI1"),
+		MA35_MUX(0x7, "I2S0_LRCK"),
+		MA35_MUX(0x8, "EBI_AD11"),
+		MA35_MUX(0x9, "SC1_CLK"),
+		MA35_MUX(0xb, "TM5"),
+		MA35_MUX(0xc, "QEI1_A")),
+	MA35_PIN(171, PL1, 0xd8, 0x4,
+		MA35_MUX(0x0, "GPL1"),
+		MA35_MUX(0x1, "EPWM1_CH1"),
+		MA35_MUX(0x2, "UART11_nRTS"),
+		MA35_MUX(0x3, "UART10_TXD"),
+		MA35_MUX(0x4, "I2C3_SCL"),
+		MA35_MUX(0x5, "SPI2_MISO"),
+		MA35_MUX(0x6, "QSPI1_MISO1"),
+		MA35_MUX(0x7, "I2S0_BCLK"),
+		MA35_MUX(0x8, "EBI_AD12"),
+		MA35_MUX(0x9, "SC1_DAT"),
+		MA35_MUX(0xb, "TM5_EXT"),
+		MA35_MUX(0xc, "QEI1_B")),
+	MA35_PIN(172, PL2, 0xd8, 0x8,
+		MA35_MUX(0x0, "GPL2"),
+		MA35_MUX(0x1, "EPWM1_CH2"),
+		MA35_MUX(0x2, "UART11_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x5, "SPI2_SS0"),
+		MA35_MUX(0x6, "QSPI1_SS1"),
+		MA35_MUX(0x7, "I2S0_DI"),
+		MA35_MUX(0x8, "EBI_AD13"),
+		MA35_MUX(0x9, "SC1_RST"),
+		MA35_MUX(0xb, "TM7"),
+		MA35_MUX(0xc, "QEI1_INDEX")),
+	MA35_PIN(173, PL3, 0xd8, 0xc,
+		MA35_MUX(0x0, "GPL3"),
+		MA35_MUX(0x1, "EPWM1_CH3"),
+		MA35_MUX(0x2, "UART11_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "SPI2_CLK"),
+		MA35_MUX(0x6, "QSPI1_CLK"),
+		MA35_MUX(0x7, "I2S0_DO"),
+		MA35_MUX(0x8, "EBI_AD14"),
+		MA35_MUX(0x9, "SC1_PWR"),
+		MA35_MUX(0xb, "TM7_EXT"),
+		MA35_MUX(0xc, "ECAP0_IC0")),
+	MA35_PIN(174, PL4, 0xd8, 0x10,
+		MA35_MUX(0x0, "GPL4"),
+		MA35_MUX(0x1, "EPWM1_CH4"),
+		MA35_MUX(0x2, "UART2_nCTS"),
+		MA35_MUX(0x3, "UART1_RXD"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x5, "SPI3_MOSI"),
+		MA35_MUX(0x6, "QSPI1_MOSI0"),
+		MA35_MUX(0x7, "I2S0_MCLK"),
+		MA35_MUX(0x8, "EBI_nRD"),
+		MA35_MUX(0x9, "SC1_nCD"),
+		MA35_MUX(0xb, "TM9"),
+		MA35_MUX(0xc, "ECAP0_IC1")),
+	MA35_PIN(175, PL5, 0xd8, 0x14,
+		MA35_MUX(0x0, "GPL5"),
+		MA35_MUX(0x1, "EPWM1_CH5"),
+		MA35_MUX(0x2, "UART2_nRTS"),
+		MA35_MUX(0x3, "UART1_TXD"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x5, "SPI3_MISO"),
+		MA35_MUX(0x6, "QSPI1_MISO0"),
+		MA35_MUX(0x7, "I2S1_MCLK"),
+		MA35_MUX(0x8, "EBI_nWR"),
+		MA35_MUX(0x9, "SC0_nCD"),
+		MA35_MUX(0xb, "TM9_EXT"),
+		MA35_MUX(0xc, "ECAP0_IC2")),
+	MA35_PIN(176, PL6, 0xd8, 0x18,
+		MA35_MUX(0x0, "GPL6"),
+		MA35_MUX(0x1, "EPWM0_CH0"),
+		MA35_MUX(0x2, "UART2_RXD"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x6, "QSPI1_MOSI1"),
+		MA35_MUX(0x7, "TRACE_CLK"),
+		MA35_MUX(0x8, "EBI_AD5"),
+		MA35_MUX(0xb, "TM3"),
+		MA35_MUX(0xc, "ECAP1_IC0"),
+		MA35_MUX(0xd, "INT0")),
+	MA35_PIN(177, PL7, 0xd8, 0x1c,
+		MA35_MUX(0x0, "GPL7"),
+		MA35_MUX(0x1, "EPWM0_CH1"),
+		MA35_MUX(0x2, "UART2_TXD"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x6, "QSPI1_MISO1"),
+		MA35_MUX(0x8, "EBI_AD6"),
+		MA35_MUX(0xb, "TM3_EXT"),
+		MA35_MUX(0xc, "ECAP1_IC1"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(178, PL8, 0xdc, 0x0,
+		MA35_MUX(0x0, "GPL8"),
+		MA35_MUX(0x1, "EPWM0_CH2"),
+		MA35_MUX(0x2, "UART14_nCTS"),
+		MA35_MUX(0x3, "UART13_RXD"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x5, "SPI3_SS0"),
+		MA35_MUX(0x6, "EPWM0_CH4"),
+		MA35_MUX(0x7, "I2S1_LRCK"),
+		MA35_MUX(0x8, "EBI_AD7"),
+		MA35_MUX(0x9, "SC0_CLK"),
+		MA35_MUX(0xb, "TM4"),
+		MA35_MUX(0xc, "ECAP1_IC2"),
+		MA35_MUX(0xd, "INT2")),
+	MA35_PIN(179, PL9, 0xdc, 0x4,
+		MA35_MUX(0x0, "GPL9"),
+		MA35_MUX(0x1, "EPWM0_CH3"),
+		MA35_MUX(0x2, "UART14_nRTS"),
+		MA35_MUX(0x3, "UART13_TXD"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x5, "SPI3_CLK"),
+		MA35_MUX(0x6, "EPWM1_CH4"),
+		MA35_MUX(0x7, "I2S1_BCLK"),
+		MA35_MUX(0x8, "EBI_AD8"),
+		MA35_MUX(0x9, "SC0_DAT"),
+		MA35_MUX(0xb, "TM4_EXT"),
+		MA35_MUX(0xc, "QEI0_A"),
+		MA35_MUX(0xd, "INT3")),
+	MA35_PIN(180, PL10, 0xdc, 0x8,
+		MA35_MUX(0x0, "GPL10"),
+		MA35_MUX(0x1, "EPWM0_CH4"),
+		MA35_MUX(0x2, "UART14_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x5, "SPI3_MOSI"),
+		MA35_MUX(0x6, "EPWM0_CH5"),
+		MA35_MUX(0x7, "I2S1_DI"),
+		MA35_MUX(0x8, "EBI_AD9"),
+		MA35_MUX(0x9, "SC0_RST"),
+		MA35_MUX(0xb, "EBI_nWRH"),
+		MA35_MUX(0xc, "QEI0_B")),
+	MA35_PIN(181, PL11, 0xdc, 0xc,
+		MA35_MUX(0x0, "GPL11"),
+		MA35_MUX(0x1, "EPWM0_CH5"),
+		MA35_MUX(0x2, "UART14_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "SPI3_MISO"),
+		MA35_MUX(0x6, "EPWM1_CH5"),
+		MA35_MUX(0x7, "I2S1_DO"),
+		MA35_MUX(0x8, "EBI_AD10"),
+		MA35_MUX(0x9, "SC0_PWR"),
+		MA35_MUX(0xb, "EBI_nWRL"),
+		MA35_MUX(0xc, "QEI0_INDEX")),
+	MA35_PIN(182, PL12, 0xdc, 0x10,
+		MA35_MUX(0x0, "GPL12"),
+		MA35_MUX(0x1, "EPWM0_SYNC_IN"),
+		MA35_MUX(0x2, "UART7_nCTS"),
+		MA35_MUX(0x3, "ECAP1_IC0"),
+		MA35_MUX(0x4, "UART14_RXD"),
+		MA35_MUX(0x5, "SPI0_SS0"),
+		MA35_MUX(0x6, "I2S1_LRCK"),
+		MA35_MUX(0x7, "SC1_CLK"),
+		MA35_MUX(0x8, "EBI_AD0"),
+		MA35_MUX(0x9, "HSUSBH_PWREN"),
+		MA35_MUX(0xa, "I2C2_SDA"),
+		MA35_MUX(0xb, "TM0"),
+		MA35_MUX(0xc, "EPWM0_CH2"),
+		MA35_MUX(0xd, "EBI_AD11"),
+		MA35_MUX(0xe, "RGMII0_PPS"),
+		MA35_MUX(0xf, "RMII0_PPS")),
+	MA35_PIN(183, PL13, 0xdc, 0x14,
+		MA35_MUX(0x0, "GPL13"),
+		MA35_MUX(0x1, "EPWM0_SYNC_OUT"),
+		MA35_MUX(0x2, "UART7_nRTS"),
+		MA35_MUX(0x3, "ECAP1_IC1"),
+		MA35_MUX(0x4, "UART14_TXD"),
+		MA35_MUX(0x5, "SPI0_CLK"),
+		MA35_MUX(0x6, "I2S1_BCLK"),
+		MA35_MUX(0x7, "SC1_DAT"),
+		MA35_MUX(0x8, "EBI_AD1"),
+		MA35_MUX(0x9, "HSUSBH_OVC"),
+		MA35_MUX(0xa, "I2C2_SCL"),
+		MA35_MUX(0xb, "TM0_EXT"),
+		MA35_MUX(0xc, "EPWM0_CH3"),
+		MA35_MUX(0xd, "EBI_AD12"),
+		MA35_MUX(0xe, "RGMII1_PPS"),
+		MA35_MUX(0xf, "RMII1_PPS")),
+	MA35_PIN(184, PL14, 0xdc, 0x18,
+		MA35_MUX(0x0, "GPL14"),
+		MA35_MUX(0x1, "EPWM0_CH2"),
+		MA35_MUX(0x2, "UART7_RXD"),
+		MA35_MUX(0x4, "CAN1_RXD"),
+		MA35_MUX(0x5, "SPI0_MOSI"),
+		MA35_MUX(0x6, "I2S1_DI"),
+		MA35_MUX(0x7, "SC1_RST"),
+		MA35_MUX(0x8, "EBI_AD2"),
+		MA35_MUX(0xb, "TM2"),
+		MA35_MUX(0xc, "INT0"),
+		MA35_MUX(0xd, "EBI_AD13")),
+	MA35_PIN(185, PL15, 0xdc, 0x1c,
+		MA35_MUX(0x0, "GPL15"),
+		MA35_MUX(0x1, "EPWM0_CH1"),
+		MA35_MUX(0x2, "UART7_TXD"),
+		MA35_MUX(0x3, "TRACE_CLK"),
+		MA35_MUX(0x4, "CAN1_TXD"),
+		MA35_MUX(0x5, "SPI0_MISO"),
+		MA35_MUX(0x6, "I2S1_DO"),
+		MA35_MUX(0x7, "SC1_PWR"),
+		MA35_MUX(0x8, "EBI_AD3"),
+		MA35_MUX(0xb, "TM2_EXT"),
+		MA35_MUX(0xc, "INT2"),
+		MA35_MUX(0xd, "EBI_AD14")),
+	MA35_PIN(186, PM0, 0xe0, 0x0,
+		MA35_MUX(0x0, "GPM0"),
+		MA35_MUX(0x4, "I2C4_SDA"),
+		MA35_MUX(0x6, "CCAP0_VSYNC"),
+		MA35_MUX(0x8, "EBI_AD3"),
+		MA35_MUX(0xa, "EBI_ADR3")),
+	MA35_PIN(187, PM1, 0xe0, 0x4,
+		MA35_MUX(0x0, "GPM1"),
+		MA35_MUX(0x4, "I2C4_SCL"),
+		MA35_MUX(0x5, "SPI3_I2SMCLK"),
+		MA35_MUX(0x6, "CCAP0_SFIELD"),
+		MA35_MUX(0x8, "EBI_AD4"),
+		MA35_MUX(0xa, "EBI_ADR4")),
+	MA35_PIN(188, PM2, 0xe0, 0x8,
+		MA35_MUX(0x0, "GPM2"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x6, "CCAP0_DATA0"),
+		MA35_MUX(0x8, "EBI_AD5"),
+		MA35_MUX(0xa, "EBI_ADR5")),
+	MA35_PIN(189, PM3, 0xe0, 0xc,
+		MA35_MUX(0x0, "GPM3"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x6, "CCAP0_DATA1"),
+		MA35_MUX(0x8, "EBI_AD6"),
+		MA35_MUX(0xa, "EBI_ADR6")),
+	MA35_PIN(190, PM4, 0xe0, 0x10,
+		MA35_MUX(0x0, "GPM4"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x6, "CCAP0_DATA2"),
+		MA35_MUX(0x8, "EBI_AD7"),
+		MA35_MUX(0xa, "EBI_ADR7")),
+	MA35_PIN(191, PM5, 0xe0, 0x14,
+		MA35_MUX(0x0, "GPM5"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x6, "CCAP0_DATA3"),
+		MA35_MUX(0x8, "EBI_AD8"),
+		MA35_MUX(0xa, "EBI_ADR8")),
+	MA35_PIN(192, PM6, 0xe0, 0x18,
+		MA35_MUX(0x0, "GPM6"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x6, "CCAP0_DATA4"),
+		MA35_MUX(0x8, "EBI_AD9"),
+		MA35_MUX(0xa, "EBI_ADR9")),
+	MA35_PIN(193, PM7, 0xe0, 0x1c,
+		MA35_MUX(0x0, "GPM7"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x6, "CCAP0_DATA5"),
+		MA35_MUX(0x8, "EBI_AD10"),
+		MA35_MUX(0xa, "EBI_ADR10")),
+	MA35_PIN(194, PM8, 0xe4, 0x0,
+		MA35_MUX(0x0, "GPM8"),
+		MA35_MUX(0x4, "I2C0_SDA"),
+		MA35_MUX(0x6, "CCAP0_DATA6"),
+		MA35_MUX(0x8, "EBI_AD11"),
+		MA35_MUX(0xa, "EBI_ADR11")),
+	MA35_PIN(195, PM9, 0xe4, 0x4,
+		MA35_MUX(0x0, "GPM9"),
+		MA35_MUX(0x4, "I2C0_SCL"),
+		MA35_MUX(0x6, "CCAP0_DATA7"),
+		MA35_MUX(0x8, "EBI_AD12"),
+		MA35_MUX(0xa, "EBI_ADR12")),
+	MA35_PIN(196, PM10, 0xe4, 0x8,
+		MA35_MUX(0x0, "GPM10"),
+		MA35_MUX(0x1, "EPWM1_CH2"),
+		MA35_MUX(0x3, "CAN2_RXD"),
+		MA35_MUX(0x5, "SPI3_SS0"),
+		MA35_MUX(0x6, "CCAP0_DATA8"),
+		MA35_MUX(0x7, "SPI2_I2SMCLK"),
+		MA35_MUX(0x8, "EBI_AD13"),
+		MA35_MUX(0xa, "EBI_ADR13")),
+	MA35_PIN(197, PM11, 0xe4, 0xc,
+		MA35_MUX(0x0, "GPM11"),
+		MA35_MUX(0x1, "EPWM1_CH3"),
+		MA35_MUX(0x3, "CAN2_TXD"),
+		MA35_MUX(0x5, "SPI3_SS1"),
+		MA35_MUX(0x6, "CCAP0_DATA9"),
+		MA35_MUX(0x7, "SPI2_SS1"),
+		MA35_MUX(0x8, "EBI_AD14"),
+		MA35_MUX(0xa, "EBI_ADR14")),
+	MA35_PIN(198, PM12, 0xe4, 0x10,
+		MA35_MUX(0x0, "GPM12"),
+		MA35_MUX(0x1, "EPWM1_CH4"),
+		MA35_MUX(0x2, "UART10_nCTS"),
+		MA35_MUX(0x3, "TRACE_DATA0"),
+		MA35_MUX(0x4, "UART11_RXD"),
+		MA35_MUX(0x5, "I2C2_SDA"),
+		MA35_MUX(0x7, "SC1_nCD"),
+		MA35_MUX(0x8, "EBI_AD8"),
+		MA35_MUX(0x9, "I2S1_MCLK"),
+		MA35_MUX(0xb, "TM8")),
+	MA35_PIN(199, PM13, 0xe4, 0x14,
+		MA35_MUX(0x0, "GPM13"),
+		MA35_MUX(0x1, "EPWM1_CH5"),
+		MA35_MUX(0x2, "UART10_nRTS"),
+		MA35_MUX(0x3, "TRACE_DATA1"),
+		MA35_MUX(0x4, "UART11_TXD"),
+		MA35_MUX(0x5, "I2C2_SCL"),
+		MA35_MUX(0x8, "EBI_AD9"),
+		MA35_MUX(0x9, "ECAP1_IC0"),
+		MA35_MUX(0xb, "TM8_EXT")),
+	MA35_PIN(200, PM14, 0xe4, 0x18,
+		MA35_MUX(0x0, "GPM14"),
+		MA35_MUX(0x1, "EPWM1_BRAKE0"),
+		MA35_MUX(0x2, "UART10_RXD"),
+		MA35_MUX(0x3, "TRACE_DATA2"),
+		MA35_MUX(0x4, "CAN2_RXD"),
+		MA35_MUX(0x6, "I2C3_SDA"),
+		MA35_MUX(0x8, "EBI_AD10"),
+		MA35_MUX(0x9, "ECAP1_IC1"),
+		MA35_MUX(0xb, "TM10"),
+		MA35_MUX(0xd, "INT1")),
+	MA35_PIN(201, PM15, 0xe4, 0x1c,
+		MA35_MUX(0x0, "GPM15"),
+		MA35_MUX(0x1, "EPWM1_BRAKE1"),
+		MA35_MUX(0x2, "UART10_TXD"),
+		MA35_MUX(0x3, "TRACE_DATA3"),
+		MA35_MUX(0x4, "CAN2_TXD"),
+		MA35_MUX(0x6, "I2C3_SCL"),
+		MA35_MUX(0x8, "EBI_AD11"),
+		MA35_MUX(0x9, "ECAP1_IC2"),
+		MA35_MUX(0xb, "TM10_EXT"),
+		MA35_MUX(0xd, "INT2")),
+	MA35_PIN(202, PN0, 0xe8, 0x0,
+		MA35_MUX(0x0, "GPN0"),
+		MA35_MUX(0x4, "I2C2_SDA"),
+		MA35_MUX(0x6, "CCAP1_DATA0")),
+	MA35_PIN(203, PN1, 0xe8, 0x4,
+		MA35_MUX(0x0, "GPN1"),
+		MA35_MUX(0x4, "I2C2_SCL"),
+		MA35_MUX(0x6, "CCAP1_DATA1")),
+	MA35_PIN(204, PN2, 0xe8, 0x8,
+		MA35_MUX(0x0, "GPN2"),
+		MA35_MUX(0x3, "CAN0_RXD"),
+		MA35_MUX(0x6, "CCAP1_DATA2")),
+	MA35_PIN(205, PN3, 0xe8, 0xc,
+		MA35_MUX(0x0, "GPN3"),
+		MA35_MUX(0x3, "CAN0_TXD"),
+		MA35_MUX(0x6, "CCAP1_DATA3")),
+	MA35_PIN(206, PN4, 0xe8, 0x10,
+		MA35_MUX(0x0, "GPN4"),
+		MA35_MUX(0x4, "I2C1_SDA"),
+		MA35_MUX(0x6, "CCAP1_DATA4")),
+	MA35_PIN(207, PN5, 0xe8, 0x14,
+		MA35_MUX(0x0, "GPN5"),
+		MA35_MUX(0x4, "I2C1_SCL"),
+		MA35_MUX(0x6, "CCAP1_DATA5")),
+	MA35_PIN(208, PN6, 0xe8, 0x18,
+		MA35_MUX(0x0, "GPN6"),
+		MA35_MUX(0x3, "CAN1_RXD"),
+		MA35_MUX(0x6, "CCAP1_DATA6")),
+	MA35_PIN(209, PN7, 0xe8, 0x1c,
+		MA35_MUX(0x0, "GPN7"),
+		MA35_MUX(0x3, "CAN1_TXD"),
+		MA35_MUX(0x6, "CCAP1_DATA7")),
+	MA35_PIN(210, PN10, 0xec, 0x8,
+		MA35_MUX(0x0, "GPN10"),
+		MA35_MUX(0x3, "CAN2_RXD"),
+		MA35_MUX(0x6, "CCAP1_SCLK")),
+	MA35_PIN(211, PN11, 0xec, 0xc,
+		MA35_MUX(0x0, "GPN11"),
+		MA35_MUX(0x3, "CAN2_TXD"),
+		MA35_MUX(0x6, "CCAP1_PIXCLK")),
+	MA35_PIN(212, PN12, 0xec, 0x10,
+		MA35_MUX(0x0, "GPN12"),
+		MA35_MUX(0x2, "UART6_nCTS"),
+		MA35_MUX(0x3, "UART12_RXD"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x6, "CCAP1_HSYNC")),
+	MA35_PIN(213, PN13, 0xec, 0x14,
+		MA35_MUX(0x0, "GPN13"),
+		MA35_MUX(0x2, "UART6_nRTS"),
+		MA35_MUX(0x3, "UART12_TXD"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x6, "CCAP1_VSYNC")),
+	MA35_PIN(214, PN14, 0xec, 0x18,
+		MA35_MUX(0x0, "GPN14"),
+		MA35_MUX(0x2, "UART6_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x5, "SPI1_SS1"),
+		MA35_MUX(0x6, "CCAP1_SFIELD"),
+		MA35_MUX(0x7, "SPI1_I2SMCLK")),
+	MA35_PIN(215, PN15, 0xec, 0x1c,
+		MA35_MUX(0x0, "GPN15"),
+		MA35_MUX(0x1, "EPWM2_CH4"),
+		MA35_MUX(0x2, "UART6_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x5, "I2S0_MCLK"),
+		MA35_MUX(0x6, "SPI1_SS1"),
+		MA35_MUX(0x7, "SPI1_I2SMCLK"),
+		MA35_MUX(0x8, "SC0_nCD"),
+		MA35_MUX(0x9, "EADC0_ST"),
+		MA35_MUX(0xa, "CLKO"),
+		MA35_MUX(0xb, "TM6")),
+	MA35_PIN(216, PN8, 0xec, 0x0,
+		MA35_MUX(0x0, "GPN8"),
+		MA35_MUX(0x1, "EPWM2_CH4"),
+		MA35_MUX(0x4, "I2C0_SDA"),
+		MA35_MUX(0x5, "SPI2_I2SMCLK"),
+		MA35_MUX(0x6, "CCAP1_DATA8")),
+	MA35_PIN(217, PN9, 0xec, 0x4,
+		MA35_MUX(0x0, "GPN9"),
+		MA35_MUX(0x1, "EPWM2_CH5"),
+		MA35_MUX(0x4, "I2C0_SCL"),
+		MA35_MUX(0x5, "SPI1_I2SMCLK"),
+		MA35_MUX(0x6, "CCAP1_DATA9")),
+	MA35_PIN(218, PN10, 0xec, 0x8,
+		MA35_MUX(0x0, "GPN10"),
+		MA35_MUX(0x3, "CAN2_RXD"),
+		MA35_MUX(0x4, "USBHL2_DM"),
+		MA35_MUX(0x6, "CCAP1_SCLK")),
+	MA35_PIN(219, PN11, 0xec, 0xc,
+		MA35_MUX(0x0, "GPN11"),
+		MA35_MUX(0x3, "CAN2_TXD"),
+		MA35_MUX(0x4, "USBHL2_DP"),
+		MA35_MUX(0x6, "CCAP1_PIXCLK")),
+	MA35_PIN(220, PN12, 0xec, 0x10,
+		MA35_MUX(0x0, "GPN12"),
+		MA35_MUX(0x2, "UART6_nCTS"),
+		MA35_MUX(0x3, "UART12_RXD"),
+		MA35_MUX(0x4, "I2C5_SDA"),
+		MA35_MUX(0x6, "CCAP1_HSYNC")),
+	MA35_PIN(221, PN13, 0xec, 0x14,
+		MA35_MUX(0x0, "GPN13"),
+		MA35_MUX(0x2, "UART6_nRTS"),
+		MA35_MUX(0x3, "UART12_TXD"),
+		MA35_MUX(0x4, "I2C5_SCL"),
+		MA35_MUX(0x6, "CCAP1_VSYNC")),
+	MA35_PIN(222, PN14, 0xec, 0x18,
+		MA35_MUX(0x0, "GPN14"),
+		MA35_MUX(0x2, "UART6_RXD"),
+		MA35_MUX(0x3, "CAN3_RXD"),
+		MA35_MUX(0x4, "USBHL3_DM"),
+		MA35_MUX(0x5, "SPI1_SS1"),
+		MA35_MUX(0x6, "CCAP1_SFIELD"),
+		MA35_MUX(0x7, "SPI1_I2SMCLK")),
+	MA35_PIN(223, PN15, 0xec, 0x1c,
+		MA35_MUX(0x0, "GPN15"),
+		MA35_MUX(0x1, "EPWM2_CH4"),
+		MA35_MUX(0x2, "UART6_TXD"),
+		MA35_MUX(0x3, "CAN3_TXD"),
+		MA35_MUX(0x4, "USBHL3_DP"),
+		MA35_MUX(0x5, "I2S0_MCLK"),
+		MA35_MUX(0x6, "SPI1_SS1"),
+		MA35_MUX(0x7, "SPI1_I2SMCLK"),
+		MA35_MUX(0x8, "SC0_nCD"),
+		MA35_MUX(0x9, "EADC0_ST"),
+		MA35_MUX(0xa, "CLKO"),
+		MA35_MUX(0xb, "TM6")),
+};
+
+static int ma35d1_get_pin_num(int offset, int shift)
+{
+	return (offset - 0x80) * 2 + shift / 4;
+}
+
+static struct ma35_pinctrl_soc_info ma35d1_pinctrl_info = {
+	.pins = ma35d1_pins,
+	.npins = ARRAY_SIZE(ma35d1_pins),
+	.get_pin_num = ma35d1_get_pin_num,
+};
+
+static DEFINE_NOIRQ_DEV_PM_OPS(ma35_pinctrl_pm_ops, ma35_pinctrl_suspend, ma35_pinctrl_resume);
+
+static int ma35d1_pinctrl_probe(struct platform_device *pdev)
+{
+	return ma35_pinctrl_probe(pdev, &ma35d1_pinctrl_info);
+}
+
+static const struct of_device_id ma35d1_pinctrl_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-pinctrl" },
+	{ },
+};
+
+static struct platform_driver ma35d1_pinctrl_driver = {
+	.probe = ma35d1_pinctrl_probe,
+	.driver = {
+		.name = "ma35d1-pinctrl",
+		.pm = pm_sleep_ptr(&ma35_pinctrl_pm_ops),
+		.of_match_table = ma35d1_pinctrl_of_match,
+	},
+};
+
+static int __init ma35d1_pinctrl_init(void)
+{
+	return platform_driver_register(&ma35d1_pinctrl_driver);
+}
+arch_initcall(ma35d1_pinctrl_init);
+
+MODULE_AUTHOR("schung@nuvoton.com");
+MODULE_DESCRIPTION("Nuvoton MA35D1 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


