Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6F02B7F75
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 15:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgKROcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 09:32:01 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35394 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgKROcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 09:32:00 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIEVvHv105854;
        Wed, 18 Nov 2020 08:31:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605709917;
        bh=Ge2t0Q/igfymhtyh+miLyvCJaa9mUFCi6AQqk2DqRPY=;
        h=From:To:CC:Subject:Date;
        b=dyZ6L6zno3pphEK7k6qPejnGlXzFHMw0IDGw/s3l1sGHTsr1WhGr/gXEjzhrQL6Yv
         eERDmgrqAlRYODKqk0XWkTUme2UwP04E9lzdlvcRVVXWFF8LMwDNQXiTbrcRpcvLwB
         Qd6xdiLZo7p4pTKZuBo0ZdZcQXSbiihjTveI1/kU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIEVva5022768
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Nov 2020 08:31:57 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 08:31:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 08:31:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIEVu22079492;
        Wed, 18 Nov 2020 08:31:56 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpio: omap: handle deferred probe with dev_err_probe() for gpiochip_add_data()
Date:   Wed, 18 Nov 2020 16:31:49 +0200
Message-ID: <20201118143149.26067-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpiochip_add_data() may return -EPROBE_DEFER which is not handled
properly by TI GPIO driver and causes unnecessary boot log messages.

Hence, add proper deferred probe handling with new dev_err_probe() API.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index f7ceb2b11afc..41952bb818ad 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1049,11 +1049,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 	irq->first = irq_base;
 
 	ret = gpiochip_add_data(&bank->chip, bank);
-	if (ret) {
-		dev_err(bank->chip.parent,
-			"Could not register gpio chip %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(bank->chip.parent, ret, "Could not register gpio chip\n");
 
 	ret = devm_request_irq(bank->chip.parent, bank->irq,
 			       omap_gpio_irq_handler,
-- 
2.17.1

