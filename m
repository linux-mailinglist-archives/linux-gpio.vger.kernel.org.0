Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133D3A5685
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2019 14:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730572AbfIBMqC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Sep 2019 08:46:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38785 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730556AbfIBMqC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2019 08:46:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id h195so2407225pfe.5
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2019 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=typeblog-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UxK0D/fheIqSygqLr5s8Jq9AxF3QesYF0ilcNylte7o=;
        b=xZeRG54YWKgB5dbF3y59khScl7yI/HflO++6A95O/QzD0f+8H5FUe2QQ3uAhJzFOqW
         MOZhRtvQsBNttdrNi6MzxpT9+vo+cisz5qhPDQhREQA2QDNNLA2JR8SF4xoUAe0v7Ju0
         uDuMxGHHYUZFf9CHrGwFQEI3PszflA2AtaQ8qPf4tyjkU9iFpBKQ2wWTdDX2V1ODXDqB
         5Vv9Vd0Lty5qxiYaMFwrRNYzk+TYv6WpdYIPAyM+o/Fninkl1JRoboszMWFnjzGQiEFn
         dGv7QXx+L13ylOkzwOA3ssTwjv36EHLkuJ3yFJAo74527kCN8levJC1nPNfz+YY7WZHc
         K2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UxK0D/fheIqSygqLr5s8Jq9AxF3QesYF0ilcNylte7o=;
        b=NS00b2kjdrOPWAMytxdLmLIYQ9EDBjKzVFm0Qkx3oN74osNW8vMh2alj/WhdKYzfHc
         z9cyIkCxVmKqPIQ/f8XFkmE0gyYj1qUA6kmvBon5Kpw8faob8FMY925bnljuHTOeO5QF
         y4/deYA1LpaIdiiaIZ1L+/gQ+MhBKll8mv6RMRy6F+8LN4v1tzE8WuoVaOxLTuSzMyf2
         g//KdQuYEMZkXrGBZRymzLZZgd9bPABNBk9qGXgHmncMdfjNvJeEmjIc9UVAvd9wkTiu
         NCoKNrqQPq8dOpg/2qeRqFXI9xD807YHL8MTZ0xUaRP6mkQG7hsKs8k2ZRNNMiaPeIOu
         btxQ==
X-Gm-Message-State: APjAAAWiCmdnnt8qTC7Gmginpy8sde4pKl9uT9oD8c8arF/hIgaB56rW
        UD3znhmTDKJMweqXDMHXfCDmRw==
X-Google-Smtp-Source: APXvYqxIvcyPxpnb3yh6eeP7HxC1AmtMZNRoGdxnjCor2F+TkQe4/r3whehjlKum19mXExKsD3b4OQ==
X-Received: by 2002:a17:90a:d0c6:: with SMTP id y6mr3298714pjw.76.1567428361563;
        Mon, 02 Sep 2019 05:46:01 -0700 (PDT)
Received: from peter-pc.home ([91.207.174.229])
        by smtp.gmail.com with ESMTPSA id 2sm15884652pjh.13.2019.09.02.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:46:00 -0700 (PDT)
From:   Peter Cai <peter@typeblog.net>
Cc:     Peter Cai <peter@typeblog.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v3 1/2] gpio: acpi: add quirk to override GpioInt polarity
Date:   Mon,  2 Sep 2019 20:43:51 +0800
Message-Id: <20190902124352.12291-1-peter@typeblog.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190831030916.13172-1-peter@typeblog.net>
References: <20190831030916.13172-1-peter@typeblog.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On GPD P2 Max, the firmware could not reset the touch panel correctly.
The kernel needs to take on the job instead, but the GpioInt definition
in DSDT specifies ActiveHigh while the GPIO pin should actually be
ActiveLow.

We need to override the polarity defined by DSDT. The GPIO driver
already allows defining polarity in acpi_gpio_params, but the option is
not applied to GpioInt.

This patch adds a new quirk that enables the polarity specified in
acpi_gpio_params to also be applied to GpioInt.

Signed-off-by: Peter Cai <peter@typeblog.net>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: rebased to gpio/for-next, moved quirk out of the gpioint
conditional.

v3: no change, series update.
---
 drivers/gpio/gpiolib-acpi.c   | 9 +++++++++
 include/linux/gpio/consumer.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index fdee8afa5339..ab16ea61a8fa 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -603,6 +603,15 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 			lookup->info.polarity = lookup->active_low;
 		}
+
+		/*
+		 * Override the polarity specified by GpioInt if
+		 * ACPI_GPIO_QUIRK_OVERRIDE_POLARITY is set.
+		 */
+		if (lookup->info.quirks & ACPI_GPIO_QUIRK_OVERRIDE_POLARITY) {
+			dev_warn(&lookup->info.adev->dev, FW_BUG "Incorrect polarity specified by GpioInt, overriding.\n");
+			lookup->info.polarity = lookup->active_low;
+		}
 	}
 
 	return 1;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index b70af921c614..7e9f24ebb085 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -622,6 +622,12 @@ struct acpi_gpio_mapping {
  * get GpioIo type explicitly, this quirk may be used.
  */
 #define ACPI_GPIO_QUIRK_ONLY_GPIOIO		BIT(1)
+/*
+ * Use the GPIO polarity (ActiveHigh / ActiveLow) from acpi_gpio_params
+ * for GpioInt as well. The default behavior is to use the one specified
+ * by GpioInt, which can be incorrect on some devices.
+ */
+#define ACPI_GPIO_QUIRK_OVERRIDE_POLARITY	BIT(2)
 
 	unsigned int quirks;
 };
-- 
2.23.0

