Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A38EF3BA9C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388281AbfFJRM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44446 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387898AbfFJRM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:26 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCG0p121555;
        Mon, 10 Jun 2019 12:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186736;
        bh=mRBjHVSGVjmh06j3YRgbF6k6lDaugFDHiLDKP+4u0kM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mANGvUlk0EVPNp5Z1gQWmbIavoQghIE9hfDvbe6QKk8UJS37FVmxLbZBaogKEF9eJ
         ZfZRJ9iO1WmCHcOICvLc3rw4UQnM267VHI9znNJZZUYZkARaPl4OBHVU8xckyiEdm9
         vlFM1zrhv0fmwAfPxn8qYMkqu6Oc6DezuHGewRD0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCGXe011053
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:16 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCBGW051427;
        Mon, 10 Jun 2019 12:12:11 -0500
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
Subject: [PATCH-next 09/20] gpio: gpio-omap: simplify get_multiple()
Date:   Mon, 10 Jun 2019 20:10:52 +0300
Message-ID: <20190610171103.30903-10-grygorii.strashko@ti.com>
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

There is no reason to have helper functions to read the datain and
dataout registers when they are only used in one location.  Simplify
this code to make it more readable.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index bf1e6f1d0de7..a26decc5c611 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -175,22 +175,6 @@ static void omap_set_gpio_dataout_mask_multiple(struct gpio_bank *bank,
 	bank->context.dataout = l;
 }
 
-static unsigned long omap_get_gpio_datain_multiple(struct gpio_bank *bank,
-					      unsigned long *mask)
-{
-	void __iomem *reg = bank->base + bank->regs->datain;
-
-	return readl_relaxed(reg) & *mask;
-}
-
-static unsigned long omap_get_gpio_dataout_multiple(struct gpio_bank *bank,
-					       unsigned long *mask)
-{
-	void __iomem *reg = bank->base + bank->regs->dataout;
-
-	return readl_relaxed(reg) & *mask;
-}
-
 static inline void omap_gpio_rmw(void __iomem *base, u32 reg, u32 mask, bool set)
 {
 	int l = readl_relaxed(base + reg);
@@ -987,18 +971,20 @@ static int omap_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 				  unsigned long *bits)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
-	void __iomem *reg = bank->base + bank->regs->direction;
-	unsigned long in = readl_relaxed(reg), l;
+	void __iomem *base = bank->base;
+	u32 direction, m, val = 0;
+
+	direction = readl_relaxed(base + bank->regs->direction);
 
-	*bits = 0;
+	m = direction & *mask;
+	if (m)
+		val |= readl_relaxed(base + bank->regs->datain) & m;
 
-	l = in & *mask;
-	if (l)
-		*bits |= omap_get_gpio_datain_multiple(bank, &l);
+	m = ~direction & *mask;
+	if (m)
+		val |= readl_relaxed(base + bank->regs->dataout) & m;
 
-	l = ~in & *mask;
-	if (l)
-		*bits |= omap_get_gpio_dataout_multiple(bank, &l);
+	*bits = val;
 
 	return 0;
 }
-- 
2.17.1

