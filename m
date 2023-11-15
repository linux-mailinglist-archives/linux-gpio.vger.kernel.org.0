Return-Path: <linux-gpio+bounces-180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDCA7EC8EF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 17:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E49C21C20944
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B9A2C86F;
	Wed, 15 Nov 2023 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pZ3F0WMx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDC28E2C
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 16:50:10 +0000 (UTC)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FF7126
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:06 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-460f623392fso2243117137.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700067005; x=1700671805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/+c2VO8PV1RqLkhAzMdFyQNC3apc5LK2X9ZNQJCpQY=;
        b=pZ3F0WMxzknwX8Erg7N0MyTRtZdHeP/CSYxMYlbTW9KCnXX/GG6t7wT44v649yh3B6
         CMQBbFLPqEV6iQL/wmkHytQ6SjG98W1iUIL+E86SPT528c0JIdWPVXPQtl0tiHKQw+v2
         qrBWrgAxJ63rLPqpV55Orzog3Hl8cwF8EE+GjXl2lpoBxTjHKuHzZlh2ah0Pk8iaCV7r
         BNIyI4JsZ6SJbg2p/DxA2n+2d90tZSzeC8qO+UIpb6Wrnw24bo3ri1EQJrTSO03NYWPz
         By2gFNxqwrPgPk61wzqB5iY9LwKXeJqMIeSWIA2HSxxWIucZHfRmW80uF/Yz62vSc7nQ
         cv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067005; x=1700671805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/+c2VO8PV1RqLkhAzMdFyQNC3apc5LK2X9ZNQJCpQY=;
        b=ttLIqjpzlZ/OZ9KCHehVMP8zWBs0lC/hxle5Y9DL4qyRafXZ12T6GD1s8k9sHk/CWM
         WJuCtNTjNVFQWSb+IRXukKdvjfW7myp85XEaO8Xlo4YYSF6R2DkOYr0ey9EzMBYsNqM9
         AvVemjLehUa6H/HnHso0y772p54IkaeNKUsvjLFsD/Ymw4NUN8eptHjoSgwyq47yMDfu
         CxRipLSPBbB5KyWq2xjYcpvfCZAfFCgOom+1LFTXTEwYHDKp1PlchJ3Z5z9CSWF2xnQb
         tjHplSs3q9PKkIHDaq6dSAvBxqGYi/2Hh+WwQ2ombd9gVaa0ZQtXYxlEwh2c58dcX8cM
         nvCQ==
X-Gm-Message-State: AOJu0YxYIc1pnVryXneRSL+jkCPiLcJZTyBBPiv0g24mMKGO4zADxeBB
	5a1DTVVf8BF0TAjRUbRd6ZzzGYxp/bkyzXlRRDpV2Q==
X-Google-Smtp-Source: AGHT+IHOoVUBbpIgEyTvnyBKJGvAGhVu9Qj2aYtvhzH+QlMA+xwk5+Qd8WOs/1fmHihY3nCWNEfULQ==
X-Received: by 2002:a67:c218:0:b0:45d:9224:a898 with SMTP id i24-20020a67c218000000b0045d9224a898mr13122998vsj.16.1700067005671;
        Wed, 15 Nov 2023 08:50:05 -0800 (PST)
Received: from brgl-uxlite.. ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id mn16-20020a0562145ed000b00670a8921170sm658781qvb.112.2023.11.15.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:50:05 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] pinctrl: stop using gpiod_to_chip()
Date: Wed, 15 Nov 2023 17:50:00 +0100
Message-Id: <20231115165001.2932350-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231115165001.2932350-1-brgl@bgdev.pl>
References: <20231115165001.2932350-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't dereference struct gpio_chip directly, use dedicated gpio_device
getters instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1fa89be29b8f..0b4d07aea387 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -13,6 +13,7 @@
 #define pr_fmt(fmt) "pinctrl core: " fmt
 
 #include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -1649,8 +1650,8 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
 #ifdef CONFIG_GPIOLIB
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	struct pinctrl_gpio_range *range;
-	struct gpio_chip *chip;
 	int gpio_num;
 #endif
 
@@ -1685,11 +1686,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 			 * we need to get rid of the range->base eventually and
 			 * get the descriptor directly from the gpio_chip.
 			 */
-			chip = gpiod_to_chip(gpio_to_desc(gpio_num));
-		else
-			chip = NULL;
-		if (chip)
-			seq_printf(s, "%u:%s ", gpio_num - chip->gpiodev->base, chip->label);
+			gdev = gpiod_to_gpio_device(gpio_to_desc(gpio_num));
+		if (gdev)
+			seq_printf(s, "%u:%s ",
+				   gpio_num - gpio_device_get_base(gdev),
+				   gpio_device_get_label(gdev));
 		else
 			seq_puts(s, "0:? ");
 #endif
-- 
2.40.1


