Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1117EC42EB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 23:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfJAVrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 17:47:43 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44579 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfJAVrn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 17:47:43 -0400
Received: by mail-lf1-f68.google.com with SMTP id q11so11074143lfc.11
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 14:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJwlGq1TtQwFLSgA6mfwP2x59Db9d4N/6A5413/kJSw=;
        b=fafDBKHzPMe46dlC+vWZdpTYk4ywxKJh4qYmxIP/tcZGLXtLur2G9iPA/JWcPXzekE
         QeFDmTPX0xV2iVdL+jsuUUQ/llBquj75LWTdmnlXQWHG6yiSeRQ6XMQ53pTlR6isEmjh
         MYPngRaqcvfhuN8RJ7tumQooig+3FvbYj2kjG+499M73EZvb1FyukoDsMo52czisoFIc
         2FPnE1nefZ6x+qL4G0F9xBeLRwawGEQ4LUcJFYKorVG2w6O1Cr3cuXjTZ8heyb2hg9xw
         Yqyzw8eQPqDObd+E6iqx4Av4CcQ9Zt5zWFxtyxCLJ9v8fEaNchJBfyT6hm6YSgxzsLE/
         QbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJwlGq1TtQwFLSgA6mfwP2x59Db9d4N/6A5413/kJSw=;
        b=CuEY0xX3sEbGdkRK0LhsbWPu1sKMyGNeSXYxX8SI2VbFLLy6K4xHFTQn6iE+5yaLhV
         RJwgRRAhpH6Km2ssb9iLV6khjtE/GXZoUtT+FYFUvJFLM4zQbW+t2KAdmLNDj8sk3B+H
         tUuieutAA88lvLy0lHcAbwjA4aeSbrDPhcURQxUm3IiOcVdsrnt7hX6WHQc1C8iR7OVk
         7tgs4VgRDJSj1mIqC01/vv+ic0jCPDFHgVYn1UDEczKyxtphIXZ3zemJEoiASOqmdoet
         VPLY1C0kgUMCy5u5VkFjBemNyx7kysCSKiE/BKJrusZme7ZvE8OgDtlQsqrYhBulzwND
         f/Kg==
X-Gm-Message-State: APjAAAX7Ttve5+fh8ebym/Q+YorKFZWkeBpz7J48ApQ8v4fO+GVD132Q
        78rC1XOeVF5SvCpq/VVdeWWET1ftA5J5gA==
X-Google-Smtp-Source: APXvYqwJCziPbrHg5axA7CMt1PF+BaUA4DTVuTIggaPtHx8VhHTQUY+Z2RAB4J/Tw1lT9ufNRXn9gA==
X-Received: by 2002:a19:f111:: with SMTP id p17mr16533610lfh.187.1569966460659;
        Tue, 01 Oct 2019 14:47:40 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id m17sm5432706lje.0.2019.10.01.14.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 14:47:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Bresticker <abrestic@chromium.org>,
        James Hartley <james.hartley@sondrel.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: pistachio: Pass irqchip when adding gpiochip
Date:   Tue,  1 Oct 2019 23:45:36 +0200
Message-Id: <20191001214536.18477-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: James Hartley <james.hartley@sondrel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 379e9a6a6d89..eb40ae9f8639 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1352,6 +1352,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 	for (i = 0; i < pctl->nbanks; i++) {
 		char child_name[sizeof("gpioXX")];
 		struct device_node *child;
+		struct gpio_irq_chip *girq;
 
 		snprintf(child_name, sizeof(child_name), "gpio%d", i);
 		child = of_get_child_by_name(node, child_name);
@@ -1383,23 +1384,28 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 
 		bank->gpio_chip.parent = pctl->dev;
 		bank->gpio_chip.of_node = child;
-		ret = gpiochip_add_data(&bank->gpio_chip, bank);
-		if (ret < 0) {
-			dev_err(pctl->dev, "Failed to add GPIO chip %u: %d\n",
-				i, ret);
+
+		girq = &bank->gpio_chip.irq;
+		girq->chip = &bank->irq_chip;
+		girq->parent_handler = pistachio_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(pctl->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents) {
+			ret = -ENOMEM;
 			goto err;
 		}
+		girq->parents[0] = irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
 
-		ret = gpiochip_irqchip_add(&bank->gpio_chip, &bank->irq_chip,
-					   0, handle_level_irq, IRQ_TYPE_NONE);
+		ret = gpiochip_add_data(&bank->gpio_chip, bank);
 		if (ret < 0) {
-			dev_err(pctl->dev, "Failed to add IRQ chip %u: %d\n",
+			dev_err(pctl->dev, "Failed to add GPIO chip %u: %d\n",
 				i, ret);
-			gpiochip_remove(&bank->gpio_chip);
 			goto err;
 		}
-		gpiochip_set_chained_irqchip(&bank->gpio_chip, &bank->irq_chip,
-					     irq, pistachio_gpio_irq_handler);
 
 		ret = gpiochip_add_pin_range(&bank->gpio_chip,
 					     dev_name(pctl->dev), 0,
-- 
2.21.0

