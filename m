Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAF2B1C74
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 13:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfIMLfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 07:35:48 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43869 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbfIMLfs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 07:35:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id d5so26757953lja.10
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mM74njTvgowkp4HOwb8Z+3NrXc9FZ3ZrZS3AnnZSph8=;
        b=ycCLcroRcdHD6/2N6QnZpqp4zfmPr/EmZ8PAOG+M6urdXlqy5/20Woijqky/BDhZE9
         Tu2aDDvtNxg4fBgFNubTRHzQbyVq6P7hRbdqLWDzwJpX6A/HpUif/mXPdMGc+oOLFxdI
         VdJkfg/f2/RIYZt/GiGJO3WrD/ZXPlyzdlpexLMewNZTJ5kzUMZrFfIPEhnJcsnL0SVX
         kaEYGico8UF5Kql+VRnm0aHaGGgP6eGbNd41k/BUxOSwHMaaqWLm9pqlHhzhGDT0SEip
         Lbq4zI4sruNkaOPpftnJb3d8v+Bhu+bFzxupfuYzPIJ/I4ywgwwue6pCMjrzAbygWHDf
         SxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mM74njTvgowkp4HOwb8Z+3NrXc9FZ3ZrZS3AnnZSph8=;
        b=fsTNh9lOfMW7ZebaKzxj6per0ydOuzlgETRysGACaoMpv/srvuWNKk+QT7af9t7FRQ
         TbkgH5U0Nh/nsp4UKhj9HFkHX1GE6VzfWBk/jKiSf6HC654bvFeTZlbam2+B9PmqcGk8
         ixMDAAeTr1XWVkH/yHCWmytyMADUSnIfv6agJbEINcMvMZ5u8OyxwPi92hGMtVUGvKOR
         qH4BhSCmdLEqY2dxDyiH8mtZdOafGewdb8EDvaXIAGs6LB8RO16cKQnydw6dZTgk3dNB
         iWCLo8Q1RE/e2ApNC4nAMFsjPKmUA7WKpiYq4Um1IH1dYHQmVCrfS7sCTZmBBca8roHE
         8ETg==
X-Gm-Message-State: APjAAAV6YsTdDKgus7LifY+WYx0J9GZHjPhpieUrWIp/HgRLxRMvHnHv
        +eWKquojT114BJltgSStkxm0/S4EUEEMS2g2
X-Google-Smtp-Source: APXvYqyA8L8XSbmivltzf9aJGuUqj9t5H++f35YQlFVWJzg0SRL7ucsv3kHNJ1ycTS+cdVVvOkinuQ==
X-Received: by 2002:a2e:a17a:: with SMTP id u26mr29865455ljl.137.1568374545552;
        Fri, 13 Sep 2019 04:35:45 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v17sm6177440ljh.8.2019.09.13.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 04:35:44 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Yuping Luo <yuping.luo@csr.com>,
        Rongjun Ying <rongjun.ying@csr.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/6] pinctrl: sirf: Pass irqchip when adding gpiochip
Date:   Fri, 13 Sep 2019 13:35:29 +0200
Message-Id: <20190913113530.5536-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113530.5536-1-linus.walleij@linaro.org>
References: <20190913113530.5536-1-linus.walleij@linaro.org>
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

Cc: Barry Song <baohua@kernel.org>
Cc: Yuping Luo <yuping.luo@csr.com>
Cc: Rongjun Ying <rongjun.ying@csr.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 43 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 780c31bb4009..1ebcb957c654 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -785,6 +785,7 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 	struct sirfsoc_gpio_bank *bank;
 	void __iomem *regs;
 	struct platform_device *pdev;
+	struct gpio_irq_chip *girq;
 
 	u32 pullups[SIRFSOC_GPIO_NO_OF_BANKS], pulldowns[SIRFSOC_GPIO_NO_OF_BANKS];
 
@@ -816,36 +817,33 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 	sgpio->chip.gc.parent = &pdev->dev;
 	sgpio->chip.regs = regs;
 
-	err = gpiochip_add_data(&sgpio->chip.gc, sgpio);
-	if (err) {
-		dev_err(&pdev->dev, "%pOF: error in probe function with status %d\n",
-			np, err);
-		goto out;
-	}
-
-	err =  gpiochip_irqchip_add(&sgpio->chip.gc,
-		&sirfsoc_irq_chip,
-		0, handle_level_irq,
-		IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(&pdev->dev,
-			"could not connect irqchip to gpiochip\n");
-		goto out_banks;
-	}
-
+	girq = &sgpio->chip.gc.irq;
+	girq->chip = &sirfsoc_irq_chip;
+	girq->parent_handler = sirfsoc_gpio_handle_irq;
+	girq->num_parents = SIRFSOC_GPIO_NO_OF_BANKS;
+	girq->parents = devm_kcalloc(&pdev->dev, SIRFSOC_GPIO_NO_OF_BANKS,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
 	for (i = 0; i < SIRFSOC_GPIO_NO_OF_BANKS; i++) {
 		bank = &sgpio->sgpio_bank[i];
 		spin_lock_init(&bank->lock);
 		bank->parent_irq = platform_get_irq(pdev, i);
 		if (bank->parent_irq < 0) {
 			err = bank->parent_irq;
-			goto out_banks;
+			goto out;
 		}
+		girq->parents[i] = bank->parent_irq;
+	}
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
 
-		gpiochip_set_chained_irqchip(&sgpio->chip.gc,
-			&sirfsoc_irq_chip,
-			bank->parent_irq,
-			sirfsoc_gpio_handle_irq);
+	err = gpiochip_add_data(&sgpio->chip.gc, sgpio);
+	if (err) {
+		dev_err(&pdev->dev, "%pOF: error in probe function with status %d\n",
+			np, err);
+		goto out;
 	}
 
 	err = gpiochip_add_pin_range(&sgpio->chip.gc, dev_name(&pdev->dev),
@@ -867,7 +865,6 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 	return 0;
 
 out_no_range:
-out_banks:
 	gpiochip_remove(&sgpio->chip.gc);
 out:
 	iounmap(regs);
-- 
2.21.0

