Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09153584A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 10:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfFEICc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 04:02:32 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33656 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFEICb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 04:02:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5582Te0031348;
        Wed, 5 Jun 2019 03:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559721749;
        bh=tIJbe7Fp1BD7LDlYGApM8nyEkRguoaTkqCrr26aUqco=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kEnDeDQtf2vuCaqyqob9xhuYa5QXlcF5E0c8SoEDgVRUgDzGQwfnQrP2vxoWHsF5m
         sQklCl4F+YVX/hHWA/aElrUeJ129jJ5Y3nfQi3WQ2UEi/KnaOR4rc88c3REK8O4sdI
         ExSc9wVk73mpw9LFrzBs9NgLtivqft+pabhWAN5E=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5582TkV128402
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 03:02:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 03:02:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 03:02:29 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5582N7m041815;
        Wed, 5 Jun 2019 03:02:27 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <lokeshvutla@ti.com>, <linux-gpio@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] gpio: davinci: Fix the compiler warning with ARM64 config enabled
Date:   Wed, 5 Jun 2019 13:32:57 +0530
Message-ID: <20190605080259.2462-2-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605080259.2462-1-j-keerthy@ti.com>
References: <20190605080259.2462-1-j-keerthy@ti.com>
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

