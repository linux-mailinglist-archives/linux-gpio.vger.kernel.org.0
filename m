Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8AF95917
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 10:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfHTIFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 04:05:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37215 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfHTIFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 04:05:34 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so3421320lfh.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mAOQfKuPDv59rAP/50Uq7dXiqumJsVP5h6BG03JNo8Q=;
        b=jqnHPhybhbHcvdfAzVhhj6bXrAwKiN/cMJDgpXvEhVMT4l16f/n8QXBTX0x1HtqKLy
         C1RYOqqsbe6pGprK/gm0KXdTNY/I7h2iClPwvqnmMsiIw9GRKFP0Zmu0j/rSsO6yfSxv
         AfqzxX0aV6JV+xe7hZXlV/vB56yA/26/k2VVIGg0JB8ZD2Bp4FkCmDpsYywySMKwbxiU
         cBfgzIqbdbsq8cAGcF6+4FrTWo0mFY+zdWH+wNCG/W0pYRiEqDfO5UwvjnHfpfTOqqtJ
         PHuhzxsk5frZqkqo4rZ0MYS67hvtTekNy5ORNoxRA0Z9IuoUn4C4ZH8bLmqPQCjmp2p8
         n0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mAOQfKuPDv59rAP/50Uq7dXiqumJsVP5h6BG03JNo8Q=;
        b=GhqprFsF55qc06wm0TgnYp6w7Go9xjfOOtrpfuGfRQ2dMzbo4T9UpKyCqogc0Z7bnr
         3CIpZXGH6fhkyMSuObr9HE9O3gADMghxl22NnhdK8Y91O7FIt4+VW6/e/4ivWLdfEcw9
         8PYrw6NOkMV4wPYO1Il8ufBNML5RQgKwL2PDGY8av2vgh3yXETSJ1HRoqA5kfSs6LYUm
         dgoVNJHWBZEBgw8K59yp2wE5TNbXpWildfM12edmKiWJnsjh5gduNfsAToiHy5CQnaTB
         6KzHR9NDIl21DU2GljjzpakN+WUkSK3TvTDyaVSec5uvFFJQtJ9gv5ki1nMVMvb7GQrB
         +dlA==
X-Gm-Message-State: APjAAAUj83D7r7p1Ooa+oz2yRMUkrY0cZFR+g2gzSqCHVbdin4cLREHl
        XOh4abzZbOZXy/g72eRGspkie+RXLTA=
X-Google-Smtp-Source: APXvYqwjJLwZH8hlaqawdTy39q/XhbVL5rP2uMXCH5lBXDJP2Pwn2MsTulDiPn8C4VcZ7J9mkGQTjA==
X-Received: by 2002:a19:4349:: with SMTP id m9mr14554832lfj.64.1566288331681;
        Tue, 20 Aug 2019 01:05:31 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id i123sm3014957lfi.72.2019.08.20.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 01:05:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] gpio: Fix irqchip initialization order
Date:   Tue, 20 Aug 2019 10:05:27 +0200
Message-Id: <20190820080527.11796-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The new API for registering a gpio_irq_chip along with a
gpio_chip has a different semantic ordering than the old
API which added the irqchip explicitly after registering
the gpio_chip.

Move the calls to add the gpio_irq_chip *last* in the
function, so that the different hooks setting up OF and
ACPI and machine gpio_chips are called *before* we try
to register the interrupts, preserving the elder semantic
order.

This cropped up in the PL061 driver which used to work
fine with no special ACPI quirks, but started to misbehave
using the new API.

Fixes: e0d897289813 ("gpio: Implement tighter IRQ chip integration")
Cc: Thierry Reding <treding@nvidia.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Reported-by: Wei Xu <xuwei5@hisilicon.com>
Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Wei: it would be great if you could test this and
confirm if it solves your problem, so I can apply this
for fixes.
---
 drivers/gpio/gpiolib.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 80a2a2cb673b..cca749010cd0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1373,21 +1373,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (status)
 		goto err_remove_from_list;
 
-	status = gpiochip_irqchip_init_valid_mask(chip);
-	if (status)
-		goto err_remove_from_list;
-
 	status = gpiochip_alloc_valid_mask(chip);
 	if (status)
-		goto err_remove_irqchip_mask;
-
-	status = gpiochip_add_irqchip(chip, lock_key, request_key);
-	if (status)
-		goto err_free_gpiochip_mask;
+		goto err_remove_from_list;
 
 	status = of_gpiochip_add(chip);
 	if (status)
-		goto err_remove_chip;
+		goto err_free_gpiochip_mask;
 
 	status = gpiochip_init_valid_mask(chip);
 	if (status)
@@ -1413,6 +1405,14 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	machine_gpiochip_add(chip);
 
+	status = gpiochip_irqchip_init_valid_mask(chip);
+	if (status)
+		goto err_remove_acpi_chip;
+
+	status = gpiochip_add_irqchip(chip, lock_key, request_key);
+	if (status)
+		goto err_remove_irqchip_mask;
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -1424,21 +1424,21 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (gpiolib_initialized) {
 		status = gpiochip_setup_dev(gdev);
 		if (status)
-			goto err_remove_acpi_chip;
+			goto err_remove_irqchip;
 	}
 	return 0;
 
+err_remove_irqchip:
+	gpiochip_irqchip_remove(chip);
+err_remove_irqchip_mask:
+	gpiochip_irqchip_free_valid_mask(chip);
 err_remove_acpi_chip:
 	acpi_gpiochip_remove(chip);
 err_remove_of_chip:
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
-err_remove_chip:
-	gpiochip_irqchip_remove(chip);
 err_free_gpiochip_mask:
 	gpiochip_free_valid_mask(chip);
-err_remove_irqchip_mask:
-	gpiochip_irqchip_free_valid_mask(chip);
 err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&gdev->list);
-- 
2.21.0

