Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435F1F3F3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 12:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfD3KN6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 06:13:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36946 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfD3KN6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 06:13:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UADb0M044378;
        Tue, 30 Apr 2019 05:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556619217;
        bh=aTzbaXCkitoyyObVP7/290TFOKbW9FPc/rnqgRyc600=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Fo3hbaZklQ3SvglTk45UBDsFWjKtxj09CmQGaGpRFV84SCc1gO/gmQA59MN28iT8Q
         nkG7vp1OVgOkcfOYJm9KnmRkBdYo4FUqst/LS7EG4HsaBj5TC9J00o2Ec0xJqaWqgp
         NlxhWfVqFOgmpqYIPT+Aed/J/jwsoxqR4KzoqMRs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UADbWm124840
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 05:13:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 05:13:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 05:13:37 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UAD0Y9085082;
        Tue, 30 Apr 2019 05:13:33 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <linus.walleij@linaro.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v8 07/14] gpio: thunderx: Use the default parent apis for {request,release}_resources
Date:   Tue, 30 Apr 2019 15:42:23 +0530
Message-ID: <20190430101230.21794-8-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430101230.21794-1-lokeshvutla@ti.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

thunderx_gpio_irq_{request,release}_resources apis are trying to
{request,release} resources on parent interrupt. There are default
apis doing the same. Use the default parent apis instead of writing
the same code snippet.

Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes since v7:
- None

 drivers/gpio/gpio-thunderx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 1306722faa5a..715371b5102a 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -363,22 +363,16 @@ static int thunderx_gpio_irq_request_resources(struct irq_data *data)
 {
 	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 	struct thunderx_gpio *txgpio = txline->txgpio;
-	struct irq_data *parent_data = data->parent_data;
 	int r;
 
 	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
 	if (r)
 		return r;
 
-	if (parent_data && parent_data->chip->irq_request_resources) {
-		r = parent_data->chip->irq_request_resources(parent_data);
-		if (r)
-			goto error;
-	}
+	r = irq_chip_request_resources_parent(data);
+	if (r)
+		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
 
-	return 0;
-error:
-	gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
 	return r;
 }
 
@@ -386,10 +380,8 @@ static void thunderx_gpio_irq_release_resources(struct irq_data *data)
 {
 	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 	struct thunderx_gpio *txgpio = txline->txgpio;
-	struct irq_data *parent_data = data->parent_data;
 
-	if (parent_data && parent_data->chip->irq_release_resources)
-		parent_data->chip->irq_release_resources(parent_data);
+	irq_chip_release_resources_parent(data);
 
 	gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
 }
-- 
2.21.0

