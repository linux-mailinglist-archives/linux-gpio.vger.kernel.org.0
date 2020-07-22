Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5916B22966B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 12:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgGVKlU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 06:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGVKlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 06:41:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24457C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:41:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s9so1925443ljm.11
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nISrxVS8UqzGlgf+2A0W88c1tgl6SPPChJofeeLKcDg=;
        b=YRSv5MVzfrYu8qC98NjV7vtmuQ7JzAe3+F9KRcxGDokf4ePUgqfy6LuTvGUoi5d7TZ
         1Gb9QunCMzL6KvMY+JFk5Fl8kte2h53+DWFt8VYkywgjYpZIZ6TOdg7R0mppsbpD4CDn
         YGVno09Sv3CsD2RYw85Vso9BwpjRiaNps5dyUJSzRU/mxt1qWIyse8KO2UthmZGuX9We
         xFW67mgMhkxG4GxrK92o1YU1K6eVLag3CI7i0zooKl2JejD6LhHjfmBSBAuv5tdJNYDG
         D/gII2ykmbT3aBQ1gderYoj+3ohRF+xjRUyePKerihE7FtPvvWYQuRid0LWNoYZyCmdF
         tREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nISrxVS8UqzGlgf+2A0W88c1tgl6SPPChJofeeLKcDg=;
        b=I7ZU8gBK2mhY3luz4fTZf+lcppj6kFrqHf1EyRDfr1EuxlLvRrZytaPJwtxSCxYK1A
         O1HsxUlhsm6nc4FHRXUMAH9UUryZx5MqpjgpdcaSfsB91CF4RlZFOEKp5Dkg6AYhxOEP
         JTP1Ff1TOKj6ALBq40yBwPyOkH/jicRTznwQsHlRQoi4BAL01OLpgP4SaRqA6nf6SVXq
         2tJ+csO1z9mBr9AmKLGYXolvuwFoj0oulLZMzbFme7MmThc3TpBDVp7YP2GSiNUO7y0S
         KJLRUlarTjxLP1nFg4oHMsqXadGkHVOrloDsACsGzomA7ylgkBL5hQ/jyU7PMTuBEJ7a
         4q3A==
X-Gm-Message-State: AOAM530w100GZAqCoZ5omgEI9QzrpHPi+F4nBVt+Soh8DyABz/DZ59hI
        ER0jhV/fchUFO2vvpbbuq3YWPC2CSjiiww==
X-Google-Smtp-Source: ABdhPJzHcNpeTwemEIx+wI7YHaCbT1r/SAt3QyEkGVYtExb8OqJxPxi2m50wwem0IUlUZlFUZXS+hQ==
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr15561923ljl.167.1595414478441;
        Wed, 22 Jul 2020 03:41:18 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id e18sm3355680ljn.135.2020.07.22.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 03:41:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-dio-48e: Use irqchip template
Date:   Wed, 22 Jul 2020 12:39:15 +0200
Message-Id: <20200722103915.162156-1-linus.walleij@linaro.org>
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
 drivers/gpio/gpio-104-dio-48e.c | 35 ++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 1f7d9bbec0fc..7a9021c4fa48 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -368,10 +368,21 @@ static const char *dio48e_names[DIO48E_NGPIO] = {
 	"PPI Group 1 Port C 5", "PPI Group 1 Port C 6", "PPI Group 1 Port C 7"
 };
 
+static int dio48e_irq_init_hw(struct gpio_chip *gc)
+{
+	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(gc);
+
+	/* Disable IRQ by default */
+	inb(dio48egpio->base + 0xB);
+
+	return 0;
+}
+
 static int dio48e_probe(struct device *dev, unsigned int id)
 {
 	struct dio48e_gpio *dio48egpio;
 	const char *const name = dev_name(dev);
+	struct gpio_irq_chip *girq;
 	int err;
 
 	dio48egpio = devm_kzalloc(dev, sizeof(*dio48egpio), GFP_KERNEL);
@@ -399,13 +410,17 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	dio48egpio->chip.set_multiple = dio48e_gpio_set_multiple;
 	dio48egpio->base = base[id];
 
-	raw_spin_lock_init(&dio48egpio->lock);
+	girq = &dio48egpio->chip.irq;
+	girq->chip = &dio48e_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+	girq->init_hw = dio48e_irq_init_hw;
 
-	err = devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
-	if (err) {
-		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		return err;
-	}
+	raw_spin_lock_init(&dio48egpio->lock);
 
 	/* initialize all GPIO as output */
 	outb(0x80, base[id] + 3);
@@ -419,13 +434,9 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	outb(0x00, base[id] + 6);
 	outb(0x00, base[id] + 7);
 
-	/* disable IRQ by default */
-	inb(base[id] + 0xB);
-
-	err = gpiochip_irqchip_add(&dio48egpio->chip, &dio48e_irqchip, 0,
-		handle_edge_irq, IRQ_TYPE_NONE);
+	err = devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
 	if (err) {
-		dev_err(dev, "Could not add irqchip (%d)\n", err);
+		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		return err;
 	}
 
-- 
2.26.2

