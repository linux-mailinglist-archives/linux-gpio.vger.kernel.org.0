Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF7A861D62
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 13:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbfGHLB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 07:01:58 -0400
Received: from onstation.org ([52.200.56.107]:56130 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728391AbfGHLB5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 07:01:57 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 26C3E3EE9C;
        Mon,  8 Jul 2019 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562583716;
        bh=ABCfObbpbwuoupDoFMigDxKhE1zAF3XOt0cZUmn746o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=biKGCEB3hPCdsoZvEmt4KP6nEyNW/8vTY1LYgY8xgImoGEstmu4nzwpIQDBx88Fp4
         9hDkAUPsvyucUC6m6BqyGCwhzt7DxeGU51JksjBHnLT1L0RE7NyG3ZOeb+oSolH7uJ
         Pi84jEIP+NBfh+BZ1eeVS4jT3HqydqyCUv/l25Vc=
From:   Brian Masney <masneyb@onstation.org>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com,
        linux-tegra@vger.kernel.org, david.daney@cavium.com,
        yamada.masahiro@socionext.com, treding@nvidia.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell functions
Date:   Mon,  8 Jul 2019 07:01:35 -0400
Message-Id: <20190708110138.24657-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce the functions gpiochip_populate_parent_fwspec_{two,four}cell
that will be used for hierarchical IRQ support in GPIO drivers.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpio/gpiolib.c      | 24 ++++++++++++++++++++++++
 include/linux/gpio/driver.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d767e111694d..06c9cf714c99 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1946,6 +1946,30 @@ static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
 	return !!gc->irq.parent_domain;
 }
 
+void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+					     struct irq_fwspec *fwspec,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type)
+{
+	fwspec->param_count = 2;
+	fwspec->param[0] = parent_hwirq;
+	fwspec->param[1] = parent_type;
+}
+EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_twocell);
+
+void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+					      struct irq_fwspec *fwspec,
+					      unsigned int parent_hwirq,
+					      unsigned int parent_type)
+{
+	fwspec->param_count = 4;
+	fwspec->param[0] = 0;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = 0;
+	fwspec->param[3] = parent_type;
+}
+EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_fourcell);
+
 #else
 
 static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 682ad09e29f4..6b6bca20c8f9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -493,6 +493,36 @@ struct bgpio_pdata {
 	int ngpio;
 };
 
+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
+
+void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+					     struct irq_fwspec *fwspec,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type);
+void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+					      struct irq_fwspec *fwspec,
+					      unsigned int parent_hwirq,
+					      unsigned int parent_type);
+
+#else
+
+static void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+						    struct irq_fwspec *fwspec,
+						    unsigned int parent_hwirq,
+						    unsigned int parent_type)
+{
+}
+
+static void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
+						     struct irq_fwspec *fwspec,
+						     unsigned int parent_hwirq,
+						     unsigned int parent_type)
+{
+}
+
+#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
+
+
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 
 int bgpio_init(struct gpio_chip *gc, struct device *dev,
-- 
2.20.1

