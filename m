Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4B4898A5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 10:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfHLIXi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 04:23:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36323 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfHLIXh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 04:23:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id j17so19633687lfp.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tIwv8dK4/49+nYJUXAhUb6v7kSDNhA5y6DSNONfPNGw=;
        b=ArLrOvzidmhgHvCs+LPUonuvQsXaCPj2ergMFlg79B6RqlC1PPEE1HcrhFSpNKKube
         ZIWAApQlYFf42bv/MePqIEOJreNBo0JR1fPRSk08f+m9pAdwVG6hA4nMOrjP8iNmElxA
         tW+EColZ9L+aOqAI4JoHvfFIR/lZj+7ta5hXnQX4jG7ckjsPwwpAxWrNv0H8eandho7v
         sby0wKyExH0obqvj/j8cvrsF39ur5CqAKMzjBdjbYVDAAFn99l0lIT7WzKXDHJd379ag
         z5/3U6eqKJ+2W3Eg5smznoZHgT4Sh/5etuceMHXFfURIuDdliLz3cgt1cfGjRh+5zL/R
         NcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tIwv8dK4/49+nYJUXAhUb6v7kSDNhA5y6DSNONfPNGw=;
        b=JXmE0bsx++279XoxPN2QXnJp06oe5/X9yCI7f/EsZ567dZ5fKRf+eFAeX3WL9FfHIU
         7fzdltpnyYj4iz7wRShLbVc/HG55rOKpFRyaoFY7YHK39PJgdpyPAJ0MQHQm/AsjVVfs
         weA41bOWPCWGDFZHEe0sY8Oe1GmixQpm+kKbupv3z1BFsYJieeAD2m2LYqtllWYGPv6Y
         DWqkFFUdsdWm6YLKr1P/5KzzTxTxNJeaOYBdx16zpptzKQXNU8noxCgO2EdQg3hl+k6F
         8jWQvGsVKNjVGO2dD5HfeiOnsTGhEZ21LEo5gaiEja+oNqbNXimAE05HsXNBj4JVtd5I
         AepQ==
X-Gm-Message-State: APjAAAXuXFLRmhrydYEky1Nry/BGxeiGuyQsKF8j5By6quooowkLAc9x
        erTxuVFd909EzqOzwm4lffnltpXA3BQ=
X-Google-Smtp-Source: APXvYqyUE+nnAsGpw+XjdEWDUac0p72HjEYNE71HGqE13Uv+z90hMXYvZrT86olLjacYSYUIfKSKwg==
X-Received: by 2002:a19:c6d4:: with SMTP id w203mr19271481lff.135.1565598215469;
        Mon, 12 Aug 2019 01:23:35 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n17sm4635074lfi.37.2019.08.12.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2019 01:23:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: merrifield: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 10:23:31 +0200
Message-Id: <20190812082331.22674-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Andy: when you're happy with this you can either supply an
ACK and I will merge it or you can merge it into your tree
for a later pull request, just tell me what you prefer.
---
 drivers/gpio/gpio-merrifield.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 3302125e5265..299277951791 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -397,6 +397,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 {
 	const struct mrfld_gpio_pinrange *range;
 	const char *pinctrl_dev_name;
+	struct gpio_irq_chip *girq;
 	struct mrfld_gpio *priv;
 	u32 gpio_base, irq_base;
 	void __iomem *base;
@@ -444,6 +445,21 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	raw_spin_lock_init(&priv->lock);
 
+	girq = &priv->chip.irq;
+	girq->chip = &mrfld_irqchip;
+	girq->parent_handler = mrfld_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = pdev->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	mrfld_irq_init_hw(priv);
+
 	pci_set_drvdata(pdev, priv);
 	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
@@ -465,18 +481,6 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 		}
 	}
 
-	retval = gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip, irq_base,
-				      handle_bad_irq, IRQ_TYPE_NONE);
-	if (retval) {
-		dev_err(&pdev->dev, "could not connect irqchip to gpiochip\n");
-		return retval;
-	}
-
-	mrfld_irq_init_hw(priv);
-
-	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip, pdev->irq,
-				     mrfld_irq_handler);
-
 	return 0;
 }
 
-- 
2.21.0

