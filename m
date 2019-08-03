Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 654C780651
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2019 15:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389014AbfHCNe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Aug 2019 09:34:59 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39539 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388206AbfHCNe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Aug 2019 09:34:59 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so58608032wmc.4;
        Sat, 03 Aug 2019 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DkNcRnL8FH3VgmR1dnBTegTNAsdwg0XzETSqbm2zevw=;
        b=vOP3h4+xTMO+2jauN1ZAUs3m7oypXxniShWBjKDmhd8oH3QDdjAdi95G96YYL7VNLK
         zYGkxywv//1wAiMGReBo1Z3HdMhhqrNOfXY9hSDT+h74SGOVQt3PCfj2ay2XGYKOzQPf
         Ru+508YBMf+WGW1Gl4hNPREEwmbhwWPMWM6oaXEtB4I/VA9Fe9paJn/Q6pgl4ZgEtgtZ
         L0w1toPaEjpG130t2wEVMaEc9aReGSeChLS88NzPag2MG/JHWv8LqBcxJC3rnIXK9JM+
         1OWBqwy06WvDz5FQ4o6UYYCqGCMh1ef+DQxyKjaZJee7R5TRbl2cegphjcomqLkVF1C8
         VMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DkNcRnL8FH3VgmR1dnBTegTNAsdwg0XzETSqbm2zevw=;
        b=WHg5RlptqGvPDzLCXNr5sGUsz0kL3AugV2hRBiL5KDpN7TpAR3cVY44qeYO9xiO4FY
         J1VPqWw/YZmWpIyPHV43wc7HbMx+ncoRO3+POfwlyr4MFPeBg0pg8R86V1zFua9YmGqL
         m478fcVxgEp82MDT3sFP3RAQ64SclL8aetaUHr8LMlEUaSp8uNbHdZZq6C9pjFbEX2V/
         cX1DS4VGrMVJbcG6FMYyfMbxkmr2jR+mxlHL4DjyLHx2dQNIULJhaT1mhuDZ1ewjMFDZ
         UX/m9Ihu24kq1VFc4SMF9LozW02qeyqHtSQtnpJB7eIBmWOhG5dfVZ3SG3AUctyGxr/A
         m4Ug==
X-Gm-Message-State: APjAAAVBN+YIf5lJEafqu1iH0Pe/ub4zO6cKHkxHS14di+sm76p4EjNc
        yRmddhck930LapICUy9/DCg=
X-Google-Smtp-Source: APXvYqzSkMZT4D9FhJSp/xY/wj3jkBfduIluCC7ztOUTt3ZOpsHDc2hIzlGY7FYSiOUglW5aakv/0Q==
X-Received: by 2002:a1c:6454:: with SMTP id y81mr9513848wmb.105.1564839296440;
        Sat, 03 Aug 2019 06:34:56 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
        by smtp.gmail.com with ESMTPSA id f3sm63118428wrt.56.2019.08.03.06.34.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 06:34:55 -0700 (PDT)
From:   Ramon Fried <rfried.dev@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH] gpiolib: Take MUX usage into account
Date:   Sat,  3 Aug 2019 16:34:36 +0300
Message-Id: <20190803133436.15016-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Stefan Wahren <stefan.wahren@i2se.com>

The user space like gpioinfo only see the GPIO usage but not the
MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
pin is free/safe to use. So take the MUX usage of strict pinmux controllers
into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Tested-By: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
Sending Stefan's RFC as patch, as I tested it and it seems to work,
additionally, an accompanying fix was made by me to gpiolibd to fix a
display error of the actual result:
https://patchwork.ozlabs.org/patch/1139923/

 drivers/gpio/gpiolib.c           |  3 ++-
 drivers/pinctrl/core.c           | 23 +++++++++++++++++++++++
 drivers/pinctrl/pinmux.c         | 18 ++++++++++++++++++
 drivers/pinctrl/pinmux.h         |  7 +++++++
 include/linux/pinctrl/consumer.h |  6 ++++++
 5 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..2fd9eee0b98c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1082,7 +1082,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
 		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
 		    test_bit(FLAG_EXPORT, &desc->flags) ||
-		    test_bit(FLAG_SYSFS, &desc->flags))
+		    test_bit(FLAG_SYSFS, &desc->flags) ||
+		    pinctrl_gpio_is_in_use(chip->base + lineinfo.line_offset))
 			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
 		if (test_bit(FLAG_IS_OUT, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a64849a9d1b0..0dd00c175eed 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -759,6 +759,29 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
+bool pinctrl_gpio_is_in_use(unsigned gpio)
+{
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_gpio_range *range;
+	bool result;
+	int pin;
+
+	if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
+		return false;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gpio);
+
+	result = pinmux_is_in_use(pctldev, pin);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return result;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_is_in_use);
+
 /**
  * pinctrl_gpio_request() - request a single pin to be used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 020e54f843f9..02d2751a4884 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -70,6 +70,24 @@ int pinmux_validate_map(const struct pinctrl_map *map, int i)
 	return 0;
 }
 
+bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin)
+{
+	struct pin_desc *desc = pin_desc_get(pctldev, pin);
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+
+	if (!desc) {
+		dev_err(pctldev->dev,
+			"pin %u is not registered so it cannot be requested\n",
+			pin);
+		return false;
+	}
+
+	if (ops->strict && desc->mux_usecount)
+		return true;
+
+	return ops->strict && !!desc->gpio_owner;
+}
+
 /**
  * pin_request() - request a single pin to be muxed in, typically for GPIO
  * @pin: the pin number in the global pin space
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 794cb3a003ff..24ae61136803 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -15,6 +15,8 @@ int pinmux_check_ops(struct pinctrl_dev *pctldev);
 
 int pinmux_validate_map(const struct pinctrl_map *map, int i);
 
+bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin);
+
 int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
 			unsigned pin, unsigned gpio);
@@ -42,6 +44,11 @@ static inline int pinmux_validate_map(const struct pinctrl_map *map, int i)
 	return 0;
 }
 
+static inline bool pinmux_is_in_use(struct pinctrl_dev *pctldev, unsigned pin)
+{
+	return false;
+}
+
 static inline int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
 			unsigned pin, unsigned gpio)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 86720a5a384f..d26826b057a1 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -24,6 +24,7 @@ struct device;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
+extern bool pinctrl_gpio_is_in_use(unsigned gpio);
 extern int pinctrl_gpio_request(unsigned gpio);
 extern void pinctrl_gpio_free(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
@@ -61,6 +62,11 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 
 #else /* !CONFIG_PINCTRL */
 
+static inline bool pinctrl_gpio_is_in_use(unsigned gpio)
+{
+	return 0;
+}
+
 static inline int pinctrl_gpio_request(unsigned gpio)
 {
 	return 0;
-- 
2.22.0

