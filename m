Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DC0261FBA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 22:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730326AbgIHUGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 16:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730340AbgIHPVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 11:21:40 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459BDC0612FD
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 05:58:31 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w5so19005935wrp.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rWwIjxnFTzbkw/BaFxCLOnaCoWy8p8lKDcXzU2XY9Ow=;
        b=0Mh/WjQW7cqk7vvIT6ANfMSVJkivRyR0vHLEVsdr4dQX1OjZzRdtoApwZqXslIjZiP
         kSZOOLWhDdsQhdveRqN2HDp+l1m4GDuFBCtEWiCxsbFzs3ur0KxcpCzb6c8q8K1eMfHb
         WJyVFrutCBoOHu92bew55PlZ7yTm06sJc9i8roPiLYbIczeSsyP/PEr+Os3UB91wFSgs
         wjmAvSeT25kS/NqvOh0sZOSZWVE/OzMwqKgrcmh6hMvUmzGAnKNCQBUX7BcTkcm5x6pk
         5zkAr2JrAuvIFfnGvLpiFHfVMmQL0uNF5z5eds0QYZIkSxxH6ubB3r+8FQmICgldecH7
         HbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWwIjxnFTzbkw/BaFxCLOnaCoWy8p8lKDcXzU2XY9Ow=;
        b=OZFam6xAtXjaLxvij/pvbMQpF3xwIvtqZony8CXXI1+CBlhGDORmIsUgi7F/O5+LjD
         A+0mKRTt9EPgaNuAOX0KuFyCJ3Rx2DrflkW2j+NGwiej5Ue63O7c7itFS9ojorm9S4jT
         GOJYqf12bujtEOh1qPVAxHFiehuuwDhQXmxwfL6iflFLj4wJ5mt42lQEWyD3iEyyR7Mk
         K16LW9i3RPukLrjEV/meW9ht4NCSKaCrtxOyF+D2SW4PPRy/ydDO8itJY7m0pWvc48Cl
         NdT9aG6HKW9/ioAwI57a8hB2duJIgPR4gvMGQko8dSkO7EEowUgffSUah68Si1YYU2OT
         VaMA==
X-Gm-Message-State: AOAM530WIFJbx+FxZ2vPHFkp8lemwy00WCpTJaVD1ch6H7yq0GhcIgkn
        WKxm2cA2pdl2HtlkkmkhD7sIxQ==
X-Google-Smtp-Source: ABdhPJx0tjO6B48c1MN/4xfKk3sKOEne5d+CNPDJ1Yw4DodcBAvPnRi/imY5s2CtNkv8XAEb4aSFng==
X-Received: by 2002:adf:84c3:: with SMTP id 61mr26170029wrg.131.1599569909956;
        Tue, 08 Sep 2020 05:58:29 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm34817875wmc.17.2020.09.08.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:58:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] gpiolib: unexport devprop_gpiochip_set_names()
Date:   Tue,  8 Sep 2020 14:58:13 +0200
Message-Id: <20200908125813.8809-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200908125813.8809-1-brgl@bgdev.pl>
References: <20200908125813.8809-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Now that devprop_gpiochip_set_names() is only used in a single place
inside drivers/gpio/gpiolib.c, there's no need anymore for it to be
exported or to even live in its own source file. Pull this function into
the core source file for gpiolib.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Makefile       |  1 -
 drivers/gpio/gpiolib.c      | 47 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h |  2 --
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 4f9abff4f2dc..639275eb4e4d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -6,7 +6,6 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
-obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-cdev.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0d390f0ec32c..2b2526c5de51 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -358,6 +358,53 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 	return 0;
 }
 
+/*
+ * devprop_gpiochip_set_names - Set GPIO line names using device properties
+ * @chip: GPIO chip whose lines should be named, if possible
+ *
+ * Looks for device property "gpio-line-names" and if it exists assigns
+ * GPIO line names for the chip. The memory allocated for the assigned
+ * names belong to the underlying software node and should not be released
+ * by the caller.
+ */
+static int devprop_gpiochip_set_names(struct gpio_chip *chip)
+{
+	struct gpio_device *gdev = chip->gpiodev;
+	struct device *dev = chip->parent;
+	const char **names;
+	int ret, i;
+	int count;
+
+	count = device_property_count_strings(dev, "gpio-line-names");
+	if (count < 0)
+		return 0;
+
+	if (count > gdev->ngpio) {
+		dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
+			 count, gdev->ngpio);
+		count = gdev->ngpio;
+	}
+
+	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	ret = device_property_read_string_array(dev, "gpio-line-names",
+						names, count);
+	if (ret < 0) {
+		dev_warn(&gdev->dev, "failed to read GPIO line names\n");
+		kfree(names);
+		return ret;
+	}
+
+	for (i = 0; i < count; i++)
+		gdev->descs[i].name = names[i];
+
+	kfree(names);
+
+	return 0;
+}
+
 static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
 {
 	unsigned long *p;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 56485a040b82..4a7e295c3640 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -756,8 +756,6 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 					    enum gpiod_flags dflags);
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
-int devprop_gpiochip_set_names(struct gpio_chip *gc);
-
 #ifdef CONFIG_GPIOLIB
 
 /* lock/unlock as IRQ */
-- 
2.26.1

