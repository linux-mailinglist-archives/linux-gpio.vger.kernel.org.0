Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7EC564CB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfFZIoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:44:25 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41522 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfFZIoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:44:25 -0400
Received: by mail-lf1-f67.google.com with SMTP id 136so984652lfa.8
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Thv0yruwmmup3gZPVBMby8+N9UFFpu3/fAgwAoU8xE=;
        b=knnu9IX3AnghdmjiUVHJy9jxcgNpjMBB66zzyDAghznBI8N7ROY8lSn4mf2RTQexKt
         7vETLu1V5IfVMrlInrD/CUsAgxv0diehd/u7LJTVq25G1VE5Aw8msLh8zeNaNdxK2ZG8
         7MmH3QNXZ+t0ntocSvlPczy7FtqUvv0PIeNz/+6O/5AAwwb3W+RjTdA6IvFpAZd9KxVn
         hnamNT9zrlqgpnOCgYHJHMaex6nGCS/9OpZi4JOD4uEMj8t8YphkegkEpNDbOUJSWie3
         pd6nXFcqsX+4Z6pY9YSzrrfkNdGjTmjWy9n3jDlohh9S4Sqis98yLW4O97r5LCYyK8TW
         H4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Thv0yruwmmup3gZPVBMby8+N9UFFpu3/fAgwAoU8xE=;
        b=HkyzON4jy5spYid7Xoif7exnicY3k8vaW0FkJwVQwAY08AF9T00SJp649TsCT08Jdv
         3TO8BGnTLpda04DavkGA/MRDrPKHOqWx64h1gZBiETVOLw238cZwgC3hV1khsRBZHdJp
         OPGAvxFgq4k0EfPLTln0LqJuyIyTOZq2GUGmT8PToqWBvxjJXs5K9X7x56V2skbN5h/D
         W5AHg2aAbfo9TqN08RTIsIylbZuTcpf2h0dMWZYrXk3NrFw4nTlY7InjuTL/H+3sP4vT
         1PS1huSvdEQMKyQT/yJxs/88QtWqd1wycvNgrANXXN4RXwBp6AiEBSjGw90Y0BJZqW6D
         3mog==
X-Gm-Message-State: APjAAAXNS0E7uDxcA/9daJ41H6vaz6Q5hMdLmc0dqFtCGV6oLIHnTpgd
        keaW/vygUR1rG7aLpuGgjTYJJMZnZyU=
X-Google-Smtp-Source: APXvYqwfBMtpnh1EKTNcGvOqOF/gb+1q3FFl3UM+oXG2ZmqDkcTMdKQ0jlP+OmQoSZOZ/f9UX3txvQ==
X-Received: by 2002:a19:7607:: with SMTP id c7mr2108961lff.28.1561538663409;
        Wed, 26 Jun 2019 01:44:23 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y5sm2683635ljj.5.2019.06.26.01.44.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 01:44:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 5/5] gpio: siox: Use devm_ managed gpiochip
Date:   Wed, 26 Jun 2019 10:44:07 +0200
Message-Id: <20190626084407.27976-5-linus.walleij@linaro.org>
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

By using devm_gpiochip_add_data() we can get rid of the
remove() callback. As this driver doesn't use the
gpiochip data pointer we simply pass in NULL.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-siox.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index f85f1fab781f..5e3861c1ad99 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -246,7 +246,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	ret = gpiochip_add(&ddata->gchip);
+	ret = devm_gpiochip_add_data(dev, &ddata->gchip, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to register gpio chip (%d)\n", ret);
 		return ret;
@@ -255,17 +255,8 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	return 0;
 }
 
-static int gpio_siox_remove(struct siox_device *sdevice)
-{
-	struct gpio_siox_ddata *ddata = dev_get_drvdata(&sdevice->dev);
-
-	gpiochip_remove(&ddata->gchip);
-	return 0;
-}
-
 static struct siox_driver gpio_siox_driver = {
 	.probe = gpio_siox_probe,
-	.remove = gpio_siox_remove,
 	.set_data = gpio_siox_set_data,
 	.get_data = gpio_siox_get_data,
 	.driver = {
-- 
2.20.1

