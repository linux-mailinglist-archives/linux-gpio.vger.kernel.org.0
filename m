Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF4A97EB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 03:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIEBRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 21:17:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37523 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIEBRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 21:17:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id y9so581008pfl.4;
        Wed, 04 Sep 2019 18:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6xBV7lQcJGLCdJ1DprCQZXPKzQ/B4slHcpqoJmoHHX0=;
        b=DsoLW11sIiOue6shE75Kxyfal48BeGlDYtuQ+uPzHfgLzR4wvmdRUekonS4w+/F3I5
         KVLSfhFMcJ5lVUmtJbWWFyyGLz7SfEwmIXgvuB06UoufGIWtcI0TJVARStBpb3TjqDHd
         PhiPHPhRdYmfDRTHhqLMoJy2tooTqkyEo1Q8krWJHMsGqC4Xs4EvMjd/0LbcFH1uEPgn
         FdPmGFI6GedTiP4ugFuXKQiYJlXR5H3QhdzXUjdO19ZmlJQz6ulRVnLwJ7b/nXcMdnYO
         N0wO0JPWewff3GpxQbkgX8XPXQU/kVmto4x5XE25Jc6kwVROiGxA9zWZosi3eBpZ/scA
         dzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6xBV7lQcJGLCdJ1DprCQZXPKzQ/B4slHcpqoJmoHHX0=;
        b=Oo7Sp6+ZkkmZvC0vIG0XEEHl2zfpJcx6W0HpL/s3icX1zwmIVc4ZAH0YeNB6qqVGHo
         mHv5SQkloapYpFZJA+lYPhnTgftGzlQDpS45PXoBHQOUt0IdZrtcU1IWnysQA4i21iAP
         PRXEzTdSjWanbBvTpXU6koAdFGSpWb6FzEpYGHTdbK2mWN32UFtJ9rJZQy9KRESoEJmA
         7+x2M8PMED8tkXF3NTQTuXo12XI8cLUyRdPbZC65CWKiTBnGvW1PZMp3et3yk5Crmvgr
         yAP7mrluvdt9s7mU06YNHCvlMW0pesW9PAqW8mQggv3/SUSmK5lt7NgSv4wWA7kRbhPu
         WYuw==
X-Gm-Message-State: APjAAAVx7ejbeaNq7jXy61p41ZeG3bI7QwqxSS/xzmo5NkYUOpCEFZed
        FFe3bD/Je4UGnu0Z9If5Y/g=
X-Google-Smtp-Source: APXvYqyLU0ir1KiY3O4QnlY1CFxOjeaDqE6YSk1Fqt8q7NGwnUf983bmjsuDk0IW04G2/KhqGC4LYw==
X-Received: by 2002:a17:90a:ca02:: with SMTP id x2mr1077306pjt.98.1567646236325;
        Wed, 04 Sep 2019 18:17:16 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id f12sm294387pgq.52.2019.09.04.18.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 18:17:15 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] gpio/aspeed: Setup irqchip dynamically
Date:   Thu,  5 Sep 2019 11:17:01 +1000
Message-Id: <20190905011701.15981-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is in preparation for adding ast2600 support. The ast2600 requires two
GPIO drivers which each need their own irqchip.

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

