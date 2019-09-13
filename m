Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B93B1C73
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 13:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbfIMLfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 07:35:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40451 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727997AbfIMLfp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 07:35:45 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so26722389ljw.7
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2019 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/iNsOMpID3q2zsOyYQIhDoGSptuJapIiBbVcWgviOv8=;
        b=twkc2kJ/SbFcCIamyZTxQMh+agBJF6dSjUFfU+V4dpPM0GzPmiWhqST8lqXOPUbQ3s
         Lc1OGUUsi+51wLR55dgH9Eae6RsV5wZMl48zU2ynMtwLst9dkV1OytbsVetrzqNCIx0l
         ngSl2/h9FFj0nPxgyRkDqeNvqaXIhEzVsJQRti9077gm1srKybn/9EFePjqzMdo2kEJs
         As9DH3YUtB59lv34oIsA/xQBlgYTjsc7y/yG/JOc3B0CgwYVuVGOqFWfpdxjCEeQlFMR
         qHatEjIw6IIkaSgMt5XOhIvzDj8g3itvwxxRuc69bxGvZXOj2hCrDQWIRV7l8hmn+thm
         7DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/iNsOMpID3q2zsOyYQIhDoGSptuJapIiBbVcWgviOv8=;
        b=bMZUrG4VNpAVxFJcTn12d0/9MRSWye/zKZce/Pi7sFuy7Uh3qoRTyzH30VBvgqv8vL
         W3LY+T854liORafBm3AwAmnmy5PMj8Pb393D4EvaQkqnbwPatQPWOOi7P6djYw5E3I1I
         B0wxwbZitfk2x77pBFwOn+zfY2eU/DPNdgENrS7YOZYZvyoG15DmBW6kQEZ/YHl36Qr4
         mj3i2ycEMwriqyr1DG3QUpjCAOpwh/jqefNFDcfpNokD9sLgFJ/yHqI9KgoBzYkREx/B
         2gnAR9sRLgKyguZxxcxCJy51bogMeLS0iWyI2cfGxTRWKfnn1A/TmM8xnek4oGrE2tby
         9U0w==
X-Gm-Message-State: APjAAAUqjdiCVc8r+qEG/H91uui9v/rQeCEdnD8DeiUUfUQMKO5NaxPH
        nqLaMJ1Rs1lcvtixXMz0hEM0ruomsJjL/XS0
X-Google-Smtp-Source: APXvYqxbWMW3CdrZe9SZBsDB0GAfCG8I+E3rCdo9YbDb2xN3xqj69GIOpsVc/rXvUhFoLtzipuzCTQ==
X-Received: by 2002:a2e:9c87:: with SMTP id x7mr17704483lji.207.1568374543456;
        Fri, 13 Sep 2019 04:35:43 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v17sm6177440ljh.8.2019.09.13.04.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 04:35:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomer Maimon <tmaimon77@gmail.com>, Kun Yi <kunyi@google.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/6] pinctrl: nuvoton: npcm7xx: Pass irqchip when adding gpiochip
Date:   Fri, 13 Sep 2019 13:35:28 +0200
Message-Id: <20190913113530.5536-4-linus.walleij@linaro.org>
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

Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Kun Yi <kunyi@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 32 +++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 17f909d8b63a..22077cbe6880 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1954,6 +1954,22 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 	int ret, id;
 
 	for (id = 0 ; id < pctrl->bank_num ; id++) {
+		struct gpio_irq_chip *girq;
+
+		girq = &pctrl->gpio_bank[id].gc.irq;
+		girq->chip = &pctrl->gpio_bank[id].irq_chip;
+		girq->parent_handler = npcmgpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(pctrl->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents) {
+			ret = -ENOMEM;
+			goto err_register;
+		}
+		girq->parents[0] = pctrl->gpio_bank[id].irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
 		ret = devm_gpiochip_add_data(pctrl->dev,
 					     &pctrl->gpio_bank[id].gc,
 					     &pctrl->gpio_bank[id]);
@@ -1972,22 +1988,6 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 			gpiochip_remove(&pctrl->gpio_bank[id].gc);
 			goto err_register;
 		}
-
-		ret = gpiochip_irqchip_add(&pctrl->gpio_bank[id].gc,
-					   &pctrl->gpio_bank[id].irq_chip,
-					   0, handle_level_irq,
-					   IRQ_TYPE_NONE);
-		if (ret < 0) {
-			dev_err(pctrl->dev,
-				"Failed to add IRQ chip %u\n", id);
-			gpiochip_remove(&pctrl->gpio_bank[id].gc);
-			goto err_register;
-		}
-
-		gpiochip_set_chained_irqchip(&pctrl->gpio_bank[id].gc,
-					     &pctrl->gpio_bank[id].irq_chip,
-					     pctrl->gpio_bank[id].irq,
-					     npcmgpio_irq_handler);
 	}
 
 	return 0;
-- 
2.21.0

