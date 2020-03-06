Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E917BE30
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 14:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgCFNXd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 08:23:33 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44830 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgCFNXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 08:23:33 -0500
Received: by mail-lj1-f196.google.com with SMTP id a10so2159046ljp.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2020 05:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5p0q249kQ19apNNwnIykCR+Ljj6bkbqNaaZmDhFryY8=;
        b=IVAxe5fhzLMkLefAx0pA5KLVPKga9qnDuKoT/TDmDXX2u4lRV4sosbO/OTfcKY6tKt
         L4x08JKs3RDhU9vZqz7AcLe1MiKEVEeX+XgSB2PLpa6OWj38j/1JGgzprP1MQDH03HSl
         vOemNL3oJE5Lm5dVFgoQ/hymLaQeC2OPvlbiTLU52a78TWcxg+eFHt1vtFlhoOhEwxtL
         3X3Wl2iGzyWeWhOwqtUwoI+WhRPJxpI06pEKNPBij/hQov8/Qz870uiUKRQ6YQ2crsSl
         7Y3ewIkxJgWWYdb1JrWXnSu+8TlgnLQEonOUr0jJSUBwqAlcNXEGA4pzvCDx5PXGgh2Y
         LrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5p0q249kQ19apNNwnIykCR+Ljj6bkbqNaaZmDhFryY8=;
        b=paNzFCOGEVCU6a7IlvwspGg0xR4J/lHnust1igywmasjj9LkKLhCMIsBechXpIl2Wr
         utJAerfKlAnQ59O71OqIHUKdUty/1g8YkKKt8oNzSYcBCJJ+GYtWlvvklXvGsCaYz8d0
         +Eyv1rEhO9Yl1T6PQ20BXlV12Q595kImk1xf5EvL+VBOkbfMOIZhczTVJkeQOeYf3EeR
         mCWvGgIkr7UxzkNj6Sj6uwQw+Zf+suYRBmlFttMQjvTSjHg4a4vZsq17WWbQZiPL8tnN
         SY4IjxGe6f+3rkSyNCXVUye+5hTYYrX2AQ8MVKW1OO0mHXUmicmbVToS6b4YU4vCWNT0
         9HyQ==
X-Gm-Message-State: ANhLgQ3UiKQCobrbYvdWehm+lbTlyn/sX8R4bMq7WQOsDc7ePk6MgLxv
        D0nnNHtnMBOVnGfoaYfLktZgz8a8HKQ=
X-Google-Smtp-Source: ADFU+vtU2DcIUl8Tn5aTldmW2bk4FA94y/+pSMtaZMZ4MkDMZsTWGt7/umdWHZuBTugukgCq1xP+0g==
X-Received: by 2002:a05:651c:326:: with SMTP id b6mr2129317ljp.289.1583501010817;
        Fri, 06 Mar 2020 05:23:30 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o20sm20132808lfg.45.2020.03.06.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 05:23:30 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, stable@vger.kernel.org
Subject: [PATCH] gpiolib: Fix irq_disable() semantics
Date:   Fri,  6 Mar 2020 14:23:26 +0100
Message-Id: <20200306132326.1329640-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The implementation if .irq_disable() which kicks in between
the gpiolib and the driver is not properly mimicking the
expected semantics of the irqchip core: the irqchip will
call .irq_disable() if that exists, else it will call
mask_irq() which first checks if .irq_mask() is defined
before calling it.

Since we are calling it unconditionally, we get this bug
from drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c, as it only
defines .irq_mask_ack and not .irq_mask:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = (ptrval)
(...)
PC is at 0x0
LR is at gpiochip_irq_disable+0x20/0x30

Fix this by only calling .irq_mask() if it exists.

Cc: Brian Masney <masneyb@onstation.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: stable@vger.kernel.org
Fixes: 461c1a7d4733 ("gpiolib: override irq_enable/disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bdbc1649eafa..d0bb962f42d5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2169,9 +2169,16 @@ static void gpiochip_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
+	/*
+	 * Since we override .irq_disable() we need to mimic the
+	 * behaviour of __irq_disable() in irq/chip.c.
+	 * First call .irq_disable() if it exists, else mimic the
+	 * behaviour of mask_irq() which calls .irq_mask() if
+	 * it exists.
+	 */
 	if (chip->irq.irq_disable)
 		chip->irq.irq_disable(d);
-	else
+	else if (chip->irq.chip->irq_mask)
 		chip->irq.chip->irq_mask(d);
 	gpiochip_disable_irq(chip, d->hwirq);
 }
-- 
2.24.1

