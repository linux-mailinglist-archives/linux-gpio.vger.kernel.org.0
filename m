Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 837223BA8F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388119AbfFJRMF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57646 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387415AbfFJRMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBx7q056908;
        Mon, 10 Jun 2019 12:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186719;
        bh=5bloGzVqTd/4YnCS64tBw8jwXGnghbwGp6k4yGdxJeA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=w8e0dO06BkOe0ffohVsy1LgFdYaLupvdHH20O2w8M/IUtaS8w66zYKf/mlSTyxrlQ
         nSBSw5GIv2gnEE5ZfdaN4v+GhxUCjy1s+Yiv0N6HevoCpoQpLeG1d05p2K3mgTR8sz
         fecc+O2FIzMUYiQq0vuttv+24ah/71fTaKxMdRS8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBxaQ080097
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBvja038748;
        Mon, 10 Jun 2019 12:11:58 -0500
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
Subject: [PATCH-next 07/20] gpio: gpio-omap: simplify omap_gpio_get_direction()
Date:   Mon, 10 Jun 2019 20:10:50 +0300
Message-ID: <20190610171103.30903-8-grygorii.strashko@ti.com>
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

Architectures are single-copy atomic, which means that simply reading
a register is an inherently atomic operation.  There is no need to
take a spinlock here.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index cc320d09d074..44a4287cce9e 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -953,17 +953,10 @@ static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_bank *bank;
-	unsigned long flags;
-	void __iomem *reg;
-	int dir;
+	struct gpio_bank *bank = gpiochip_get_data(chip);
 
-	bank = gpiochip_get_data(chip);
-	reg = bank->base + bank->regs->direction;
-	raw_spin_lock_irqsave(&bank->lock, flags);
-	dir = !!(readl_relaxed(reg) & BIT(offset));
-	raw_spin_unlock_irqrestore(&bank->lock, flags);
-	return dir;
+	return !!(readl_relaxed(bank->base + bank->regs->direction) &
+		  BIT(offset));
 }
 
 static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
-- 
2.17.1

