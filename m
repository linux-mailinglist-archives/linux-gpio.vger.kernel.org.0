Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8257B1CD9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 14:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjI1Mqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 08:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbjI1Mqo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 08:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F384719E
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695905157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ACdKckhs2IGUtv5AveDwU/IL9fYWvBeI2aPkdMd1dhI=;
        b=DSQY5BTLdfcwI5qb2dk3MHNeyooYqDVH4RTZU8vN8xeMwpDYGhkkq3WYbMYqxKn1hApip3
        zycOWVWi97P/U4PpzlKtcefyTCRQJI0XXDIDjfH0Ls9OzSQSE8GqFvgXQfN89+1pLOqDbC
        mh6/OXbc1tzyFR8jztJrfbw1dcDKoQQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-BFEZXVCWNFK9MTuvfGgdYg-1; Thu, 28 Sep 2023 08:45:55 -0400
X-MC-Unique: BFEZXVCWNFK9MTuvfGgdYg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ae686dafedso1099013866b.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695905154; x=1696509954;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACdKckhs2IGUtv5AveDwU/IL9fYWvBeI2aPkdMd1dhI=;
        b=u2vsWc1tKr5xdZGCdtLd/bizaafiNIqmFknnSdRACqT+kkGoRLHw081D9HmEh+jYaB
         iU96mGpr+Ljx6J7CTvU94yP4vXrit1KDVmlxJJ2K2ABRD4BNnm4peMUjANg0jZkBEGCZ
         7s2IPLxqKMsvEjzltis068EABGrVXNk0q33B0Hu9CysyAQpaAXgLjZWKIEM+5B6um9SH
         MLzzoQIY7CL9OxdGfkEWwfPC2cJZ3tpZNyb4WitGYsiJofQH30lSUpnj7iysXUjwg2gG
         +mRfaQdzSRI1EO9yxtbVnPifMtvOvJXOGKYjGLeP09neyQfv3Y3xQg0imCl99W6JwNnr
         RdUg==
X-Gm-Message-State: AOJu0YzT7BmbGZ1vCUIhfMVd3j02SW2vRVq4qSnFfw3wIxj0D1Eqra2d
        +SxOAG6yTTafYKTs6xLbKL4q64h8LmCFRh9B7Tgagm0slTBvwR78o+2NbRnPuSLARIEiG8mJ37R
        lRA+4yf8gH3HIY3P/l9q5hw==
X-Received: by 2002:a17:906:3150:b0:9ae:696c:2c43 with SMTP id e16-20020a170906315000b009ae696c2c43mr1183241eje.28.1695905154403;
        Thu, 28 Sep 2023 05:45:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQnYwpJz4FRm5OEctCUqntpuOgB3RgSDa5zxu4Q3oNPpnc3WMFQcTzGCzOVBYL6EaWeUHW8A==
X-Received: by 2002:a17:906:3150:b0:9ae:696c:2c43 with SMTP id e16-20020a170906315000b009ae696c2c43mr1183223eje.28.1695905154189;
        Thu, 28 Sep 2023 05:45:54 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id lw13-20020a170906bccd00b0098884f86e41sm10683387ejb.123.2023.09.28.05.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:45:53 -0700 (PDT)
Message-ID: <93be52fc-fa87-423f-dde2-1b0b758ab632@redhat.com>
Date:   Thu, 28 Sep 2023 14:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 5/5] gpio: acpi: remove acpi_get_and_request_gpiod()
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
In-Reply-To: <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With no more users, we can remove acpi_get_and_request_gpiod().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Link: https://lore.kernel.org/r/20230926145943.42814-5-brgl@bgdev.pl
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib-acpi.c   | 28 ----------------------------
 include/linux/gpio/consumer.h |  8 --------
 2 files changed, 36 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 17a86bdd9609..89ff93f3b579 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -158,34 +158,6 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	return gpiochip_get_desc(chip, pin);
 }
 
-/**
- * acpi_get_and_request_gpiod - Translate ACPI GPIO pin to GPIO descriptor and
- *                              hold a refcount to the GPIO device.
- * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
- * @pin:       ACPI GPIO pin number (0-based, controller-relative)
- * @label:     Label to pass to gpiod_request()
- *
- * This function is a simple pass-through to acpi_get_gpiod(), except that
- * as it is intended for use outside of the GPIO layer (in a similar fashion to
- * gpiod_get_index() for example) it also holds a reference to the GPIO device.
- */
-struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label)
-{
-	struct gpio_desc *gpio;
-	int ret;
-
-	gpio = acpi_get_gpiod(path, pin);
-	if (IS_ERR(gpio))
-		return gpio;
-
-	ret = gpiod_request(gpio, label);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return gpio;
-}
-EXPORT_SYMBOL_GPL(acpi_get_and_request_gpiod);
-
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
 {
 	struct acpi_gpio_event *event = data;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 1c4385a00f88..9d1f598b8971 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -614,8 +614,6 @@ void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
 int devm_acpi_dev_add_driver_gpios(struct device *dev,
 				   const struct acpi_gpio_mapping *gpios);
 
-struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label);
-
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 #include <linux/err.h>
@@ -633,12 +631,6 @@ static inline int devm_acpi_dev_add_driver_gpios(struct device *dev,
 	return -ENXIO;
 }
 
-static inline struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin,
-							   char *label)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
 #endif /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 
-- 
2.41.0

