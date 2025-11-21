Return-Path: <linux-gpio+bounces-28960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB516C7ABEB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 33C97364863
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB5134E748;
	Fri, 21 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxPORWCj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5593C346E55
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741333; cv=none; b=eVPAL6RBsL+mcpaEmmKT1JAv/DPZQQznhZvfzl5+0vLlsX3HPhkzgPpZWkk3Uvu+Q/WPK83Ie5QlIEHEggJhkd8w1DbGSPr3e2lPUtBGhoMeMnNsm36Kx4DPYgiYfTNPxOBQJP7s9hgezLmFQwqF/5Ld0ZMmhOFZCu3/QNi+saI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741333; c=relaxed/simple;
	bh=mJBsb/8tblOWWGx4ZdPfo6jHjtaF6JwkscFYF/NwPBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOkEgCA6P7eXPlBO7yjWzS1DOl2LaNDNze7zTd+fZMHlYMCx8mswjjgc/vPEEcxyyl6DwOMr5l2mVnuvfFjXNeGArxniRv8JIirjh83ZLbZl7Kx9Ewvv73NjGGVH1Ix2Vcyegs+V9nje56wj56IOureTej4l8oqQQdeJv+vs9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxPORWCj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755de027eso12494245e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741328; x=1764346128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=024rs0BxWU5PY1RJJMZTz6cDZohSwOOFxlPClgib9y0=;
        b=HxPORWCjjEYE5BOC2/Vf3YdFaYx/7DoSVlmZC152NZ04c5GBk4RbUuynhkOpnPpBo6
         Pj3FS5SS/SlKh6hTWXeuSw+DE5lpZIOJJ4/CRxDfVl/IjCPb2nyH4e5jtTFdw+dDGnEP
         DcTPSUD2jHrPY6+BDnZZq9To+SVv3UIBMM2l5FsiN6WkLAmeLjeUOxHSbK2B27ird4y9
         /mszvlNvjabHajPqa2QCeT5R+Jm37Gktg3BPgDxGZbeq+k6SwXB+YmKK5g8Wn1Xo+auH
         OCl9omtByRxEC08EwYwFVJubo2Pt1FiYnNQVjLSESWxzd56K99aj3mo/VUJtlofFxakf
         LtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741328; x=1764346128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=024rs0BxWU5PY1RJJMZTz6cDZohSwOOFxlPClgib9y0=;
        b=QcQz9Ye3xF9bpVZEUmID55+F0QOggVsGW5H1bCAlnaJGvpd3jPhmhUdU5td98oq/Zr
         R9g0MeWXf2+1t1auvGGjSL7Piu9b1aR/pCyxR3IcaFrFUtlX8Awgg6ZaysjDGPHFzGTj
         MWqWK7c750wI7zOIiDkUmrLsf0aSReavEwBSHE9wpWJnrdJu5kBXfwHTcmHrIUcqZoOu
         8afiLxE1LQ+Pw6/ACdZBXoZuf+hmtQP1K/nu0Fs4POjGsy85o4em/p/+/nOvZ7WVvgV2
         w4Z5hhYSnvobcHHZeakQYGpILd82agb1B2JWvF5fzzQbGRmNLY6QPgOY5CfIKvSwReqw
         2xTA==
X-Forwarded-Encrypted: i=1; AJvYcCV2jRQxzkH9j4pFNuEYOp40TG0+T8lC5AHdC6GHPqT05Yc/mI49LK8qwRZANWt4N7VnBvlsv3LMUBz6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/EJV2QNEzWwh4jnJcRN/OxrzB+Tz7TPUvzUGA5uXU53uns09e
	p0SvdUygbA7FRKkjYeTnYtZj3i+dnWKG8nP3V1ktZwpz7Kswy6TxwwPt
X-Gm-Gg: ASbGncvdaXpybudjUu1Sv151yBERcxUaBtkNPvOJFLz24ywAI3NHOy7Pq7/HhY3E8gU
	5t5MhkWVaZYB5c6WT+iKxgQMDq+/ZrekZx4wpsFH3MUJoJvph8eNWzT5hgNdWwi9FkOAV4jjpht
	RsFpW3Qdr6QwE84rtkVQu6TwrvyVR3fFSze37x+S9hMS7AqdMmANcDYLujDUYnS4YzunIJzh7jt
	R9w2S1mDn3plu6bYKtss/IfjBZbqjBUG4KjN3Qksg2ssQKhQUnJFMKvSF4sfBOFerKO1p+pDGEl
	HoYt+5U2aaUersiawzaZXWrzV2ow+hSavk6qMAn9CeYjboc3ubUCQZsUU0X12nR5yOmwY7JyX45
	IF/Po5evPlq3A+tj+6yClTGYLxDyp6R3ws0nKbef4xEeEbmv2N6yCMEEHZb9b6dfEzXsIGPqjw1
	snyB8d06kHsSHqaxjWydxC+0R4YUN3xy+rn3yY+XMTBtfE+4XDp1IxcSAl4EdUv9IPVpHhCog=
X-Google-Smtp-Source: AGHT+IEkaOIm9U1sCCg2TT2zjDkLJfA3RCOrCQjz6BFNxMwP+uzsBTyQcOZTSwOGWE5phuyoAgs0Ow==
X-Received: by 2002:a05:600c:a08:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-477c01be3f6mr24780845e9.21.1763741328330;
        Fri, 21 Nov 2025 08:08:48 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 04/15] drivers: pinctrl: renesas: Add RZ/G2L POEG driver support
Date: Fri, 21 Nov 2025 16:08:11 +0000
Message-ID: <20251121160842.371922-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The output pins of the RZ/G2L general PWM timer (GPT) can be disabled
by using the port output enabling function for the GPT (POEG).

Add basic support for user control and output-disable requests from the
GTETRGn pins by using poeg char device.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Replaced config name from POEG_RZG2L->RENESAS_RZG2L_POEG.
 * Updated POEG Kconfig dependency with PWM
 * Dropped static variable minor_n and instead using the value of
   "renesas,poeg-id".
 * Replaced devm_reset_*_exclusive()->devm_reset_*_exclusive_deasserted()
 * Replaced pm_runtime_enable() with devm variant.
 * Added support for handling output-disable requests from the GTETRGn
   pins.
 * Replaced the macros RZG2L_POEG_USR_CTRL_{EN,DiS}ABLE_CMD to 
   RZG2L_POEG_OUTPUT_DISABLE_USR_{EN,DIS}ABLE_CMD.
 * Replaced '&pdev->dev' by 'dev' in probe().
v6->v7:
 * Used DT to handle the system configuration
 * Added poeg char device for user control support to enable/disable
   output from GPT
 * Replaced iowrite32/ioread32-> writel/readl
 * Dropped of_match_ptr from .of_match_table
v5->v6:
 * Dropped sysfs and is handled in generic driver.
v4->v5:
 * Updated kernel version in sysfs doc.
v3->v4:
 * Updated commit description.
v2->v3:
 * Added sysfs documentation for output_disable
 * PWM_RZG2L_GPT implies ARCH_RZG2L. So removed ARCH_RZG2L dependency
 * Used dev_get_drvdata to get device data
 * Replaced sprintf->sysfs_emit in show().
v1->v2:
 * Renamed the file poeg-rzg2l->rzg2l-poeg
 * Removed the macro POEGG as there is only single register and
   updated rzg2l_poeg_write() and rzg2l_poeg_read()
 * Updated error handling in probe()
Ref->v1:
 * Moved driver files from soc to pincontrol directory
 * Updated KConfig
---
 drivers/pinctrl/renesas/Kconfig           |   2 +
 drivers/pinctrl/renesas/Makefile          |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig      |  11 +
 drivers/pinctrl/renesas/poeg/Makefile     |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c | 368 ++++++++++++++++++++++
 include/linux/pinctrl/rzg2l-poeg.h        |  15 +
 6 files changed, 400 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
 create mode 100644 include/linux/pinctrl/rzg2l-poeg.h

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 8cbd79a13414..dc95b7020d30 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -326,4 +326,6 @@ config PINCTRL_RZV2M
 	  This selects GPIO and pinctrl driver for Renesas RZ/V2M
 	  platforms.
 
+source "drivers/pinctrl/renesas/poeg/Kconfig"
+
 endmenu
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index 1c5144a1c4b8..8dc5da978a45 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -53,6 +53,8 @@ obj-$(CONFIG_PINCTRL_RZN1)	+= pinctrl-rzn1.o
 obj-$(CONFIG_PINCTRL_RZT2H)	+= pinctrl-rzt2h.o
 obj-$(CONFIG_PINCTRL_RZV2M)	+= pinctrl-rzv2m.o
 
+obj-$(CONFIG_RENESAS_RZG2L_POEG)	+= poeg/
+
 ifeq ($(CONFIG_COMPILE_TEST),y)
 CFLAGS_pfc-sh7203.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
 CFLAGS_pfc-sh7264.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
diff --git a/drivers/pinctrl/renesas/poeg/Kconfig b/drivers/pinctrl/renesas/poeg/Kconfig
new file mode 100644
index 000000000000..621a4ce72c72
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+config RENESAS_RZG2L_POEG
+	tristate "Renesas RZ/G2L poeg support"
+	depends on PWM_RENESAS_RZG2L_GPT || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This driver exposes the Port Output Enable for GPT(POEG) found
+	  in Renesas RZ/G2L alike SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rzg2l-poeg.
diff --git a/drivers/pinctrl/renesas/poeg/Makefile b/drivers/pinctrl/renesas/poeg/Makefile
new file mode 100644
index 000000000000..b0ed1e9a467a
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RENESAS_RZG2L_POEG)	+= rzg2l-poeg.o
diff --git a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
new file mode 100644
index 000000000000..2a09888407d0
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L Port Output Enable for GPT (POEG) driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ */
+#include <linux/cdev.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kfifo.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/rzg2l-poeg.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pinctrl/rzg2l-poeg.h>
+#include <linux/poll.h>
+#include <linux/reset.h>
+#include <linux/wait.h>
+
+#define POEGG_IOCE	BIT(5)
+#define POEGG_PIDE	BIT(4)
+#define POEGG_SSF	BIT(3)
+#define POEGG_IOCF	BIT(1)
+#define POEGG_PIDF	BIT(0)
+
+#define RZG2L_POEG_MAX_INDEX		3
+
+#define RZG2L_GPT_MAX_HW_CHANNELS	8
+#define RZG2L_GPT_INVALID_CHANNEL	0xff
+
+enum poeg_conf {
+	POEG_USER_CTRL = BIT(0),
+	POEG_GPT_BOTH_HIGH = BIT(1),
+	POEG_GPT_BOTH_LOW = BIT(2),
+	POEG_GPT_DEAD_TIME = BIT(3),
+	POEG_EXT_PIN_CTRL = BIT(4),
+	POEG_GPT_BOTH_HIGH_LOW = BIT(1) | BIT(2),
+	POEG_GPT_BOTH_HIGH_DEAD_TIME = BIT(1) | BIT(3),
+	POEG_GPT_BOTH_LOW_DEAD_TIME = BIT(2) | BIT(3),
+	POEG_GPT_ALL = BIT(1) | BIT(2) | BIT(3)
+};
+
+static struct class *poeg_class;
+static dev_t g_poeg_dev;
+
+struct rzg2l_poeg_chip {
+	struct device *gpt_dev;
+	struct reset_control *rstc;
+	void __iomem *mmio;
+	struct cdev poeg_cdev;
+	u32 cfg;
+	int minor_n;
+	u8 gpt_channels[RZG2L_GPT_MAX_HW_CHANNELS];
+	u8 index;
+};
+
+static void rzg2l_poeg_write(struct rzg2l_poeg_chip *chip, u32 data)
+{
+	writel(data, chip->mmio);
+}
+
+static u32 rzg2l_poeg_read(struct rzg2l_poeg_chip *chip)
+{
+	return readl(chip->mmio);
+}
+
+static int rzg2l_poeg_output_disable_user(struct rzg2l_poeg_chip *chip, bool enable)
+{
+	u32 reg_val;
+
+	reg_val = rzg2l_poeg_read(chip);
+	if (enable)
+		reg_val |= POEGG_SSF;
+	else
+		reg_val &= ~POEGG_SSF;
+
+	rzg2l_poeg_write(chip, reg_val);
+
+	return 0;
+}
+
+static irqreturn_t rzg2l_poeg_irq(int irq, void *ptr)
+{
+	struct rzg2l_poeg_chip *chip = ptr;
+	u32 val;
+
+	val = rzg2l_poeg_read(chip);
+	if (val & POEGG_PIDF)
+		val &= ~POEGG_PIDF;
+
+	rzg2l_poeg_write(chip, val);
+
+	return IRQ_HANDLED;
+}
+
+static ssize_t rzg2l_poeg_chrdev_write(struct file *filp, const char __user *buf,
+				       size_t len, loff_t *f_ps)
+{
+	struct rzg2l_poeg_chip *const chip = filp->private_data;
+	struct poeg_cmd cmd;
+
+	if (copy_from_user(&cmd, buf, sizeof(cmd)))
+		return -EFAULT;
+
+	switch (cmd.val) {
+	case RZG2L_POEG_OUTPUT_DISABLE_USR_ENABLE_CMD:
+		rzg2l_poeg_output_disable_user(chip, true);
+		break;
+	case RZG2L_POEG_OUTPUT_DISABLE_USR_DISABLE_CMD:
+		rzg2l_poeg_output_disable_user(chip, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return len;
+}
+
+static int rzg2l_poeg_chrdev_open(struct inode *inode, struct file *filp)
+{
+	struct rzg2l_poeg_chip *const chip = container_of(inode->i_cdev, typeof(*chip),
+							  poeg_cdev);
+
+	filp->private_data = chip;
+
+	return nonseekable_open(inode, filp);
+}
+
+static int rzg2l_poeg_chrdev_release(struct inode *inode, struct file *filp)
+{
+	filp->private_data = NULL;
+
+	return 0;
+}
+
+static const struct file_operations poeg_fops = {
+	.owner = THIS_MODULE,
+	.write = rzg2l_poeg_chrdev_write,
+	.open = rzg2l_poeg_chrdev_open,
+	.release = rzg2l_poeg_chrdev_release,
+};
+
+static bool rzg2l_poeg_get_linked_gpt_channels(struct platform_device *pdev,
+					       struct rzg2l_poeg_chip *chip,
+					       struct device_node *gpt_np,
+					       u8 poeg_id)
+{
+	struct of_phandle_args of_args;
+	bool ret = false;
+	unsigned int i;
+	u32 poeg_grp;
+	int cells;
+	int err;
+
+	cells = of_property_count_u32_elems(gpt_np, "renesas,poegs");
+	if (cells == -EINVAL)
+		return ret;
+
+	for (i = 0 ; i < RZG2L_GPT_MAX_HW_CHANNELS; i++)
+		chip->gpt_channels[i] = RZG2L_GPT_INVALID_CHANNEL;
+
+	cells >>= 1;
+	for (i = 0; i < cells; i++) {
+		err = of_parse_phandle_with_fixed_args(gpt_np, "renesas,poegs",
+						       1, i, &of_args);
+		if (err) {
+			dev_err_probe(&pdev->dev, err,
+				      "Failed to parse 'renesas,poegs' property\n");
+			break;
+		}
+
+		if (of_args.args[0] >= RZG2L_GPT_MAX_HW_CHANNELS) {
+			dev_err(&pdev->dev, "Invalid channel %d >= %d\n",
+				of_args.args[0], RZG2L_GPT_MAX_HW_CHANNELS);
+			of_node_put(of_args.np);
+			break;
+		}
+
+		if (!of_property_read_u32(of_args.np, "renesas,poeg-id", &poeg_grp)) {
+			if (poeg_grp == poeg_id) {
+				chip->gpt_channels[of_args.args[0]] = poeg_id;
+				ret = true;
+			}
+		}
+
+		of_node_put(of_args.np);
+	}
+
+	return ret;
+}
+
+static const struct of_device_id rzg2l_poeg_of_table[] = {
+	{ .compatible = "renesas,rzg2l-poeg", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg2l_poeg_of_table);
+
+static void rzg2l_poeg_cleanup(void *data)
+{
+	struct rzg2l_poeg_chip *chip = data;
+
+	put_device(chip->gpt_dev);
+}
+
+static int rzg2l_poeg_probe(struct platform_device *pdev)
+{
+	struct platform_device *gpt_pdev = NULL;
+	struct device *dev = &pdev->dev;
+	struct rzg2l_poeg_chip *chip;
+	bool gpt_linked = false;
+	struct device_node *np;
+	struct device *cdev;
+	u32 cfg, val;
+	int ret, irq;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	if (!of_property_read_u32(dev->of_node, "renesas,poeg-id", &val))
+		chip->index = val;
+
+	if (chip->index > RZG2L_POEG_MAX_INDEX)
+		return -EINVAL;
+
+	np = of_parse_phandle(dev->of_node, "renesas,gpt", 0);
+	if (np)
+		gpt_pdev = of_find_device_by_node(np);
+
+	gpt_linked = rzg2l_poeg_get_linked_gpt_channels(pdev, chip, np, chip->index);
+	of_node_put(np);
+	if (!gpt_pdev || !gpt_linked)
+		return -ENODEV;
+
+	chip->gpt_dev = &gpt_pdev->dev;
+	ret = devm_add_action_or_reset(dev, rzg2l_poeg_cleanup, chip);
+	if (ret < 0)
+		return ret;
+
+	chip->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->mmio))
+		return PTR_ERR(chip->mmio);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, rzg2l_poeg_irq, 0, dev_name(dev), chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get irq\n");
+
+	chip->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(chip->rstc))
+		return dev_err_probe(dev, PTR_ERR(chip->rstc), "get deasserted reset failed\n");
+
+	platform_set_drvdata(pdev, chip);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "pm_runtime_resume_get failed\n");
+
+	ret = of_property_read_u32(dev->of_node, "renesas,poeg-config", &cfg);
+	if (ret)
+		goto err_pm;
+
+	switch (cfg) {
+	case POEG_USER_CTRL:
+		rzg2l_poeg_write(chip, 0);
+		break;
+	case POEG_EXT_PIN_CTRL:
+		rzg2l_poeg_write(chip, POEGG_PIDE);
+		break;
+	default:
+		ret = -EINVAL;
+		goto err_pm;
+	}
+
+	chip->cfg = cfg;
+
+	cdev_init(&chip->poeg_cdev, &poeg_fops);
+	chip->poeg_cdev.owner = THIS_MODULE;
+	ret = cdev_add(&chip->poeg_cdev, MKDEV(MAJOR(g_poeg_dev), chip->index), 1);
+	if (ret)
+		goto err_pm;
+
+	cdev = device_create(poeg_class, NULL, MKDEV(MAJOR(g_poeg_dev), chip->index),
+			     NULL, "poeg%d", chip->index);
+	if (IS_ERR(cdev)) {
+		ret = PTR_ERR(cdev);
+		dev_err_probe(dev, ret, "Error %d creating device for port\n", chip->index);
+		goto free_cdev;
+	}
+
+	chip->minor_n = chip->index;
+
+	return ret;
+
+free_cdev:
+	cdev_del(&chip->poeg_cdev);
+err_pm:
+	pm_runtime_put(&pdev->dev);
+	return ret;
+}
+
+static void rzg2l_poeg_remove(struct platform_device *pdev)
+{
+	struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);
+
+	device_destroy(poeg_class, MKDEV(MAJOR(g_poeg_dev), chip->minor_n));
+	cdev_del(&chip->poeg_cdev);
+	pm_runtime_put(&pdev->dev);
+}
+
+static struct platform_driver rzg2l_poeg_driver = {
+	.driver = {
+		.name = "rzg2l-poeg",
+		.of_match_table = rzg2l_poeg_of_table
+	},
+	.probe = rzg2l_poeg_probe,
+	.remove = rzg2l_poeg_remove
+};
+
+static int rzg2l_poeg_device_init(void)
+{
+	int err;
+
+	err = alloc_chrdev_region(&g_poeg_dev, 0, 1, "poeg");
+	if (err)
+		goto out;
+
+	poeg_class = class_create("poeg");
+	if (IS_ERR(poeg_class)) {
+		err = PTR_ERR(poeg_class);
+		goto err_free_chrdev;
+	}
+
+	err = platform_driver_register(&rzg2l_poeg_driver);
+	if (err)
+		goto err_class_destroy;
+
+	return 0;
+
+err_class_destroy:
+	class_destroy(poeg_class);
+err_free_chrdev:
+	unregister_chrdev_region(g_poeg_dev, 1);
+out:
+	return err;
+}
+
+static void rzg2l_poeg_device_exit(void)
+{
+	platform_driver_unregister(&rzg2l_poeg_driver);
+	class_destroy(poeg_class);
+	unregister_chrdev_region(g_poeg_dev, 1);
+}
+
+module_init(rzg2l_poeg_device_init);
+module_exit(rzg2l_poeg_device_exit);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L POEG Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/pinctrl/rzg2l-poeg.h b/include/linux/pinctrl/rzg2l-poeg.h
new file mode 100644
index 000000000000..a5392f956700
--- /dev/null
+++ b/include/linux/pinctrl/rzg2l-poeg.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_RENESAS_RZG2L_POEG_H__
+#define __LINUX_RENESAS_RZG2L_POEG_H__
+
+#include <linux/types.h>
+
+#define RZG2L_POEG_OUTPUT_DISABLE_USR_DISABLE_CMD	0
+#define RZG2L_POEG_OUTPUT_DISABLE_USR_ENABLE_CMD	1
+
+struct poeg_cmd {
+	__u32 val;
+	__u8 channel;
+};
+
+#endif /* __LINUX_RENESAS_RZG2L_POEG_H__ */
-- 
2.43.0


