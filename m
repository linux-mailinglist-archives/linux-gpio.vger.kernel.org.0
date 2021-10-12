Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458FB42A625
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237187AbhJLNoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237155AbhJLNoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:44:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89436C06161C;
        Tue, 12 Oct 2021 06:42:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x27so87685270lfa.9;
        Tue, 12 Oct 2021 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dtURt139qgddHpLPO67/kM/tEuprVxdMtl96A+mzATM=;
        b=f60zFRFDt/J9sxLIcF+lO55d+JVDIGUNgcvj6khe3iArz759dKGw1U0UaynAxR7JbJ
         11RkIoPOuaWTEkZyGnvvtDc0OcZR9jTKU9zeqno0vryy9RhtqUv73+fHh/C8OX76I0IR
         Hzuxxpi0iuzgswXPrVq4DWtWEL8Ak9SFq0fRoclFGZtGkecO1cRUhqFR6mSRaGxhe5jB
         Zh7iE5xY8TuWkJvbEyU0zPQGfYIY0LRv0hunGby1bZMTG9BjIP1rU2rbx3Hrs0y8dXpr
         nqLFe0dO2i4FqNbGh7ZZtSNUpe22NKIikcSvPlnr5eHID+2dQj88DEamPZPwBgJdR64W
         +rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dtURt139qgddHpLPO67/kM/tEuprVxdMtl96A+mzATM=;
        b=GrFcDWNWF6IQ+in0PT5DTm+qxL72HziljNLBzgEB5OeDA9YSXwZzOoncy5YS5wknMb
         ZnGuw2Tf1eyEke/OMDDoiehpFJdyJrjcohiO3Lpn1DXDtkSJptrLC3veXxo84+ec2tSk
         lRWPKBifvpF+8f4Kv3jkqvz+uN06K2EEhAVe8ZWz4dPJwaF8EwlztTxA9j3ZiD0XgAmU
         Kknl8Z5D1EqZgoCcdg7xmgQsupjfoKvvIO7W3GvV/Lk7doVu6qPV3N/hbufxSxmGtGT6
         40koZbF50Pt1dcShBiZV4o0Kyvj3Zantxe8uk9kma573Bpfv+lGbHd1sM2Hzx4UP40g6
         cLdQ==
X-Gm-Message-State: AOAM532V3Ucx95kAp3IOO6M6voNwchtaKil1yzBD7R4Z0lKvD0TX6+Mv
        oIMAswnAvJdtn4qBV9fsC/k=
X-Google-Smtp-Source: ABdhPJzNpUTNHtZKYvkfOn3zYXgma9rI5O1vya6ZA38ztxGLe7l7ZEbLH0F3xnw9itB6Ml15kGfo7A==
X-Received: by 2002:a2e:b949:: with SMTP id 9mr29558640ljs.400.1634046121868;
        Tue, 12 Oct 2021 06:42:01 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:42:01 -0700 (PDT)
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100 reset driver
Date:   Tue, 12 Oct 2021 15:40:20 +0200
Message-Id: <20211012134027.684712-10-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a driver for the StarFive JH7100 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 MAINTAINERS                           |   7 ++
 drivers/reset/Kconfig                 |   8 ++
 drivers/reset/Makefile                |   1 +
 drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 drivers/reset/reset-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d2b95b96f0ec..f7883377895e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17854,6 +17854,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
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
index be799a5abf8a..8345521744b3 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -92,6 +92,14 @@ config RESET_INTEL_GW
 	  Say Y to control the reset signals provided by reset controller.
 	  Otherwise, say N.
 
+config RESET_STARFIVE_JH7100
+	bool "StarFive JH7100 Reset Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on OF
+	default SOC_STARFIVE
+	help
+	  This enables the reset controller driver for the StarFive JH7100 SoC.
+
 config RESET_K210
 	bool "Reset controller driver for Canaan Kendryte K210 SoC"
 	depends on (SOC_CANAAN || COMPILE_TEST) && OF
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 21d46d8869ff..021eff3525de 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
+obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
new file mode 100644
index 000000000000..26bc5b59c1f3
--- /dev/null
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7100 SoC
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/reset/starfive-jh7100.h>
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
+struct jh7100_reset {
+	struct reset_controller_dev rcdev;
+	/* protect registers against overlapping read-modify-write */
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
+static const u32 jh7100_reset_asserted[4] = {
+	BIT(JH7100_RST_U74 % 32) |
+	BIT(JH7100_RST_VP6_DRESET % 32) |
+	BIT(JH7100_RST_VP6_BRESET % 32),
+
+	BIT(JH7100_RST_HIFI4_DRESET % 32) |
+	BIT(JH7100_RST_HIFI4_BRESET % 32),
+
+	BIT_MASK(JH7100_RST_E24	% 32)
+};
+
+static int jh7100_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = id / 32;
+	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
+	u32 mask = BIT(id % 32);
+	u32 done = jh7100_reset_asserted[offset] & mask;
+	unsigned long flags;
+	u32 value;
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
+	do {
+		value = readl(reg_status) & mask;
+	} while (value != done);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+	return 0;
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
+	u32 mask = BIT(id % 32);
+	u32 value = (readl(reg_status) ^ jh7100_reset_asserted[offset]) & mask;
+
+	dev_dbg(rcdev->dev, "status(%lu) = %d\n", id, !value);
+	return !value;
+}
+
+static const struct reset_control_ops jh7100_reset_ops = {
+	.assert		= jh7100_reset_assert,
+	.deassert	= jh7100_reset_deassert,
+	.reset		= jh7100_reset_reset,
+	.status		= jh7100_reset_status,
+};
+
+static int jh7100_reset_probe(struct platform_device *pdev)
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
+	{ /* sentinel */ },
+};
+
+static struct platform_driver jh7100_reset_driver = {
+	.probe = jh7100_reset_probe,
+	.driver = {
+		.name = "jh7100-reset",
+		.of_match_table = jh7100_reset_dt_ids,
+	},
+};
+builtin_platform_driver(jh7100_reset_driver);
-- 
2.33.0

