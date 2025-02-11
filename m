Return-Path: <linux-gpio+bounces-15721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9ACA30B3B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8EAE188B460
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B806A2147F8;
	Tue, 11 Feb 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="09VUB9Gq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B641FDE31
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275809; cv=none; b=U/AQg+hZEHcrvMmyoOda0FuuBx/UiP1jrc/2+hs7blpq2RmF1S8bEx+13wd9P3SV4zb/DluO+uT/LpnnYs6IcGyrKR/T9XxxcRsD1ourKNOmLEuKT1h1iyMTCms0XIPZur53g3QcfjM5HYWiALRzY3CYH91c2cyo/8J+UHqGc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275809; c=relaxed/simple;
	bh=caKhfxtRFMp/EYZR8ylZh3Qlurb7Wy9UqMcdz0OG2as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzeZQGJPv2vvalQ3imMmGWx2dCiCQTPbNCofQvckIAP20wnXY0gcQmCr7JoTZiBnKokepAn/qMRcu9c3eUYeJyIY4VcfhiAmWqQbCrT1KO1T/icrpFw4QUOjKTUp4csFKsOaCy7pIoQMmpMfWHP4/OX6LYZZF0HWIOXxapgb8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=09VUB9Gq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so2354456f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275805; x=1739880605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB5pK+oicJDwPB8Q0nFLhIRVf54jMTA5bcMsE6iZ+04=;
        b=09VUB9GqdzNkKIr2xORY+cZ+vFaigKWdkg2V+alYu0mFG0rViMoheV6DX7TE/0UxCR
         hLyPoaAp5gO8Yi3PwjRMBW+5OuvI6ujfNGx0yyaYxYGRaamIdZbRHYNiUE0ybE1Tm8+Y
         l/ngD6YHIGa6ciMSA73voMmRK0AOL9XOEBc9Jj2i3lnODlhUin7NtyOtvr3I8jz1gxzU
         3k6w5114GB021WP5qziSgf+N1iGjMW2AOl5KPj2O+sJjNhIDPwSeCR3qBv4sc+mLXVCV
         M6a+vwaFOCbV87KehRyFTUkGeKaQ3QiRdVpEFIFHIIn+xy5DYJGdjHU4qVgPf8qYW9sg
         YGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275805; x=1739880605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB5pK+oicJDwPB8Q0nFLhIRVf54jMTA5bcMsE6iZ+04=;
        b=NqqyH1b2FRokTJ94ejeaMXsY5Vs/xggZaVeUSn1zaPHMKOjwkDZefFxd4eP5bc5QH9
         rax4PKleFEzxvf6454r55qEm3fp7ys0nr1SJxc8oN8S0mufqbOOpflV9EdED5t3ZX213
         YxZpYJmHYflfrqKQY0hkEep6+Law58RhKanlH/9A6e8TFgE4NkWIyVi5AKz8DcZGhxM2
         rLCUfyjkbIY3W1Ea7Y2tATAD1+8wSjuBfk3Z8HZ+kKwOsTyYOYPimL05agg1dpeR+XpU
         NiiGYi5/caUpZEWzIKCcJjdDrc+/ANHNsD/ZwFUZSBdLceYVnsaEBOLpr+6ZyaWpxnvh
         CI2Q==
X-Gm-Message-State: AOJu0YxEqhwIy4XR9zjHy5wtZ71Y6WMAEUbDcBA/sUSPwaMJjsgO8+hM
	o3hf6QCk6ph2v1XItKx7fUrw3mDeSoB0Ebd9ZB9cjC4+klP0HvohWn8sVoYqQUE=
X-Gm-Gg: ASbGncvvWMaP7R7cnxIVwiPtdXri0xKwrGKTX3mYvOtWKCHlWn3N4VwjWmh8VXoUbzy
	C0QnXnD/dZItEq7axONRmrpQZWHditr0G8LyY69+rCzYgelAzYADHawmqhCZhHXOR7KJqwSKMfN
	aRTopS8Oo2I0pFsEnVsicjVmdTllSn0dcUlDDm0GDzYZ7PQmUvzCWw/Qo1KQkPWI+Y2gOz78i9b
	jHe3xJIaT/AVl5baiwg6qAxl7xOfjcqabqz5sY39VjTWHc4aKztd41S4wq60m9T5SBWwrcqGNZL
	U03Q3eI=
X-Google-Smtp-Source: AGHT+IHYHO39FYN9fqzxuulSr07JHo1uzefPIt87F1jvA2dDEDL04bAJrSOp1VwnvFvuELyXPcAF8g==
X-Received: by 2002:a5d:5887:0:b0:385:e429:e59e with SMTP id ffacd0b85a97d-38de41c608bmr2481781f8f.52.1739275805525;
        Tue, 11 Feb 2025 04:10:05 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:05 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:38 +0100
Subject: [PATCH 04/14] gpiolib: introduce gpio_chip setters that return
 values
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-4-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PqwP4DdGtYYvgPMEjhHMWkD10+jKqk8KGLWSnN3SmPc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4W3+44nQ16vPqyxAePOsKaJyxohjnqd0KpT
 NuNoYQsnFOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 chgfEACzRCcnf+4m5DpSw182YLXuZErPrxL0A62O8H7l8svfDNzjQJiWI995glAAgJDKRyX9YFZ
 wC67eV1f25gGJbelW8EsQDfnTRQ9xF+MeQ9KuwyiTzFKynPPG+0ADusMK99YZgX3LiWZptryiNY
 J4qmtw4Yw2Q7EGIJoDxW1RvyO0QsV2YU/+YeUuTwfMA0ax/rl/7skgYhnatYv1oUFjmhMFTMDaY
 ohiUWQHczNS6Di8c7JdxqiZpE1FjgKGXgLNYLw1aSuAEQzEn4tErp8+snpfQ4IflYHkjF3PcDa0
 43IzeuTvqAW16p/TV41sMQMLK9EJCdlUYRMIcDWVBD5SYHenZkgQNguX/h+XewNbClO/15nqZgR
 v+JyOxCaXi44Vzpx3g9jU27XtaVNtF/RJG6UC9LM3YsYA9QJiChYhTZ2a93xmLWIg4fN/b8kqaP
 TAKroL0sQgaD7OCISNstYXxUL9OFZtwJ5I7z3lHFNT28Lxyd3iP1+4kXgTYb1dIjlKJPn3S/p7n
 UrDNEsm2Svti0jVMoX/sGpX7n97oFT1Sp2U83iN2MHHRFWisttHXm9n7ow4I9OEWXQZjVw9DPdf
 LXEoQ7ULJtSZS4+2aci/n4zgVqfNLF7E003IooHaW/yZSrReVTfz5Q4++15HttkhesFpI2HofOQ
 Li1fGOyaUEQBWYw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add new variants of the set() and set_multiple() callbacks that have
integer return values allowing to indicate failures to users of the GPIO
consumer API. Until we convert all GPIO providers treewide to using
them, they will live in parallel to the existing ones.

Make sure that providers cannot define both. Prefer the new ones and
only use the old ones as fallback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 28 ++++++++++++++++++++++++++--
 include/linux/gpio/driver.h | 10 ++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1f078a20ce3d..5f3a8f1b7757 100644
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
@@ -2749,11 +2754,21 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 
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
@@ -3475,12 +3490,21 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 				 unsigned long *mask, unsigned long *bits)
 {
 	unsigned int i;
+	int ret;
 
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
index 2dd7cb9cc270..ac42f0164d5f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -346,6 +346,10 @@ struct gpio_irq_chip {
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
@@ -441,6 +445,12 @@ struct gpio_chip {
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


