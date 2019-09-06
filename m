Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74E3AB271
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 08:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730440AbfIFG0z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 02:26:55 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45271 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfIFG0y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 02:26:54 -0400
Received: by mail-pg1-f196.google.com with SMTP id 4so2873049pgm.12;
        Thu, 05 Sep 2019 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBz/Nw09bo2+Nxy27B6Bnst72+LgNmbIsMhxAo7ybD0=;
        b=aUMqxfSdSnkuwGPqLRjheiUFzikOfV2fc0xU5mynUICbJ06VKhxLcszMC7XIGhR+9a
         LCox84h/CIDLKI1gSOXrLAHb3iR6w4VFUPCGACcdJ6Ma0OQwvRE2K/M2jl30aGnGEUHh
         qtdsJvleLml70aYLbf52MZduXl+OBtmnBO7lfJ5+23BRakN9poArHpHZ7Vp3xIAEP4Ip
         IKpv9txRDkokW+UwGti5JJzeptzCSA4SXd8fNu4C6HaAUyOdEMbrrwRHBDnX2D1FweAj
         5DG0jbewwAw/rv0ZkvJaoVxtqR6FcgG8OKwBRl3aqO1YWYoIVxWHLYc9xe36ZLlCKuq8
         nnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBz/Nw09bo2+Nxy27B6Bnst72+LgNmbIsMhxAo7ybD0=;
        b=LD0Dgs7/gCXWkOHszPhgTgmBJ2OpQRIJrPLu0v58olzYWkz9991zilQHdXZwDDiKuM
         vGGCYzwWZ/mM33ro1czNCBD63dJlOSZJdn6bWaMA5/CbTZOfSLriXd+jHaHupWtQW4iC
         Zv23bG+S3gMkdaoPK8DxkBG4SOFyvQSRT5EUH58EHiQYQgQrRbZOI1WAICJfQC6n+zkd
         9/AUozEIv5QZLyD2+GY2bDt8GCPTlC1gohy1jXBXcM8oS9jjbji6h5CHrorcjM0F1ICW
         37HJPukQe/chlHSpGlQg2a5utqX8HBnCAbaxq5jM6q61mcZRyQvlHfkzi9t5wwdjRlf1
         MpRA==
X-Gm-Message-State: APjAAAXRQTGMAyg+YzTGONA03fPAobCFV3+18yaJY9zY3gBlR8D8kzlf
        wKaK0ZE9nRNZzP9QY3Ztkjg=
X-Google-Smtp-Source: APXvYqxBZZ2BelsDovsxHdtpDaLyiv2LFGl8lKiDGpiVUZV8DHdc7jIWEf8BdGHl1IAd2NAHni+KZA==
X-Received: by 2002:a63:6904:: with SMTP id e4mr6538279pgc.321.1567751214158;
        Thu, 05 Sep 2019 23:26:54 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id a20sm3109704pfo.33.2019.09.05.23.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 23:26:53 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/5] gpio/aspeed: Setup irqchip dynamically
Date:   Fri,  6 Sep 2019 16:26:44 +1000
Message-Id: <20190906062644.13445-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is in preparation for adding ast2600 support. The ast2600 SoC
requires two instances of the GPIO driver as it has two GPIO
controllers. Each instance needs it's own irqchip.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b83e23aecd18..16c6eaf70857 100644
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

