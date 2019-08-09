Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE1487C5E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfHIOLW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:11:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46794 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIOLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:11:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id n19so1214686lfe.13
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zv5zaIK+W734WPRwgbyvqdVX6u8ERDo9sAQWiOXOxo=;
        b=ZhH6yWnE8a/LL7jLmWfQQs7EbO5vXgeFlRxovWGNo4xcHVwuN45bkmfamj96Uutq/L
         nt9CR2A7hq9k8vFlTUXAGv0nr+n/IRmQ91X/6yY5DbzlyGRa095hUsyDAXtSvnljgi+R
         TCmDaCQ0Dw7+UxP5VnpB83JiIVrDeKaLyHTy3SeWzqjQMEswiEibJ8iTqlvS31iODUOm
         d6RlWJVWW4vg8aa2mOw9OwviBkh6ey5qJZcfhpPGhpM3UVrN+f3aSwVLW1A4yNDCV296
         WOgq4+vpMKxxcdpDoe/RRCRblfTujxCSHfc+q5RhwAnxZJKrc2O9RTtiiaMEv4VMBMv/
         +JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zv5zaIK+W734WPRwgbyvqdVX6u8ERDo9sAQWiOXOxo=;
        b=JK+l8s8RBR2TGsfeprUlDsqRmgx435XQPThGOxc7yloDLR83m5KO04Y/LvgESg/UQZ
         NvF3iSJ9jpHa0bjCuQrk43wMN95fzf1sOYVJks9iJ6uYaJS2FvwhRNx3B6CjOh+cpJ9h
         IUl6eJpJjTr6n9FAZCP3mZafazBAyYKTMDniwllT7RA6ITi2ukOqcn/lwHjrai4I3Z3y
         ZnKJfGc5trVFgvrVugTZtKYa/rTxnk+tHOlFzOra3yO5K2eETNJKlQogfCEey6KVs/pu
         YSSoesR5OxkSi+TvY8cS7WMBhQTyUNX/SQ9SERTbVdNDr/FQveF1JZQHAw116LulzsyC
         UUcQ==
X-Gm-Message-State: APjAAAVquBfOvW1ulazC1RTVAPxkXChyum0Peh6junNeKEnFYs4gqW6e
        4OooeUNW1L/ToY33z01jw6vdD/kbLNY=
X-Google-Smtp-Source: APXvYqyz4ZMK+lA5GCA2GiWLO2Vdmb+6zVBa2dPFViVZVr8ADqoQBupD8iVUpNzFHMnmQS4le1KM2A==
X-Received: by 2002:a19:c887:: with SMTP id y129mr13047645lff.73.1565359879778;
        Fri, 09 Aug 2019 07:11:19 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id t8sm2119091lfk.61.2019.08.09.07.11.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:11:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        Greg Ungerer <gerg@kernel.org>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: mt7621: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 16:11:16 +0200
Message-Id: <20190809141116.16403-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This driver requests the IRQ directly in the driver so it
differs a bit from the others.

Cc: René van Dorst <opensource@vdorst.com>
Cc: Greg Ungerer <gerg@kernel.org>
Cc: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mt7621.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 79654fb2e50f..d1d785f983a7 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -241,13 +241,6 @@ mediatek_gpio_bank_probe(struct device *dev,
 	if (!rg->chip.label)
 		return -ENOMEM;
 
-	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
-	if (ret < 0) {
-		dev_err(dev, "Could not register gpio %d, ret=%d\n",
-			rg->chip.ngpio, ret);
-		return ret;
-	}
-
 	rg->irq_chip.name = dev_name(dev);
 	rg->irq_chip.parent_device = dev;
 	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
@@ -256,8 +249,10 @@ mediatek_gpio_bank_probe(struct device *dev,
 	rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
 
 	if (mtk->gpio_irq) {
+		struct gpio_irq_chip *girq;
+
 		/*
-		 * Manually request the irq here instead of passing
+		 * Directly request the irq here instead of passing
 		 * a flow-handler to gpiochip_set_chained_irqchip,
 		 * because the irq is shared.
 		 */
@@ -271,15 +266,21 @@ mediatek_gpio_bank_probe(struct device *dev,
 			return ret;
 		}
 
-		ret = gpiochip_irqchip_add(&rg->chip, &rg->irq_chip,
-					   0, handle_simple_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(dev, "failed to add gpiochip_irqchip\n");
-			return ret;
-		}
+		girq = &rg->chip.irq;
+		girq->chip = &rg->irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+	}
 
-		gpiochip_set_chained_irqchip(&rg->chip, &rg->irq_chip,
-					     mtk->gpio_irq, NULL);
+	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
+	if (ret < 0) {
+		dev_err(dev, "Could not register gpio %d, ret=%d\n",
+			rg->chip.ngpio, ret);
+		return ret;
 	}
 
 	/* set polarity to low for all gpios */
-- 
2.21.0

