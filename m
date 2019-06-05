Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E6135677
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 07:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfFEFza (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 01:55:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39226 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFEFza (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 01:55:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x555tS02101476;
        Wed, 5 Jun 2019 00:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559714128;
        bh=tIJbe7Fp1BD7LDlYGApM8nyEkRguoaTkqCrr26aUqco=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NLvmv78igSNog9DS2vN93FGEY/wz+6OcjcILHXF0rTRZPI6EmPmMghMIllTbYgKvG
         Rv7f29CcZ2sCmRnA5lUx0rvxIzhZGx5KfYcB55D0dDYWZQO1/lrKAkUI6fnJ8FczDP
         3SoG5Hm95qZrSkBnEO1jOWzr5Da8Rom5ZhW2l1kQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x555tRsv049082
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 00:55:28 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 00:55:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 00:55:27 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x555tMHc049531;
        Wed, 5 Jun 2019 00:55:25 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <lokeshvutla@ti.com>, <linux-gpio@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] gpio: davinci: Fix the compiler warning with ARM64 config enabled
Date:   Wed, 5 Jun 2019 11:25:18 +0530
Message-ID: <20190605055519.24079-2-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605055519.24079-1-j-keerthy@ti.com>
References: <20190605055519.24079-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the compiler warning with ARM64 config enabled
as the current mask assumes 32 bit by default.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 3bbf5804bd11..0977590eb996 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -297,7 +297,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 static void gpio_irq_disable(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
-	u32 mask = (u32) irq_data_get_irq_handler_data(d);
+	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 
 	writel_relaxed(mask, &g->clr_falling);
 	writel_relaxed(mask, &g->clr_rising);
@@ -306,7 +306,7 @@ static void gpio_irq_disable(struct irq_data *d)
 static void gpio_irq_enable(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
-	u32 mask = (u32) irq_data_get_irq_handler_data(d);
+	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
 	unsigned status = irqd_get_trigger_type(d);
 
 	status &= IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
@@ -447,7 +447,7 @@ davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 				"davinci_gpio");
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 	irq_set_chip_data(irq, (__force void *)g);
-	irq_set_handler_data(irq, (void *)__gpio_mask(hw));
+	irq_set_handler_data(irq, (void *)(uintptr_t)__gpio_mask(hw));
 
 	return 0;
 }
-- 
2.17.1

