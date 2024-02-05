Return-Path: <linux-gpio+bounces-2944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55D849693
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E3B1C227D0
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9177512E46;
	Mon,  5 Feb 2024 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hve7TEUn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5512B88
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125672; cv=none; b=g53Rqh1lMlyWe1awYRmaO0aX+/KQZSbitLeXsUcJWqU86r0K2e9iUjCHyJXwyutgqwbI5g2E0u3GwwIYOYRt7gBUc56VZ0UQa4iF9eZ5K9f8qJu/+399nPdmQPTy9CM5Bwc36kxWpso12a9FVNwBcPPBh2E0Anq291tLNspH4nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125672; c=relaxed/simple;
	bh=w9OTZVARMR4Mdnl0o0yhVNJkoS2c5kOcFylZbMhF7Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lIEYB4l3EmHUIh6aiswplFHJDIUUkXtrZhQ75l9/3ElDO3e0DAvb2OIIQ9eLtaBJTt+SaGuYo8+NwbUr7l5CeATiJpulcZTovG0FxWTl+wymLpEnHU1tlxmXTnlyK9hQCbYdVh0V+IRSw7E7xmV7y+D6BANKD87MTgHr0UNiYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hve7TEUn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fccd090c2so18817325e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125667; x=1707730467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCe01XgCpcinR2htLJWjY1RLrdRFN2p3/+OpFVj9aQM=;
        b=Hve7TEUn3MCqrdR7JXdEyuYo2XMGXSIvIlZ3buFYvmDsjzlT4dT5PgKTr7PmY2P2JH
         tp2bsA7Ih1g0u0B3M0V/hL20E6AFT5olkivyqRw7llPf71cuemaQuwwrfojcs8pEP6ow
         j2yZ2RGos/QQMckJsbbbB86EIVAXw7xBzeSDYcOx0KlIfWhqYX8BRKXDr9xbivhfM0dJ
         ZMhdOYCz3O/4zc5PtbSmSFhmNBCZzWc74X+RsEfP5FPFxHMbnRPZPSgyGoBI3Q1Rxp2g
         IJlJcr1YulUVDhCRMxOlTmYPyKPF0+/l4yESc74/EUbe+cZD/ip2eTAX/7j8o/pXMI1f
         Y+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125667; x=1707730467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCe01XgCpcinR2htLJWjY1RLrdRFN2p3/+OpFVj9aQM=;
        b=NNIo4nwh65SLeCKHsWjblDP4J2L/AFx5eBd7GVZGG4+f71yT8tNm0WE7G2PYKmLKUL
         2oM3En2/c4bibjYtyRNaeN+oQmK6cVUjhYyrW4viaF4yJWnqSmdd2hPgq3xYkBYWfpHi
         GzfsRlE4TgvizkcbdDCysMbptg0UPuaby1Gq+VkMOcqwcWDwNpgjsGWEY+W1AXNd/xHF
         l7HfUQxS7bkOUYPmLf9majWgTk31mXA5jmmVJSrs1+EL5q07p1W2HmqYgACryIU+q5Hi
         eLlOxDQtV2EvtEiMBHBaTMjmG4xjLFklnwVQ2I27Zf9LMlimsnBtG2XEkD44vnSy+/Qq
         X4bA==
X-Gm-Message-State: AOJu0YyQbdgo5sOMsDCGzIj309Z2ErJdrxgoXl9iYd0CFe1Dsx/DgXeq
	/J8vROMKUoXJXhNegVXR0gBWv01ghKsatgpEMsgcwet42GZFS3BMPifnFvwsUJhwkKxEqBzMUXO
	w
X-Google-Smtp-Source: AGHT+IEL3J9p5BXWGBPz7AI47HRJRAqQdPPdU85CEgl2ZpCxmqbm2bH4OibqUJ9q4vkgL1ejZSG1uQ==
X-Received: by 2002:a05:600c:1c06:b0:40f:b630:a9cb with SMTP id j6-20020a05600c1c0600b0040fb630a9cbmr4101104wms.6.1707125667557;
        Mon, 05 Feb 2024 01:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXxt3LeBVGvnr1P5pPQb4AEa9+llY3je+7jtCjmRAYyLAZngAs/Xcd+Umcj1bz4tdnQ/lTJcXe/qcu7VCvfQ9Vf+884tRivPpIA5/efCz3hMMp4qqTn/Aw+ALXxQhvEmaXvseYnn6EAhRHucSmg3ltSb+J1T3hJ8p9SGAXuLLh2nfCQWDT8Z+ftk096wh/wtd3nxqYaavK4GtiRPIV/fNsXpVV07A/t7R/WD5NjN6u1CyxCnkSBcgKVp1Kg83drGbbDbypO9McRBjJPb4XfgZUUSZwEjXFdh3CYRQnQ4qy99/O0ajhg8D0fnHAOLaL0LU4ycgoKQdgyWyX/3+to3ggmSbJHr92LCw==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:26 -0800 (PST)
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
Subject: [PATCH v2 02/23] gpio: of: assign and read the hog pointer atomically
Date: Mon,  5 Feb 2024 10:33:57 +0100
Message-Id: <20240205093418.39755-3-brgl@bgdev.pl>
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

The device nodes representing GPIO hogs cannot be deleted without
unregistering the GPIO chip so there's no need to serialize their access.
However we must ensure that users can get the right address so write and
read it atomically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 4 ++--
 drivers/gpio/gpiolib.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 77509aa19900..bd6b8702c790 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -800,7 +800,7 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
 			return ret;
 
 #ifdef CONFIG_OF_DYNAMIC
-		desc->hog = hog;
+		WRITE_ONCE(desc->hog, hog);
 #endif
 	}
 
@@ -848,7 +848,7 @@ static void of_gpiochip_remove_hog(struct gpio_chip *chip,
 	struct gpio_desc *desc;
 
 	for_each_gpio_desc_with_flag(chip, desc, FLAG_IS_HOGGED)
-		if (desc->hog == hog)
+		if (READ_ONCE(desc->hog) == hog)
 			gpiochip_free_own_desc(desc);
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a14eef93ead8..4c18b693d06c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2324,7 +2324,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
 #ifdef CONFIG_OF_DYNAMIC
-		desc->hog = NULL;
+		WRITE_ONCE(desc->hog, NULL);
 #endif
 		ret = true;
 	}
-- 
2.40.1


