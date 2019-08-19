Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC5A91ED8
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 10:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfHSI1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 04:27:10 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41484 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfHSI1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 04:27:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id m24so918746ljg.8
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpQMy9naloyy8PyB5YU5SgsS71Vz0rQiFat+E8ZGbB8=;
        b=IsK36qgVNxqVJmERdRnFF5u5wHmpDfamuJ0CsaRMgtH57B/yeW+KImoyE2O8LEgBNr
         WxIxB7N9huoBzJdmq2wqqW1EyGr4861GlKEVmxOjbuTSgIFAkDxQvzug3gLaL/qSUq5b
         etaQbedjgY+IefEaVWTU6bLOPIGvD1J4EN7fXPIwJw3pDKa7sFFp8ZG4212dldVE1qbR
         l4Ys18UBh8NlTuznK89ORP7J2DR9oupP0XTpmWnh++zCMnxXYPnGkRJH5HylKtETdIXQ
         CMXMdznrTzY7ZZnwu0MP2VqCja6Sc9YlKCvGbol2+DgST9b1YQfNmOsjYFrK4flXnUcu
         cAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpQMy9naloyy8PyB5YU5SgsS71Vz0rQiFat+E8ZGbB8=;
        b=mObBr3PPS8pfPzHm+7az6rpkZN5PldfMNRNbVtZecfb5bIeXHUl7qdn7iAqPgiGfnW
         QSExI1rjoAV5xF85Leon5TeKSHqrvY8oOebkMenyRO082jCicYnlPxZpXj5idyLwe25j
         ESxwWoXfRrlj9yC+s7elRq6gGy6+cWtxXciTXd47upKBVS+kOJI7nbT9TBAdgj79igtE
         h66GVUG0q1Z1TXNYI4RfFAcSHjtyx5cNYW0JTlVHLFbmk1GD7Y2gCiYEB24gzBnQq2sS
         yXWakS8v1jTcRfk4X+CaZCdTh3VgMevrboQ8ftH6hDESdrpEaQ8JolzbZT0CdIvCNA0C
         tqBw==
X-Gm-Message-State: APjAAAUdFy6VRv0wx89tSedPMECdhv9wHtx9pFgVPuyrsLLXrLGrKv6d
        GiW9RjkjZdomjY7sVcqRll8q/iD1aPg=
X-Google-Smtp-Source: APXvYqz5kRbILXPHIg2FG/DdD4XWlg8gzew23I+r7qIEskw+ya54cVDKlPHx6li/8FZALYJBPj7wsw==
X-Received: by 2002:a2e:968e:: with SMTP id q14mr11079753lji.195.1566203227746;
        Mon, 19 Aug 2019 01:27:07 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u9sm2228410lfk.64.2019.08.19.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 01:27:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: ftgpio: Move hardware initialization
Date:   Mon, 19 Aug 2019 10:27:04 +0200
Message-Id: <20190819082704.14237-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is probably wise to initialize the hardware before registering
the irq chip.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ftgpio010.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 250e71f3e688..3118d282514a 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -296,10 +296,6 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = irq;
 
-	ret = devm_gpiochip_add_data(dev, &g->gc, g);
-	if (ret)
-		goto dis_clk;
-
 	/* Disable, unmask and clear all interrupts */
 	writel(0x0, g->base + GPIO_INT_EN);
 	writel(0x0, g->base + GPIO_INT_MASK);
@@ -308,6 +304,10 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	/* Clear any use of debounce */
 	writel(0x0, g->base + GPIO_DEBOUNCE_EN);
 
+	ret = devm_gpiochip_add_data(dev, &g->gc, g);
+	if (ret)
+		goto dis_clk;
+
 	platform_set_drvdata(pdev, g);
 	dev_info(dev, "FTGPIO010 @%p registered\n", g->base);
 
-- 
2.21.0

