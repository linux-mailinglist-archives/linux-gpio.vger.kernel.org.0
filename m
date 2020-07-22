Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B725229780
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 13:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgGVLds (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 07:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgGVLdr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 07:33:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACABC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 04:33:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so2106794ljc.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=02kJz3V5Ev1Aa6woh5D3vNRvs2lccGTZkiG4e0/umxQ=;
        b=xEMmQgyWPZNl0EoPsRkOdieA2kbKGNGkItI5iey0DppynW2UsbfaEHaZn4WeVxdfTN
         /wn/wipq5nMMrkya8qR7epktIMk2Y1HPY17lnFBVih696t8BTnZr5TdyFWWG8TKi+8uo
         /kXB4soN11utEy0HNteyd1VwrHnYIVRD0RyyIaYFlYw9B9wefyMRCzW19SRPh7aO4pOF
         os8A70Y8Avb8+JuYFCPFwULP5xkxExymMwzetUHAk7hg+lyi60o8rn+qMof/2M5Zf9qe
         GPE2uedYUDK5ZqS4bcsFmLs558J73gL/8OzU3OKI0RXHDHP5jh4Qqb75sr+0ObzA5hOH
         J/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=02kJz3V5Ev1Aa6woh5D3vNRvs2lccGTZkiG4e0/umxQ=;
        b=p2OUDReKMk7WuGkbv8TKtf8ooS9+FjM1R5raH4wazCSWrHc30R2DycM5R8uflrlkXW
         uRJ6EHsuYRwivsEre3GTmb6kyTGx91OjCelZ1x65JDBXiECxyeYix0EHF2oj/wzo/cQS
         tLBXJq18h1zHt8szT22cZ9OkOW8LQ+gOSoj2Osl8G5YOEpVxfdff0cowYeZksXQFIjNO
         3JSSccRjpbGiNDdbIiHSlulQNncrOch9U5WrCeV+Z+/V5YNuyBk+ikROihLFSJem/S+B
         zuzA8tlh4ZxlPDfvEUUFmFUFRK4pzsdanZnMt0A1oOIAU+8FyH8jfM2qmIrNJL9zxppX
         CbRA==
X-Gm-Message-State: AOAM532mQUE56LKyWWHXcx5fuxF8jF1aXOM1auXVCiMMQ2tkzN92Q/sF
        M5HEUH7GXkjPvHzgH3P4rQOBQukd0wB3/w==
X-Google-Smtp-Source: ABdhPJxpyta2ymWwBMAHi5Fc74P2O/RD45QUnK3W1Okbim4gm4jP3SgC1j6t3ZRQMMDlkaVP4jgFwg==
X-Received: by 2002:a2e:8016:: with SMTP id j22mr14871912ljg.405.1595417625084;
        Wed, 22 Jul 2020 04:33:45 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id d23sm7915868lfm.85.2020.07.22.04.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:33:44 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Use irqchip template
Date:   Wed, 22 Jul 2020 13:31:41 +0200
Message-Id: <20200722113141.243163-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit call to gpiochip_irqchip_add().

The irqchip is instead added while adding the gpiochip.

Cc: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-rcar.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index eac1582c70da..3ef19cef8da9 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -438,6 +438,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	struct resource *irq;
 	struct gpio_chip *gpio_chip;
 	struct irq_chip *irq_chip;
+	struct gpio_irq_chip *girq;
 	struct device *dev = &pdev->dev;
 	const char *name = dev_name(dev);
 	unsigned int npins;
@@ -496,19 +497,21 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
 	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
 
+	girq = &gpio_chip->irq;
+	girq->chip = irq_chip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
 	ret = gpiochip_add_data(gpio_chip, p);
 	if (ret) {
 		dev_err(dev, "failed to add GPIO controller\n");
 		goto err0;
 	}
 
-	ret = gpiochip_irqchip_add(gpio_chip, irq_chip, 0, handle_level_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev, "cannot add irqchip\n");
-		goto err1;
-	}
-
 	p->irq_parent = irq->start;
 	if (devm_request_irq(dev, irq->start, gpio_rcar_irq_handler,
 			     IRQF_SHARED, name, p)) {
-- 
2.26.2

