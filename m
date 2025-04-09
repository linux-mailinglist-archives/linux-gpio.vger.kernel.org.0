Return-Path: <linux-gpio+bounces-18546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C8A82064
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91C916CF04
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0A025DB11;
	Wed,  9 Apr 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zlXd6NXX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237825D904
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188056; cv=none; b=HlO7JGwzPxMKrzSTfM/fIOwGDWJz7W1BUpJxzvM6LNb1/1b9RR7EpCYp7eTpnayDclIzVubYDj8YClvX6L3KzrDDS4kgXlrFSNBjWEuGSDDw22qxw2e6OLUococZUEdrEI5EyG/yPxfXhl+XQ3CgTb9UMbYFPMmEYPxyfM3wI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188056; c=relaxed/simple;
	bh=pPqlQo3DRiKCcYkAQJQaHw1DlE2TLJ3LSJd2MBRf7n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBQ+LN+3Joc6mtDy9hFfpPSVSt1+P5QiEDzyudIE3LPb12e7aZhNwOtOsvWLUFU73Xt2RttvfXz5GA+o/EudJjPkfjLoK0ZB3mA7zjtri15Js7gLoI9b0dJKPGLJXQKAIq5yB0uh6eLsiGDFd+ZxUbuCB09G6VoDDaKN8Icf6Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zlXd6NXX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso31100085e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188052; x=1744792852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwTUwTMxyTj7zTjMDARLn6ufuL/C/9AMOfMQrrdFbkc=;
        b=zlXd6NXX4P9KuRmQLGg6Pddnrdh1u17sEwKiJ3eZ7XQu3rM/QUXPJmroX/BGyvgFtp
         VgXkdWihR1iQ7rPeOYhgbEO2g40Cl+vEb2Ww+ZrtDaVxXrH3No71d8CF2q47dMFxlZT4
         8bmr0ER+bbF/lQDKZsHjkIbE2gPUrj1vO/4Tt84b4Ns2wKuQV9HxudJmXbgMElqJByPY
         mMRGjS8ptre6fZilEGf+ru55jbR/GnBx7fq8fNIWkDzxf0Aq1SU9QXKegY+KkqiKDOkE
         yoe9NxKgY8WAr2TJDY1VrzJ/1K/BN+fxbdUNfDVLi9uwZ5YGQzSQjptbBBSjdRvfaPId
         Z0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188052; x=1744792852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwTUwTMxyTj7zTjMDARLn6ufuL/C/9AMOfMQrrdFbkc=;
        b=RKIHq+je7pmyHR1NFpg9IHzJJGXgSw3RyiDaUFwbDIUVGWNqOsKV8o0195v3sS39Up
         HYi2sUBENlqis7T0kFK0sVYACfKGnq2YzlSBHCZJOBr/hphEkxDBRos9cIn7GSkebFly
         3pOQxLhVQMejxJ+u2Jd0J4QqhSPyuic4DYwyr3rVk5Y2yGuuhPUhrtCMHwfxh4zalhc4
         WE2uHlD25ope+8AqV6/BCQeKxWRHhx4EetlRNnFOd7C9M6z2XPi1xoufo5eZmXr5Cl3Z
         jazoAE4jbu9EsbdzmE9H8jTS4K9R35uszkPuQUcJbTWX2iQlDNMEd+anbG269En0uA9n
         dyGw==
X-Forwarded-Encrypted: i=1; AJvYcCUVEOl3LBz/4ukFNBQaQMZ7PFYQ0hk5CzWkTeqQu9Ns44DQ027Ck+Xq8dinuLZhN/5b4DsGmmnUpEPU@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrAhxOZaQ6RlPCzFSJVa/kEeyfldRflan96/Cmj9pGX4zYoaq
	WkstMr2NKu7GESsrDvyvuMOZZDV5CkqcTvvErJ4EWlfdkQiO2Lkkn56ufx/QAsM=
X-Gm-Gg: ASbGncvPi2BXecsNgHpYTi1ynHw5n78kLrNsgJDFNa1p9UFqSCAahe1jZxwqbmrRPUD
	fr1uvP7FUeQAUUTZmoWY40rIPPWR6w7dMiOxh3ZQ2/DL1ls0ZsCmDEJb9jKlC6/BzL2xwsZR9SE
	r079bER3V0Rs+vN+N+cRHSvpAcPemolsQoKNxBNb+W6IcG+V94ZMWcmjXsLNSXTTlcysr1b72tH
	xTc7yhb7YoN/YZLzzeQFOedccdvZ6jKBeJyueL58sqvEBvw9vTW0kRDPEbv3OEs52RkakrpUcGN
	530hm5DvaZe2Ptg/55dNl52sPwAbxcP9fw==
X-Google-Smtp-Source: AGHT+IG2rUP1u8AtLqvFPqtI5IJP5tCAlsoMsV3VVHT0ZrACaP2KWQR8dxGZAgGDfwzhkpOlRtnpQQ==
X-Received: by 2002:a05:600c:3555:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43f1ff3bc66mr15768995e9.24.1744188052585;
        Wed, 09 Apr 2025 01:40:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:44 +0200
Subject: [PATCH v2 6/7] iio: addac: ad74413r: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-6-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BJlj3nSl7FlGTWhuoQWXENcxnJ6fTBwNzUrL3zDx7YM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKMly84lMX+ymyueER8h4PH2zH9nRYfOtQpl
 taKdWN8mdyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 cqF3D/9Nb7PFT24jUYlGv5l/crO6d49YufoF8aaamWFtpp9X+lAFTh5h7ZLaEqykLBKT/YiJnUS
 iO3vd2qf7p9YUkVFIJ0GbTTv7aSgwBWE+ZObPgIY+aPOpBv3xoYUk3zRkWWmmui28OJWPeRJWY0
 Y/59Z+7h7EKhYJ1A8ByjezbB5erDBnFDeZCqsAb43rvbXJQQSZa1fhoMa4ulVI94r6bFdvBqEEh
 5EbXwdNGX+8uwmO0RoBFjWp3FKebwGAwFqWqAdjkvdW+im/sKpl5zNYsTOgtkoo4TIAJzFnKVJ8
 EPwtuaFNvVydW48zZc/WItSB1ruxJTXaQaci2rXqXvg0v62dQ10oTgHvElBR7uWV8UOcoufs4f0
 hnYZgeE6vFP9UsE8UftKHtdCVoq8x8wLuBRP/LMaI+oI8risNBAworYt3j8tclGQdZxubeDskDa
 ioH6THD7IOImPDdwF9rlmSb8m1IY1m/WD87bf5Nr5QQsju133dD+jppDi5OX0fgxvWPlzDT2014
 +e3gYFDFDI5rUm+3BpfLvnFHmejUxh8Wb1j11z8q2B3kmAiW5aGdsVpnDIn8MvEptzG1JQ6kFdz
 oI8CMNsasqB54nGoCWZ3Rvk1giOZYzRHpZtYH8+C/QMRQJ2BARIMROUP4ScOciNYa2sEEb+f6DZ
 YD8KPLt7U7E/few==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/addac/ad74413r.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
index f14d12b03da6..adfa14c4b06f 100644
--- a/drivers/iio/addac/ad74413r.c
+++ b/drivers/iio/addac/ad74413r.c
@@ -276,8 +276,8 @@ static int ad74413r_set_comp_drive_strength(struct ad74413r_state *st,
 }
 
 
-static void ad74413r_gpio_set(struct gpio_chip *chip,
-			      unsigned int offset, int val)
+static int ad74413r_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct ad74413r_state *st = gpiochip_get_data(chip);
 	unsigned int real_offset = st->gpo_gpio_offsets[offset];
@@ -286,16 +286,16 @@ static void ad74413r_gpio_set(struct gpio_chip *chip,
 	ret = ad74413r_set_gpo_config(st, real_offset,
 				      AD74413R_GPO_CONFIG_LOGIC);
 	if (ret)
-		return;
+		return ret;
 
-	regmap_update_bits(st->regmap, AD74413R_REG_GPO_CONFIG_X(real_offset),
-			   AD74413R_GPO_CONFIG_DATA_MASK,
-			   val ? AD74413R_GPO_CONFIG_DATA_MASK : 0);
+	return regmap_update_bits(st->regmap,
+				  AD74413R_REG_GPO_CONFIG_X(real_offset),
+				  AD74413R_GPO_CONFIG_DATA_MASK,
+				  val ? AD74413R_GPO_CONFIG_DATA_MASK : 0);
 }
 
-static void ad74413r_gpio_set_multiple(struct gpio_chip *chip,
-				       unsigned long *mask,
-				       unsigned long *bits)
+static int ad74413r_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct ad74413r_state *st = gpiochip_get_data(chip);
 	unsigned long real_mask = 0;
@@ -309,15 +309,15 @@ static void ad74413r_gpio_set_multiple(struct gpio_chip *chip,
 		ret = ad74413r_set_gpo_config(st, real_offset,
 			AD74413R_GPO_CONFIG_LOGIC_PARALLEL);
 		if (ret)
-			return;
+			return ret;
 
 		real_mask |= BIT(real_offset);
 		if (*bits & offset)
 			real_bits |= BIT(real_offset);
 	}
 
-	regmap_update_bits(st->regmap, AD74413R_REG_GPO_PAR_DATA,
-			   real_mask, real_bits);
+	return regmap_update_bits(st->regmap, AD74413R_REG_GPO_PAR_DATA,
+				  real_mask, real_bits);
 }
 
 static int ad74413r_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -1424,8 +1424,8 @@ static int ad74413r_probe(struct spi_device *spi)
 		st->gpo_gpiochip.ngpio = st->num_gpo_gpios;
 		st->gpo_gpiochip.parent = st->dev;
 		st->gpo_gpiochip.can_sleep = true;
-		st->gpo_gpiochip.set = ad74413r_gpio_set;
-		st->gpo_gpiochip.set_multiple = ad74413r_gpio_set_multiple;
+		st->gpo_gpiochip.set_rv = ad74413r_gpio_set;
+		st->gpo_gpiochip.set_multiple_rv = ad74413r_gpio_set_multiple;
 		st->gpo_gpiochip.set_config = ad74413r_gpio_set_gpo_config;
 		st->gpo_gpiochip.get_direction =
 			ad74413r_gpio_get_gpo_direction;

-- 
2.45.2


