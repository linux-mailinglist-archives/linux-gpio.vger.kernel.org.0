Return-Path: <linux-gpio+bounces-675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F57FD939
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 947881C20D8D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0BC30F99;
	Wed, 29 Nov 2023 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LmLhgxQO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E655FAF
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:26 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b4c2ef5cdso16055665e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267865; x=1701872665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDkm1mz5JKda1Ie70um5gnCumWIdGzqKbagKhi4Mqgw=;
        b=LmLhgxQO3nHYMI2D6VsD6PUbZTI4P8P8pyL71/ah7j5htcKAuq+fZmhoQhie6rGmor
         EM0ExqKdJJ/qjlPCo1CK+sFFDHX23cP0LFR1Ohy3gQ9VauskBGHXtJxBbTI9hBGyfkgP
         wbRagLLQkNnlBc6ldAODpY370cVnp5PrScBcojZHEG5x+6I6SN2P5RUXHPRbNqbldIT7
         RAxjNp5OPdwL6TkFiU7IHgHcr9TthmxfotCSkMnFB0ak6+sWThNXrFKXqiaUDf7HVvTj
         vX7QukghLx/yXrgyIYVE4bT/EuacWr1UBEwzNGgVRVDQsUmve4N/bGRLaRDkH0crBs8G
         6eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267865; x=1701872665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDkm1mz5JKda1Ie70um5gnCumWIdGzqKbagKhi4Mqgw=;
        b=SUlf4YIDq8+PToVaNI8Tb6cYe1/16NhJ0F5o3trKRxr9QxY4CuCTHvLD8eSkIiFn3E
         +Ldbht0Sg3Vi/edtt/ySU459+mvzYs8+dOPGCIGclbjgqg9MlojzT/itQEgYdlzbfaqE
         AT/iFjd6Ct8WIYQQf83izxuB9w7333PhH1ffAjdFmIgv3FRstZrFLieUhBIDHdbcKgni
         /hCy9QDIT2JxWGgmiyl+0NNdtYMDa/i5hIRV3wFS/7okEjwSmbTiHd95NOeaX1Q53W2H
         81xIC0Rti/TkmGm4JK3ezA6LAik8QcugME9VyHm46+ODb21D4xN1MlWXuZM/qG5rOAjf
         mOnQ==
X-Gm-Message-State: AOJu0YzxHC3jqEwN/mMAUqqtxGS+Z/3iHRhwfc4QPas+8x3w79xSfYGk
	vsqmwwKmQ3Xf+U+Xn0Nmn0JDOA==
X-Google-Smtp-Source: AGHT+IGzwxqZ/cr1y8ySwFiJGA66fa+vba4/Je/dhnGCBrRLJyMyF58vXXnPj3KEdcBW2tko7WDfpw==
X-Received: by 2002:a05:600c:138e:b0:40b:3605:acda with SMTP id u14-20020a05600c138e00b0040b3605acdamr14504750wmf.25.1701267865284;
        Wed, 29 Nov 2023 06:24:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 03/10] gpio: wm8994: use gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:04 +0100
Message-Id: <20231129142411.76863-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129142411.76863-1-brgl@bgdev.pl>
References: <20231129142411.76863-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new gpiochip_dup_line_label() helper to safely retrieve the
descriptor label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm8994.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index f4a474cef32d..bf05c9b5882b 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -193,18 +194,20 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	for (i = 0; i < chip->ngpio; i++) {
 		int gpio = i + chip->base;
 		int reg;
-		const char *label;
 
 		/* We report the GPIO even if it's not requested since
 		 * we're also reporting things like alternate
 		 * functions which apply even when the GPIO is not in
 		 * use as a GPIO.
 		 */
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			label = "Unrequested";
+		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
+		if (IS_ERR(label)) {
+			dev_err(wm8994->dev, "Failed to duplicate label\n");
+			continue;
+		}
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio, label);
+		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio,
+			   label ?: "Unrequested");
 
 		reg = wm8994_reg_read(wm8994, WM8994_GPIO_1 + i);
 		if (reg < 0) {
-- 
2.40.1


