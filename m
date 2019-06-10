Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F27D3BAAE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388522AbfFJRNC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:13:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44568 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387500AbfFJRNC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:13:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCqad121864;
        Mon, 10 Jun 2019 12:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186772;
        bh=xjRoLjnZEnJ71XstATMS/Qw07MjkUWg7z73ux8r3eP4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hKs2ui5xVlE0RGBLpR5vSl8TSEXRTmLazxkxMa6607ZggvtbLK+6GpS+rd1qDHsLQ
         EfxfuJq/2pG+85yrxvFltTycXKGIX0/2MJTDD7VUWCfeIFPlYTT2EZOdJHvIvJa+pU
         SGB1S2vPr6j/B1YgbMegGZIbaAyQz6/xUc0tAEl8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCqSO011507
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCp2L067873;
        Mon, 10 Jun 2019 12:12:52 -0500
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
Subject: [PATCH-next 15/20] gpio: gpio-omap: remove dataout variation in context handling
Date:   Mon, 10 Jun 2019 20:10:58 +0300
Message-ID: <20190610171103.30903-16-grygorii.strashko@ti.com>
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

When a GPIO block has the set/clear dataout registers implemented, it
also has the normal dataout register implemented. Reading this register
reads the current GPIO output state, and writing it sets the GPIOs to
the explicit state. This is the behaviour that we want when saving and
restoring the context, so use the dataout register exclusively.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a90e27d7ce5e..c24a91b2df97 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1087,11 +1087,7 @@ static void omap_gpio_init_context(struct gpio_bank *p)
 	p->context.fallingdetect = readl_relaxed(base + regs->fallingdetect);
 	p->context.irqenable1	= readl_relaxed(base + regs->irqenable);
 	p->context.irqenable2	= readl_relaxed(base + regs->irqenable2);
-
-	if (regs->set_dataout && p->regs->clr_dataout)
-		p->context.dataout = readl_relaxed(base + regs->set_dataout);
-	else
-		p->context.dataout = readl_relaxed(base + regs->dataout);
+	p->context.dataout	= readl_relaxed(base + regs->dataout);
 
 	p->context_valid = true;
 }
@@ -1109,11 +1105,7 @@ static void omap_gpio_restore_context(struct gpio_bank *bank)
 				bank->base + bank->regs->risingdetect);
 	writel_relaxed(bank->context.fallingdetect,
 				bank->base + bank->regs->fallingdetect);
-	if (bank->regs->set_dataout && bank->regs->clr_dataout)
-		writel_relaxed(bank->context.dataout,
-				bank->base + bank->regs->set_dataout);
-	else
-		writel_relaxed(bank->context.dataout,
+	writel_relaxed(bank->context.dataout,
 				bank->base + bank->regs->dataout);
 	writel_relaxed(bank->context.oe, bank->base + bank->regs->direction);
 
-- 
2.17.1

