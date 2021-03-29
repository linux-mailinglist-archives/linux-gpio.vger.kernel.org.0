Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4BA34CF3B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhC2Llc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:41:32 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:43663 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhC2LlT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:41:19 -0400
Received: by mail-lj1-f177.google.com with SMTP id y1so15499884ljm.10;
        Mon, 29 Mar 2021 04:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DuIPGQD/Ekez1kZGizx8nUHGdnGihW0Vg6tpYb7UMwo=;
        b=VPzBPUx7KDFXskAY00NBANEq8upHAdqZ/4WKh+FyE0gVY/jMfFWfpteSjKuRdsl7Tz
         P6ChX6/Mej3hnVUEQyHl083RbUm4dEP0OtIWt9/fx/WCHAeW2zBmtxMA2eGIq1DQ5rx+
         D/g9g4maBEOYgGxgcZChKeu0PkuzVXJEMNm0Ce4AmQTx2YRtK/uRf9wdl/67z6cXxJ3Q
         6nR2oxziUFUi/ohDWK9D2mXLU/oGHpxPKVyMHtzxFkIHoUnQbTiTACCAUcq9ICZZGKYV
         EYy+/SV6UHJ4crEj0Va6GG7jA/N0NUx9peeiYddUna4Z8u2xg3P3NAOKx/ioIxaESqIn
         2QjA==
X-Gm-Message-State: AOAM531byC+pWX7xqdUZk04du2mtjafrJVYp+nYkK2NUN20elyu9PTy3
        8I6W5T7evbIxx5Pb/MA02+c=
X-Google-Smtp-Source: ABdhPJztmsJn5FM5DJhB6xLbYoR5N8QZv5nTi1FeSCIXoCdE822eOg8zpr2IRdVEQNIULt/Y8cu/Ww==
X-Received: by 2002:a2e:9715:: with SMTP id r21mr17870769lji.224.1617018078135;
        Mon, 29 Mar 2021 04:41:18 -0700 (PDT)
Received: from dc7vkhyh15000m40t6jht-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id a17sm1748598lfr.204.2021.03.29.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 04:41:17 -0700 (PDT)
Date:   Mon, 29 Mar 2021 14:41:12 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: sysfs: Obey valid_mask
Message-ID: <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Do not allow exporting GPIOs which are set invalid
by the driver's valid mask.

Fixes: 726cb3ba49692bdae6caff457755e7cdb432efa4

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpiolib-sysfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 26c5466b8179..ae49bb23c6ed 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -458,6 +458,8 @@ static ssize_t export_store(struct class *class,
 	long			gpio;
 	struct gpio_desc	*desc;
 	int			status;
+	struct gpio_chip	*gc;
+	int			offset;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
@@ -469,6 +471,12 @@ static ssize_t export_store(struct class *class,
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
 		return -EINVAL;
 	}
+	gc = desc->gdev->chip;
+	offset = gpio_chip_hwgpio(desc);
+	if (!gpiochip_line_is_valid(gc, offset)) {
+		pr_warn("%s: GPIO %ld masked\n", __func__, gpio);
+		return -EINVAL;
+	}
 
 	/* No extra locking here; FLAG_SYSFS just signifies that the
 	 * request and export were done by on behalf of userspace, so
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
