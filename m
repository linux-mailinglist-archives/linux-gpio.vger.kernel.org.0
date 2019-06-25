Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316E654CC3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 12:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfFYKxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 06:53:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45367 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbfFYKxv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 06:53:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so15731266lje.12
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0f0W7WStv6RQJrFpojftu42py7SwzycQLlXcXJvd8c=;
        b=sXNZIHghQR3Qy/KlxcpuhirLamlyJZboiC/HAYATBR3OlOR4ssHFttBatwHyj/qc8l
         tWl/UK75PnCP7Sus6XuTUxnUyBSC/KxG5v0/ebBUDIrFWJ6ETwmmz5YK2BX7Aiwz1LjZ
         ECz49Y395qYTDYSIujkHqYBOKT6li0u3nLmWBojgAk9OtUz2SMI4V8JcmgmgMRCB1bv2
         qHDf0I25icSciWBXXGNda8yKVvOZDJBasluUrlofwzli8B/x+uUbjAKhWWBOep2fq6qo
         nEz1URgWg2BJGAEJtWdgPC1pThimIuIubi6TTAF9XGCUzspdA+YIq/lq2YLadwVrpUqY
         cSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0f0W7WStv6RQJrFpojftu42py7SwzycQLlXcXJvd8c=;
        b=uRwJrwhIeJyHAtXlL38xm/tV/zOyIW4TqsGDoC2cW+lbbgcBnQ3X/lyr28hYjuFZze
         eiScxM0hcgyH9Tt9IpYAs0cXY2AwW/W8YmNesGhnwDDA7xr0bZj8w5e10N0h8UE0uUz8
         /c7GS7QqnF4JfvvMR2eXapA58QG9Wi4hpEpvF95CeUYB5+B+nM5st7ERwKIagZHrLdyO
         2e0jWrAU9lE7QCbmdytAoi9b1w6PkpxrvpuRRP90R7XnT+SA/WtnV4Y0tBPm4VyPJjeA
         8QX5hfZ6urek29R1AmI13c0lGN5YhFgNGaA9XqXzlRsYP1cc8DSuscWls+NgsRTJGhEW
         +wtg==
X-Gm-Message-State: APjAAAWBCMWocE8lC2nDDJSf9KUqicMVK9/X1iLCltfG6yuyNxvDcJa1
        hNsVod7+w+nN2FO559ypwoVgr27PjTQ=
X-Google-Smtp-Source: APXvYqzSjY8cXw2LHvD48UEY0pjmvO7ovxflg9t/tnPtPY9tqJcoxN7jAz7jsr/q3FaMaWRbzWfEwg==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr56072912ljj.144.1561460029243;
        Tue, 25 Jun 2019 03:53:49 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m4sm2197925ljc.56.2019.06.25.03.53.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 03:53:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: siox: Pass irqchip when adding gpiochip
Date:   Tue, 25 Jun 2019 12:53:46 +0200
Message-Id: <20190625105346.3267-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip.

For chained irqchips this is a pretty straight-forward
conversion.

The siox GPIO driver passes a IRQ_TYPE_EDGE_RISING as
default IRQ trigger type which seems wrong, as consumers
should explicitly set this up, so set IRQ_TYPE_NONE instead.

Also gpiochip_remove() was called on the errorpath if
gpiochip_add() failed: this is wrong, if the chip failed
to add it is not there so it should not be removed.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-siox.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index fb4e318ab028..e5c85dc932e8 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -211,6 +211,7 @@ static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int gpio_siox_probe(struct siox_device *sdevice)
 {
 	struct gpio_siox_ddata *ddata;
+	struct gpio_irq_chip *girq;
 	int ret;
 
 	ddata = devm_kzalloc(&sdevice->dev, sizeof(*ddata), GFP_KERNEL);
@@ -239,20 +240,16 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	ddata->ichip.irq_unmask = gpio_siox_irq_unmask;
 	ddata->ichip.irq_set_type = gpio_siox_irq_set_type;
 
+	girq = &ddata->gchip.irq;
+	girq->chip = &ddata->ichip;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
 	ret = gpiochip_add(&ddata->gchip);
 	if (ret) {
 		dev_err(&sdevice->dev,
 			"Failed to register gpio chip (%d)\n", ret);
-		goto err_gpiochip;
-	}
-
-	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
-				   0, handle_level_irq, IRQ_TYPE_EDGE_RISING);
-	if (ret) {
-		dev_err(&sdevice->dev,
-			"Failed to register irq chip (%d)\n", ret);
-err_gpiochip:
-		gpiochip_remove(&ddata->gchip);
+		return ret;
 	}
 
 	return ret;
-- 
2.20.1

