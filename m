Return-Path: <linux-gpio+bounces-680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2067FD943
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 707D1B21531
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC28A31591;
	Wed, 29 Nov 2023 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fSB4WGkZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A3010C6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:32 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c88b7e69dfso81569481fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701267870; x=1701872670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4oN2yBzcOb1+JXtPZKrl0tpOl2eK1zlq9JfJmTld4=;
        b=fSB4WGkZG35mb/eSTil6wJYHacf7Xy2ySbuqtE9u4PIxHoqiNA9geqZmdtJfQR8jFZ
         PoM9Sm2m6/g3RKGh5M9zYdJo9+06YpdBb34gqjxqXZzfBq5N5ucgL1SqcC9CVhWFbmWl
         MAhOGo8I5Iz31n0B97Y6/4WjK0J9mt9LbTWH11ptTjP2WvTf9j80SBoxBr4+IhzTbU39
         cb/wepHsOFYajQuRCP265xQ8E4GLlBJaqwEJN2R+Wl1v/S4F7u/qgTpSmcQbD8lH+Q+q
         AR+fgiK99L1kJyju2sbD3TKCLLhoEKM+EIOR8/WYUSh6/XtRP7vS/7vgw4zMZwMj1VoF
         I5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267870; x=1701872670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ4oN2yBzcOb1+JXtPZKrl0tpOl2eK1zlq9JfJmTld4=;
        b=DXvrXTXd5szTVEcvmMNd1c5QP2OHymRnWB/BewLnqBMf/REs3NRdqazi4N8LJKkxfB
         y1HuSMBZR3EMQu7XtfwD//hNqXaMyP9DMgAaqXmgR0noSEfEW+S0Dluc5hSTiGAwZJSK
         rjkxPUZQ062JLs6PgG9BLX/AZ5yMYxNZXrgr5nDNcVphMtpUUuHVDMAGaWYPRRMzhVmU
         zmxJdB6AdjkqfMJU8w3NpVP0j+SBjoY5b1jNz2CwqpvB3jjxgkc6UJzfKZmYHYd1/1nS
         WNtW/04zZNqJ/2S80U3bEHiuLJEmALWclMOGN50p+oJd7vXjX/52qhcYC3gjj+o1bjcf
         rsLw==
X-Gm-Message-State: AOJu0YzpxATn3Wy7mzyeOz+ZIvQ1DIn5TcpCz/Y3D3uVSUNGqPeKQVrx
	gxr+LJALXcL4vitsiJG0dO8aiQ==
X-Google-Smtp-Source: AGHT+IEM0ferBCaODHhUulOSAu3F+ckHAPew6loNpc69zlAeek/BqCYvoUTSVE7JAcLnIlSQGFuJ5w==
X-Received: by 2002:a2e:97d6:0:b0:2c5:16c0:6239 with SMTP id m22-20020a2e97d6000000b002c516c06239mr12471205ljj.51.1701267870294;
        Wed, 29 Nov 2023 06:24:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4520:2f25:4d3a:4adf])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040b34720206sm2406848wms.12.2023.11.29.06.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:24:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 08/10] pinctrl: sppctl: use gpiochip_dup_line_label()
Date: Wed, 29 Nov 2023 15:24:09 +0100
Message-Id: <20231129142411.76863-9-brgl@bgdev.pl>
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
 drivers/pinctrl/sunplus/sppctl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index bb5ef391dbe4..ae156f779a16 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -4,6 +4,7 @@
  * Copyright (C) Sunplus Tech / Tibbo Tech.
  */
 
+#include <linux/cleanup.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -500,16 +501,15 @@ static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 static void sppctl_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	const char *label;
 	int i;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			label = "";
+		char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
+		if (IS_ERR(label))
+			continue;
 
 		seq_printf(s, " gpio-%03d (%-16.16s | %-16.16s)", i + chip->base,
-			   chip->names[i], label);
+			   chip->names[i], label ?: "");
 		seq_printf(s, " %c", sppctl_gpio_get_direction(chip, i) ? 'I' : 'O');
 		seq_printf(s, ":%d", sppctl_gpio_get(chip, i));
 		seq_printf(s, " %s", sppctl_first_get(chip, i) ? "gpi" : "mux");
-- 
2.40.1


