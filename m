Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239864F6CDF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 23:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbiDFVjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 17:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237436AbiDFViG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 17:38:06 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086F773074
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 13:55:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z12so6168909lfu.10
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vhqha7JMfAYsUct4fIUI/9kOzGco6RbGmbm8Igy+FJM=;
        b=bIvItBGmzGFfzyCVvvgi+0ES+c/QZrKbefI2+y5FPp1ECUObPupdEUj9uFCQ3SBvse
         cJZl2VRJwkhT/95FogjEaSP3zdtUF9pah+GE+Ri7n9M1eKECmqWOIHkCALiJClWue/EN
         E9efIh+JOy7n9exfxfWNF7+OmHt+4ot1jBXEfy8FAWLragf7kIQQoHXxXHyuudLNH330
         mKVE0BJM4UTmuWsnyLOvDpOFv1g+jwc8WJkKnHb4fYzAU/l/VT8XvsPH42ZF5nfKWZRT
         Ga/8E/Zbrd5l9AcUYCvFt85Awar2RG7n1gGGc8q6pgxq1jlMGDw7eAyOMbsCyUjMVpbl
         RjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vhqha7JMfAYsUct4fIUI/9kOzGco6RbGmbm8Igy+FJM=;
        b=s5039kxy68iM3NOc2VYAN9W6AEqPFDF1IKJaaFVUGrMg7CEFFjpaBC8nwr7FDTV28y
         8JkO4CqYsr45l3pgNoSdUkC1FojiTlfgY80cvzk1QQe52pakHNSzS0QRXAqUAVaseoOA
         dUD2gF9la72e8l7NhBa07CEiKWn+Hb8Zk3cCGuC0JEssWwTuI4FweQc7V8MW9+bb8SZI
         LGCW+J8dVQclMgxScHpEMB30qH9U2tmWaJbmy7Gq5LzlrUpehBWTo0D68jKpUxer/fvm
         T3g0FgsO/NtUQe8tj1pIvz3nsn0KOFa8xGlNITKRrfKj2YJbS0MeqaO6Kl61YVbsios3
         zvpA==
X-Gm-Message-State: AOAM532Lzh1ZwwLMnFRDlukQgOdQCRWr76SsMxDMF+/BGIPJbl/gJO+F
        liH3e1xrit2IHMRcTzjxH1zX53X9vwcYVQ==
X-Google-Smtp-Source: ABdhPJxeM6WQFmeyeQDiHbyBIVMqk67NM+sOmpak4ME1jcKM9HaqeeZr52qojMI4Sh+8XthPM5z0nQ==
X-Received: by 2002:ac2:4569:0:b0:44a:de90:e495 with SMTP id k9-20020ac24569000000b0044ade90e495mr7177058lfm.352.1649278533076;
        Wed, 06 Apr 2022 13:55:33 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h21-20020a0565123c9500b0044a34642bf4sm1954053lfv.7.2022.04.06.13.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 13:55:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] irq/gpio: ixp4xx: Drop boardfile probe path
Date:   Wed,  6 Apr 2022 22:53:27 +0200
Message-Id: <20220406205327.2332687-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The boardfiles for IXP4xx have been deleted. Delete all the
quirks and code dealing with that boot path and rely solely on
device tree boot.

Fix some missing static keywords that the kernel test robot
was complaining about while we're at it.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I don't know if this is best to merge into the GPIO or IRQ
tree, maybe GPIO as I sent another patch to GPIO and Marc
sent some IRQ rework for GPIO as well?
---
 drivers/gpio/Kconfig               |   2 +
 drivers/gpio/gpio-ixp4xx.c         |  40 +++------
 drivers/irqchip/irq-ixp4xx.c       | 126 +----------------------------
 include/linux/irqchip/irq-ixp4xx.h |  12 ---
 4 files changed, 17 insertions(+), 163 deletions(-)
 delete mode 100644 include/linux/irqchip/irq-ixp4xx.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 075a5d0feef7..57426fdba1b6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -354,6 +354,7 @@ config GPIO_IOP
 config GPIO_IXP4XX
 	bool "Intel IXP4xx GPIO"
 	depends on ARCH_IXP4XX
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
@@ -362,6 +363,7 @@ config GPIO_IXP4XX
 	  IXP4xx series of chips.
 
 	  If unsure, say N.
+
 config GPIO_LOGICVC
 	tristate "Xylon LogiCVC GPIO support"
 	depends on MFD_SYSCON && OF
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 1acda980d119..2e91d79929a8 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -14,8 +14,6 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
-/* Include that go away with DT transition */
-#include <linux/irqchip/irq-ixp4xx.h>
 
 #define IXP4XX_REG_GPOUT	0x00
 #define IXP4XX_REG_GPOE		0x04
@@ -193,6 +191,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct ixp4xx_gpio *g;
 	struct gpio_irq_chip *girq;
+	struct device_node *irq_parent;
 	int ret;
 
 	g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
@@ -205,34 +204,17 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(g->base))
 		return PTR_ERR(g->base);
 
-	/*
-	 * When we convert to device tree we will simply look up the
-	 * parent irqdomain using irq_find_host(parent) as parent comes
-	 * from IRQCHIP_DECLARE(), then use of_node_to_fwnode() to get
-	 * the fwnode. For now we need this boardfile style code.
-	 */
-	if (np) {
-		struct device_node *irq_parent;
-
-		irq_parent = of_irq_find_parent(np);
-		if (!irq_parent) {
-			dev_err(dev, "no IRQ parent node\n");
-			return -ENODEV;
-		}
-		parent = irq_find_host(irq_parent);
-		if (!parent) {
-			dev_err(dev, "no IRQ parent domain\n");
-			return -ENODEV;
-		}
-		g->fwnode = of_node_to_fwnode(np);
-	} else {
-		parent = ixp4xx_get_irq_domain();
-		g->fwnode = irq_domain_alloc_fwnode(&res->start);
-		if (!g->fwnode) {
-			dev_err(dev, "no domain base\n");
-			return -ENODEV;
-		}
+	irq_parent = of_irq_find_parent(np);
+	if (!irq_parent) {
+		dev_err(dev, "no IRQ parent node\n");
+		return -ENODEV;
+	}
+	parent = irq_find_host(irq_parent);
+	if (!parent) {
+		dev_err(dev, "no IRQ parent domain\n");
+		return -ENODEV;
 	}
+	g->fwnode = of_node_to_fwnode(np);
 
 	/*
 	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
index fb68f8c59fbb..5fba907b9052 100644
--- a/drivers/irqchip/irq-ixp4xx.c
+++ b/drivers/irqchip/irq-ixp4xx.c
@@ -13,7 +13,6 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/irq-ixp4xx.h>
 #include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -106,7 +105,8 @@ static void ixp4xx_irq_unmask(struct irq_data *d)
 	}
 }
 
-asmlinkage void __exception_irq_entry ixp4xx_handle_irq(struct pt_regs *regs)
+static asmlinkage void __exception_irq_entry
+ixp4xx_handle_irq(struct pt_regs *regs)
 {
 	struct ixp4xx_irq *ixi = &ixirq;
 	unsigned long status;
@@ -195,56 +195,6 @@ static const struct irq_domain_ops ixp4xx_irqdomain_ops = {
 	.free = irq_domain_free_irqs_common,
 };
 
-/**
- * ixp4xx_get_irq_domain() - retrieve the ixp4xx irq domain
- *
- * This function will go away when we transition to DT probing.
- */
-struct irq_domain *ixp4xx_get_irq_domain(void)
-{
-	struct ixp4xx_irq *ixi = &ixirq;
-
-	return ixi->domain;
-}
-EXPORT_SYMBOL_GPL(ixp4xx_get_irq_domain);
-
-/*
- * This is the Linux IRQ to hwirq mapping table. This goes away when
- * we have DT support as all IRQ resources are defined in the device
- * tree. It will register all the IRQs that are not used by the hierarchical
- * GPIO IRQ chip. The "holes" inbetween these IRQs will be requested by
- * the GPIO driver using . This is a step-gap solution.
- */
-struct ixp4xx_irq_chunk {
-	int irq;
-	int hwirq;
-	int nr_irqs;
-};
-
-static const struct ixp4xx_irq_chunk ixp4xx_irq_chunks[] = {
-	{
-		.irq = 16,
-		.hwirq = 0,
-		.nr_irqs = 6,
-	},
-	{
-		.irq = 24,
-		.hwirq = 8,
-		.nr_irqs = 11,
-	},
-	{
-		.irq = 46,
-		.hwirq = 30,
-		.nr_irqs = 2,
-	},
-	/* Only on the 436 variants */
-	{
-		.irq = 48,
-		.hwirq = 32,
-		.nr_irqs = 10,
-	},
-};
-
 /**
  * ixp4x_irq_setup() - Common setup code for the IXP4xx interrupt controller
  * @ixi: State container
@@ -298,75 +248,8 @@ static int __init ixp4xx_irq_setup(struct ixp4xx_irq *ixi,
 	return 0;
 }
 
-/**
- * ixp4xx_irq_init() - Function to initialize the irqchip from boardfiles
- * @irqbase: physical base for the irq controller
- * @is_356: if this is an IXP43x, IXP45x or IXP46x SoC variant
- */
-void __init ixp4xx_irq_init(resource_size_t irqbase,
-			    bool is_356)
-{
-	struct ixp4xx_irq *ixi = &ixirq;
-	void __iomem *base;
-	struct fwnode_handle *fwnode;
-	struct irq_fwspec fwspec;
-	int nr_chunks;
-	int ret;
-	int i;
-
-	base = ioremap(irqbase, 0x100);
-	if (!base) {
-		pr_crit("IXP4XX: could not ioremap interrupt controller\n");
-		return;
-	}
-	fwnode = irq_domain_alloc_fwnode(&irqbase);
-	if (!fwnode) {
-		pr_crit("IXP4XX: no domain handle\n");
-		return;
-	}
-	ret = ixp4xx_irq_setup(ixi, base, fwnode, is_356);
-	if (ret) {
-		pr_crit("IXP4XX: failed to set up irqchip\n");
-		irq_domain_free_fwnode(fwnode);
-	}
-
-	nr_chunks = ARRAY_SIZE(ixp4xx_irq_chunks);
-	if (!is_356)
-		nr_chunks--;
-
-	/*
-	 * After adding OF support, this is no longer needed: irqs
-	 * will be allocated for the respective fwnodes.
-	 */
-	for (i = 0; i < nr_chunks; i++) {
-		const struct ixp4xx_irq_chunk *chunk = &ixp4xx_irq_chunks[i];
-
-		pr_info("Allocate Linux IRQs %d..%d HW IRQs %d..%d\n",
-			chunk->irq, chunk->irq + chunk->nr_irqs - 1,
-			chunk->hwirq, chunk->hwirq + chunk->nr_irqs - 1);
-		fwspec.fwnode = fwnode;
-		fwspec.param[0] = chunk->hwirq;
-		fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
-		fwspec.param_count = 2;
-		ret = __irq_domain_alloc_irqs(ixi->domain,
-					      chunk->irq,
-					      chunk->nr_irqs,
-					      NUMA_NO_NODE,
-					      &fwspec,
-					      false,
-					      NULL);
-		if (ret < 0) {
-			pr_crit("IXP4XX: can not allocate irqs in hierarchy %d\n",
-				ret);
-			return;
-		}
-	}
-}
-EXPORT_SYMBOL_GPL(ixp4xx_irq_init);
-
-#ifdef CONFIG_OF
-int __init ixp4xx_of_init_irq(struct device_node *np,
-			      struct device_node *parent)
+static int __init ixp4xx_of_init_irq(struct device_node *np,
+				     struct device_node *parent)
 {
 	struct ixp4xx_irq *ixi = &ixirq;
 	void __iomem *base;
@@ -400,4 +283,3 @@ IRQCHIP_DECLARE(ixp45x, "intel,ixp45x-interrupt",
 		ixp4xx_of_init_irq);
 IRQCHIP_DECLARE(ixp46x, "intel,ixp46x-interrupt",
 		ixp4xx_of_init_irq);
-#endif
diff --git a/include/linux/irqchip/irq-ixp4xx.h b/include/linux/irqchip/irq-ixp4xx.h
deleted file mode 100644
index 9395917d6936..000000000000
--- a/include/linux/irqchip/irq-ixp4xx.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __IRQ_IXP4XX_H
-#define __IRQ_IXP4XX_H
-
-#include <linux/ioport.h>
-struct irq_domain;
-
-void ixp4xx_irq_init(resource_size_t irqbase,
-		     bool is_356);
-struct irq_domain *ixp4xx_get_irq_domain(void);
-
-#endif /* __IRQ_IXP4XX_H */
-- 
2.35.1

