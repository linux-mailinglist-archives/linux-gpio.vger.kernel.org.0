Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F148B27B9
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390527AbfIMV7v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59838 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390431AbfIMV7u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CE44A61231; Fri, 13 Sep 2019 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411988;
        bh=D72EJTD2RGe2SPhGafah7f7DzgpjP9aQgjraD4RHoiM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GeBi1GypDzFndf2zoqBXNKaYStly77TVzNgQX2yG8rQl8Hq3AkghbpDUjCT1pupKQ
         ss4Q67M9/XHuwLUBCg7+J7e0sZ4lQ9X9eRUXAcikcZLEKegx1fctUH9ss7W2dgorfE
         ZyGvEZqG9W8dXXiRN5/sj7Dxgwz1SyTZeVSY/Tig=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DD59611CE;
        Fri, 13 Sep 2019 21:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411988;
        bh=D72EJTD2RGe2SPhGafah7f7DzgpjP9aQgjraD4RHoiM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GeBi1GypDzFndf2zoqBXNKaYStly77TVzNgQX2yG8rQl8Hq3AkghbpDUjCT1pupKQ
         ss4Q67M9/XHuwLUBCg7+J7e0sZ4lQ9X9eRUXAcikcZLEKegx1fctUH9ss7W2dgorfE
         ZyGvEZqG9W8dXXiRN5/sj7Dxgwz1SyTZeVSY/Tig=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8DD59611CE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 07/14] drivers: irqchip: pdc: additionally set type in SPI config registers
Date:   Fri, 13 Sep 2019 15:59:15 -0600
Message-Id: <1568411962-1022-8-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIOs that can be configured as wakeup are routed to the PDC wakeup
interrupt controller and from there to the GIC interrupt controller. On
some QCOM SoCs, the interface to the GIC for wakeup capable GPIOs have
additional hardware registers that need to be configured as well to
match the trigger type of the GPIO. This register interfaces the PDC to
the GIC and therefore updated from the PDC driver.

Typically, the firmware intializes the interface registers for the
wakeup capable GPIOs with commonly used GPIO trigger type, but it is
possible that a platform may want to use the GPIO differently. So, in
addition to configuring the PDC, configure the interface registers as
well.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 4abd775..affb0bfa 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -18,6 +18,8 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <linux/qcom_scm.h>
+
 #define PDC_MAX_IRQS		168
 #define PDC_MAX_GPIO_IRQS	256
 
@@ -35,10 +37,20 @@ struct pdc_pin_region {
 	u32 cnt;
 };
 
+struct spi_cfg_regs {
+	union {
+		u64 start;
+		void __iomem *base;
+	};
+	resource_size_t size;
+	bool scm_io;
+};
+
 static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
+static struct spi_cfg_regs *spi_cfg;
 
 static void pdc_reg_write(int reg, u32 i, u32 val)
 {
@@ -100,6 +112,57 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
 	irq_chip_unmask_parent(d);
 }
 
+static u32 __spi_pin_read(unsigned int pin)
+{
+	void __iomem *cfg_reg = spi_cfg->base + pin * 4;
+	u64 scm_cfg_reg = spi_cfg->start + pin * 4;
+
+	if (spi_cfg->scm_io) {
+		unsigned int val;
+
+		qcom_scm_io_readl(scm_cfg_reg, &val);
+		return val;
+	} else {
+		return readl(cfg_reg);
+	}
+}
+
+static void __spi_pin_write(unsigned int pin, unsigned int val)
+{
+	void __iomem *cfg_reg = spi_cfg->base + pin * 4;
+	u64 scm_cfg_reg = spi_cfg->start + pin * 4;
+
+	if (spi_cfg->scm_io)
+		qcom_scm_io_writel(scm_cfg_reg, val);
+	else
+		writel(val, cfg_reg);
+}
+
+static int spi_configure_type(irq_hw_number_t hwirq, unsigned int type)
+{
+	int spi = hwirq - 32;
+	u32 pin = spi / 32;
+	u32 mask = BIT(spi % 32);
+	u32 val;
+	unsigned long flags;
+
+	if (!spi_cfg)
+		return 0;
+
+	if (pin * 4 > spi_cfg->size)
+		return -EFAULT;
+
+	raw_spin_lock_irqsave(&pdc_lock, flags);
+	val = __spi_pin_read(pin);
+	val &= ~mask;
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		val |= mask;
+	__spi_pin_write(pin, val);
+	raw_spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return 0;
+}
+
 /*
  * GIC does not handle falling edge or active low. To allow falling edge and
  * active low interrupts to be handled at GIC, PDC has an inverter that inverts
@@ -137,7 +200,9 @@ enum pdc_irq_config_bits {
 static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 {
 	int pin_out = d->hwirq;
+	int parent_hwirq = d->parent_data->hwirq;
 	enum pdc_irq_config_bits pdc_type;
+	int ret;
 
 	if (pin_out == GPIO_NO_WAKE_IRQ)
 		return 0;
@@ -168,6 +233,11 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 
 	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
 
+	/* Additionally, configure (only) the GPIO in the f/w */
+	ret = spi_configure_type(parent_hwirq, type);
+	if (ret)
+		return ret;
+
 	return irq_chip_set_type_parent(d, type);
 }
 
@@ -354,6 +424,7 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
+	struct resource res;
 	int ret;
 
 	pdc_base = of_iomap(node, 0);
@@ -384,6 +455,27 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		goto fail;
 	}
 
+	ret = of_address_to_resource(node, 1, &res);
+	if (!ret) {
+		spi_cfg = kcalloc(1, sizeof(*spi_cfg), GFP_KERNEL);
+		if (!spi_cfg) {
+			ret = -ENOMEM;
+			goto remove;
+		}
+		spi_cfg->scm_io = of_find_property(node,
+						   "qcom,scm-spi-cfg", NULL);
+		spi_cfg->size = resource_size(&res);
+		if (spi_cfg->scm_io) {
+			spi_cfg->start = res.start;
+		} else {
+			spi_cfg->base = ioremap(res.start, spi_cfg->size);
+			if (!spi_cfg->base) {
+				ret = -ENOMEM;
+				goto remove;
+			}
+		}
+	}
+
 	pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
 						      IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
 						      PDC_MAX_GPIO_IRQS,
@@ -401,6 +493,7 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 
 remove:
 	irq_domain_remove(pdc_domain);
+	kfree(spi_cfg);
 fail:
 	kfree(pdc_region);
 	iounmap(pdc_base);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

