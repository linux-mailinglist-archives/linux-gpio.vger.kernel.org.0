Return-Path: <linux-gpio+bounces-21451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9521AD7176
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8581417473A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040D224886F;
	Thu, 12 Jun 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kf0hl+oF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D156F24A047
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734130; cv=none; b=iW/1OMdWOlW3YjmYHX7E9ohDE83Gvhbbw3s5PY3qvHCPH8vKNL9p12pHNceg743zn0XnYzetm5192ky4eA0w6HW3jNaUPvgTjD3xzJkix9vfWO1f/Og9gf8Lkn6gWYLV+AkMJUWisgjKc8Uk1Kba0yG6K8Bsj0L9zdG7fmt/ABg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734130; c=relaxed/simple;
	bh=kcI0bfI5H/Hmf5yZdyf0QMbThFtI4nWGLfbZ3WK0FlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/M+ONVwMafUSK1eoTPhx3ANgzKKpY7iijzeYBQBAKV6eSFOoFQ3nXHjzAUj0f01v9wshJNGD3eTO7bGSDjClTgHN3XerSr+D/ZpdpKUeO0pqQS+lv8IiAzj7iymndecI6jk8EoW9BthSL7pI6IPQxmft6ESP3gyEnhOLqVK3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kf0hl+oF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9884765e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734127; x=1750338927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=kf0hl+oF1YH8z2XK9SBxt88+4+55wGdV4bnjPQkPBgQb3QXeZIUvm0m9pP2PhD7dLg
         RhIDNpLUOSXaTMOmjXx35qqKA1fiWSkFTUC0AVlgDYYtiUlyspoy4sDVf6eIBqXBjFNA
         F6Xlt8beduzdKIf6CLjtdJRFHCq6G+xvgZAkUl/TCayN+pJafPyVPxyC+QHoXm2WnR9K
         slSRtzHCS/Q5kKY+ZUYI9yRtMVIDa8vYDf4YC23QZeSvdv/Dyshtg9FYsym42t26dI0D
         c1fTbZlVrQ7ayLcX89D8RwmQmyDZW+w/jKCwnFYKIgubbBhp45dQR2NyqSjErjeqRjJx
         w1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734127; x=1750338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=ovzily/kaPugudE2CtDyzXaBzoOHrw+EtwXP4SQLN9DAeAhmz7jAxID9OTodExLy+Z
         dc4WW71ESNNltNdRcX45e/41eU5qnszlVSe6jXAV1N6FI+6SYcjEvzh4KoZrp4lgwPWR
         YwEAO8pPc8YKWeQFQ+wxe7nlIbfrQy4DgRgZ9H6tTEp1oDmzenZciCC/akRcw3e8YVZa
         RBQI303j/VFMn7fjDBwLpqfiIaRd3AqKxTAvyCoO0FZZWQcnUS7S3a3hM4vVMT3DSbAu
         zCabB3Z+MZguKIYeaoxqCdXuczqTRrJ1RffyodQblMdEXHwslURPa2CVkZZu8y0SDgaZ
         q3bw==
X-Forwarded-Encrypted: i=1; AJvYcCUSPzTI3p1MNqsWicCjPqkuQ9stbtaJ0OZeiVZQN8nrOJ6f0Pj9Ug5QYMe3ng2IH1bRcsHO39AhIpsD@vger.kernel.org
X-Gm-Message-State: AOJu0YwKC3gP0BUJ1yBV2+5kLGhfG+D+d/8IwFOIDo5l3xkJz/y/JOWV
	glaOoMxYcZsiFlcnPtHFjtoppzPmypUjAHgrrMG3kL+lPMGAJZ16zFkxsOAeNWCPSQw=
X-Gm-Gg: ASbGncs/5peVwZLkjrIWiCUvo2Uk/6u45jD5ouciJb+M+8cyd4oqklPFweX30f5aZSR
	u84tFTpI5kIHTRerl2pLqEivB+PhTX/BH5p0d143N0BkTQJbZQHqOA+HH/A+LoL6rtIyER2jIrB
	pLcUSBclbDWM7oh3KiNTX8ZVZDNKbsF20lysGG3QwQ15XgzCYs1kqP9o2tWrOyPrtTRFtAZOR3q
	SWtOXB+I1OeBoI9Yzk7etnAqa/XRlWo3l2uwL5V9WcM9r4ku2gAHq4LDIP2l8RZb5C0n4aBF9JJ
	g4IrTI+8RSGOHE8ZZ9YG35eXc4Vaa7ZV8GCWbQIMWOZVpJ0F1pqxL1/scFZkfmf/4Q==
X-Google-Smtp-Source: AGHT+IF8dQFZu3267rnqS9T+MlnDpsGMNr4UhOIVEWZlRhW8ilrSLXmT3/L/LQod0dJlLDDEHru6ig==
X-Received: by 2002:a05:6000:2505:b0:3a4:f7e6:2b29 with SMTP id ffacd0b85a97d-3a5586dcc29mr6204277f8f.5.1749734127149;
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:14 +0200
Subject: [PATCH 05/16] pinctrl: wmt: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-5-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zZBlMtHKzzXioPhlG1XBi+lA5WvGdR2KtCyPxbjRVIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLll7sZrjDKxB+yIfzZvsGDAzsgGsNSphici
 P1S3FHTYBuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 clh4D/0eejaFFeaR28Vf6ymty4cRxtkyHHnZyl0oNIAQK4k2LKxfyvv1Uvm5rcDeJyn5YwvFLUM
 63wQ/V8f3n0FvrZ0akyzb4OoY/gTGr9TqBrRvfmdw3r88RstUyCq+LAePz4qg737URegvsmvcqD
 d0sTmTdeWFE8SJUqM1Rthnrc32nwNGmdogrzN3Y3ZySLnrLIrGYKfwRv1uaBnPxjdZ92ZZp7S3u
 EkfpWxLbbosC+cqD7juqS5+lazxS8yOH2tC8dPPUxwYFwlA/yuIElg3a5eB1sSMrR4EGmkb2RuG
 omLdr7y0eoOfBmNyoHulUJeZERWMiUDyTpZuVWgKEfCYdzgb/Ti1935juLv1SrhpTfvkpL369DG
 saMpzPev+8uD4fKF3iWymk7Rpdk2zZ+93Ey4bGlSG2YDdgz5qd31nsBMFhvQPWVdVKNty0XtRyX
 mt0+a9PFIVXl1mjGeDhyldfzWKuR1cd3kDzod6bLGisrs3zMUq+/Ru0yBalUAzuB40k9boYhvhv
 jfa8sc/Rp5eAZ3YSb7LDTNEf9m5zWmWu2wMBGWlQIS0JyYZqtY+6j37fbI16nOHQgPZcd9zGGG/
 cvIur8XbL1wPUk8bK7ZObQF8wT/Nu0GAH+UK2fj/hAJAIHmRY6Vy2gaw9fAM0vxRT/AEE2HSZfC
 45zRTemNQslYrtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index fce92111a32e4976bd31c7e9845e4fd08a7affa3..767c6808a463ede61aee61b63f28ee38185b7633 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -507,8 +507,8 @@ static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(data->base + reg_data_in) & BIT(bit));
 }
 
-static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
-			       int val)
+static int wmt_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			      int val)
 {
 	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
@@ -517,19 +517,26 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 	if (reg_data_out == NO_REG) {
 		dev_err(data->dev, "no data out register defined\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (val)
 		wmt_setbits(data, reg_data_out, BIT(bit));
 	else
 		wmt_clearbits(data, reg_data_out, BIT(bit));
+
+	return 0;
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
-	wmt_gpio_set_value(chip, offset, value);
+	int ret;
+
+	ret = wmt_gpio_set_value(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -542,7 +549,7 @@ static const struct gpio_chip wmt_gpio_chip = {
 	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = wmt_gpio_direction_output,
 	.get = wmt_gpio_get_value,
-	.set = wmt_gpio_set_value,
+	.set_rv = wmt_gpio_set_value,
 	.can_sleep = false,
 };
 

-- 
2.48.1


