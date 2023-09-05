Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C788D792E25
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 21:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbjIETAn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 15:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239115AbjIETAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 15:00:36 -0400
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020C31A3
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 12:00:09 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso24890555e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 12:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940016; x=1694544816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD8mhbYtSpsp4MugkXhi33yXQT05nfWNxdtLBId4RL8=;
        b=ilV5yCdeRzZ+G5yIoeldAMeJvdL6TejWCwd6BDF10srY/hFvyug/k5w/DpbABu2kuB
         esKaZbpatQxH4BV8YUHRoJfnEZ8iZml3r8QocdOmnTXpd5EbarxqhB+KAPBs8RFJFbpk
         FkqXYWuo7hfzKH0NpOXh6toJVQFtFAgoulvWzpPj1Bd9V7D7JRe40+idqmCj2vU4GvfN
         7C4O3LXRHOKpk9pt8C9JOmogDWJt7fgmcaOUGg/zuQ+LckXuUGahGsMKQWkoLslh2Z8e
         WW2ri+AaMwI+sQbAmlEmxl8D7DuUfWBNLtC3pQRVELrcGofDc9GVqdFIZIHr+0UOzKzU
         rSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940016; x=1694544816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD8mhbYtSpsp4MugkXhi33yXQT05nfWNxdtLBId4RL8=;
        b=Ou4KzPKM5mYao47sWdS9kvY3CyD/12yF49j0Q+AKB1axNURdQHC7bQMOoDluuw77tc
         6Aa9aHNnyho70Lsa7ZgF4FTJZC/0O/Ee4kSDkbKiMFBiT8X74RVsmcAnAIrIqmLUZlyX
         iWcR8RRWYjq1JpwMbwFP3LmKetV9uon2jqLaegMigDwEU1q8v7+E2+jRFi1KZmYag+Yl
         VIsGEUI2/RXdh1GONNtXsIwkpf/6Yp5q0KwpXEZrvPrwtbxJ/DfW64VFP3iG04VSYiuP
         DCbWgXPs5e6qp0SXinne0LHGPPv9WgXWimXVmlZ6y4h/JVGubG9PTZjVqtQjul2xoM+4
         KMpw==
X-Gm-Message-State: AOJu0Yz6h75enElZ4BcQVeGiriA4GN4LM3eDRYG5eMhkqvdxbfkpjK5p
        tpahHtTCcVVqq99juN5BvZW4Fw==
X-Google-Smtp-Source: AGHT+IFIMVvhNg464qJima4kezuYWuRmRs+hpxgOQnc+URZYC5BvtqpinR7GN44km7chTJtWGj8fDQ==
X-Received: by 2002:a7b:c390:0:b0:401:38dc:8918 with SMTP id s16-20020a7bc390000000b0040138dc8918mr481515wmj.24.1693940015869;
        Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 08/21] gpio: acpi: provide acpi_gpio_device_free_interrupts()
Date:   Tue,  5 Sep 2023 20:52:56 +0200
Message-Id: <20230905185309.131295-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're moving away from public functions that take struct gpio_chip as
argument as the chip - unlike struct gpio_device - is owned by its
provider and tied to its lifetime.

Provide an alternative to acpi_gpiochip_free_interrupts().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 29 +++++++++++++++++++++++------
 include/linux/gpio/driver.h | 12 ++++++++++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index fbda452fb4d6..5633e39396bc 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -558,12 +558,9 @@ void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);
 
-/**
- * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
- * @chip:      GPIO chip
- *
- * Free interrupts associated with GPIO ACPI event method for the given
- * GPIO chip.
+/*
+ * This function is deprecated, use acpi_gpio_device_free_interrupts()
+ * instead.
  */
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 {
@@ -604,6 +601,26 @@ void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);
 
+/**
+ * acpi_gpio_device_free_interrupts() - Free GPIO ACPI event interrupts.
+ * @chip	GPIO device
+ *
+ * Free interrupts associated with GPIO ACPI event method for the given
+ * GPIO device.
+ */
+void acpi_gpio_device_free_interrupts(struct gpio_device *gdev)
+{
+	struct gpio_chip *gc;
+
+	/* TODO: protect gdev->chip once SRCU is in place in GPIOLIB. */
+	gc = gdev->chip;
+	if (!gc)
+		return;
+
+	acpi_gpiochip_free_interrupts(gc);
+}
+EXPORT_SYMBOL_GPL(acpi_gpio_device_free_interrupts);
+
 int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b68b3493b29d..47906bc56b3d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -835,4 +835,16 @@ static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
 	return NULL;
 }
 
+/*
+ * FIXME: Remove this once the only driver that uses it - android tablets -
+ * becomes a good citizen and stops abusing GPIOLIB.
+ */
+#ifdef CONFIG_ACPI
+void acpi_gpio_device_free_interrupts(struct gpio_device *gdev);
+#else
+static inline void acpi_gpio_device_free_interrupts(struct gpio_device *gdev)
+{
+}
+#endif
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.39.2

