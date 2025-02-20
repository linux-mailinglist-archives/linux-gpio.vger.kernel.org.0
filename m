Return-Path: <linux-gpio+bounces-16261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E9EA3D596
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8F7189D69B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7341F0E2E;
	Thu, 20 Feb 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eJEaxOwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD61F0E50
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045443; cv=none; b=ImdA02/SS7bPPKw56AP/62VRxyHH5a8M3+Q5LPJaaLnFS9ULc2AOC09dVrdRgdQYUZw3sngJ0yFhnDT/dkZ2p3MQnJ4jBc3i0qqtdS1ISsoStLe00ExRv6V2x2+UD4hODNPfjKu/czzpvRmwu2XrOwhQbi9E8GTeKagCUDBJUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045443; c=relaxed/simple;
	bh=Hx8x42h3TmyvG19Hvhj3xP7pPFU/ZDoyjClGhadyhMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNqtjBvS+nLGenl9G1EIQeRkTUhXCzM79kv1jOxRrBsokaoPsej9flyaPbG94gbMLxQDbUzvoOwgv99m3Fue3GLg2xP3V8S7eSp/qLf6Z7rPubRIMalNuLpY0JDEEZkH1vlJDFK72tgK+bU1EWAf/enzc/Gj9a84cKGm/tBBMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eJEaxOwZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so4255865e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045440; x=1740650240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CW1BtDxAa/GSG19LzM6FVm6kpOL/sCLazVCSkC2HISg=;
        b=eJEaxOwZ49GirZ7WB7oRfLIYRLO+MydNW8gTlGzR5Q46+ZiD+7VaTXJ8A/boLs42Ji
         otgBkXwuE3bO71peK5w18tUYB3AZAlKfgH7/LyQzFAeWwKL/94f2hEUB+LoAItH1vZ8r
         vqu+RVTp23S6xtZfpYxGQpIYD/b8ZFdqXsbpHCtibSpAE+hbYf30wvGAWHj7A9Kwx5IO
         ERdXVKsU1xUGguAbQagf7VqmmAtsJkBPxj/wP41n4Vt6psmtg8peahcMCgEYGPLMMMcu
         2Q9UW6gRT+9jYX28vp/kLbS+5Qji/671ecpyUGwe+/Sl4yZBK4EqhsMTTZfkopMadx9u
         qrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045440; x=1740650240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CW1BtDxAa/GSG19LzM6FVm6kpOL/sCLazVCSkC2HISg=;
        b=uQuYCz/DIicemeA+TJ3aKOkGKmpJMCc8I9HqcYP6aSRLH0p3fz0uZnWiyid320Wzvh
         rPMtVoKNg52BqwCHcBZp2aeNx0Ie693ms4PDckDF689XC1H1R6sMHr8eN3JKqJKJbyjC
         c/qT305Nh9DkWFxjmcgAoT9jBzQPKFajZhREhiv8X3bLcidkjUPvK/TsFBVxYHqjCPQj
         cJt1OEcu35/UnO+TcrUekMn3P87leB3jZp3vh+tcczFTwaqJ7BIJdpy4s63BZYxnJBwL
         yrWZ1gnORQy2Zruv5Alr1g2PBZ/g2cWjmYkvNOV8j4i/pnRZt8HMVx1khxfD/dKIz3pW
         zsJQ==
X-Gm-Message-State: AOJu0YxnctOhrYxfV4BFI5uf5dnXDO0vcyXr1+BXqHiG5XeRAOs9mD3k
	imHHu1Xnx9XXD+xbRntFh3KyKCyYFsDf0MN/g/GBd80JzLIReKMkm/ufvByQgoo=
X-Gm-Gg: ASbGncsTN9hgfwHKstAkCCZ5aOt3B9FEOHXQcYHpTmKq18cZhJo9OS4OLsFhnT3Hd0r
	oI6eV3fd/bv/b3TocdVh0UI3r5o9jUOfAr6r/jSthjxVju86nDYhndnyNYHsEY4NrY52ZksaMVr
	sFEvcfkZzlESbtyCmXJzNewKpLz+6YtHoaMo2rbi+yv2dnB5Sacmk8OVcO80/WcvL+QOa3EtC6i
	sDCRSBVQoNPb2wjX0O4vnwn4g7mk53Y/dgBjYfac5MzVLrvF100tDLxHC/XoXS3K3ziA/KO1y9R
	+wTPwJs=
X-Google-Smtp-Source: AGHT+IEzfYTeDdg/DrUePFOBkrqsf083bzzXDfXkF2qzL45+2j4Kd/nMhGJG7tMvJ7+QZy9eEcP3Tg==
X-Received: by 2002:a05:600c:1516:b0:439:5d00:e78f with SMTP id 5b1f17b1804b1-439a30d4c32mr21123675e9.11.1740045440011;
        Thu, 20 Feb 2025 01:57:20 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:57:02 +0100
Subject: [PATCH v2 05/15] gpiolib: introduce gpio_chip setters that return
 values
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-5-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=A1iH2N7/CXnZXWebW/r7AKV8RFBFJ+TvTYVcN6Ufjwk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx340P6bz8HBHSRoz1htB8NvNzkOI84ft9b7
 Or6HUMWz9GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8dwAKCRARpy6gFHHX
 crNxD/49lgMRbbBvfftYNyPR3zsQIi3k6BMOdyIhLPRspZIILH/urHQIKCOotMqhAU/Ab2cKPiY
 jxjvOxmTQN7MUBTRQ6df1NEDwthBY4RKKf+JURBJn3bQ9SwPaLzI1EVx8zRrcqFqiAxxpGfmTP2
 OUU1tpThztixzKi6Knf6+0loNH8aWYXd9bxs6+mjQVOisQqe6RGu2JEsC4v6jvC/FwdLseCaaSf
 x8Kqw8o6wtQixtEHVtV0jl8eKahilwSH+I7v7qzIiCay0ctDkpxNKIRIV/GTb+FudqWxjh6nuZq
 FXQG3PDWhT+2+CAaPGsX7AiLsoJChWoVVLgVp/SdcVmgq4yv2ye09RNxgkvc6YmuizOU1rJiFg7
 Tae4zQ0KEKHfXuHCTi9z8IAxCUtF+vm3jkkX6f19O3jnMyfiP7OUj+7Gmu8goagEc3zn5nPPTf5
 +xEl+ig3mNs3B48/wdRAXAdUVP5oS7PhTqOEHA+GxR6nB+K8K/c3bldMADga6CXx9RHNetTWTLl
 KVh+ZCs1b0t5eTOyMFY+fmjVCyD+iwnTs35enqg2kDRve/6XJe+9fqvMYsVJDlZvUFgc075w1mw
 r8wwTdvLHKWpfiyXVNx7VTsNqqunZZ5khVevjPD209bcw/26iq13yhhQ49twYY+dtNTeAMu5tzD
 7c/rAcxajd8AdVw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add new variants of the set() and set_multiple() callbacks that have
integer return values allowing to indicate failures to users of the GPIO
consumer API. Until we convert all GPIO providers treewide to using
them, they will live in parallel to the existing ones.

Make sure that providers cannot define both. Prefer the new ones and
only use the old ones as fallback.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 27 +++++++++++++++++++++++++--
 include/linux/gpio/driver.h | 10 ++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b1e7d368bc7d..19f78ffcc3c1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -926,6 +926,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = 0;
 	int ret = 0;
 
+	/* Only allow one set() and one set_multiple(). */
+	if ((gc->set && gc->set_rv) ||
+	    (gc->set_multiple && gc->set_multiple_rv))
+		return -EINVAL;
+
 	/*
 	 * First: allocate and populate the internal stat container, and
 	 * set up the struct device.
@@ -2757,11 +2762,21 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 
 static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
+	int ret;
+
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(unlikely(!gc->set)))
+	if (WARN_ON(unlikely(!gc->set && !gc->set_rv)))
 		return -EOPNOTSUPP;
 
+	if (gc->set_rv) {
+		ret = gc->set_rv(gc, offset, value);
+		if (ret > 0)
+			ret = -EBADE;
+
+		return ret;
+	}
+
 	gc->set(gc, offset, value);
 	return 0;
 }
@@ -3501,9 +3516,17 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set)))
+	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set_multiple_rv)))
 		return -EOPNOTSUPP;
 
+	if (gc->set_multiple_rv) {
+		ret = gc->set_multiple_rv(gc, mask, bits);
+		if (ret > 0)
+			ret = -EBADE;
+
+		return ret;
+	}
+
 	if (gc->set_multiple) {
 		gc->set_multiple(gc, mask, bits);
 		return 0;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 10544f4a03e5..b2627c8ed513 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -347,6 +347,10 @@ struct gpio_irq_chip {
  *	stores them in "bits", returns 0 on success or negative error
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
+ * @set_rv: assigns output value for signal "offset", returns 0 on success or
+ *          negative error value
+ * @set_multiple_rv: assigns output values for multiple signals defined by
+ *                   "mask", returns 0 on success or negative error value
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
@@ -442,6 +446,12 @@ struct gpio_chip {
 	void			(*set_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
+	int			(*set_rv)(struct gpio_chip *gc,
+					  unsigned int offset,
+					  int value);
+	int			(*set_multiple_rv)(struct gpio_chip *gc,
+						   unsigned long *mask,
+						   unsigned long *bits);
 	int			(*set_config)(struct gpio_chip *gc,
 					      unsigned int offset,
 					      unsigned long config);

-- 
2.45.2


