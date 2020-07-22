Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E112296BE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 12:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgGVK5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 06:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGVK5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 06:57:21 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D11C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:57:21 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h8so1051202lfp.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZsNeWA9GXodr5DBsQKK85CaqV74QSMW5NBcfA6WQCEk=;
        b=JHKqyXY4VlrQH9C/NMDqq1tOOEUCmGhui8B0gLTreWEtbGoKokQ2EwUdNaR4gqG/fg
         ngQqGHa4lhANDG/oQ9HHEGIIc8HC5507DHdrAMLiqvXlJL/+Ca9E8EZ+V/uyxd/AvRII
         DBx2gtPWQ2zhpDuxGUwUOL0D4NDvLv9z0MHTiATbhSLsDYoDZTV3CfDcQPUkbUOaHkLr
         ST5Uyx+drm/nlbpl6uBInWipdqdXZc7WGckA0yewKzH13gdEoeVaGOO3uOeVz2UgcCUv
         ek9jXpLPMByu1md1jb5D1v/2K4eTFnTxsa0Q7NCkaNHlypeQR4HNUBsqCjgV8EC+ba9/
         qPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZsNeWA9GXodr5DBsQKK85CaqV74QSMW5NBcfA6WQCEk=;
        b=Q2Ne0D97BDnhuRqwnWKyKxM5a9QFeJpkus8AvRFMrp2IMCMxeHcdjuELUhMW7xrWCS
         UvORbDOZj7KwxspMCdE+bwo40IfH5DW38CnYKvCt3hQhU+bAPz3x3QhaUT8QT/0M51RF
         JvJqBjeZuMxxzjWJcr62fYNAU8hCHFm0qT3zuom5L3IYCGh93gUWTm0wP8PlmqE8lfm2
         yQAus3MlluHb4fOKGQ0ZYozxMFvW8RWT++viCCt0zvm5OluqL1DsWrlZegsUsQZ3UXmM
         +xFpijVlnXp7wUvmH3/6j1DL9WIP6K+5psi8pS7K3ipuBhopfofbA5/HeXGyhLzz1Bpe
         P6WQ==
X-Gm-Message-State: AOAM531ekIqEi6mVBNmcWDoEmSoRQ5608zEUZPh6gYc74fZTYMVy5YZg
        h1qWmMGzrhi3UwX4ukMHutdHU4to/8vzkw==
X-Google-Smtp-Source: ABdhPJwPDtamipd2bnUjuYWZ7hjAVd9knO8zgrXd8QvTHCYg9hFXuxSQ4GLSqg4HgUe+cbTWPlRM0w==
X-Received: by 2002:ac2:4422:: with SMTP id w2mr15716694lfl.152.1595415439656;
        Wed, 22 Jul 2020 03:57:19 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id q24sm5582013lfa.16.2020.07.22.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 03:57:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idio-16: Use irqchip template
Date:   Wed, 22 Jul 2020 12:55:17 +0200
Message-Id: <20200722105517.186137-1-linus.walleij@linaro.org>
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
 drivers/gpio/gpio-104-idio-16.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 5752d9dab148..50ad0280fd78 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -224,10 +224,22 @@ static const char *idio_16_names[IDIO_16_NGPIO] = {
 	"IIN8", "IIN9", "IIN10", "IIN11", "IIN12", "IIN13", "IIN14", "IIN15"
 };
 
+static int idio_16_irq_init_hw(struct gpio_chip *gc)
+{
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(gc);
+
+	/* Disable IRQ by default */
+	outb(0, idio16gpio->base + 2);
+	outb(0, idio16gpio->base + 1);
+
+	return 0;
+}
+
 static int idio_16_probe(struct device *dev, unsigned int id)
 {
 	struct idio_16_gpio *idio16gpio;
 	const char *const name = dev_name(dev);
+	struct gpio_irq_chip *girq;
 	int err;
 
 	idio16gpio = devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
@@ -256,6 +268,16 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 	idio16gpio->base = base[id];
 	idio16gpio->out_state = 0xFFFF;
 
+	girq = &idio16gpio->chip.irq;
+	girq->chip = &idio_16_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+	girq->init_hw = idio_16_irq_init_hw;
+
 	raw_spin_lock_init(&idio16gpio->lock);
 
 	err = devm_gpiochip_add_data(dev, &idio16gpio->chip, idio16gpio);
@@ -264,17 +286,6 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 		return err;
 	}
 
-	/* Disable IRQ by default */
-	outb(0, base[id] + 2);
-	outb(0, base[id] + 1);
-
-	err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
-		handle_edge_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		return err;
-	}
-
 	err = devm_request_irq(dev, irq[id], idio_16_irq_handler, 0, name,
 		idio16gpio);
 	if (err) {
-- 
2.26.2

