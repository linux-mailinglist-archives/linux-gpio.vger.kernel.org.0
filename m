Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3393BA83
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387923AbfFJRLj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:11:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47274 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387415AbfFJRLj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:11:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBWdk069004;
        Mon, 10 Jun 2019 12:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186692;
        bh=WNL2UJTUUU6SRtjGfZDQQT6BCUW7ZKQ0up9DfYalQrQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=eOXivUP5JFRoF9lmxBpqUtLUkDwr2f+12z1wTyqHIA8KybZJ54m1wXTmtQZyawtU4
         /ptB6skik/2qEEw8lclyxvcFnvBQVeVAHgYAc8DxqaB7BQFSHJ1W5Ai3ZN46M3iIC+
         g+esuqP6XtHjWdK4+dGdcpi0YMk31HrIbXU1Og4k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBWlr079763
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:32 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBVlC066255;
        Mon, 10 Jun 2019 12:11:31 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Russell King <rmk@arm.linux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH-next 03/20] gpio: gpio-omap: remove remainder of list management
Date:   Mon, 10 Jun 2019 20:10:46 +0300
Message-ID: <20190610171103.30903-4-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610171103.30903-1-grygorii.strashko@ti.com>
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>

Commit c4791bc6e3a6 ("gpio: omap: drop omap_gpio_list") removed the
list head and addition to the list head of each gpio bank, but failed
to remove the list_del() call and the node inside struct gpio_bank.
Remove these too.

Fixes: c4791bc6e3a6 ("gpio: omap: drop omap_gpio_list")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 44b214e5cefb..708a135e2f0c 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -47,7 +47,6 @@ struct gpio_regs {
 };
 
 struct gpio_bank {
-	struct list_head node;
 	void __iomem *base;
 	int irq;
 	u32 non_wakeup_gpios;
@@ -1641,7 +1640,6 @@ static int omap_gpio_remove(struct platform_device *pdev)
 	struct gpio_bank *bank = platform_get_drvdata(pdev);
 
 	cpu_pm_unregister_notifier(&bank->nb);
-	list_del(&bank->node);
 	gpiochip_remove(&bank->chip);
 	pm_runtime_disable(&pdev->dev);
 	if (bank->dbck_flag)
-- 
2.17.1

