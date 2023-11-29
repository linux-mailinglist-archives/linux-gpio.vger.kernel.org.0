Return-Path: <linux-gpio+bounces-674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9F7FD938
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1491C20C4A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AB230D08;
	Wed, 29 Nov 2023 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KkU0Icqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1637A197
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:26 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so6391811fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267864; x=1701872664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Sv99NjQCF32QfqStrxQNV++EDXzWOND44xPhDEPFwA=;
        b=KkU0Icqx8HR3nwLcQajkvSFBK6+OUPGRRyjgnUa1BO8ra9MFdWS/NPuH7KOwRzcrOR
         yzAR/a2ihBfjZPg+C9hGAQ7lGEWRRI62VXFF0iOVOQlgpvgw0s4O4V779l6jfUuTucXP
         VSzqwqawXHrNtaC+3bf7ey+Zx90e4+zRxXBelqlL5mHcBtuOrioNCnhLjK+/5QWSFV7G
         /0vWvU1pVhxTfiIcAbzUQwJIK6O+Tt2yIp2WaN7zBiohDgOD5nk+ZRSEG/sJakvuOdm8
         RXSsaJY2tpfR8arbUolhMOWoE+SrdIcmhEQVywHWOjJKQxOyHTlq+tVZj1zYcBgg7l73
         j8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267864; x=1701872664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sv99NjQCF32QfqStrxQNV++EDXzWOND44xPhDEPFwA=;
        b=WBLlD+H+YGjoZitThqy4QDNdLzh0PJsW6WiY5jqRfUSoAV4C1IlUL0ZxLU/ji4Nhwo
         mUbQdyZeiH7YHJzi1TnvPxkNbEtBM2ycoKSjD/4VGQ4rPQ31bWIf6pAC1FsB5K2j6q25
         cWfYZ61A7mGvnJZbsPFHU1RHI+IkJQ1306Sri8qQSL8q/fWzvRQxGO2I+/vw1UKTldi7
         R+n/7nKlgb5vTRFRoQKeTZ/3AzaU9HbwmKhOA/vxzjjWEjvlrNwgU6drt4TtX5766HJe
         No/3YEp6gvjwDOYDnP0fnxIp7jh8D5GEZBfLfqaOb+XkhF26q/vA6cssL1k3JW5leyn7
         w6Tw==
X-Gm-Message-State: AOJu0YzGAi3nIpK1Z2Dxadh6+ntzIrIgzuSvuQqPsvLieN1QWWMeiXmQ
	ZJLfJzFkg7hxQrFWgTqEo+gGSw==
X-Google-Smtp-Source: AGHT+IEkczzI1R8jS+gFL7GKFMTH6r1tr8NT05t7eLAvQCb5G46R9vrMwpDmkFfL0LuzEN/A2vrYpQ==
X-Received: by 2002:a2e:8804:0:b0:2c9:b84a:1485 with SMTP id x4-20020a2e8804000000b002c9b84a1485mr2878937ljh.7.1701267864148;
        Wed, 29 Nov 2023 06:24:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 02/10] gpio: wm831x: use gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:03 +0100
Message-Id: <20231129142411.76863-3-brgl@bgdev.pl>
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
 drivers/gpio/gpio-wm831x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 7eaf8a28638c..f7d5120ff8f1 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
@@ -160,18 +161,21 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	for (i = 0; i < chip->ngpio; i++) {
 		int gpio = i + chip->base;
 		int reg;
-		const char *label, *pull, *powerdomain;
+		const char *pull, *powerdomain;
 
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
+			dev_err(wm831x->dev, "Failed to duplicate label\n");
+			continue;
+		}
 
-		seq_printf(s, " gpio-%-3d (%-20.20s) ", gpio, label);
+		seq_printf(s, " gpio-%-3d (%-20.20s) ",
+			   gpio, label ?: "Unrequested");
 
 		reg = wm831x_reg_read(wm831x, WM831X_GPIO1_CONTROL + i);
 		if (reg < 0) {
-- 
2.40.1


