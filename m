Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA9823BABC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfFJRNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:13:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44604 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728549AbfFJRNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:13:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHDBKD121923;
        Mon, 10 Jun 2019 12:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186791;
        bh=SNBUl0AgT9mDHDFh2idiGb/Cxs8x27UMIHDIZ9dVyA0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bk/jLN7JU0Xwhpv1oxdpoIqxrYHN0mmIkWOUuyHSkPnX7Iy0b/CX2pdRKgdZJlo9X
         iUOG/vnrJTs8sX/Sh+CH9BAWQVbHcmbFOFQ8+9FkkKMogcmkmr29K/cZ+jWNYHwRsa
         GDzxciiiJaBIMTr3GcIgfKh0sPrpGkDm+CZ74HLw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHDA4b047205
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:13:10 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:13:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:13:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD9fs052679;
        Mon, 10 Jun 2019 12:13:10 -0500
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
Subject: [PATCH-next 20/20] gpio: gpio-omap: clean up register access in omap2_set_gpio_debounce()
Date:   Mon, 10 Jun 2019 20:11:03 +0300
Message-ID: <20190610171103.30903-21-grygorii.strashko@ti.com>
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

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 94b10dfbff3f..52592eac0895 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -181,7 +181,6 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
 static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 				   unsigned debounce)
 {
-	void __iomem		*reg;
 	u32			val;
 	u32			l;
 	bool			enable = !!debounce;
@@ -198,8 +197,7 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 	l = BIT(offset);
 
 	clk_enable(bank->dbck);
-	reg = bank->base + bank->regs->debounce;
-	writel_relaxed(debounce, reg);
+	writel_relaxed(debounce, bank->base + bank->regs->debounce);
 
 	val = omap_gpio_rmw(bank->base + bank->regs->debounce_en, l, enable);
 	bank->dbck_enable_mask = val;
-- 
2.17.1

