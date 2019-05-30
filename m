Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147F930210
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2019 20:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfE3Sjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 May 2019 14:39:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45130 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfE3Sjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 May 2019 14:39:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id b18so4815153wrq.12
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2019 11:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAK9MrenSlPC8C/iHgrsmDrbWNiFudxPoXTBF+kuvuo=;
        b=Jfae/Of59+yIXNUVWWoF71kdiFFUziUO4kmL/VbMl0NWzrR3TNzEjT29tv88FaTXhx
         W4SM5uod1CVFAcIB8TLoextBz2N39q7Jtun0clozoHgqtyGzDngQKvXA07NkOiZQ/AKm
         e8/RDIY+rrJQYAw1TxysdHlWo8tpI2tSRkZUN11O5htG95FYIxgKaEZVhAvsRhbKEal1
         YkEOLM3Say9oQt3qeCNy/MSyU/Wv9l8RZBiWCzlwsW69OY3TODpGJRnCZdjdNSJq8DfX
         arzonaPQq6EzdefbjpD4x2IyXi3w4dty+GwqN5HRtsdLNTDAoZDpS8Oh1vzHbdhkl3du
         lPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAK9MrenSlPC8C/iHgrsmDrbWNiFudxPoXTBF+kuvuo=;
        b=Euy/WP/H+Lwc0GMi67QzBatSgbfD9mRzOfxS+XseBaL7bCD5bWqmjDGVc5sVGndawJ
         etmeav/iKFzqTYH/1pGg8Xf9rQ7TNYOjnmnWY1CgZKpi2uKgCg6WxL7GAI1nNc/VMfHO
         u0/9nP7VmvKyAhZGxxlS952tcZJfZbrOv4ziGapRN381nkLXZCkoPwKGVWrFUkaaQKw7
         r/BvSA4I55u+T83X2wX1P+5EzY+w5nuICqfj1/lPZjX7VsE3WeiABXZ6xW4yXAd31hni
         hyMPr0Or8nq+ENyBELyNB2AatuCkFGbnwQv/NJFGEFEr9UNO9IH24fQY6pKS3YhKqeXy
         vlVQ==
X-Gm-Message-State: APjAAAVuty6VcMx07XM6IQwUIrWivs5XKRS6DGydJ+IsvvT+a83Qeu0w
        V7budEiZN8DpmuxQU+NNTjPJVg==
X-Google-Smtp-Source: APXvYqyMDhfBNqRWiXBoU9dEGkDWEBjMmw7g+FzvfkXbOpVBds8XlAECsA5/ZO/zQhTNMFrP+U9Vdg==
X-Received: by 2002:adf:e9ca:: with SMTP id l10mr3359952wrn.47.1559241577128;
        Thu, 30 May 2019 11:39:37 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id l8sm2097012wrw.56.2019.05.30.11.39.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 11:39:36 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Mike Lockwood <lockwood@google.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] extcon: gpio: Request reasonable interrupts
Date:   Thu, 30 May 2019 20:39:32 +0200
Message-Id: <20190530183932.4132-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The only thing that makes sense is to request a falling edge interrupt
if the line is active low and a rising edge interrupt if the line is
active high, so just do that and get rid of the assignment from
platform data. The GPIO descriptor knows if the line is active high
or low.

Also make irq a local variable in probe(), it's not used anywhere else.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-gpio.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
index 13ba3a6e81d5..a0674f1f3849 100644
--- a/drivers/extcon/extcon-gpio.c
+++ b/drivers/extcon/extcon-gpio.c
@@ -30,26 +30,22 @@
 /**
  * struct gpio_extcon_data - A simple GPIO-controlled extcon device state container.
  * @edev:		Extcon device.
- * @irq:		Interrupt line for the external connector.
  * @work:		Work fired by the interrupt.
  * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
  *			value.
  * @gpiod:		GPIO descriptor for this external connector.
  * @extcon_id:		The unique id of specific external connector.
  * @debounce:		Debounce time for GPIO IRQ in ms.
- * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
  * @check_on_resume:	Boolean describing whether to check the state of gpio
  *			while resuming from sleep.
  */
 struct gpio_extcon_data {
 	struct extcon_dev *edev;
-	int irq;
 	struct delayed_work work;
 	unsigned long debounce_jiffies;
 	struct gpio_desc *gpiod;
 	unsigned int extcon_id;
 	unsigned long debounce;
-	unsigned long irq_flags;
 	bool check_on_resume;
 };
 
@@ -77,6 +73,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 {
 	struct gpio_extcon_data *data;
 	struct device *dev = &pdev->dev;
+	unsigned long irq_flags;
+	int irq;
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
@@ -96,9 +94,20 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
 	if (IS_ERR(data->gpiod))
 		return PTR_ERR(data->gpiod);
-	data->irq = gpiod_to_irq(data->gpiod);
-	if (data->irq <= 0)
-		return data->irq;
+	irq = gpiod_to_irq(data->gpiod);
+	if (irq <= 0)
+		return irq;
+
+	/*
+	 * It is unlikely that this is an acknowledged interrupt that goes
+	 * away after handling, what we are looking for are falling edges
+	 * if the signal is active low, and rising edges if the signal is
+	 * active high.
+	 */
+	if (gpiod_is_active_low(data->gpiod))
+		irq_flags = IRQF_TRIGGER_FALLING;
+	else
+		irq_flags = IRQF_TRIGGER_RISING;
 
 	/* Allocate the memory of extcon devie and register extcon device */
 	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
@@ -117,8 +126,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
 	 * Request the interrupt of gpio to detect whether external connector
 	 * is attached or detached.
 	 */
-	ret = devm_request_any_context_irq(dev, data->irq,
-					gpio_irq_handler, data->irq_flags,
+	ret = devm_request_any_context_irq(dev, irq,
+					gpio_irq_handler, irq_flags,
 					pdev->name, data);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

