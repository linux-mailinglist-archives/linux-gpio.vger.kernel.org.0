Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A184587E3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 19:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfF0RCd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 13:02:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39317 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfF0RCd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 13:02:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so6390789wma.4
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0xYG4HZED+E9m9ml553eZ53Gjg1VkuMzfTuMKX7NOM=;
        b=WtjLdKRZYuwoKitIobhj4K9KSYyPiUoXZW6ioFthuQbdp8UEve8t7GpRMp1aALF19q
         UZAtxDRbPNHz5prQJeL9Ul1rj9qOVqdUWM7RtjPlhZ2JGH6A9zvpOTNLXs1PIRe3VGIP
         bCUlWlVzVX/AxTrf051CWZym4qjjOoaOPKokncBlrLjsWdgkYw814Cml/b+nObvYYJIH
         gsIwBFvV77O0LqXrn7toHL9PLlYcz1Vid1KrDvfwBO0ZHLlkoru9V009klVEfTF/Jw9H
         TjDrBzSbaeo34P0CTE1l+RCD3FgxWjitnzCiRs5Ve5jqLkuP6y51gG+ciRnww2Kskwja
         uwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0xYG4HZED+E9m9ml553eZ53Gjg1VkuMzfTuMKX7NOM=;
        b=k+W3yIedqMmKI3T/m6QH95YGhFlSD4D9xD0+TSrQR5HovWxOj5+SBheAfwmzHyR6oG
         9GZILF9Xv+IlzUWItOScgpYmmoaTCiifJnNqYhr7KDr/F5fxpvjoyqK889BaSHUIGyiH
         rnj9baFH6HHjvSkTyOnYERWOT78l/nTCb7SrnBeFKOFgqZDI8dKHm6fBz+G9Yx87DbmB
         O/CR6/YCTqUi4qNKl53P+f8uVWE1+2jYsq/SVXzR9cfKNs0RnnRfT3XmoTdUvbkwQcx0
         uNIqFhZFzEwJNexh27YGMKHlWr41D6elNCH6eJiQKx+vnEKd6Cjl/5PzLkRf4DQXr/sP
         KblQ==
X-Gm-Message-State: APjAAAVtiklqrL78apLmndJ7sJz2cqgHHzi/f4H5ZhQbTLR/7LNQFdru
        tQRminol5SUk6m1mO0In6/1opbFiOldysw==
X-Google-Smtp-Source: APXvYqyRPr35zAHEZhotfQo+gy8zClmyoxExMnjhDydqO+/Z/jhlRojaqqrjdkZQrf4UzOWJ2sbXZg==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr4124116wme.94.1561654950877;
        Thu, 27 Jun 2019 10:02:30 -0700 (PDT)
Received: from genomnajs.guestnet.cambridge.arm.com ([212.187.182.165])
        by smtp.gmail.com with ESMTPSA id l124sm9454503wmf.36.2019.06.27.10.02.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 10:02:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH 3/5 v3] gpio: siox: Pass irqchip when adding gpiochip
Date:   Thu, 27 Jun 2019 18:02:21 +0100
Message-Id: <20190627170221.31444-1-linus.walleij@linaro.org>
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

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Diet down if (ret) { ... return ret; } return 0;
  to if (ret) ... return ret;
ChangeLog v1->v2:
- Split out bugfixes to separate patches.
---
 drivers/gpio/gpio-siox.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 40067e1535d3..26a0ecd487cb 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -211,6 +211,7 @@ static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int gpio_siox_probe(struct siox_device *sdevice)
 {
 	struct gpio_siox_ddata *ddata;
+	struct gpio_irq_chip *girq;
 	int ret;
 
 	ddata = devm_kzalloc(&sdevice->dev, sizeof(*ddata), GFP_KERNEL);
@@ -239,18 +240,15 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	ddata->ichip.irq_unmask = gpio_siox_irq_unmask;
 	ddata->ichip.irq_set_type = gpio_siox_irq_set_type;
 
-	ret = gpiochip_add(&ddata->gchip);
-	if (ret) {
-		dev_err(&sdevice->dev,
-			"Failed to register gpio chip (%d)\n", ret);
-		return ret;
-	}
+	girq = &ddata->gchip.irq;
+	girq->chip = &ddata->ichip;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
 
-	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
-				   0, handle_level_irq, IRQ_TYPE_NONE);
+	ret = gpiochip_add(&ddata->gchip);
 	if (ret)
 		dev_err(&sdevice->dev,
-			"Failed to register irq chip (%d)\n", ret);
+			"Failed to register gpio chip (%d)\n", ret);
 
 	return ret;
 }
-- 
2.20.1

