Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89EC17AF670
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 00:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjIZWpz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 18:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjIZWny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 18:43:54 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8180218E83
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 14:48:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c12ae20a5cso159623261fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 14:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695764897; x=1696369697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCuTZhEJPz8ZqCyb/xY7ocE2o3PkqDSRE/J2TdY26/o=;
        b=EwC4MXuFj2KrB2CN2IakXRhv5gAh+jzTrViJkl4faVqa7/m+CPj2MsgMeoYlfFg3Qi
         Z/2oI2zSMem1yHL/Jl9EyPTjQ7Od0aGyjNcFNIP85BuO9CqUDh54hBLaJKg6H5cp9nY/
         PUdSuVqYxewnn9KlRtU/M1niG5mLWe+CI2hVdqK5NtEu1znrl12OMzk7FZTo0L1esxRq
         JRVCnXFkJTBprlSdbbOypOSCmPkMlEuqrhGwnqr3XhOrIuYSb0A1Vx7hE+DSYhLYBBjV
         wwN4ucX+T8qngUMQt87HlTOwkp4BVoPJ9pCHCg4O/k2KZGrShpjOHaXzlh9XQugO59Rq
         G8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764897; x=1696369697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCuTZhEJPz8ZqCyb/xY7ocE2o3PkqDSRE/J2TdY26/o=;
        b=TkUV2lcM7c528Sr8hJBUFegu1CX738pZW48nkEWNOUci3ocNwOklCAr2s/lpGUAlcu
         7HT8Jt+PxXPFO5uH83TAo9a7HpopbNES195LcPIZrA1l3Bjis/K8MbYQFSjGGM21JB8w
         qXS3didgPHxBDBjo//3xW9IV2Ea8MHOMdcNb7ILGS0MNRNkJoNJ2Aiv/ceU3m9PatIpp
         dkGzV2B/QmNcgp9e7PMzG8gY79knIfbF8o1768xrmzcwnWyjaCFQPI3g0egI6GwzDJMX
         WhJPc3XMv3LwszXuvApTQxcR0NGm99znHk0uTpnOHG4bs3KFcaLMF6xlmEiOzqneQvF7
         htHw==
X-Gm-Message-State: AOJu0YyYK4UeoDYMRjeYKZNJxgbdzj64/4aPRLxvyg7WaG/Ceb2uKo+a
        tZXpDXqcYpJhECxt0kgh2AfGMg==
X-Google-Smtp-Source: AGHT+IGBrC0bECecJjFp+EqYLonAlaFQLJT/bnX6STpQt3TRBoCa+su9DN31qD3xXpVwLjbs+7PzsA==
X-Received: by 2002:ac2:58ef:0:b0:503:9c2:e44e with SMTP id v15-20020ac258ef000000b0050309c2e44emr16458lfo.55.1695764897557;
        Tue, 26 Sep 2023 14:48:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f10-20020a19ae0a000000b0050334e5f5a8sm2299982lfc.271.2023.09.26.14.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:48:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 23:48:13 +0200
Subject: [PATCH v2 3/3] leds: triggers: gpio: Rewrite to use
 trigger-sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-gpio-led-trigger-dt-v2-3-e06e458b788e@linaro.org>
References: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org>
In-Reply-To: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org>
To:     =?utf-8?q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

By providing a GPIO line as "trigger-sources" in the FWNODE
(such as from the device tree) and combining with the
GPIO trigger, we can support a GPIO LED trigger in a natural
way from the hardware description instead of using the
custom sysfs and deprecated global GPIO numberspace.

Example:

gpio: gpio@0 {
    compatible "my-gpio";
    gpio-controller;
    #gpio-cells = <2>;
    interrupt-controller;
    #interrupt-cells = <2>;
    #trigger-source-cells = <2>;
};

leds {
    compatible = "gpio-leds";
    led-my-gpio {
        label = "device:blue:myled";
        gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
        default-state = "off";
        linux,default-trigger = "gpio";
        trigger-sources = <&gpio 1 GPIO_ACTIVE_HIGH>;
    };
};

Make this the norm, unmark the driver as broken.

Delete the sysfs handling of GPIOs.

Since GPIO descriptors inherently can describe inversion,
the inversion handling can just be deleted.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix a use-after-free bug found by Dan Carpenter
---
 drivers/leds/trigger/Kconfig        |   5 +-
 drivers/leds/trigger/ledtrig-gpio.c | 137 +++++++++++-------------------------
 2 files changed, 41 insertions(+), 101 deletions(-)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 2a57328eca20..d11d80176fc0 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -83,13 +83,10 @@ config LEDS_TRIGGER_ACTIVITY
 config LEDS_TRIGGER_GPIO
 	tristate "LED GPIO Trigger"
 	depends on GPIOLIB || COMPILE_TEST
-	depends on BROKEN
 	help
 	  This allows LEDs to be controlled by gpio events. It's good
 	  when using gpios as switches and triggering the needed LEDs
-	  from there. One use case is n810's keypad LEDs that could
-	  be triggered by this trigger when user slides up to show
-	  keypad.
+	  from there. Triggers are defined as device properties.
 
 	  If unsure, say N.
 
diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 0120faa3dafa..9b7fe5dd5208 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -3,12 +3,13 @@
  * ledtrig-gio.c - LED Trigger Based on GPIO events
  *
  * Copyright 2009 Felipe Balbi <me@felipebalbi.com>
+ * Copyright 2023 Linus Walleij <linus.walleij@linaro.org>
  */
 
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
@@ -16,10 +17,8 @@
 
 struct gpio_trig_data {
 	struct led_classdev *led;
-
 	unsigned desired_brightness;	/* desired brightness when led is on */
-	unsigned inverted;		/* true when gpio is inverted */
-	unsigned gpio;			/* gpio that triggers the leds */
+	struct gpio_desc *gpiod;	/* gpio that triggers the led */
 };
 
 static irqreturn_t gpio_trig_irq(int irq, void *_led)
@@ -28,10 +27,7 @@ static irqreturn_t gpio_trig_irq(int irq, void *_led)
 	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
 	int tmp;
 
-	tmp = gpio_get_value_cansleep(gpio_data->gpio);
-	if (gpio_data->inverted)
-		tmp = !tmp;
-
+	tmp = gpiod_get_value_cansleep(gpio_data->gpiod);
 	if (tmp) {
 		if (gpio_data->desired_brightness)
 			led_set_brightness_nosleep(gpio_data->led,
@@ -73,93 +69,8 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
 static DEVICE_ATTR(desired_brightness, 0644, gpio_trig_brightness_show,
 		gpio_trig_brightness_store);
 
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
 static struct attribute *gpio_trig_attrs[] = {
 	&dev_attr_desired_brightness.attr,
-	&dev_attr_inverted.attr,
-	&dev_attr_gpio.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(gpio_trig);
@@ -167,16 +78,48 @@ ATTRIBUTE_GROUPS(gpio_trig);
 static int gpio_trig_activate(struct led_classdev *led)
 {
 	struct gpio_trig_data *gpio_data;
+	struct device *dev = led->dev;
+	int ret;
 
 	gpio_data = kzalloc(sizeof(*gpio_data), GFP_KERNEL);
 	if (!gpio_data)
 		return -ENOMEM;
 
-	gpio_data->led = led;
-	gpio_data->gpio = -ENOENT;
+	/*
+	 * The generic property "trigger-sources" is followed,
+	 * and we hope that this is a GPIO.
+	 */
+	gpio_data->gpiod = fwnode_gpiod_get_index(dev->fwnode,
+						  "trigger-sources",
+						  0, GPIOD_IN,
+						  "led-trigger");
+	if (IS_ERR(gpio_data->gpiod)) {
+		ret = PTR_ERR(gpio_data->gpiod);
+		kfree(gpio_data);
+		return ret;
+	}
+	if (!gpio_data->gpiod) {
+		dev_err(dev, "no valid GPIO for the trigger\n");
+		kfree(gpio_data);
+		return -EINVAL;
+	}
 
+	gpio_data->led = led;
 	led_set_trigger_data(led, gpio_data);
 
+	ret = request_threaded_irq(gpiod_to_irq(gpio_data->gpiod), NULL, gpio_trig_irq,
+			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
+			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
+	if (ret) {
+		dev_err(dev, "request_irq failed with error %d\n", ret);
+		gpiod_put(gpio_data->gpiod);
+		kfree(gpio_data);
+		return ret;
+	}
+
+	/* Finally update the LED to initial status */
+	gpio_trig_irq(0, led);
+
 	return 0;
 }
 
@@ -184,8 +127,8 @@ static void gpio_trig_deactivate(struct led_classdev *led)
 {
 	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
 
-	if (gpio_is_valid(gpio_data->gpio))
-		free_irq(gpio_to_irq(gpio_data->gpio), led);
+	free_irq(gpiod_to_irq(gpio_data->gpiod), led);
+	gpiod_put(gpio_data->gpiod);
 	kfree(gpio_data);
 }
 

-- 
2.34.1

