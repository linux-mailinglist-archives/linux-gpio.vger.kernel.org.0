Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98094A7B47
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 08:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbfIDGNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 02:13:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35230 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfIDGNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 02:13:21 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so10648162pgv.2;
        Tue, 03 Sep 2019 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0R4od+wuMr+NDzF1+z+ZTrIyJPL7Gs58v3spHNx+2Ww=;
        b=I9GQo1LKddFj+zeh1M5ALKgcSoPfUmH8J1F6u4tihZK///JmHS0Rut+73m0FesKYOV
         /f7RfOB7hF8MdsxLiaIj7UOr99ai6wOj2P1bVUnzKQWBL8Lh3CukghsKchIWSRF+1Ega
         0GoKw0T3XUSIpclPFQVKsuWJEgi1wLOg92abAbggKjGZHV3yWpxF90rBtcOtLScznd+t
         Kr1xXyg1pRjscBMPIua94ge1T6WL3gLNll8w0I8RBIcKOaKfG79CHLO4w5BgWXyUMaCS
         61/lrsEh6AOtynDw5tRsEX2IoAz0Ay3NP6OJcGLtBKfSJ0m8gDFa2r0ExuEiGKv1y3Bh
         mjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0R4od+wuMr+NDzF1+z+ZTrIyJPL7Gs58v3spHNx+2Ww=;
        b=pFYcgtSf5UFlFZQocAUr/mmdtwWkCbzx3wpgUbACNBCDfE5Ku+50i3pkHDy31LAZzY
         v1qrury9kLisIX5jKvvYyzmjeTkKDRJEecsL/pqLMorLOnkD+Y+iYPK49BsgE4yovb+y
         E+u1T0NPrS+pgit1Wk5W45VhpdMJZ3Gd0Y2N+ADuqSbuYi+uam3jssSgVJY7gMJQ2fHV
         WK5N8KJHu+QXw4cLFP0O/oz4w0qd4bb9vJwpMSDxAg+sscQ2/4nr56ijpYxbjrnNZjZ6
         wDiWYZZnl0U8ezgdV0cGbf3F4eGZWB2Eb2Eut6lucK2c2SuiXr0tb7r2ItBmAmud4PGZ
         gUJg==
X-Gm-Message-State: APjAAAUzPOHiFMUzwXXryzHVXsHEZg8zbLhMITEhvnNfl0xdKwZaO69x
        mbQYoQNdKtWtQWTFQh8kib0=
X-Google-Smtp-Source: APXvYqyrSsRag5fFUjnjFpISMekXcJebSX0p+DbmDDo9Ojs7XfwNCS4cd2mq5Gn2rGzkdbFERUMFEg==
X-Received: by 2002:a62:e205:: with SMTP id a5mr44807409pfi.137.1567577600668;
        Tue, 03 Sep 2019 23:13:20 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 23:13:20 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au,
        Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PATCH 2/4] gpio/aspeed: Setup irqchip dynamically
Date:   Wed,  4 Sep 2019 16:12:43 +1000
Message-Id: <20190904061245.30770-2-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is in preparation for ast2600 as we will have two gpio drivers
which need their own irqchip.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 77752b2624e8..60ab042c9129 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -52,6 +52,7 @@ struct aspeed_gpio_config {
  */
 struct aspeed_gpio {
 	struct gpio_chip chip;
+	struct irq_chip irqc;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
@@ -681,14 +682,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
-static struct irq_chip aspeed_gpio_irqchip = {
-	.name		= "aspeed-gpio",
-	.irq_ack	= aspeed_gpio_irq_ack,
-	.irq_mask	= aspeed_gpio_irq_mask,
-	.irq_unmask	= aspeed_gpio_irq_unmask,
-	.irq_set_type	= aspeed_gpio_set_type,
-};
-
 static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 {
 	const struct aspeed_bank_props *props = gpio->config->props;
@@ -1192,7 +1185,12 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 		gpio->irq = rc;
 		girq = &gpio->chip.irq;
-		girq->chip = &aspeed_gpio_irqchip;
+		girq->chip = &gpio->irqc;
+		girq->chip->name = dev_name(&pdev->dev);
+		girq->chip->irq_ack = aspeed_gpio_irq_ack;
+		girq->chip->irq_mask = aspeed_gpio_irq_mask;
+		girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
+		girq->chip->irq_set_type = aspeed_gpio_set_type;
 		girq->parent_handler = aspeed_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,
-- 
2.20.1

