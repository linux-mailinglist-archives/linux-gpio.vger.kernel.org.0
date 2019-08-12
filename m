Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C66F89FA0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 15:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfHLNZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 09:25:59 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41160 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728705AbfHLNZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 09:25:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id 62so69321787lfa.8
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XEJH3l/aOj6yw+fI23+mBIzT1rWD8QNPS7gLFK8a1nE=;
        b=xyChg1FV6TqNKjbiwudtiCBaN9gikmUS21yXQTDiDJTgE1BVdYoi2f9UUmJr1HBXNf
         nq4aDyhCpQEhv9SPVdhJpPk4JcHvhZqopGSI9r/oZ5KlA+xu9AwzWeicHqOwl9eDxVx7
         x9aewrcx3s8UgECnar56bDIdXDn2Hqte1IXdTvbxkQJgeeYy2dxWNNL0IxB/OFWeyz4l
         iG+uXcSu57b/FnMIUrnLE20Gx2uL8b7zVbJijQe6OxtueLCcYjrOec41Fk319hXN+SG4
         eUQleZqoWcGNmuuhoLMJB9PHQQAfJjmYYZmR6JOiLvso/VymhNyMNFsESZf0ZOfGuu4Z
         W4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XEJH3l/aOj6yw+fI23+mBIzT1rWD8QNPS7gLFK8a1nE=;
        b=ESXiPwInYCGq9fM5JeR2IZPyvq0VITyAg+y5k1JAKj2a1zKXvlb7lo0EyVPqZHdwwT
         TUAlUcdZfO4pFVRaxLNFhcQjIK75sYepJpCfdLNlfrFClHkUVf+9Onses/sgdYOu80/P
         3yxj7ZwaXYwxGVQOZVOIsWrE/HF1nWGoH5OyNE/+zGEZvkUfrh9Tkdz8m2PlUeBVkwK/
         LD3fWzzDkLt1HGkLYmMhvIgbsyOyQvoc6z0RJ/F+4Us+i2U1jt45U19627JkPlkNOF+5
         YvxEbLF6dYeLihC/GwSOe8lc9GMRC4DpmL5X+t/kLTuNu8ArllwRaodNt7rhn7bKo6eQ
         P7Hg==
X-Gm-Message-State: APjAAAXppdwmpUokaXt8FVg+W38QuU1DpIUkm0sUCY4XEnIumvABZqpa
        mGrISQfCWS3dUm8yqCkIjclaKl7QTYE=
X-Google-Smtp-Source: APXvYqzM5ZFStMCSPZ5mLn/fPnsCjJQJON+3TvivB4cemwDXd8xdlSiinHZyWkalZ+1X1DuV2iP8PA==
X-Received: by 2002:a19:a416:: with SMTP id q22mr19940438lfc.145.1565616357377;
        Mon, 12 Aug 2019 06:25:57 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h84sm20963663ljf.42.2019.08.12.06.25.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 06:25:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pramod Kumar <pramodku@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] pinctrl: bcm-iproc: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 15:25:54 +0200
Message-Id: <20190812132554.18313-1-linus.walleij@linaro.org>
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

Cc: Pramod Kumar <pramodku@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 33 ++++++++++++++----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 18ff01727e0e..ee01306c62fa 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -780,6 +780,25 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,
 							"gpio-ranges");
 
+	/* optional GPIO interrupt support */
+	irq = platform_get_irq(pdev, 0);
+	if (irq) {
+		struct gpio_irq_chip *girq;
+
+		girq = &gc->irq;
+		girq->chip = &iproc_gpio_irq_chip;
+		girq->parent_handler = iproc_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+	}
+
 	ret = gpiochip_add_data(gc, chip);
 	if (ret < 0) {
 		dev_err(dev, "unable to add GPIO chip\n");
@@ -804,20 +823,6 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* optional GPIO interrupt support */
-	irq = platform_get_irq(pdev, 0);
-	if (irq) {
-		ret = gpiochip_irqchip_add(gc, &iproc_gpio_irq_chip, 0,
-					   handle_simple_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(dev, "no GPIO irqchip\n");
-			goto err_rm_gpiochip;
-		}
-
-		gpiochip_set_chained_irqchip(gc, &iproc_gpio_irq_chip, irq,
-					     iproc_gpio_irq_handler);
-	}
-
 	return 0;
 
 err_rm_gpiochip:
-- 
2.21.0

