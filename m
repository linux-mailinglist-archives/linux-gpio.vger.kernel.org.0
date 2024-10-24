Return-Path: <linux-gpio+bounces-11903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A89ADC77
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2DE3282497
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C511F18A6DF;
	Thu, 24 Oct 2024 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWln3hCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D02C189F3E;
	Thu, 24 Oct 2024 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752269; cv=none; b=TODvNZ3j10ofETOfNEloNJB8F2g2+yGglC0A5DXv+cJ0pa0JACkDliwKksKnrQPEptpvzztWTBHnBnxT4ybcZnRixZQsEB7GhJk4E/HS23gcC0xkGoJLFM7GbIkbsTQV9F9Kbn04fe3l6J+AhYfj1TQKPgbVstQCnBZCkWU3s3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752269; c=relaxed/simple;
	bh=wim7ogXva+rDZn0lmBDYOnvc8GFQp1d2VD7fC4hkoPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5zVDv8G2AiX5/Axo636yZdWcP4SIpfoOQ1Nfd19vRl5G+iT+3gIIUEq6NZcGpgtcWewbJZB9sXd5T+DHePNYzT6vcF6wdOHqf0yAoX9aBw0hRdwowxYjZ4999fReOZfBu1Xnf+H6vpl8De/awlqS2g6o6MjHszwfdxby2NDvAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWln3hCq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cdda5cfb6so4512505ad.3;
        Wed, 23 Oct 2024 23:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752263; x=1730357063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUB9mK6MY5kfw70NkMwlU4DCLl7frXIjR+XwjdeDJR0=;
        b=DWln3hCqR0D/Rnz3K1WyAijsiW/qX6aQSeW14IZbobr2sc8Wsnv7zJ3J8lHMwYScPK
         +86oXiZsu3ZAuNekl3l81ZdMxbzyy8JwHTDLcVPFbpXs91i7Stqofrk/4m0xMCfd54wn
         K4SuPsghlaJqJvMP9Er2IkBYH3keiCLYzus69j7J89bd1uuQ8ztxTZFCLs5RWANsgs5B
         bWcq8OIbNC7NGzk+uS+d2EzNJO3fcAa99u2Ayqlq40u+wXoQaOqulebsmcEmdXLuWrrg
         4MpZ7GuFjlprr3NexDLPCgVsRyZqKRFXP6AsVs9XXbOjFJYhmi2atlr9nF8Rb47InAk8
         W0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752263; x=1730357063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUB9mK6MY5kfw70NkMwlU4DCLl7frXIjR+XwjdeDJR0=;
        b=AzaG6E6xkXIZDn/Tj7tmoWUURe/EZNjkJ6A+znuHykkkpHbfW6jMZ/VkmvP7HJNCQS
         OpbcQzYSE0K/6cGZObETlKvnoG9+YRQ8qUruzgJyxlfplO0cbbLUlwzimtllz+S9qKeq
         NjjJP0AZPnkcyFtVxWMTtS/z40PeQevPI8ZK07ygHCSGeBqwEjt1TfeZ+rfDbjeO0rm1
         JhnkfOynIh+4F0Ile+xqp7rJT08l7V3WNC3cVoZ8eohKhfFVhLp4NaTjbb+F+GuIVyMK
         D4O1O7q+EXAOGunaXg0U/QH6hc1wtM891npLtI3q4ZH2Ihx18O7kNg/XGx5Rx5+lm+H9
         cR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeCs9+ZU6/N0cBawtKul48rP3/3526nbRyk9h/hKA/c7ZQ5IV0E4al/YBJUW9l7GFH5m2pR5Zcx02q@vger.kernel.org, AJvYcCUozVXcYI0kgpKvEWndN4tmpp90PJOtaiEWfVs6N5v+eTaTQFbnbKjY4t7DhG96Bt5N0NacK68OgcehQw==@vger.kernel.org, AJvYcCVtm+fnunU8rd1lqCEpAZpIBAH/Sc8VVvK52gFjZiAtb7ZWcPXm8hF+y/xCOf8IhXJITazGDnAuvGSZCBbm@vger.kernel.org
X-Gm-Message-State: AOJu0YzF85YBcdhZch/pPs7FSqoLwyYDPlK/vtNBCCjSQ6WX0GSxHNQY
	3ohfPphPLKLTSCVnhKUtlLnXZ3l4bD8zayivdS8n4cJxodogo/OdioxCVw==
X-Google-Smtp-Source: AGHT+IHoJGmZ1zpS9HWbdIar9PmqW6ik9qhEVt0QebgwJICcpKcJXudyekzR9mcdgN26KiOTmeoV9g==
X-Received: by 2002:a17:902:e80c:b0:20c:e5b5:608a with SMTP id d9443c01a7336-20fa9de92a8mr72406435ad.5.1729752263356;
        Wed, 23 Oct 2024 23:44:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0e44sm66389785ad.133.2024.10.23.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
Date: Thu, 24 Oct 2024 14:43:55 +0800
Message-ID: <20241024064356.865055-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024064356.865055-1-inochiama@gmail.com>
References: <20241024064356.865055-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add base driver for SG2042 SoC and pin definition.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/Kconfig              |  14 +
 drivers/pinctrl/sophgo/Makefile             |   2 +
 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c | 583 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.c     | 642 ++++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.h     |  50 ++
 5 files changed, 1291 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index b14792ee46fc..a10301aaad04 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -52,3 +52,17 @@ config PINCTRL_SOPHGO_SG2002
 	  This pin controller allows selecting the mux function for
 	  each pin. This driver can also be built as a module called
 	  pinctrl-sg2002.
+
+config PINCTRL_SOPHGO_SG2042_OPS
+	tristate
+
+config PINCTRL_SOPHGO_SG2042
+	tristate "Sophgo SG2042 SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_SG2042_OPS
+	help
+	  Say Y to select the pinctrl driver for SG2042 SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-sg2042.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 4113a5c9191b..674b4c7cbfbb 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -5,3 +5,5 @@ obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2000)	+= pinctrl-sg2000.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2002)	+= pinctrl-sg2002.o
+obj-$(CONFIG_PINCTRL_SOPHGO_SG2042_OPS)	+= pinctrl-sg2042-ops.o
+obj-$(CONFIG_PINCTRL_SOPHGO_SG2042)	+= pinctrl-sg2042.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
new file mode 100644
index 000000000000..f1c33b166d01
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo sg2042 SoCs pinctrl driver.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#include "pinctrl-sg2042.h"
+
+#define PIN_IO_PULL_ONE_ENABLE		BIT(0)
+#define PIN_IO_PULL_DIR_UP		(BIT(1) | PIN_IO_PULL_ONE_ENABLE)
+#define PIN_IO_PULL_DIR_DOWN		(0 | PIN_IO_PULL_ONE_ENABLE)
+#define PIN_IO_PULL_ONE_MASK		GENMASK(1, 0)
+
+#define PIN_IO_PULL_UP			BIT(2)
+#define PIN_IO_PULL_UP_DONW		BIT(3)
+#define PIN_IO_PULL_UP_MASK		GENMASK(3, 2)
+
+#define PIN_IO_MUX			GENMASK(5, 4)
+#define PIN_IO_DRIVE			GENMASK(9, 6)
+#define PIN_IO_SCHMITT_ENABLE		BIT(10)
+#define PIN_IO_OUTPUT_ENABLE		BIT(11)
+
+struct sg2042_pinctrl {
+	struct device				*dev;
+	struct pinctrl_dev			*pctl_dev;
+	const struct sg2042_pinctrl_data	*data;
+	struct pinctrl_desc			pdesc;
+
+	struct mutex				mutex;
+	raw_spinlock_t				lock;
+
+	void __iomem				*regs;
+};
+
+struct sg2042_pin_mux_config {
+	const struct sg2042_pin		*pin;
+	u32				config;
+};
+
+static u16 sg2042_dt_get_pin(u32 value)
+{
+	return value;
+}
+
+static u8 sg2042_dt_get_pin_mux(u32 value)
+{
+	return value >> 16;
+}
+
+static const struct sg2042_pin *sg2042_get_pin(struct sg2042_pinctrl *pctrl,
+					       unsigned long pin)
+{
+	if (pin < pctrl->data->npins)
+		return &pctrl->data->pindata[pin];
+	return NULL;
+}
+
+static inline u32 sg2042_get_pin_reg(struct sg2042_pinctrl *pctrl,
+				     const struct sg2042_pin *pin)
+{
+	void __iomem *reg = pctrl->regs + pin->offset;
+
+	if (pin->flags & PIN_FLAG_WRITE_HIGH)
+		return readl(reg) >> 16;
+	else
+		return readl(reg) & 0xffff;
+}
+
+static inline void sg2042_set_pin_reg(struct sg2042_pinctrl *pctrl,
+				      const struct sg2042_pin *pin,
+				      u32 value, u32 mask)
+{
+	void __iomem *reg = pctrl->regs + pin->offset;
+	u32 v = readl(reg);
+
+	if (pin->flags & PIN_FLAG_WRITE_HIGH) {
+		v &= ~(mask << 16);
+		v |= value << 16;
+	} else {
+		v &= ~mask;
+		v |= value;
+	}
+
+	writel(v, reg);
+}
+
+static void sg2042_pctrl_dbg_show(struct pinctrl_dev *pctldev,
+				  struct seq_file *seq, unsigned int pin_id)
+{
+	struct sg2042_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct sg2042_pin *pin = sg2042_get_pin(pctrl, pin_id);
+	u32 value, mux;
+
+	value = sg2042_get_pin_reg(pctrl, pin);
+	mux = FIELD_GET(PIN_IO_MUX, value);
+	seq_printf(seq, "mux:%u reg:0x%04x ", mux, value);
+}
+
+static int sg2042_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+				       struct device_node *np,
+				       struct pinctrl_map **maps,
+				       unsigned int *num_maps)
+{
+	struct sg2042_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = pctrl->dev;
+	struct pinctrl_map *map;
+	const char **grpnames;
+	const char *grpname;
+	int ngroups = 0;
+	int nmaps = 0;
+	int ret;
+
+	for_each_available_child_of_node_scoped(np, child)
+		ngroups += 1;
+
+	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
+	if (!grpnames)
+		return -ENOMEM;
+
+	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	ngroups = 0;
+	guard(mutex)(&pctrl->mutex);
+	for_each_available_child_of_node_scoped(np, child) {
+		int npins = of_property_count_u32_elems(child, "pinmux");
+		unsigned int *pins;
+		struct sg2042_pin_mux_config *pinmuxs;
+		u32 config;
+		int i;
+
+		if (npins < 1) {
+			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
+				np, child);
+			ret = -EINVAL;
+			goto failed;
+		}
+
+		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
+					 np, child);
+		if (!grpname) {
+			ret = -ENOMEM;
+			goto failed;
+		}
+
+		grpnames[ngroups++] = grpname;
+
+		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+		if (!pins) {
+			ret = -ENOMEM;
+			goto failed;
+		}
+
+		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
+		if (!pinmuxs) {
+			ret = -ENOMEM;
+			goto failed;
+		}
+
+		for (i = 0; i < npins; i++) {
+			ret = of_property_read_u32_index(child, "pinmux",
+							 i, &config);
+			if (ret)
+				goto failed;
+
+			pins[i] = sg2042_dt_get_pin(config);
+			pinmuxs[i].config = config;
+			pinmuxs[i].pin = sg2042_get_pin(pctrl, pins[i]);
+
+			if (!pinmuxs[i].pin) {
+				dev_err(dev, "failed to get pin %d\n", pins[i]);
+				ret = -ENODEV;
+				goto failed;
+			}
+		}
+
+		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+		map[nmaps].data.mux.function = np->name;
+		map[nmaps].data.mux.group = grpname;
+		nmaps += 1;
+
+		ret = pinconf_generic_parse_dt_config(child, pctldev,
+						      &map[nmaps].data.configs.configs,
+						      &map[nmaps].data.configs.num_configs);
+		if (ret) {
+			dev_err(dev, "failed to parse pin config of group %s: %d\n",
+				grpname, ret);
+			goto failed;
+		}
+
+		ret = pinctrl_generic_add_group(pctldev, grpname,
+						pins, npins, pinmuxs);
+		if (ret < 0) {
+			dev_err(dev, "failed to add group %s: %d\n", grpname, ret);
+			goto failed;
+		}
+
+		/* don't create a map if there are no pinconf settings */
+		if (map[nmaps].data.configs.num_configs == 0)
+			continue;
+
+		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		map[nmaps].data.configs.group_or_pin = grpname;
+		nmaps += 1;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name,
+					  grpnames, ngroups, NULL);
+	if (ret < 0) {
+		dev_err(dev, "error adding function %s: %d\n", np->name, ret);
+		goto failed;
+	}
+
+	*maps = map;
+	*num_maps = nmaps;
+
+	return 0;
+
+failed:
+	pinctrl_utils_free_map(pctldev, map, nmaps);
+	return ret;
+}
+
+static const struct pinctrl_ops sg2042_pctrl_ops = {
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
+	.pin_dbg_show		= sg2042_pctrl_dbg_show,
+	.dt_node_to_map		= sg2042_pctrl_dt_node_to_map,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int sg2042_pmx_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int fsel, unsigned int gsel)
+{
+	struct sg2042_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const struct sg2042_pin_mux_config *configs;
+	unsigned int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	configs = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		const struct sg2042_pin *pin = configs[i].pin;
+		u32 value = configs[i].config;
+		u32 mux = sg2042_dt_get_pin_mux(value);
+
+		guard(raw_spinlock_irqsave)(&pctrl->lock);
+
+		if (!(pin->flags & PIN_FLAG_NO_PINMUX))
+			sg2042_set_pin_reg(pctrl, pin, mux, PIN_IO_MUX);
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops sg2042_pmx_ops = {
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
+	.set_mux		= sg2042_pmx_set_mux,
+	.strict			= true,
+};
+
+static u32 sg2042_pull_down_typical_resistor(struct sg2042_pinctrl *pctrl)
+{
+	return pctrl->data->pulldown_res;
+}
+
+static u32 sg2042_pull_up_typical_resistor(struct sg2042_pinctrl *pctrl)
+{
+	return pctrl->data->pullup_res;
+}
+
+static int sg2042_pinctrl_oc2reg(struct sg2042_pinctrl *pctrl,
+				 const struct sg2042_pin *pin, u32 target)
+{
+	const u32 *map = pctrl->data->oc_reg_map;
+	int len = pctrl->data->noc_reg;
+	int i;
+
+	for (i = 0; i < len; i++) {
+		if (map[i] >= target)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int sg2042_pinctrl_reg2oc(struct sg2042_pinctrl *pctrl,
+				 const struct sg2042_pin *pin, u32 reg)
+{
+	const u32 *map = pctrl->data->oc_reg_map;
+	int len = pctrl->data->noc_reg;
+
+	if (reg >= len)
+		return -EINVAL;
+
+	return map[reg];
+}
+
+static int sg2042_pconf_get(struct pinctrl_dev *pctldev,
+			    unsigned int pin_id, unsigned long *config)
+{
+	struct sg2042_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	const struct sg2042_pin *pin = sg2042_get_pin(pctrl, pin_id);
+	u32 value;
+	u32 arg;
+	bool enabled;
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	value = sg2042_get_pin_reg(pctrl, pin);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (pin->flags & PIN_FLAG_ONLY_ONE_PULL)
+			arg = FIELD_GET(PIN_IO_PULL_ONE_ENABLE, value);
+		else
+			arg = FIELD_GET(PIN_IO_PULL_UP_MASK, value);
+		enabled = arg == 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (pin->flags & PIN_FLAG_ONLY_ONE_PULL) {
+			arg = FIELD_GET(PIN_IO_PULL_ONE_MASK, value);
+			enabled = arg == PIN_IO_PULL_DIR_DOWN;
+		} else {
+			enabled = FIELD_GET(PIN_IO_PULL_UP_DONW, value) != 0;
+		}
+		arg = sg2042_pull_down_typical_resistor(pctrl);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (pin->flags & PIN_FLAG_ONLY_ONE_PULL) {
+			arg = FIELD_GET(PIN_IO_PULL_ONE_MASK, value);
+			enabled = arg == PIN_IO_PULL_DIR_UP;
+		} else {
+			enabled = FIELD_GET(PIN_IO_PULL_UP, value) != 0;
+		}
+		arg = sg2042_pull_up_typical_resistor(pctrl);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		enabled = FIELD_GET(PIN_IO_OUTPUT_ENABLE, value) != 0;
+		arg = FIELD_GET(PIN_IO_DRIVE, value);
+		ret = sg2042_pinctrl_reg2oc(pctrl, pin, arg);
+		if (ret < 0)
+			return ret;
+		arg = ret;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		arg = FIELD_GET(PIN_IO_SCHMITT_ENABLE, value);
+		enabled = arg != 0;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return enabled ? 0 : -EINVAL;
+}
+
+static int sg2042_pinconf_compute_config(struct sg2042_pinctrl *pctrl,
+					 const struct sg2042_pin *pin,
+					 unsigned long *configs,
+					 unsigned int num_configs,
+					 u16 *value, u16 *mask)
+{
+	int i;
+	u16 v = 0, m = 0;
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (pin->flags & PIN_FLAG_ONLY_ONE_PULL) {
+				v &= ~PIN_IO_PULL_ONE_ENABLE;
+				m |= PIN_IO_PULL_ONE_ENABLE;
+			} else {
+				v &= ~PIN_IO_PULL_UP_MASK;
+				m |= PIN_IO_PULL_UP_MASK;
+			}
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (pin->flags & PIN_FLAG_ONLY_ONE_PULL) {
+				v &= ~PIN_IO_PULL_ONE_MASK;
+				v |= PIN_IO_PULL_DIR_DOWN;
+				m |= PIN_IO_PULL_ONE_MASK;
+			} else {
+				v |= PIN_IO_PULL_UP_DONW;
+				m |= PIN_IO_PULL_UP_DONW;
+			}
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (pin->flags & PIN_FLAG_ONLY_ONE_PULL) {
+				v &= ~PIN_IO_PULL_ONE_MASK;
+				v |= PIN_IO_PULL_DIR_UP;
+				m |= PIN_IO_PULL_ONE_MASK;
+			} else {
+				v |= PIN_IO_PULL_UP;
+				m |= PIN_IO_PULL_UP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			v &= ~(PIN_IO_DRIVE | PIN_IO_OUTPUT_ENABLE);
+			if (arg != 0) {
+				ret = sg2042_pinctrl_oc2reg(pctrl, pin, arg);
+				if (ret < 0)
+					return ret;
+				if (!(pin->flags & PIN_FLAG_NO_OEX_EN))
+					v |= PIN_IO_OUTPUT_ENABLE;
+				v |= FIELD_PREP(PIN_IO_DRIVE, ret);
+			}
+			m |= PIN_IO_DRIVE | PIN_IO_OUTPUT_ENABLE;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			v |= PIN_IO_SCHMITT_ENABLE;
+			m |= PIN_IO_SCHMITT_ENABLE;
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	*value = v;
+	*mask = m;
+
+	return 0;
+}
+
+static int sg2042_pin_set_config(struct sg2042_pinctrl *pctrl,
+				 unsigned int pin_id,
+				 u16 value, u16 mask)
+{
+	const struct sg2042_pin *pin = sg2042_get_pin(pctrl, pin_id);
+
+	if (!pin)
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
+	sg2042_set_pin_reg(pctrl, pin, value, mask);
+
+	return 0;
+}
+
+static int sg2042_pconf_set(struct pinctrl_dev *pctldev,
+			    unsigned int pin_id, unsigned long *configs,
+			    unsigned int num_configs)
+{
+	struct sg2042_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct sg2042_pin *pin = sg2042_get_pin(pctrl, pin_id);
+	u16 value, mask;
+
+	if (!pin)
+		return -ENODEV;
+
+	if (sg2042_pinconf_compute_config(pctrl, pin,
+					  configs, num_configs,
+					  &value, &mask))
+		return -ENOTSUPP;
+
+	return sg2042_pin_set_config(pctrl, pin_id, value, mask);
+}
+
+static int sg2042_pconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int gsel,
+				  unsigned long *configs,
+				  unsigned int num_configs)
+{
+	struct sg2042_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const struct sg2042_pin_mux_config *pinmuxs;
+	u16 value, mask;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	pinmuxs = group->data;
+
+	if (sg2042_pinconf_compute_config(pctrl, pinmuxs[0].pin,
+					  configs, num_configs,
+					  &value, &mask))
+		return -ENOTSUPP;
+
+	for (i = 0; i < group->grp.npins; i++)
+		sg2042_pin_set_config(pctrl, group->grp.pins[i], value, mask);
+
+	return 0;
+}
+
+static const struct pinconf_ops sg2042_pconf_ops = {
+	.pin_config_get			= sg2042_pconf_get,
+	.pin_config_set			= sg2042_pconf_set,
+	.pin_config_group_set		= sg2042_pconf_group_set,
+	.is_generic			= true,
+};
+
+int sg2042_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sg2042_pinctrl *pctrl;
+	const struct sg2042_pinctrl_data *pctrl_data;
+	int ret;
+
+	pctrl_data = device_get_match_data(dev);
+	if (!pctrl_data)
+		return -ENODEV;
+
+	if (pctrl_data->npins == 0)
+		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctrl->regs))
+		return PTR_ERR(pctrl->regs);
+
+	pctrl->pdesc.name = dev_name(dev);
+	pctrl->pdesc.pins = pctrl_data->pins;
+	pctrl->pdesc.npins = pctrl_data->npins;
+	pctrl->pdesc.pctlops = &sg2042_pctrl_ops;
+	pctrl->pdesc.pmxops = &sg2042_pmx_ops;
+	pctrl->pdesc.confops = &sg2042_pconf_ops;
+	pctrl->pdesc.owner = THIS_MODULE;
+
+	pctrl->data = pctrl_data;
+	pctrl->dev = dev;
+	raw_spin_lock_init(&pctrl->lock);
+	mutex_init(&pctrl->mutex);
+
+	platform_set_drvdata(pdev, pctrl);
+
+	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
+					     pctrl, &pctrl->pctl_dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "fail to register pinctrl driver\n");
+
+	return pinctrl_enable(pctrl->pctl_dev);
+}
+EXPORT_SYMBOL_GPL(sg2042_pinctrl_probe);
+
+MODULE_DESCRIPTION("Pinctrl OPs for the SG2042 SoC");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
new file mode 100644
index 000000000000..81411670f855
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
@@ -0,0 +1,642 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2042 SoC pinctrl driver.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include <dt-bindings/pinctrl/pinctrl-sg2042.h>
+
+#include "pinctrl-sg2042.h"
+
+static const struct pinctrl_pin_desc sg2042_pins[] = {
+	PINCTRL_PIN(PIN_LPC_LCLK,		"lpc_lclk"),
+	PINCTRL_PIN(PIN_LPC_LFRAME,		"lpc_lframe"),
+	PINCTRL_PIN(PIN_LPC_LAD0,		"lpc_lad0"),
+	PINCTRL_PIN(PIN_LPC_LAD1,		"lpc_lad1"),
+	PINCTRL_PIN(PIN_LPC_LAD2,		"lpc_lad2"),
+	PINCTRL_PIN(PIN_LPC_LAD3,		"lpc_lad3"),
+	PINCTRL_PIN(PIN_LPC_LDRQ0,		"lpc_ldrq0"),
+	PINCTRL_PIN(PIN_LPC_LDRQ1,		"lpc_ldrq1"),
+	PINCTRL_PIN(PIN_LPC_SERIRQ,		"lpc_serirq"),
+	PINCTRL_PIN(PIN_LPC_CLKRUN,		"lpc_clkrun"),
+	PINCTRL_PIN(PIN_LPC_LPME,		"lpc_lpme"),
+	PINCTRL_PIN(PIN_LPC_LPCPD,		"lpc_lpcpd"),
+	PINCTRL_PIN(PIN_LPC_LSMI,		"lpc_lsmi"),
+	PINCTRL_PIN(PIN_PCIE0_L0_RESET,		"pcie0_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE0_L1_RESET,		"pcie0_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE0_L0_WAKEUP,	"pcie0_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE0_L1_WAKEUP,	"pcie0_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE0_L0_CLKREQ_IN,	"pcie0_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE0_L1_CLKREQ_IN,	"pcie0_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE1_L0_RESET,		"pcie1_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE1_L1_RESET,		"pcie1_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE1_L0_WAKEUP,	"pcie1_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE1_L1_WAKEUP,	"pcie1_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE1_L0_CLKREQ_IN,	"pcie1_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE1_L1_CLKREQ_IN,	"pcie1_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_SPIF0_CLK_SEL1,		"spif0_clk_sel1"),
+	PINCTRL_PIN(PIN_SPIF0_CLK_SEL0,		"spif0_clk_sel0"),
+	PINCTRL_PIN(PIN_SPIF0_WP,		"spif0_wp"),
+	PINCTRL_PIN(PIN_SPIF0_HOLD,		"spif0_hold"),
+	PINCTRL_PIN(PIN_SPIF0_SDI,		"spif0_sdi"),
+	PINCTRL_PIN(PIN_SPIF0_CS,		"spif0_cs"),
+	PINCTRL_PIN(PIN_SPIF0_SCK,		"spif0_sck"),
+	PINCTRL_PIN(PIN_SPIF0_SDO,		"spif0_sdo"),
+	PINCTRL_PIN(PIN_SPIF1_CLK_SEL1,		"spif1_clk_sel1"),
+	PINCTRL_PIN(PIN_SPIF1_CLK_SEL0,		"spif1_clk_sel0"),
+	PINCTRL_PIN(PIN_SPIF1_WP,		"spif1_wp"),
+	PINCTRL_PIN(PIN_SPIF1_HOLD,		"spif1_hold"),
+	PINCTRL_PIN(PIN_SPIF1_SDI,		"spif1_sdi"),
+	PINCTRL_PIN(PIN_SPIF1_CS,		"spif1_cs"),
+	PINCTRL_PIN(PIN_SPIF1_SCK,		"spif1_sck"),
+	PINCTRL_PIN(PIN_SPIF1_SDO,		"spif1_sdo"),
+	PINCTRL_PIN(PIN_EMMC_WP,		"emmc_wp"),
+	PINCTRL_PIN(PIN_EMMC_CD,		"emmc_cd"),
+	PINCTRL_PIN(PIN_EMMC_RST,		"emmc_rst"),
+	PINCTRL_PIN(PIN_EMMC_PWR_EN,		"emmc_pwr_en"),
+	PINCTRL_PIN(PIN_SDIO_CD,		"sdio_cd"),
+	PINCTRL_PIN(PIN_SDIO_WP,		"sdio_wp"),
+	PINCTRL_PIN(PIN_SDIO_RST,		"sdio_rst"),
+	PINCTRL_PIN(PIN_SDIO_PWR_EN,		"sdio_pwr_en"),
+	PINCTRL_PIN(PIN_RGMII0_TXD0,		"rgmii0_txd0"),
+	PINCTRL_PIN(PIN_RGMII0_TXD1,		"rgmii0_txd1"),
+	PINCTRL_PIN(PIN_RGMII0_TXD2,		"rgmii0_txd2"),
+	PINCTRL_PIN(PIN_RGMII0_TXD3,		"rgmii0_txd3"),
+	PINCTRL_PIN(PIN_RGMII0_TXCTRL,		"rgmii0_txctrl"),
+	PINCTRL_PIN(PIN_RGMII0_RXD0,		"rgmii0_rxd0"),
+	PINCTRL_PIN(PIN_RGMII0_RXD1,		"rgmii0_rxd1"),
+	PINCTRL_PIN(PIN_RGMII0_RXD2,		"rgmii0_rxd2"),
+	PINCTRL_PIN(PIN_RGMII0_RXD3,		"rgmii0_rxd3"),
+	PINCTRL_PIN(PIN_RGMII0_RXCTRL,		"rgmii0_rxctrl"),
+	PINCTRL_PIN(PIN_RGMII0_TXC,		"rgmii0_txc"),
+	PINCTRL_PIN(PIN_RGMII0_RXC,		"rgmii0_rxc"),
+	PINCTRL_PIN(PIN_RGMII0_REFCLKO,		"rgmii0_refclko"),
+	PINCTRL_PIN(PIN_RGMII0_IRQ,		"rgmii0_irq"),
+	PINCTRL_PIN(PIN_RGMII0_MDC,		"rgmii0_mdc"),
+	PINCTRL_PIN(PIN_RGMII0_MDIO,		"rgmii0_mdio"),
+	PINCTRL_PIN(PIN_PWM0,			"pwm0"),
+	PINCTRL_PIN(PIN_PWM1,			"pwm1"),
+	PINCTRL_PIN(PIN_PWM2,			"pwm2"),
+	PINCTRL_PIN(PIN_PWM3,			"pwm3"),
+	PINCTRL_PIN(PIN_FAN0,			"fan0"),
+	PINCTRL_PIN(PIN_FAN1,			"fan1"),
+	PINCTRL_PIN(PIN_FAN2,			"fan2"),
+	PINCTRL_PIN(PIN_FAN3,			"fan3"),
+	PINCTRL_PIN(PIN_IIC0_SDA,		"iic0_sda"),
+	PINCTRL_PIN(PIN_IIC0_SCL,		"iic0_scl"),
+	PINCTRL_PIN(PIN_IIC1_SDA,		"iic1_sda"),
+	PINCTRL_PIN(PIN_IIC1_SCL,		"iic1_scl"),
+	PINCTRL_PIN(PIN_IIC2_SDA,		"iic2_sda"),
+	PINCTRL_PIN(PIN_IIC2_SCL,		"iic2_scl"),
+	PINCTRL_PIN(PIN_IIC3_SDA,		"iic3_sda"),
+	PINCTRL_PIN(PIN_IIC3_SCL,		"iic3_scl"),
+	PINCTRL_PIN(PIN_UART0_TX,		"uart0_tx"),
+	PINCTRL_PIN(PIN_UART0_RX,		"uart0_rx"),
+	PINCTRL_PIN(PIN_UART0_RTS,		"uart0_rts"),
+	PINCTRL_PIN(PIN_UART0_CTS,		"uart0_cts"),
+	PINCTRL_PIN(PIN_UART1_TX,		"uart1_tx"),
+	PINCTRL_PIN(PIN_UART1_RX,		"uart1_rx"),
+	PINCTRL_PIN(PIN_UART1_RTS,		"uart1_rts"),
+	PINCTRL_PIN(PIN_UART1_CTS,		"uart1_cts"),
+	PINCTRL_PIN(PIN_UART2_TX,		"uart2_tx"),
+	PINCTRL_PIN(PIN_UART2_RX,		"uart2_rx"),
+	PINCTRL_PIN(PIN_UART2_RTS,		"uart2_rts"),
+	PINCTRL_PIN(PIN_UART2_CTS,		"uart2_cts"),
+	PINCTRL_PIN(PIN_UART3_TX,		"uart3_tx"),
+	PINCTRL_PIN(PIN_UART3_RX,		"uart3_rx"),
+	PINCTRL_PIN(PIN_UART3_RTS,		"uart3_rts"),
+	PINCTRL_PIN(PIN_UART3_CTS,		"uart3_cts"),
+	PINCTRL_PIN(PIN_SPI0_CS0,		"spi0_cs0"),
+	PINCTRL_PIN(PIN_SPI0_CS1,		"spi0_cs1"),
+	PINCTRL_PIN(PIN_SPI0_SDI,		"spi0_sdi"),
+	PINCTRL_PIN(PIN_SPI0_SDO,		"spi0_sdo"),
+	PINCTRL_PIN(PIN_SPI0_SCK,		"spi0_sck"),
+	PINCTRL_PIN(PIN_SPI1_CS0,		"spi1_cs0"),
+	PINCTRL_PIN(PIN_SPI1_CS1,		"spi1_cs1"),
+	PINCTRL_PIN(PIN_SPI1_SDI,		"spi1_sdi"),
+	PINCTRL_PIN(PIN_SPI1_SDO,		"spi1_sdo"),
+	PINCTRL_PIN(PIN_SPI1_SCK,		"spi1_sck"),
+	PINCTRL_PIN(PIN_JTAG0_TDO,		"jtag0_tdo"),
+	PINCTRL_PIN(PIN_JTAG0_TCK,		"jtag0_tck"),
+	PINCTRL_PIN(PIN_JTAG0_TDI,		"jtag0_tdi"),
+	PINCTRL_PIN(PIN_JTAG0_TMS,		"jtag0_tms"),
+	PINCTRL_PIN(PIN_JTAG0_TRST,		"jtag0_trst"),
+	PINCTRL_PIN(PIN_JTAG0_SRST,		"jtag0_srst"),
+	PINCTRL_PIN(PIN_JTAG1_TDO,		"jtag1_tdo"),
+	PINCTRL_PIN(PIN_JTAG1_TCK,		"jtag1_tck"),
+	PINCTRL_PIN(PIN_JTAG1_TDI,		"jtag1_tdi"),
+	PINCTRL_PIN(PIN_JTAG1_TMS,		"jtag1_tms"),
+	PINCTRL_PIN(PIN_JTAG1_TRST,		"jtag1_trst"),
+	PINCTRL_PIN(PIN_JTAG1_SRST,		"jtag1_srst"),
+	PINCTRL_PIN(PIN_JTAG2_TDO,		"jtag2_tdo"),
+	PINCTRL_PIN(PIN_JTAG2_TCK,		"jtag2_tck"),
+	PINCTRL_PIN(PIN_JTAG2_TDI,		"jtag2_tdi"),
+	PINCTRL_PIN(PIN_JTAG2_TMS,		"jtag2_tms"),
+	PINCTRL_PIN(PIN_JTAG2_TRST,		"jtag2_trst"),
+	PINCTRL_PIN(PIN_JTAG2_SRST,		"jtag2_srst"),
+	PINCTRL_PIN(PIN_GPIO0,			"gpio0"),
+	PINCTRL_PIN(PIN_GPIO1,			"gpio1"),
+	PINCTRL_PIN(PIN_GPIO2,			"gpio2"),
+	PINCTRL_PIN(PIN_GPIO3,			"gpio3"),
+	PINCTRL_PIN(PIN_GPIO4,			"gpio4"),
+	PINCTRL_PIN(PIN_GPIO5,			"gpio5"),
+	PINCTRL_PIN(PIN_GPIO6,			"gpio6"),
+	PINCTRL_PIN(PIN_GPIO7,			"gpio7"),
+	PINCTRL_PIN(PIN_GPIO8,			"gpio8"),
+	PINCTRL_PIN(PIN_GPIO9,			"gpio9"),
+	PINCTRL_PIN(PIN_GPIO10,			"gpio10"),
+	PINCTRL_PIN(PIN_GPIO11,			"gpio11"),
+	PINCTRL_PIN(PIN_GPIO12,			"gpio12"),
+	PINCTRL_PIN(PIN_GPIO13,			"gpio13"),
+	PINCTRL_PIN(PIN_GPIO14,			"gpio14"),
+	PINCTRL_PIN(PIN_GPIO15,			"gpio15"),
+	PINCTRL_PIN(PIN_GPIO16,			"gpio16"),
+	PINCTRL_PIN(PIN_GPIO17,			"gpio17"),
+	PINCTRL_PIN(PIN_GPIO18,			"gpio18"),
+	PINCTRL_PIN(PIN_GPIO19,			"gpio19"),
+	PINCTRL_PIN(PIN_GPIO20,			"gpio20"),
+	PINCTRL_PIN(PIN_GPIO21,			"gpio21"),
+	PINCTRL_PIN(PIN_GPIO22,			"gpio22"),
+	PINCTRL_PIN(PIN_GPIO23,			"gpio23"),
+	PINCTRL_PIN(PIN_GPIO24,			"gpio24"),
+	PINCTRL_PIN(PIN_GPIO25,			"gpio25"),
+	PINCTRL_PIN(PIN_GPIO26,			"gpio26"),
+	PINCTRL_PIN(PIN_GPIO27,			"gpio27"),
+	PINCTRL_PIN(PIN_GPIO28,			"gpio28"),
+	PINCTRL_PIN(PIN_GPIO29,			"gpio29"),
+	PINCTRL_PIN(PIN_GPIO30,			"gpio30"),
+	PINCTRL_PIN(PIN_GPIO31,			"gpio31"),
+	PINCTRL_PIN(PIN_MODE_SEL0,		"mode_sel0"),
+	PINCTRL_PIN(PIN_MODE_SEL1,		"mode_sel1"),
+	PINCTRL_PIN(PIN_MODE_SEL2,		"mode_sel2"),
+	PINCTRL_PIN(PIN_BOOT_SEL0,		"boot_sel0"),
+	PINCTRL_PIN(PIN_BOOT_SEL1,		"boot_sel1"),
+	PINCTRL_PIN(PIN_BOOT_SEL2,		"boot_sel2"),
+	PINCTRL_PIN(PIN_BOOT_SEL3,		"boot_sel3"),
+	PINCTRL_PIN(PIN_BOOT_SEL4,		"boot_sel4"),
+	PINCTRL_PIN(PIN_BOOT_SEL5,		"boot_sel5"),
+	PINCTRL_PIN(PIN_BOOT_SEL6,		"boot_sel6"),
+	PINCTRL_PIN(PIN_BOOT_SEL7,		"boot_sel7"),
+	PINCTRL_PIN(PIN_MULTI_SCKT,		"multi_sckt"),
+	PINCTRL_PIN(PIN_SCKT_ID0,		"sckt_id0"),
+	PINCTRL_PIN(PIN_SCKT_ID1,		"sckt_id1"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_MAIN,	"pll_clk_in_main"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_DDR_L,	"pll_clk_in_ddr_l"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_DDR_R,	"pll_clk_in_ddr_r"),
+	PINCTRL_PIN(PIN_XTAL_32K,		"xtal_32k"),
+	PINCTRL_PIN(PIN_SYS_RST,		"sys_rst"),
+	PINCTRL_PIN(PIN_PWR_BUTTON,		"pwr_button"),
+	PINCTRL_PIN(PIN_TEST_EN,		"test_en"),
+	PINCTRL_PIN(PIN_TEST_MODE_MBIST,	"test_mode_mbist"),
+	PINCTRL_PIN(PIN_TEST_MODE_SCAN,		"test_mode_scan"),
+	PINCTRL_PIN(PIN_TEST_MODE_BSD,		"test_mode_bsd"),
+	PINCTRL_PIN(PIN_BISR_BYP,		"bisr_byp"),
+};
+
+static const struct sg2042_pin sg2042_pin_data[ARRAY_SIZE(sg2042_pins)] = {
+	SG2042_GENERAL_PIN(PIN_LPC_LCLK, 0x000,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LFRAME, 0x000,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LAD0, 0x004,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LAD1, 0x004,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LAD2, 0x008,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LAD3, 0x008,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LDRQ0, 0x00c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LDRQ1, 0x00c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_SERIRQ, 0x010,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_CLKRUN, 0x010,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LPME, 0x014,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LPCPD, 0x014,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_LPC_LSMI, 0x018,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L0_RESET, 0x018,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L1_RESET, 0x01c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L0_WAKEUP, 0x01c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L1_WAKEUP, 0x020,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L0_CLKREQ_IN, 0x020,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L1_CLKREQ_IN, 0x024,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L0_RESET, 0x024,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L1_RESET, 0x028,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L0_WAKEUP, 0x028,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L1_WAKEUP, 0x02c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L0_CLKREQ_IN, 0x02c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L1_CLKREQ_IN, 0x030,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_CLK_SEL1, 0x030,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_CLK_SEL0, 0x034,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_WP, 0x034,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_HOLD, 0x038,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_SDI, 0x038,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_CS, 0x03c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_SCK, 0x03c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF0_SDO, 0x040,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_CLK_SEL1, 0x040,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_CLK_SEL0, 0x044,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_WP, 0x044,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_HOLD, 0x048,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_SDI, 0x048,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_CS, 0x04c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_SCK, 0x04c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPIF1_SDO, 0x050,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_EMMC_WP, 0x050,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_EMMC_CD, 0x054,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_EMMC_RST, 0x054,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_EMMC_PWR_EN, 0x058,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SDIO_CD, 0x058,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SDIO_WP, 0x05c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SDIO_RST, 0x05c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SDIO_PWR_EN, 0x060,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD0, 0x060,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD1, 0x064,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD2, 0x064,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD3, 0x068,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXCTRL, 0x068,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD0, 0x06c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD1, 0x06c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD2, 0x070,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD3, 0x070,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXCTRL, 0x074,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXC, 0x074,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXC, 0x078,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_REFCLKO, 0x078,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_IRQ, 0x07c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_MDC, 0x07c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_MDIO, 0x080,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PWM0, 0x080,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PWM1, 0x084,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PWM2, 0x084,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_PWM3, 0x088,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_FAN0, 0x088,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_FAN1, 0x08c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_FAN2, 0x08c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_FAN3, 0x090,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_IIC0_SDA, 0x090,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC0_SCL, 0x094,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC1_SDA, 0x094,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC1_SCL, 0x098,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC2_SDA, 0x098,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC2_SCL, 0x09c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC3_SDA, 0x09c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC3_SCL, 0x0a0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART0_TX, 0x0a0,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART0_RX, 0x0a4,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART0_RTS, 0x0a4,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART0_CTS, 0x0a8,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART1_TX, 0x0a8,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART1_RX, 0x0ac,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART1_RTS, 0x0ac,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART1_CTS, 0x0b0,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART2_TX, 0x0b0,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART2_RX, 0x0b4,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART2_RTS, 0x0b4,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART2_CTS, 0x0b8,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART3_TX, 0x0b8,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART3_RX, 0x0bc,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART3_RTS, 0x0bc,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_UART3_CTS, 0x0c0,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI0_CS0, 0x0c0,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI0_CS1, 0x0c4,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI0_SDI, 0x0c4,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI0_SDO, 0x0c8,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI0_SCK, 0x0c8,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI1_CS0, 0x0cc,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI1_CS1, 0x0cc,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI1_SDI, 0x0d0,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI1_SDO, 0x0d0,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_SPI1_SCK, 0x0d4,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TDO, 0x0d4,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TCK, 0x0d8,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TDI, 0x0d8,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TMS, 0x0dc,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TRST, 0x0dc,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG0_SRST, 0x0e0,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TDO, 0x0e0,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TCK, 0x0e4,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TDI, 0x0e4,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TMS, 0x0e8,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TRST, 0x0e8,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG1_SRST, 0x0ec,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TDO, 0x0ec,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TCK, 0x0f0,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TDI, 0x0f0,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TMS, 0x0f4,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TRST, 0x0f4,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_JTAG2_SRST, 0x0f8,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO0, 0x0f8,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO1, 0x0fc,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO2, 0x0fc,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO3, 0x100,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO4, 0x100,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO5, 0x104,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO6, 0x104,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO7, 0x108,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO8, 0x108,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO9, 0x10c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO10, 0x10c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO11, 0x110,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO12, 0x110,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO13, 0x114,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO14, 0x114,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO15, 0x118,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO16, 0x118,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO17, 0x11c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO18, 0x11c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO19, 0x120,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO20, 0x120,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO21, 0x124,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO22, 0x124,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO23, 0x128,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO24, 0x128,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO25, 0x12c,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO26, 0x12c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO27, 0x130,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO28, 0x130,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO29, 0x134,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO30, 0x134,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_GPIO31, 0x138,
+			   PIN_FLAG_ONLY_ONE_PULL),
+	SG2042_GENERAL_PIN(PIN_MODE_SEL0, 0x138,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_MODE_SEL1, 0x13c,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_MODE_SEL2, 0x13c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL0, 0x140,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL1, 0x140,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL2, 0x144,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL3, 0x144,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL4, 0x148,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL5, 0x148,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL6, 0x14c,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL7, 0x14c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_MULTI_SCKT, 0x150,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_SCKT_ID0, 0x150,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_SCKT_ID1, 0x154,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_MAIN, 0x154,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_DDR_L, 0x158,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_DDR_R, 0x158,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_XTAL_32K, 0x15c,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_SYS_RST, 0x15c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PWR_BUTTON, 0x160,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_EN, 0x160,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_MODE_MBIST, 0x164,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_MODE_SCAN, 0x164,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_MODE_BSD, 0x168,
+			   PIN_FLAG_ONLY_ONE_PULL | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BISR_BYP, 0x168,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_ONLY_ONE_PULL |
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+};
+
+static const u32 sg2042_oc_map[] = {
+	4300,
+	6400,
+	8500,
+	10600,
+	12800,
+	14900,
+	17000,
+	19100,
+	21200,
+	23300,
+	25500,
+	27600,
+	29700,
+	31800,
+	33900,
+	36000
+};
+
+static const struct sg2042_pinctrl_data sg2042_pindata = {
+	.pins		= sg2042_pins,
+	.pindata	= sg2042_pin_data,
+	.oc_reg_map	= sg2042_oc_map,
+	.pullup_res	= 35000,
+	.pulldown_res	= 35000,
+	.npins		= ARRAY_SIZE(sg2042_pins),
+	.noc_reg	= ARRAY_SIZE(sg2042_oc_map),
+};
+
+static const struct of_device_id sg2042_pinctrl_ids[] = {
+	{ .compatible = "sophgo,sg2042-pinctrl", .data = &sg2042_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sg2042_pinctrl_ids);
+
+static struct platform_driver sg2042_pinctrl_driver = {
+	.probe	= sg2042_pinctrl_probe,
+	.driver	= {
+		.name			= "sg2042-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sg2042_pinctrl_ids,
+	},
+};
+module_platform_driver(sg2042_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
new file mode 100644
index 000000000000..bfe1332ed2b0
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _PINCTRL_SOPHGO_SG2042_H
+#define _PINCTRL_SOPHGO_SG2042_H
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+
+#define PIN_FLAG_DEFAULT			0
+#define PIN_FLAG_WRITE_HIGH			BIT(0)
+#define PIN_FLAG_ONLY_ONE_PULL			BIT(1)
+#define PIN_FLAG_NO_PINMUX			BIT(2)
+#define PIN_FLAG_NO_OEX_EN			BIT(3)
+#define PIN_FLAG_IS_ETH				BIT(4)
+
+struct sg2042_pin {
+	u16				pin;
+	u16				offset;
+	u16				flags;
+};
+
+struct sg2042_pinctrl_data {
+	const struct pinctrl_pin_desc		*pins;
+	const struct sg2042_pin			*pindata;
+	const u32				*oc_reg_map;
+	u32					pullup_res;
+	u32					pulldown_res;
+	u16					npins;
+	u16					noc_reg;
+};
+
+int sg2042_pinctrl_probe(struct platform_device *pdev);
+
+#define SG2042_GENERAL_PIN(_id,	_offset, _flag)				\
+	{								\
+		.pin = (_id),						\
+		.offset = (_offset),					\
+		.flags = (_flag),					\
+	}
+
+#endif
-- 
2.47.0


