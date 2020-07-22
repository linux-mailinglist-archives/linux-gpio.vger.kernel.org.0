Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28FC2296D8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 13:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgGVLCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 07:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgGVLCc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 07:02:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F371BC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 04:02:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so2015166ljc.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6W/oLPmohhHYxRZou5i9u9TEyqPAIWtSiuIbdoyZTiY=;
        b=DxIocUz6oksD5y6p8bgmoAlGe6lI3j6IqtCQy5AXCc2KrOFZB6/9epPAwZ5UEWqmli
         vXdMKE0yImrdi1qmzFfif1plWhG5H4klwCnzvDlvNX8T74Qy9vzfu1dML9Ve0hXF/QWH
         JlslU186lHSQXqE8BBTRV49U5O+acX1uQZl08o0zDyhbTepMUatzUuS3dytnp1kOh7lD
         jyRFVkeD0wZh5JyGcX/41PFD1VOEJqIMekP400niFQdVJIpF/U8Obw+3KXSrdA+BBcHm
         p4fPt5/riSadabr6TxTHKQ0yimM2thrvOGPThtAEEyv1kw3stzhHgsTX2cSHAsIZ7sof
         smqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6W/oLPmohhHYxRZou5i9u9TEyqPAIWtSiuIbdoyZTiY=;
        b=GThfkyjCaYQ0bxEZGYHWBRXeDVqzeCd1ces63lYHnBibWIoHCyRLAyvVtDkyUF/aqY
         LkWNMXbiq0oxwZNPwkVhkkHNtFM/5eFFVfHIm8VHJBPyZsQNs+Wrl1R25AdlGt8HOFd5
         o9w8bR96ydkKOFYeXC+rpDNhT6Wu34ZDxLZu/OmdyZ5ECtmykDgELP2+sNrAjTYGvaVW
         +xqRIUvX+FmvuBe2ysjEmNDqEiuDbk6eVp+dPvJ9emo9PXnULRj+ONtTR8F9l0UGBCN9
         63dn7jFdh1zZkJDIRdgeMfDQb38OcFkDad10pvXCRvCoMQjhtPzitPFY5Q9xMKWD9lOb
         ERvg==
X-Gm-Message-State: AOAM530b0yCl5BLb1qPwavNVzBaLdgF6VrgYhFnxCzjiLY6p4iwxauXh
        Dy5H50PopcSm40Jvd9yENj8pHxpJKAD5dw==
X-Google-Smtp-Source: ABdhPJyeflpRh86mRrpYNgT/kdZdzfsjR89/fCwkQp9bJcOzveeQGVA/wjIug+qJtxROw64V3ggpoQ==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr2374206ljj.181.1595415750197;
        Wed, 22 Jul 2020 04:02:30 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id b26sm7325416lji.36.2020.07.22.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:02:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: pcie-idio-24: Use irqchip template
Date:   Wed, 22 Jul 2020 13:00:27 +0200
Message-Id: <20200722110027.192782-1-linus.walleij@linaro.org>
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

Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pcie-idio-24.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 1d475794a50f..a68941d19ac6 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -457,6 +457,7 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int err;
 	const size_t pci_bar_index = 2;
 	const char *const name = pci_name(pdev);
+	struct gpio_irq_chip *girq;
 
 	idio24gpio = devm_kzalloc(dev, sizeof(*idio24gpio), GFP_KERNEL);
 	if (!idio24gpio)
@@ -490,6 +491,15 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	idio24gpio->chip.set = idio_24_gpio_set;
 	idio24gpio->chip.set_multiple = idio_24_gpio_set_multiple;
 
+	girq = &idio24gpio->chip.irq;
+	girq->chip = &idio_24_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+
 	raw_spin_lock_init(&idio24gpio->lock);
 
 	/* Software board reset */
@@ -501,13 +511,6 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = gpiochip_irqchip_add(&idio24gpio->chip, &idio_24_irqchip, 0,
-		handle_edge_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		return err;
-	}
-
 	err = devm_request_irq(dev, pdev->irq, idio_24_irq_handler, IRQF_SHARED,
 		name, idio24gpio);
 	if (err) {
-- 
2.26.2

