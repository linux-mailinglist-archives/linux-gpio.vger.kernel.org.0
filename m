Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4443565331
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 10:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbfGKI3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 04:29:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33851 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbfGKI3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jul 2019 04:29:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so5295504wrm.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2019 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ay8SXsxgPAC6L6bgH21ewo8tdb5Od4VNACZbv44yG9w=;
        b=aUsvzX46KDlXXwqnkPb0imQiD0nMzyPwSGKL5BfNeS5hMlCKohKjIem6ItBNv0StfO
         Ip3XFviOSfMy66cnxz61guymK3ut2DRTJG0SAsGfv98lIzBjUwpw2GRoAfrgvXxCm8HB
         3ZTwcxwpSQleYbTVG2IwPO+U138gOtP75wS7yv94dKZj+BrboDTnn2mDcir71uaz7B+T
         i1RORGrmeO9Mycmv+xb4G9HIP21Z0/sAAld1mG1FgxMPQIlijiM33WjVWuuTIEzKHFI+
         tfa+oH4dcb0Maa9gUp0dYROJLz9EvIXOmWy+mTlxHDzjsxvfKArOUy5jfpQWUfo0L7kw
         46Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ay8SXsxgPAC6L6bgH21ewo8tdb5Od4VNACZbv44yG9w=;
        b=gjLRDH8m4bhVDy3SYNrlcUKpsy29HFYDf2IrixlecxU91jhQwA2Zwfm/A9cvGCZcBI
         Ou5FjqHW8vJMRv8HLgdrTObllmS5PH1ZgKVaz8noLDIIKFCT1Y26KSpwv60UfNO9WOeN
         lRlq5eyrmNAAi95TpAmFsYvt6uziHgdjrTy/3EqehKsegQ5C9k9TiIcJkLPyNJrbVgZf
         FwatvrsQBv7fjSqOyljjfdSxyIiZM2+ip/YTrJdb3YKajlsyxYzQmqStfPodK6A9bwpm
         LUpE1q3v56L0AnuVWz0eVOygoObdYjZIsp47iId/dveae/ZGwhWwBWLHmpUywu73gCxj
         VKag==
X-Gm-Message-State: APjAAAVPjeSVApVwtnlN5ot7l3y/kBOGVNp3pDX9tJe1Jmhvf94dEp2d
        Leii1tkEARdCAb2JbpvE9hM=
X-Google-Smtp-Source: APXvYqzdnzJ+J1zR+99hnut5Ada/Kpjx9vg2VHvHAnNUL5gEhu+ou5NDQkDNveppuVvpMV3+2k3oBw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr3407109wrv.219.1562833784023;
        Thu, 11 Jul 2019 01:29:44 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id x20sm9374781wrg.10.2019.07.11.01.29.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 01:29:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Reid <preid@electromag.com.au>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/2] gpio: em: use a helper variable for &pdev->dev
Date:   Thu, 11 Jul 2019 10:29:36 +0200
Message-Id: <20190711082936.8706-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711082936.8706-1-brgl@bgdev.pl>
References: <20190711082936.8706-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Instead of always dereferencing &pdev->dev, just assign a helper local
variable of type struct device * and use it where applicable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- no changes

 drivers/gpio/gpio-em.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index a87951293aaa..620f25b7efb4 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -272,11 +272,12 @@ static int em_gio_probe(struct platform_device *pdev)
 	struct resource *io[2], *irq[2];
 	struct gpio_chip *gpio_chip;
 	struct irq_chip *irq_chip;
-	const char *name = dev_name(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	const char *name = dev_name(dev);
 	unsigned int ngpios;
 	int ret;
 
-	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -290,27 +291,27 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq[1] = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
 
 	if (!io[0] || !io[1] || !irq[0] || !irq[1]) {
-		dev_err(&pdev->dev, "missing IRQ or IOMEM\n");
+		dev_err(dev, "missing IRQ or IOMEM\n");
 		return -EINVAL;
 	}
 
-	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
+	p->base0 = devm_ioremap_nocache(dev, io[0]->start,
 					resource_size(io[0]));
 	if (!p->base0)
 		return -ENOMEM;
 
-	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
+	p->base1 = devm_ioremap_nocache(dev, io[1]->start,
 				   resource_size(io[1]));
 	if (!p->base1)
 		return -ENOMEM;
 
-	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
-		dev_err(&pdev->dev, "Missing ngpios OF property\n");
+	if (of_property_read_u32(dev->of_node, "ngpios", &ngpios)) {
+		dev_err(dev, "Missing ngpios OF property\n");
 		return -EINVAL;
 	}
 
 	gpio_chip = &p->gpio_chip;
-	gpio_chip->of_node = pdev->dev.of_node;
+	gpio_chip->of_node = dev->of_node;
 	gpio_chip->direction_input = em_gio_direction_input;
 	gpio_chip->get = em_gio_get;
 	gpio_chip->direction_output = em_gio_direction_output;
@@ -319,7 +320,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->request = em_gio_request;
 	gpio_chip->free = em_gio_free;
 	gpio_chip->label = name;
-	gpio_chip->parent = &pdev->dev;
+	gpio_chip->parent = dev;
 	gpio_chip->owner = THIS_MODULE;
 	gpio_chip->base = -1;
 	gpio_chip->ngpio = ngpios;
@@ -333,33 +334,33 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_release_resources = em_gio_irq_relres;
 	irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
 
-	p->irq_domain = irq_domain_add_simple(pdev->dev.of_node, ngpios, 0,
+	p->irq_domain = irq_domain_add_simple(dev->of_node, ngpios, 0,
 					      &em_gio_irq_domain_ops, p);
 	if (!p->irq_domain) {
-		dev_err(&pdev->dev, "cannot initialize irq domain\n");
+		dev_err(dev, "cannot initialize irq domain\n");
 		return -ENXIO;
 	}
 
-	ret = devm_add_action_or_reset(&pdev->dev, em_gio_irq_domain_remove,
+	ret = devm_add_action_or_reset(dev, em_gio_irq_domain_remove,
 				       p->irq_domain);
 	if (ret)
 		return ret;
 
-	if (devm_request_irq(&pdev->dev, irq[0]->start,
+	if (devm_request_irq(dev, irq[0]->start,
 			     em_gio_irq_handler, 0, name, p)) {
-		dev_err(&pdev->dev, "failed to request low IRQ\n");
+		dev_err(dev, "failed to request low IRQ\n");
 		return -ENOENT;
 	}
 
-	if (devm_request_irq(&pdev->dev, irq[1]->start,
+	if (devm_request_irq(dev, irq[1]->start,
 			     em_gio_irq_handler, 0, name, p)) {
-		dev_err(&pdev->dev, "failed to request high IRQ\n");
+		dev_err(dev, "failed to request high IRQ\n");
 		return -ENOENT;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
+	ret = devm_gpiochip_add_data(dev, gpio_chip, p);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to add GPIO controller\n");
+		dev_err(dev, "failed to add GPIO controller\n");
 		return ret;
 	}
 
-- 
2.21.0

