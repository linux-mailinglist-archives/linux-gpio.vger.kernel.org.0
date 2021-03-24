Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B9F347347
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbhCXIUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhCXIT2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:28 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C35C061763;
        Wed, 24 Mar 2021 01:19:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id g20so12380502wmk.3;
        Wed, 24 Mar 2021 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qB49MCaUQa6wbIJ0vkp0O6ksgPfiyzCzGUz5+mT9oV8=;
        b=dptZkcq+qEu7d7RGW9Sm+Vj8Smefx9cQy05FKEvHOQqM9/FmGBi4lkTh74vCDnr395
         QECgLhprTst8Y9X3ObzXl4X9dvQlS9CTqBE7Z1MnqtVAZ7q8CPll2C6V7PKigBwUGmqd
         YjBMBsMQTlq0vw0VBEefdNk2nkBpZ8jFwteEXcvW+0E4Pmj+MrQM6NvBU/4p6qjLsYWC
         pLDvObQ13x3oeejmAAFjgIkvu/6uZBm5Az1MzvqecH0BXHIE88l0VVZ+W5L9KoijFtfP
         Kqv0eciqafiSloBwyjVSi50ubJCnx44H9CiGnXg6mhoYoK7FCCpXwXDz1gQVp+U2z3xt
         VqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qB49MCaUQa6wbIJ0vkp0O6ksgPfiyzCzGUz5+mT9oV8=;
        b=jyhIIErio+iVG4TL1IZmWM5PE5+tWs0VsAZGRmL4vyVkZdDYk2PCbjpnLUMMoI7bcs
         c7bZmmYVPGnyZUp/WugJIJDzcJYKA1hcI7C/lJod1pd3OOxxlYI1qT7SFwK7r/bMM2ej
         KTCmvntOgeqGyufAKkTjpMy1XIjfy65FkmI6hUkIaZtRfkkE2s99x7DUhn9QpnSm/j2+
         vLyIxGjU/N8BliOb5aIJNcS2U1fMto4rF0fd7Iwbufj/g7SLLXgqoGFPbC2eTM8bBY7C
         YftceUHg+MCFe9MjCszj8qIWbdP+FS1zoux0IVMHVSsqhtrYZASvhf+zzdSahH8ffE2Q
         UDMQ==
X-Gm-Message-State: AOAM531G6U/9LMkn8HXN8Wu0TOeLKvdx+Kan27EZuDQ4xw0Tx5BcHo9P
        2Bq2wJvCQgQS9fdrD54FAeM=
X-Google-Smtp-Source: ABdhPJzdeJsapCHgmO4hy9pQFutrgHtCt03VG/pY5PyuWDAm1oyUFMi2h8eVAQTOM/5CbcRB5rbKyA==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr1655069wmg.182.1616573966651;
        Wed, 24 Mar 2021 01:19:26 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:26 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 01/22] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
Date:   Wed, 24 Mar 2021 09:19:02 +0100
Message-Id: <20210324081923.20379-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324081923.20379-1-noltari@gmail.com>
References: <20210324081923.20379-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which results in
a compilation error when trying to build gpio-regmap if CONFIG_GPIOLIB_IRQCHIP
isn't enabled.

Fixes: 6a45b0e2589f ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 v9: no changes
 v8: no changes
 v7: no changes
 v6: no changes
 v5: add missing Suggested-by tag
 v4: add patch (fix include instead of gpio-regmap.c)

 include/linux/gpio/driver.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 286de0520574..ecf0032a0995 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -624,8 +624,17 @@ void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 				unsigned int offset);
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
 				struct irq_domain *domain);
+#else
+static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
+					      struct irq_domain *domain)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+#endif
 
 int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
-- 
2.20.1

