Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A327A564CA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbfFZIoX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:44:23 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46260 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfFZIoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:44:23 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so966347lfh.13
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1lkaTi63iwBz94zE2XHXLCsstz8matol9Cqw1XSNic=;
        b=IG01X172XqUJSWpN18yLVha5rtcaFaYrErxmjpwJurGZk+DldemW0D9+a7vQcZ5yeK
         PCmCZK/g0+MYjhjePr0sixoLG/H1QVTyDyW7kOIzXm/9/dqZne/dGgOCFolcGJ5Uzg1n
         P1ANBDbkET18C2d1uHt5F7+KgEI61WGGTnaYPAEucUpwKZPw/0ADu+0eINDjG9/B1rZd
         kuKjytabiIRVOGSpmSbhmE+fpRLYGrd1eyrpRmvn0dev2kdjVBmLl+JNQMdt45v3Jrlu
         thueaJoEResYpGiFWlxg75sbi5uWjNopQOI9R3rfvAl2o/OvqN83CurzecmBi4KCPTrb
         csWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1lkaTi63iwBz94zE2XHXLCsstz8matol9Cqw1XSNic=;
        b=mHcah+efTk1jEZBWH4eTzF614MlU+QKgSJ66WFtmQxgn19Aw8rGV/ISdSLH+VhpL/f
         pliZx/zPJv9CMl2MB4iG7f4iQ/xpDFUlYp+QtN75ym8nGr24AH7neAXbdSf09yKErFcW
         DQ3LLZNWiiYgGSMsZ3aN2l+y+FgFdoDm3cpRiKGDe3/gchfuln91KyanFueSKKig6AMb
         w2tkhO0imJrteeJ7v+gzxio590d/Z+AXtx3XAEG74FUSp4dN+hFbhPJSBJg5x/3wNeHR
         rCrua2qqiDR6cxgSYNtXf9LaFYDv34W+L9zbwpXHRYyt/85PrmJI9MC9I0FqoGWUqe2A
         GgqQ==
X-Gm-Message-State: APjAAAWzTMJzB5L0L5VUGGErM13WIO8o5KK4976F2Lh1ctfTseb3XSuw
        MF3K/yF4mK3iejBv+716RaJDLqQG1jw=
X-Google-Smtp-Source: APXvYqwnQjXKnVP7EQ4AUb+gPd0W2OBZorIJdziWQHPrcAVKER6WNr1GkfgFZO0QeZMCAIeWwhWBxw==
X-Received: by 2002:ac2:4904:: with SMTP id n4mr1920945lfi.53.1561538660465;
        Wed, 26 Jun 2019 01:44:20 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y5sm2683635ljj.5.2019.06.26.01.44.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 01:44:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 4/5] gpio: siox: Add struct device *dev helper variable
Date:   Wed, 26 Jun 2019 10:44:06 +0200
Message-Id: <20190626084407.27976-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626084407.27976-1-linus.walleij@linaro.org>
References: <20190626084407.27976-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the code easier to read.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-siox.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 31749c058e33..f85f1fab781f 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -212,20 +212,21 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 {
 	struct gpio_siox_ddata *ddata;
 	struct gpio_irq_chip *girq;
+	struct device *dev = &sdevice->dev;
 	int ret;
 
-	ddata = devm_kzalloc(&sdevice->dev, sizeof(*ddata), GFP_KERNEL);
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
 
-	dev_set_drvdata(&sdevice->dev, ddata);
+	dev_set_drvdata(dev, ddata);
 
 	mutex_init(&ddata->lock);
 	spin_lock_init(&ddata->irqlock);
 
 	ddata->gchip.base = -1;
 	ddata->gchip.can_sleep = 1;
-	ddata->gchip.parent = &sdevice->dev;
+	ddata->gchip.parent = dev;
 	ddata->gchip.owner = THIS_MODULE;
 	ddata->gchip.get = gpio_siox_get;
 	ddata->gchip.set = gpio_siox_set;
@@ -247,8 +248,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 
 	ret = gpiochip_add(&ddata->gchip);
 	if (ret) {
-		dev_err(&sdevice->dev,
-			"Failed to register gpio chip (%d)\n", ret);
+		dev_err(dev, "Failed to register gpio chip (%d)\n", ret);
 		return ret;
 	}
 
-- 
2.20.1

