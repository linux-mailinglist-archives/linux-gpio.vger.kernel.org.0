Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDA682C7D5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 15:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfE1NhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 09:37:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37098 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfE1NhB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 09:37:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id h1so6134579wro.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pKi5I0CJ2X5BwXo9XUNw8Vf2df15TmcuH8E+kJajjPM=;
        b=F8I9p3bL+LGHWYM0cDRoIfv/oll5sukRT/lGhl09pcWmcIIg4JN0g0+DsdYLJRi2bP
         yskq1Sp0jQ5h1tBlreOvMQ2S8ubx1qO7Rmr/FH7Yt4xkT8roE4MAlc1hqk7ak5TzxwXE
         tOhQye6SUer1FeoaD/NAdqeRYEleErUJj0NhkYvRmswuWizzRI0SpbwWHu+D0KaS+ate
         tII4sHG+2uvOvpLawOtJ3an3bKhVdBR1fs1BV/lvtEKVyVUQUPmUnsSrxD+1Us5Bqxpb
         Y1/0drDRdtcQq5eNKk7rC7S/uNcwwcBwpiV+i27LB2FbvGeygDTwCxh2VB4w8NNqmssC
         Htdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pKi5I0CJ2X5BwXo9XUNw8Vf2df15TmcuH8E+kJajjPM=;
        b=BbskEotfBPKt1ND+ck1uqlDDlDsafa2PcaICY9kVL8Oj3CnL77J0ut7m9suv8/jc55
         0J9mV6RKZN2uNyXpzWtPImX5SrayAboomy+cXmxBWeDqIjBbuqJY1qv3HmX6lV90RuAF
         VdwS2iQ3fJ+ATN8Tnu3V/t9bD0EzLdhM/8ZlXopVYn96iOnBrQChJLoGGuhTitSzJtID
         +rRQ9/4gx2r+wxOVAcxXoJf2r3ZMXEXgyamLJAapFFmc/6f/QlrNwPsVipZqXUpBcz6c
         27Z1rwm+dd69imGfTtGpR56B5EV5XPE5Xk+qaOQU+dz2ie6cRqr0XqA7bSGJUyoVQi/L
         nSCA==
X-Gm-Message-State: APjAAAV7xk+nUoANr41UvVl/tf/En6UfbAkKt8RcN4v1+kkQ7rx/AGyM
        OGWn52WRoiJawC5MFGU1J7lfXQ==
X-Google-Smtp-Source: APXvYqwmPaw/5aVvrO07/ESg5V589aa2lSQdjDvQNt6Rzy1gIbgYVlnIWjxvFRsuKAOtEehBHTjUOw==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr5090883wro.178.1559050618688;
        Tue, 28 May 2019 06:36:58 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:c8c7:f81b:b165:1aa7])
        by smtp.gmail.com with ESMTPSA id 95sm8652668wrk.70.2019.05.28.06.36.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 06:36:58 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Subject: [PATCH v4 2/4] irqchip/exiu: preparatory refactor for ACPI support
Date:   Tue, 28 May 2019 15:36:45 +0200
Message-Id: <20190528133647.3362-3-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528133647.3362-1-ard.biesheuvel@linaro.org>
References: <20190528133647.3362-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In preparation of adding support for EXIU controller devices described
via ACPI, split the DT init function in a DT specific and a generic part,
where the latter will be reused for ACPI support later.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/irqchip/irq-sni-exiu.c | 66 +++++++++++++-------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index 1927b2f36ff6..fef7c2437dfb 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -1,7 +1,7 @@
 /*
  * Driver for Socionext External Interrupt Unit (EXIU)
  *
- * Copyright (c) 2017 Linaro, Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (c) 2017-2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  *
  * Based on irq-tegra.c:
  *   Copyright (C) 2011 Google, Inc.
@@ -167,35 +167,23 @@ static const struct irq_domain_ops exiu_domain_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-static int __init exiu_init(struct device_node *node,
-			    struct device_node *parent)
+static struct exiu_irq_data *exiu_init(const struct fwnode_handle *fwnode,
+				       struct resource *res)
 {
-	struct irq_domain *parent_domain, *domain;
 	struct exiu_irq_data *data;
 	int err;
 
-	if (!parent) {
-		pr_err("%pOF: no parent, giving up\n", node);
-		return -ENODEV;
-	}
-
-	parent_domain = irq_find_host(parent);
-	if (!parent_domain) {
-		pr_err("%pOF: unable to obtain parent domain\n", node);
-		return -ENXIO;
-	}
-
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	if (of_property_read_u32(node, "socionext,spi-base", &data->spi_base)) {
-		pr_err("%pOF: failed to parse 'spi-base' property\n", node);
+	if (fwnode_property_read_u32_array(fwnode, "socionext,spi-base",
+					   &data->spi_base, 1)) {
 		err = -ENODEV;
 		goto out_free;
 	}
 
-	data->base = of_iomap(node, 0);
+	data->base = ioremap(res->start, resource_size(res));
 	if (!data->base) {
 		err = -ENODEV;
 		goto out_free;
@@ -205,11 +193,44 @@ static int __init exiu_init(struct device_node *node,
 	writel_relaxed(0xFFFFFFFF, data->base + EIREQCLR);
 	writel_relaxed(0xFFFFFFFF, data->base + EIMASK);
 
+	return data;
+
+out_free:
+	kfree(data);
+	return ERR_PTR(err);
+}
+
+static int __init exiu_dt_init(struct device_node *node,
+			       struct device_node *parent)
+{
+	struct irq_domain *parent_domain, *domain;
+	struct exiu_irq_data *data;
+	struct resource res;
+
+	if (!parent) {
+		pr_err("%pOF: no parent, giving up\n", node);
+		return -ENODEV;
+	}
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		pr_err("%pOF: unable to obtain parent domain\n", node);
+		return -ENXIO;
+	}
+
+	if (of_address_to_resource(node, 0, &res)) {
+		pr_err("%pOF: failed to parse memory resource\n", node);
+		return -ENXIO;
+	}
+
+	data = exiu_init(of_node_to_fwnode(node), &res);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	domain = irq_domain_add_hierarchy(parent_domain, 0, NUM_IRQS, node,
 					  &exiu_domain_ops, data);
 	if (!domain) {
 		pr_err("%pOF: failed to allocate domain\n", node);
-		err = -ENOMEM;
 		goto out_unmap;
 	}
 
@@ -220,8 +241,7 @@ static int __init exiu_init(struct device_node *node,
 
 out_unmap:
 	iounmap(data->base);
-out_free:
 	kfree(data);
-	return err;
+	return -ENOMEM;
 }
-IRQCHIP_DECLARE(exiu, "socionext,synquacer-exiu", exiu_init);
+IRQCHIP_DECLARE(exiu, "socionext,synquacer-exiu", exiu_dt_init);
-- 
2.20.1

