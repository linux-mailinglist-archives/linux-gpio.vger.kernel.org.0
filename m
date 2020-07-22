Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E9522972A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 13:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGVLIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 07:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGVLIx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 07:08:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835A9C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 04:08:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j11so2027429ljo.7
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NslyCJf8OkHeoVYn5J0mSRPu/MisQSsHrDqh4ABOok=;
        b=NtqaEmMFB8zgUwZxSsM+5lSqPHgjkp5CLjgzYxzxK3q3uG/wSdjoGyKiu9a/t99DG9
         qqG8Pejvfj8PdlOli2SrripUe6yoa8cikzLL5a++yCATYSBpZOvYnX8pAAhEkc3TIACj
         3VXWXyypoOd/SB2QyvPXIMWpmOcQfW4pdrJRdG15cPavPFJQkFC2FklwZQwIcA3xSCsD
         KRx6VjDm0hERnWk8VHgY7dA41yB9SjwSjm+oLWiUwYSCwX9nf8NYaxa/RTiLGf94i5EN
         /u8myxLa+Cs2tgwHOhqKFuA/pOAU05Qm75lNF6JPaxbyZU+MtK7OMrIFc7k5+FwGri8z
         F6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NslyCJf8OkHeoVYn5J0mSRPu/MisQSsHrDqh4ABOok=;
        b=uatd1CMz23mnj1HjNdTRk7qR6YX6OpNuFeP5PYe9n4IfvkT0emJFGP0tMRJyWYKBUn
         1HbwZXi9giz5UEg7+0y5PPwTPV5r6Mgybnl/SCVDLdHstUbxElpubWyoDciTGk1nhYt/
         bpf+Y35JGX+uhlBQRB+CwNdk3Y6k76iiwBx48IkgBlQXvjmfNwW88QVABIxkguzGNlur
         Pp9C2WOmEhpOEEC/PtzrsAMcupskFciyDi3oqwEy5FcMwpfc0EE7paISAW8lHu6OnBld
         5LWJB+DvDZCmvNAbRWNP6A3tXK8zKR0QoGLy+TtrLyLv8w6nlIcY6Cmu5LqOEqVRvg5g
         lBjQ==
X-Gm-Message-State: AOAM530kfwXEGOu1pWG+OZbRjKW5JheMP+HY/1x8tFuvjT/+O8y5bhmH
        M9UmlMHwcxJEha5hEJiOhcXZ9R02rXAyJA==
X-Google-Smtp-Source: ABdhPJyGWxdy3EFSCklLh+0fXz6UVaZQlwNOGVUfx9LeTO6BvtOovkJFrMilsqijw1AGNfmePL3wAA==
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr14083349ljj.14.1595416131774;
        Wed, 22 Jul 2020 04:08:51 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id u6sm2870179lfk.94.2020.07.22.04.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:08:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: pci-idio-16: Use irqchip template
Date:   Wed, 22 Jul 2020 13:06:49 +0200
Message-Id: <20200722110649.202223-1-linus.walleij@linaro.org>
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
 drivers/gpio/gpio-pci-idio-16.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 638d6656ce73..9acec76e0b51 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -280,6 +280,17 @@ static const char *idio_16_names[IDIO_16_NGPIO] = {
 	"IIN8", "IIN9", "IIN10", "IIN11", "IIN12", "IIN13", "IIN14", "IIN15"
 };
 
+static int idio_16_irq_init_hw(struct gpio_chip *gc)
+{
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(gc);
+
+	/* Disable IRQ by default and clear any pending interrupt */
+	iowrite8(0, &idio16gpio->reg->irq_ctl);
+	iowrite8(0, &idio16gpio->reg->in0_7);
+
+	return 0;
+}
+
 static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct device *const dev = &pdev->dev;
@@ -287,6 +298,7 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int err;
 	const size_t pci_bar_index = 2;
 	const char *const name = pci_name(pdev);
+	struct gpio_irq_chip *girq;
 
 	idio16gpio = devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
 	if (!idio16gpio)
@@ -323,6 +335,16 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	idio16gpio->chip.set = idio_16_gpio_set;
 	idio16gpio->chip.set_multiple = idio_16_gpio_set_multiple;
 
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
@@ -331,17 +353,6 @@ static int idio_16_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	/* Disable IRQ by default and clear any pending interrupt */
-	iowrite8(0, &idio16gpio->reg->irq_ctl);
-	iowrite8(0, &idio16gpio->reg->in0_7);
-
-	err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
-		handle_edge_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		return err;
-	}
-
 	err = devm_request_irq(dev, pdev->irq, idio_16_irq_handler, IRQF_SHARED,
 		name, idio16gpio);
 	if (err) {
-- 
2.26.2

