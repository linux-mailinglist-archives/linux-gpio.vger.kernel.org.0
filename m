Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A731023041A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 09:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgG1H3N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 03:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgG1H3N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 03:29:13 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B50C061794
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 00:29:12 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j22so4552875lfm.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vl/1AzReSowGHK7rWhVKeID56AYucjcDR0PS1Rw0UJs=;
        b=BnVg4hjxnMBM4u1v1/bEErLwlKbB8FFzicHCgiT2zY/kIC2Mm/lOGosy6GycuhAFAX
         /shU3Iif9RIHc49CXO14jPx7H4P2XEY6BJRrI6VaQw16mTTeZnCrP9SmKgORDPcUMoGU
         nOttlECF6UYyeqNutzrJBkr0K6jkYXEMl+xP9X3hO/kogKd6Ynz1xPqcH6Ui/3SJJhbC
         ryLvzmtrY6+es58g0mLjB1yMIesC4UiVhu2b4pp5ZqGY8JSIPJYcJEbIZRhy4Wq9aSfZ
         lNf06Qujzplu28SluZKb3dIzq/TWOV0TaG/j8jjvJT8MjhlAvNpYCy8Tl8021PL+QsMk
         3g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vl/1AzReSowGHK7rWhVKeID56AYucjcDR0PS1Rw0UJs=;
        b=F1yINUO25BrTDOAuAw0Ks5khyHiHFsuag6l5WsOczk6QbdbDEwW2X+0URVUE0rM0hG
         DXchtNKPLHk+LwETlP9d7XNlVLp8AOr7XWrbgbGVS1Q3+UDalyh7XeuV83t5uamVNEVu
         IKBB9lrsfLQ8xbrS6lRdMXzuNTUrPhCcbZxkRvjzELlNQXRjEVh0YgwlDf0Oy/jSskqx
         AzRxGckcEAydLElcBsSFRL4KbCmGe2jKO4Dp/eotgLULctqGnIYCbT2lDKLK6/fm0g27
         Ks+GJJwfbkTLt7LX1bRXOA0RivE93jtV5+wuiqVmchzFp2s6AHJQ+jnHnvld/7vsk5zg
         huEA==
X-Gm-Message-State: AOAM531nsQh6sRjycyK+SAHQnTC1uTs9vk3fYodOzrgH4DAijjRYIuzg
        rYXwT7v3ATgtAa84ossy+Ym7Zk24oHncnw==
X-Google-Smtp-Source: ABdhPJxo+lmr2Ml2VhhFziUVDvkExSb97C0nP28YbuMEW/JDggX7uqbJe2h5Nz/PJvwLFc24gyn7gw==
X-Received: by 2002:a19:257:: with SMTP id 84mr13150167lfc.208.1595921350439;
        Tue, 28 Jul 2020 00:29:10 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id h23sm3600656lfk.37.2020.07.28.00.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 00:29:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH] gpio: stmpe: Move chip registration
Date:   Tue, 28 Jul 2020 09:27:06 +0200
Message-Id: <20200728072706.348725-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make sure to register the GPIO chip after requesting the
interrupt and setting up the IRQ members of the irqchip.

Fixes: 9745079609df ("gpio: stmpe: Use irqchip template")
Cc: Patrice Chotard <patrice.chotard@st.com>
Reported-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 395ee51445ea..6c48809d0505 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -500,12 +500,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free;
 
-	ret = gpiochip_add_data(&stmpe_gpio->chip, stmpe_gpio);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
-		goto out_disable;
-	}
-
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
@@ -528,6 +522,12 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		girq->threaded = true;
 	}
 
+	ret = gpiochip_add_data(&stmpe_gpio->chip, stmpe_gpio);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
+		goto out_disable;
+	}
+
 	platform_set_drvdata(pdev, stmpe_gpio);
 
 	return 0;
-- 
2.26.2

