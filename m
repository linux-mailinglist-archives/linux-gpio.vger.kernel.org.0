Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B991142E8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 15:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbfLEOo6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 09:44:58 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52620 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729236AbfLEOo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 09:44:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5Eitp7081175;
        Thu, 5 Dec 2019 08:44:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575557095;
        bh=sOCTH24J+stVZ8v19yIhFWjSYMEcT+jN4i32UsSYr5k=;
        h=From:To:CC:Subject:Date;
        b=Sp8EDnIhEfbgbSs+fGeZ0ZzbICTm04srY0/YbfXSFNNFbZqWjxV1JB+3UKO7HwMfx
         xdnfDTPkbZhTQga1/1k+5leNE0GcfaUmdL7VwOjVwsu5A+2QEdcFGmXKO7sTfjHbhE
         4GuKlERzm5iuyGOBdgRSUQC2OmSuVkQCQKA5WVqs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB5EitTm016762
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Dec 2019 08:44:55 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 08:44:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 08:44:54 -0600
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5Eipnl115784;
        Thu, 5 Dec 2019 08:44:52 -0600
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] gpio: pca953x: Read irq trigger type from DT
Date:   Thu, 5 Dec 2019 20:15:08 +0530
Message-ID: <20191205144508.31339-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of hardcoding irq trigger type to IRQF_TRIGGER_LOW, let's
respect settings specified in DT. Default to IRQF_TRIGGER_LOW,
if DT does not provide a flag.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/gpio/gpio-pca953x.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6652bee01966..e0e2a77ef6ad 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -744,6 +744,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	struct irq_chip *irq_chip = &chip->irq_chip;
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
+	unsigned long irqflags;
 	int ret;
 
 	if (!client->irq)
@@ -768,10 +769,14 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	bitmap_and(chip->irq_stat, irq_stat, reg_direction, chip->gpio_chip.ngpio);
 	mutex_init(&chip->irq_lock);
 
+	irqflags = irq_get_trigger_type(client->irq);
+	if (irqflags == IRQF_TRIGGER_NONE)
+		irqflags = IRQF_TRIGGER_LOW;
+	irqflags |= IRQF_ONESHOT | IRQF_SHARED;
+
 	ret = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, pca953x_irq_handler,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT |
-					IRQF_SHARED,
+					irqflags,
 					dev_name(&client->dev), chip);
 	if (ret) {
 		dev_err(&client->dev, "failed to request irq %d\n",
-- 
2.24.0

