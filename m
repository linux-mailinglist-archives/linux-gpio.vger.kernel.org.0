Return-Path: <linux-gpio+bounces-2943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8211849691
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641C828330F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBAE134A6;
	Mon,  5 Feb 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RVuSZXDU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3C312B9C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125671; cv=none; b=aBp+d5v+NLYjowmL81WVkWLO67rAhQgGrOyl91MuKaW1p8ERnfFmZtBrG+pJeXGy5o1ek2NkoupBkwsSAITCUWM6vLYyldyM4Q3BmuQ+535RVMnmniIV6I5+gRekFzNu1DmEnrDh1PM8tO9JYalJccVCcYX5juojZaA06wzzri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125671; c=relaxed/simple;
	bh=wKoekw2eVVFcj9oxq6vzdf2ok15iXRtTtNq2jliv4lA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tolKB4g3D0l9nT64Eu4bdUTwkINqR4YZ9D9olvykeZMd1YPf6cdOf5LZV4uz9EPrAwq37jc1kJt4y45qr1/NJVeGLS3Ka6LSsTILn7/FrzjDnrRl9RrlPgqbm0a/3DuynJEzalwA9zZPjsQdhk9KdagSyta0+WziNpR/UxlMbRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RVuSZXDU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fdd65a9bdso2704375e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125668; x=1707730468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZDQVAK/m+EwHZp2HJIrHIBUSEbpzq9pOlgL2Kpkkjg=;
        b=RVuSZXDU1PPPz0u88nlb5x4+Ori5uy8kod2URqu0ndVD0AKG32/31hpR+Pvp/gc3b9
         opVFI3FwfHGnVS2rk1TrPdYId4493uyRFx2V3pymUrV/9WPhPaTgeRPeFlp1GhDhFXif
         6hfC5uL9+jo0HXqN6YntjPPC3fU166Ur4ddE2TTwZ13eUz+ivZ+r0FzO7f85bcLi51D0
         xTPZ6qVdzEince491l5iGgp4Vt9uQrbXOwdYLCwqIKPaI5LykkTvG41rVmAwwFhyLkn7
         WacRFnHgX3iPN8eMqF6ooKIkR3GjB4OrbakdAxYLBnvqhGEZJhkvcti+ZOGf8nOuTnsz
         mYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125668; x=1707730468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZDQVAK/m+EwHZp2HJIrHIBUSEbpzq9pOlgL2Kpkkjg=;
        b=DfwyB95Qj5iez0v1JOaIBP1SXNalfOv+mTh4cktIwKrtSXxUujW0emGwVXv53aUKT5
         fjVe/WFBUTf0jz4d84rF7a/v1QXlvhPs2ywRDPV7gc+y9dVyqTB4Lqo8AxbDHqu1446T
         xdnE+qqm3aNaCV0aJ4PnhVDsnL5611FiaDXpIEoWKW2D9FQ4AjI855LmE7mF4uFZNUIS
         zwUsHFcIALcRoxxqwzBf1gx5ir7ld84Mkgy45KQtxLV706boCHUCosAW+KUou1ULc5DW
         JCJXnvFBW8ushnjIL4qfv0ldAYLDX4bLqmZzrd+x+j5l0hawuOwEfOXF7tPBQydnzKoQ
         eOFA==
X-Gm-Message-State: AOJu0Yyz3pRs7MwWWaG7Aod41iM8pWNrzOoiQzU3KzoIDRScTr7/TRJB
	on4UnqOXgg18cPoYHIXEGb+1GukQ2JukP/sl7oKl6oyeCn269hf6mk2mSOl8cfk=
X-Google-Smtp-Source: AGHT+IGOzddUhMQZJ0PD2K9+76g0yiZag3OnprMbiqKxoQPCFOLRGilGiVvAOxPHQD+R4ETWI4CyHQ==
X-Received: by 2002:a05:600c:a01:b0:40f:c1f9:c884 with SMTP id z1-20020a05600c0a0100b0040fc1f9c884mr4142575wmp.39.1707125668491;
        Mon, 05 Feb 2024 01:34:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUm83IhfTyQ7y6ls6Z3lT+Xx58RcKqxvlQep2ldxlrwxsmT6NcjogMnkVoMyYiXpWnpXWVIeKQtwOrmmrndaMAqI5KG9I60lg++7fcDO3ZPAQtwB/f2qKxHFMp0HkGXLedguNBPIg9CgET6gFQkgOEtAdQyYdY40lzTOYSeuOSfs/TkjOj2V0B1oloOCsHFU9z+cI8EgYAjCt1kBBVBqrpLZr8g/scnZo6DE9UR4/jE+/+Qvy50gfaRgAa57BMfsB5lFKBORni4uhRb7XTe46mfdX0t/Es7DCy64o5WBJFoIew/LJv4F2Y4AGKITDNSsozpyl6QecaDvfaJiMIFf8Yf7T81pzJ8bw==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 03/23] gpio: remove unused logging helpers
Date: Mon,  5 Feb 2024 10:33:58 +0100
Message-Id: <20240205093418.39755-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The general rule of the kernel is to not provide symbols that have no
users upstream. Let's remove logging helpers that are not used anywhere.

This will save us work later when we'll be modifying them to use the
upcoming SRCU infrastructure.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a4a2520b5f31..c3ae5bfa3f2e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -219,31 +219,18 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 /* With descriptor prefix */
 
-#define gpiod_emerg(desc, fmt, ...)					       \
-	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
-		 ##__VA_ARGS__)
-#define gpiod_crit(desc, fmt, ...)					       \
-	pr_crit("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
-		 ##__VA_ARGS__)
 #define gpiod_err(desc, fmt, ...)					       \
 	pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",  \
 		 ##__VA_ARGS__)
 #define gpiod_warn(desc, fmt, ...)					       \
 	pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
 		 ##__VA_ARGS__)
-#define gpiod_info(desc, fmt, ...)					       \
-	pr_info("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?", \
-		 ##__VA_ARGS__)
 #define gpiod_dbg(desc, fmt, ...)					       \
 	pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
 		 ##__VA_ARGS__)
 
 /* With chip prefix */
 
-#define chip_emerg(gc, fmt, ...)					\
-	dev_emerg(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
-#define chip_crit(gc, fmt, ...)					\
-	dev_crit(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
 #define chip_err(gc, fmt, ...)					\
 	dev_err(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__VA_ARGS__)
 #define chip_warn(gc, fmt, ...)					\
-- 
2.40.1


