Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CA04433DD
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235212AbhKBQwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235037AbhKBQv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:51:56 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F3FC06122C;
        Tue,  2 Nov 2021 09:12:00 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id f8so56342205edy.4;
        Tue, 02 Nov 2021 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gr1wIwTgNcFqIl+KtBgXG2trMXyB3lpCcCeSmV2+9WY=;
        b=kesuWbk9QcRbTHpSJ2A10Q6H95jas9sYalZHj8eRZNjTGUGOaf+UUzkg6V+yA7NYIt
         BQsP3GIIxSRP47TRDhvh6SmXgsvjY7NojTVPf4UmQvgfbZwG5YZmm9eVcCRFMhiHWIqX
         fe5YOMGWsLLkjV7NTD9pQRiwBhNaEnElQ1A9cn69samSO2ZxildjFRog/xrFFctzSCTw
         ncJ5e3thI3FdaWDJjgB2qrGjoY/MVqTJoV89DUfcqai+8yfheJNBR2XhOZypRjxz0LCV
         ZqpM1IXjLe8cacP/jwJQ2qA1tbydorQttsf+KnvrZW4pYDESJTMSZp7wHcEKNzIoGnem
         Whjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Gr1wIwTgNcFqIl+KtBgXG2trMXyB3lpCcCeSmV2+9WY=;
        b=BdPsVmJNtXklNmogpvmuUreGo5Bs413G912wnq9jnbGyt4G3fVmw7GCCWTzpB7Umgu
         orAP+Oz21b3uAdGfAHuFU/ATeXHfYxO+WL+Ys/ISY6am9wx7fD8mhKRmqnzDjngXhrfk
         PVN3gOwDzNLb0SgZ3ZcD775shIg6bLr+9+uso/x6kQa1yF1cnohVK4ut8QpSIuko+0V3
         bg731oLbcPLDscS9Vk5NmFNYFMti3G2kouy4b0SWoapIt5RZcsV8j0EWuUiPZTlxJMQY
         YHszQDHUPhhxDwXnJPlQtvOw+LcKlzb2yb9Bw8oqzGQiWWRgHG7YPMsu0AbNA45F9I0K
         bJRQ==
X-Gm-Message-State: AOAM530kWm0Chibs1WPEF5O7oz0jz3/XVbjyWDBdIgf5YoWW6lKv/C0c
        d0AmLYU9iqyJOxbrl27nRuU=
X-Google-Smtp-Source: ABdhPJxsQXhFOdodq7sgqZhbOs4IXxJ0LcYr8VHTuKHe46oKUaM43Vg1y2FuktrEefEmnmpEvyn6Pg==
X-Received: by 2002:a50:e606:: with SMTP id y6mr25517269edm.270.1635869519070;
        Tue, 02 Nov 2021 09:11:59 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:58 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100 reset driver
Date:   Tue,  2 Nov 2021 17:11:18 +0100
Message-Id: <20211102161125.1144023-10-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a driver for the StarFive JH7100 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 MAINTAINERS                           |   7 +
 drivers/reset/Kconfig                 |   7 +
 drivers/reset/Makefile                |   1 +
 drivers/reset/reset-starfive-jh7100.c | 178 ++++++++++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 drivers/reset/reset-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ed49827dfb29..8274fa4b8430 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17866,6 +17866,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
 F:	drivers/clk/starfive/clk-starfive-jh7100.c
 F:	include/dt-bindings/clock/starfive-jh7100.h
 
+STARFIVE JH7100 RESET CONTROLLER DRIVER
+M:	Emil Renner Berthing <kernel@esmil.dk>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
+F:	drivers/reset/reset-starfive-jh7100.c
+F:	include/dt-bindings/reset/starfive-jh7100.h
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@redhat.com>
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index b0056ae5d463..346e66ae690b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -224,6 +224,13 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
+config RESET_STARFIVE_JH7100
+	bool "StarFive JH7100 Reset Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	default SOC_STARFIVE
+	help
+	  This enables the reset controller driver for the StarFive JH7100 SoC.
+
 config RESET_SUNXI
 	bool "Allwinner SoCs Reset Driver" if COMPILE_TEST && !ARCH_SUNXI
 	default ARCH_SUNXI
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 21d46d8869ff..bd0a97be18b5 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
+obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
new file mode 100644
index 000000000000..a3cbae933ec0
--- /dev/null
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7100 SoC
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/reset/starfive-jh7100.h>
+
+#define BIT_MASK32(x) BIT((x) % 32)
+
+/* register offsets */
+#define JH7100_RESET_ASSERT0	0x00
+#define JH7100_RESET_ASSERT1	0x04
+#define JH7100_RESET_ASSERT2	0x08
+#define JH7100_RESET_ASSERT3	0x0c
+#define JH7100_RESET_STATUS0	0x10
+#define JH7100_RESET_STATUS1	0x14
+#define JH7100_RESET_STATUS2	0x18
+#define JH7100_RESET_STATUS3	0x1c
+
+/*
+ * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
+ * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
+ * same line.
+ * most reset lines have their status inverted so a 0 in the STATUS register
+ * means the line is asserted and a 1 means it's deasserted. a few lines don't
+ * though, so store the expected value of the status registers when all lines
+ * are asserted.
+ */
+static const u32 jh7100_reset_asserted[4] = {
+	/* STATUS0 register */
+	BIT_MASK32(JH7100_RST_U74) |
+	BIT_MASK32(JH7100_RST_VP6_DRESET) |
+	BIT_MASK32(JH7100_RST_VP6_BRESET),
+	/* STATUS1 register */
+	BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
+	BIT_MASK32(JH7100_RST_HIFI4_BRESET),
+	/* STATUS2 register */
+	BIT_MASK32(JH7100_RST_E24),
+	/* STATUS3 register */
+	0,
+};
+
+struct jh7100_reset {
+	struct reset_controller_dev rcdev;
+	/* protect registers against concurrent read-modify-write */
+	spinlock_t lock;
+	void __iomem *base;
+};
+
+static inline struct jh7100_reset *
+jh7100_reset_from(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct jh7100_reset, rcdev);
+}
+
+static int jh7100_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = id / 32;
+	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
+	u32 mask = BIT_MASK32(id);
+	u32 done = jh7100_reset_asserted[offset] & mask;
+	unsigned long flags;
+	u32 value;
+	int ret;
+
+	if (!assert)
+		done ^= mask;
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	value = readl(reg_assert);
+	if (assert)
+		value |= mask;
+	else
+		value &= ~mask;
+	writel(value, reg_assert);
+
+	/* if the associated clock is gated, deasserting might otherwise hang forever */
+	ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+	return ret;
+}
+
+static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	dev_dbg(rcdev->dev, "assert(%lu)\n", id);
+	return jh7100_reset_update(rcdev, id, true);
+}
+
+static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	dev_dbg(rcdev->dev, "deassert(%lu)\n", id);
+	return jh7100_reset_update(rcdev, id, false);
+}
+
+static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	int ret;
+
+	dev_dbg(rcdev->dev, "reset(%lu)\n", id);
+	ret = jh7100_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return jh7100_reset_deassert(rcdev, id);
+}
+
+static int jh7100_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = id / 32;
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
+	u32 mask = BIT_MASK32(id);
+	int ret = !((readl(reg_status) ^ jh7100_reset_asserted[offset]) & mask);
+
+	dev_dbg(rcdev->dev, "status(%lu) = %d\n", id, ret);
+	return ret;
+}
+
+static const struct reset_control_ops jh7100_reset_ops = {
+	.assert		= jh7100_reset_assert,
+	.deassert	= jh7100_reset_deassert,
+	.reset		= jh7100_reset_reset,
+	.status		= jh7100_reset_status,
+};
+
+static int __init jh7100_reset_probe(struct platform_device *pdev)
+{
+	struct jh7100_reset *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	data->rcdev.ops = &jh7100_reset_ops;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.nr_resets = JH7100_RSTN_END;
+	data->rcdev.dev = &pdev->dev;
+	data->rcdev.of_node = pdev->dev.of_node;
+	spin_lock_init(&data->lock);
+
+	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+}
+
+static const struct of_device_id jh7100_reset_dt_ids[] = {
+	{ .compatible = "starfive,jh7100-reset" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jh7100_reset_driver = {
+	.driver = {
+		.name = "jh7100-reset",
+		.of_match_table = jh7100_reset_dt_ids,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver_probe(jh7100_reset_driver, jh7100_reset_probe);
-- 
2.33.1

