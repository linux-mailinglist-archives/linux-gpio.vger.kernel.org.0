Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B660922969C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 12:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgGVKuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 06:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgGVKuY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 06:50:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72037C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:50:24 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h22so1960269lji.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BlKFCV+w8C/Efkq0KGerH9f4JXaF8cEGwSDRVd0xhz4=;
        b=keIn5TiCZovCECf6CNWZWVyZNCUJcxyiaudz0i9yiG4zNV5gA+O1KjwAXUK2+xGZlY
         zYdtWtPAvCYh0WuJo97sHbTYJ9bmP2HxJL386CwZwSACRZfBdk6tuC6MPA4si4e5Hwzh
         TWNEIYEcpyMsZkXPNbXTxhq9e0MOI4vgUdMG/DutUxEykhZYNIH0GVHbXQfNBQI8hHoi
         ZvCSUgSgp4CHTQXLTL7f3rAbe90KKCFMAo3XpHbeLsXEdIF4Htti8g7V4njBP8AwwqoM
         aaJXaDnPcIP0SUOdRobmCZm2A0baO+n5Wrj9rH5TYAmKLVNAgFhY/KiV4UEhb9opItOJ
         L28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BlKFCV+w8C/Efkq0KGerH9f4JXaF8cEGwSDRVd0xhz4=;
        b=Wmxfjn0744+PFgM645DRn5JenDQSTgRPwUCSNBeFKKRXSl0RJ6TjjUeoTid8e5Z+Eh
         m7FW1QjrNay+UU/+js0NDAhH9YmJGqxlKDs9vwlTS2fBvBAo2ucxrMymJC24RkzrlQBe
         iEvttElx6VfJt3mX9zA4rTGC3XHOERvQCHsjvhIHESkBuPREsh7F8VQsUoou6CFPS2FY
         Nv7XlhtO5zoZoCDSoWHja3rAAMkLQxxGEf7XDBUgNhtKdp8a8R7xklnDPBxHX+oVuiyq
         gTc83mIoce7iqRNO4xTU399dbf3xGoLiHsAoFXSA9l5fXXuAYdbPzg25NWzawWG5QfJj
         V2Bw==
X-Gm-Message-State: AOAM531n7uvcmXXW7nwtsfwPv9sKsXNRsZ/ADpp6T20gFJ3hTyJacYsl
        W7scWKiwwzNtCz9GzPwafWyxrP8kudqwyA==
X-Google-Smtp-Source: ABdhPJy8fiWk71KmhHs4j3FfmiNSjyUGMIqQfOkOikOWq5DBZWO47eC2+U0eHNAka2O+w2n9yOvFmw==
X-Received: by 2002:a2e:9b0f:: with SMTP id u15mr15788554lji.180.1595415022686;
        Wed, 22 Jul 2020 03:50:22 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id x30sm7747405lfn.3.2020.07.22.03.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 03:50:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idi-48: Use irqchip template
Date:   Wed, 22 Jul 2020 12:48:20 +0200
Message-Id: <20200722104820.174654-1-linus.walleij@linaro.org>
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
Also move the IRQ initialization to the special .init_hw()
callback.

Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-104-idi-48.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index d350ac0de06b..94c3a9bc4e75 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -247,10 +247,22 @@ static const char *idi48_names[IDI48_NGPIO] = {
 	"Bit 18 B", "Bit 19 B", "Bit 20 B", "Bit 21 B", "Bit 22 B", "Bit 23 B"
 };
 
+static int idi_48_irq_init_hw(struct gpio_chip *gc)
+{
+	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(gc);
+
+	/* Disable IRQ by default */
+	outb(0, idi48gpio->base + 7);
+	inb(idi48gpio->base + 7);
+
+	return 0;
+}
+
 static int idi_48_probe(struct device *dev, unsigned int id)
 {
 	struct idi_48_gpio *idi48gpio;
 	const char *const name = dev_name(dev);
+	struct gpio_irq_chip *girq;
 	int err;
 
 	idi48gpio = devm_kzalloc(dev, sizeof(*idi48gpio), GFP_KERNEL);
@@ -275,6 +287,16 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	idi48gpio->chip.get_multiple = idi_48_gpio_get_multiple;
 	idi48gpio->base = base[id];
 
+	girq = &idi48gpio->chip.irq;
+	girq->chip = &idi_48_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+	girq->init_hw = idi_48_irq_init_hw;
+
 	raw_spin_lock_init(&idi48gpio->lock);
 	spin_lock_init(&idi48gpio->ack_lock);
 
@@ -284,17 +306,6 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 		return err;
 	}
 
-	/* Disable IRQ by default */
-	outb(0, base[id] + 7);
-	inb(base[id] + 7);
-
-	err = gpiochip_irqchip_add(&idi48gpio->chip, &idi_48_irqchip, 0,
-		handle_edge_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		return err;
-	}
-
 	err = devm_request_irq(dev, irq[id], idi_48_irq_handler, IRQF_SHARED,
 		name, idi48gpio);
 	if (err) {
-- 
2.26.2

