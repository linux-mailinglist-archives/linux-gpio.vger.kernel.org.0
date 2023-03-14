Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6146B9275
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 13:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbjCNMAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 08:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjCNMAb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 08:00:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20999FE44
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 05:00:05 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d36so19656940lfv.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678795182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViP+MAHVi9ZX7WmXnnlEqSV44cIxrdPJm6mHwoawDgM=;
        b=gI4K0yab0tI/hvQk5FfB96VwA8JGsKdD5yzdodVHZZBhJ+AyW7y2OZ6I5PEVxDJRxf
         MhhthPdiQHCBjsLw6fToZxWOi8Guu19sGyaRZeeVbpGrGp9AsX71lNuxuA9DZTwetFBm
         gJD1KS6/tFf9u4VsUHQq2RJYWNwq6g5gF1s3khcsDMS7KRNqYPo9ct03fxvUE+x/I8WW
         5DyB14AVtnDGufYVv+m9C4Y0keOlxWS8m47QRKK+u40sjrregKT5OKShXWOppTSvqMZM
         bmXBgBCT1aLT1BERU9nMQRzTE2jyxXGaMRphDSLM9Xcyuw4FLtXsc12JGuKc/pxsbglT
         tIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678795182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViP+MAHVi9ZX7WmXnnlEqSV44cIxrdPJm6mHwoawDgM=;
        b=32nbR6HZPf+T0AE6PDhtKACtHR3mBrri4Q6LnL70rPur0Zw2GkmY489/8wMdwwRA9v
         rLz1LlbXD1vbqkNRuZTqsAHJyhvePj77UV/dZB/LoXB1g0sW91/BL7eBy1oLPJgdQTlf
         dVR1xwGNfHnIA2quHFWyxq+eUM+vDXmywF2SOoNQx0mS+U9EcIDrn9PXZHQPOirElJrI
         /bh7uBcpBpaQh8cVmStxOZeCoj3HEWZUIntG4ymQ7Q6ipiurxGUiNK/cw3ugqlE4Qt35
         VRfdSk7rwfFZmHtjc/HF/dEja4W0S9Uii0ehMvHI8hmn2lroxwaqGZMNy4pCQqp0x6YE
         goYA==
X-Gm-Message-State: AO0yUKUZoommr8QIesrIkEBFgiYbfMrFU8dnSdONSkyeIbhOYfKSFDHb
        BBgAvNqWqhuJmEkTELIlKlpbGQ==
X-Google-Smtp-Source: AK7set9HxJWvCWZqRUD1AUMJ2jgecIt1ciTlkSlWfUSEIAx/SP8rU0kevunAothDR/ypZkpuLAOmrg==
X-Received: by 2002:ac2:5966:0:b0:4b6:a6e4:ab7a with SMTP id h6-20020ac25966000000b004b6a6e4ab7amr598959lfp.8.1678795182136;
        Tue, 14 Mar 2023 04:59:42 -0700 (PDT)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id q19-20020ac25293000000b004dc4b00a1f3sm373747lfm.253.2023.03.14.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 04:59:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH] leds: Delete GPIO LED trigger
Date:   Tue, 14 Mar 2023 12:59:40 +0100
Message-Id: <20230314115940.411939-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO LED trigger exposes a userspace ABI where a user
can echo a GPIO number from the global GPIO numberspace into
a file that will trigger a certain LED when active.

This is problematic because the global GPIO numberspace is
inherently instable. The trigger came about at a time when
systems had one GPIO controller that defined hard-wired
GPIOs numbered 0..N and this number space was stable.

We have since moved to dynamic allocation of GPIO numbers
and there is no real guarantee that a GPIO number will stay
consistent even across a reboot: consider a USB attached
GPIO controller for example. Or two. Or the effect of
probe order after adding -EPROBE_DEFER to the kernel.

The trigger was added to support keypad LEDs on the Nokia
n810 from the GPIO event when a user slides up/down the
keypad. This is arch/arm/boot/dts/omap2420-n810.dts.
A userspace script is needed to activate the trigger.

I want to know that this trigger has active users that
cannot live without it if we are to continue to support it.
Otherwise: delete it.

As second option: I can develop a new trigger that can associate
GPIOs with LEDs as triggers using device tree, which should
also remove the use of userspace custom scripts to achieve
this and be much more trustworthy, if someone with the Nokia
n810 or a device with a similar need is willing to test it.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/trigger/ledtrig-gpio.c | 202 ----------------------------
 1 file changed, 202 deletions(-)
 delete mode 100644 drivers/leds/trigger/ledtrig-gpio.c

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
deleted file mode 100644
index 0120faa3dafa..000000000000
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ /dev/null
@@ -1,202 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ledtrig-gio.c - LED Trigger Based on GPIO events
- *
- * Copyright 2009 Felipe Balbi <me@felipebalbi.com>
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/gpio.h>
-#include <linux/interrupt.h>
-#include <linux/leds.h>
-#include <linux/slab.h>
-#include "../leds.h"
-
-struct gpio_trig_data {
-	struct led_classdev *led;
-
-	unsigned desired_brightness;	/* desired brightness when led is on */
-	unsigned inverted;		/* true when gpio is inverted */
-	unsigned gpio;			/* gpio that triggers the leds */
-};
-
-static irqreturn_t gpio_trig_irq(int irq, void *_led)
-{
-	struct led_classdev *led = _led;
-	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
-	int tmp;
-
-	tmp = gpio_get_value_cansleep(gpio_data->gpio);
-	if (gpio_data->inverted)
-		tmp = !tmp;
-
-	if (tmp) {
-		if (gpio_data->desired_brightness)
-			led_set_brightness_nosleep(gpio_data->led,
-					   gpio_data->desired_brightness);
-		else
-			led_set_brightness_nosleep(gpio_data->led, LED_FULL);
-	} else {
-		led_set_brightness_nosleep(gpio_data->led, LED_OFF);
-	}
-
-	return IRQ_HANDLED;
-}
-
-static ssize_t gpio_trig_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-
-	return sprintf(buf, "%u\n", gpio_data->desired_brightness);
-}
-
-static ssize_t gpio_trig_brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t n)
-{
-	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-	unsigned desired_brightness;
-	int ret;
-
-	ret = sscanf(buf, "%u", &desired_brightness);
-	if (ret < 1 || desired_brightness > 255) {
-		dev_err(dev, "invalid value\n");
-		return -EINVAL;
-	}
-
-	gpio_data->desired_brightness = desired_brightness;
-
-	return n;
-}
-static DEVICE_ATTR(desired_brightness, 0644, gpio_trig_brightness_show,
-		gpio_trig_brightness_store);
-
-static ssize_t gpio_trig_inverted_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-
-	return sprintf(buf, "%u\n", gpio_data->inverted);
-}
-
-static ssize_t gpio_trig_inverted_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t n)
-{
-	struct led_classdev *led = led_trigger_get_led(dev);
-	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-	unsigned long inverted;
-	int ret;
-
-	ret = kstrtoul(buf, 10, &inverted);
-	if (ret < 0)
-		return ret;
-
-	if (inverted > 1)
-		return -EINVAL;
-
-	gpio_data->inverted = inverted;
-
-	/* After inverting, we need to update the LED. */
-	if (gpio_is_valid(gpio_data->gpio))
-		gpio_trig_irq(0, led);
-
-	return n;
-}
-static DEVICE_ATTR(inverted, 0644, gpio_trig_inverted_show,
-		gpio_trig_inverted_store);
-
-static ssize_t gpio_trig_gpio_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-
-	return sprintf(buf, "%u\n", gpio_data->gpio);
-}
-
-static ssize_t gpio_trig_gpio_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t n)
-{
-	struct led_classdev *led = led_trigger_get_led(dev);
-	struct gpio_trig_data *gpio_data = led_trigger_get_drvdata(dev);
-	unsigned gpio;
-	int ret;
-
-	ret = sscanf(buf, "%u", &gpio);
-	if (ret < 1) {
-		dev_err(dev, "couldn't read gpio number\n");
-		return -EINVAL;
-	}
-
-	if (gpio_data->gpio == gpio)
-		return n;
-
-	if (!gpio_is_valid(gpio)) {
-		if (gpio_is_valid(gpio_data->gpio))
-			free_irq(gpio_to_irq(gpio_data->gpio), led);
-		gpio_data->gpio = gpio;
-		return n;
-	}
-
-	ret = request_threaded_irq(gpio_to_irq(gpio), NULL, gpio_trig_irq,
-			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
-			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
-	if (ret) {
-		dev_err(dev, "request_irq failed with error %d\n", ret);
-	} else {
-		if (gpio_is_valid(gpio_data->gpio))
-			free_irq(gpio_to_irq(gpio_data->gpio), led);
-		gpio_data->gpio = gpio;
-		/* After changing the GPIO, we need to update the LED. */
-		gpio_trig_irq(0, led);
-	}
-
-	return ret ? ret : n;
-}
-static DEVICE_ATTR(gpio, 0644, gpio_trig_gpio_show, gpio_trig_gpio_store);
-
-static struct attribute *gpio_trig_attrs[] = {
-	&dev_attr_desired_brightness.attr,
-	&dev_attr_inverted.attr,
-	&dev_attr_gpio.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(gpio_trig);
-
-static int gpio_trig_activate(struct led_classdev *led)
-{
-	struct gpio_trig_data *gpio_data;
-
-	gpio_data = kzalloc(sizeof(*gpio_data), GFP_KERNEL);
-	if (!gpio_data)
-		return -ENOMEM;
-
-	gpio_data->led = led;
-	gpio_data->gpio = -ENOENT;
-
-	led_set_trigger_data(led, gpio_data);
-
-	return 0;
-}
-
-static void gpio_trig_deactivate(struct led_classdev *led)
-{
-	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
-
-	if (gpio_is_valid(gpio_data->gpio))
-		free_irq(gpio_to_irq(gpio_data->gpio), led);
-	kfree(gpio_data);
-}
-
-static struct led_trigger gpio_led_trigger = {
-	.name		= "gpio",
-	.activate	= gpio_trig_activate,
-	.deactivate	= gpio_trig_deactivate,
-	.groups		= gpio_trig_groups,
-};
-module_led_trigger(gpio_led_trigger);
-
-MODULE_AUTHOR("Felipe Balbi <me@felipebalbi.com>");
-MODULE_DESCRIPTION("GPIO LED trigger");
-MODULE_LICENSE("GPL v2");
-- 
2.39.2

