Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793CB229229
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 09:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgGVHgb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 03:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgGVHgb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 03:36:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCE2C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 00:36:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s9so1390741ljm.11
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 00:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AW545wyqnzjd9cz2nVLAkT4dmk7TFu8OWbGQ6dF6vm4=;
        b=O6tzxIMqV2MjVAreLULH90U+foKiCj1BOZTaLIXVQcK9Cba9+52dOv6ugamyJD127b
         0bRGC7LDKD5B+hfMbEys7vvkGzJea5wTqZRfnzc7vtA5pk0XQ65cSSWrC0hWbbanD9h7
         7Ru3FnFPHoKAskRMS+9qGRPEGsTSaX7dntVHQXzB8RMHGm6WN5eXSU92DOveqhWATGOC
         mzmfYo19VEZQyIrmnwNxk2qh6RE2eiAA0lk+RpsPTb7ynW++ia/jO2ATftPc3qukodnK
         NupBvmTDVqNkvCt+/9NC2FeqspnENY8NeArISTr1/j9Id6SsPFpfR3yIwlRUoKDLfn5M
         wX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AW545wyqnzjd9cz2nVLAkT4dmk7TFu8OWbGQ6dF6vm4=;
        b=KhlhfbVP44AnJtVRW6p31gYDZ3kWYSXGh53cOeod3anzL84J0UWBZitTHe4ADpK5Zc
         CO2WiRGdUneiS7wOBtHt4FirHKGo3ygNcULghkimduGSTfG17fCI3voZvjY5AIaOBXpU
         Z9c4kH/gSjGu6FKNCzeyNEyCT9BBXFeEXPhVwSYiLsT3sdjdFCQd2irG0AyyKYvcUdbG
         olZmgaIUIgEIo0oqFqqqptUR/WvoTouJcgqdkNtb85AEuC7y3xexej/43N1MA6ZzyTPy
         frMzzjKEPY9Us9xy6qcMiszkeuNDdA/xzyMXSwZHxWsUswXeLF3I/q0SwSe46XH/lpY1
         K43w==
X-Gm-Message-State: AOAM533zsCyK9mgLWQTBJokPysn7nOE95UvZ6BsjN6ENeJ+8r8Rj+kPr
        lxKWLsC9keWJlv34hsJwwMagCurIYicqug==
X-Google-Smtp-Source: ABdhPJzQoaq03uBHaZe5ecM0yVpZayPCzVbYVTWfYrvHqH17hM0ksclPVXMTMexq1Rcn0fsEtrZiew==
X-Received: by 2002:a2e:9bc4:: with SMTP id w4mr14992432ljj.391.1595403388947;
        Wed, 22 Jul 2020 00:36:28 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c14sm7417649lfb.69.2020.07.22.00.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 00:36:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Baluta <daniel.baluta@gmail.com>,
        Octavian Purdila <octavian.purdila@nxp.com>
Subject: [PATCH] gpio: dln2: Use irqchip template
Date:   Wed, 22 Jul 2020 09:34:26 +0200
Message-Id: <20200722073426.38890-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add(). The irqchip is
instead added while adding the gpiochip.

Cc: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Octavian Purdila <octavian.purdila@nxp.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dln2.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 26b40c8b8a12..4c5f6d0c8d74 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -440,6 +440,7 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 {
 	struct dln2_gpio *dln2;
 	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
 	int pins;
 	int ret;
 
@@ -476,6 +477,15 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 	dln2->gpio.direction_output = dln2_gpio_direction_output;
 	dln2->gpio.set_config = dln2_gpio_set_config;
 
+	girq = &dln2->gpio.irq;
+	girq->chip = &dln2_gpio_irqchip;
+	/* The event comes from the outside so no parent handler */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+
 	platform_set_drvdata(pdev, dln2);
 
 	ret = devm_gpiochip_add_data(dev, &dln2->gpio, dln2);
@@ -484,13 +494,6 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = gpiochip_irqchip_add(&dln2->gpio, &dln2_gpio_irqchip, 0,
-				   handle_simple_irq, IRQ_TYPE_NONE);
-	if (ret < 0) {
-		dev_err(dev, "failed to add irq chip: %d\n", ret);
-		return ret;
-	}
-
 	ret = dln2_register_event_cb(pdev, DLN2_GPIO_CONDITION_MET_EV,
 				     dln2_gpio_event);
 	if (ret) {
-- 
2.26.2

