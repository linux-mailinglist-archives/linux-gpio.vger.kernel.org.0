Return-Path: <linux-gpio+bounces-15648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7DA2EA23
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9177F7A3BBA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9A61DF749;
	Mon, 10 Feb 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2Lh0H0hF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A311DE3B8
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184731; cv=none; b=XUQobf5fdLrQW/dj7mE8TlRGiDm9tkdyUEJtVrRox3GmRQX9iqAlZU+2YQUxNwVWdSa0urwxG8zrC+97pkHVYEF60wXQ9peikhxsnNvIy0SV6vxNbVqdfKaBEotA1eh8dwiob9oTt/q7jWnUa1wd0FpMxqXDQ8j6c9TgJa1lXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184731; c=relaxed/simple;
	bh=q+8h6LGXedGssIbDpk6doFlGaWnQknR2RXXNfrg5t/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AiGDfQm1VNxYO33uCfgntevYQOMRzw1X4m5hbbXZWJz/jfI4MLT8y6DKqsAjYRn0L/dBabNmUMYDUqoDFZ+70EjIsatZ1blY47tzr22saPaUcxEZQbzhjTL3V1xOiX+dgD+dgbOTfkCaqB1Sf0UL5dEePEbwsKJ2pVMTYZ64SUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2Lh0H0hF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so1693057f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184728; x=1739789528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3TsbNFVHS/IC4iUVVEnnqOzTVBqUgDCo4J9C33YERY=;
        b=2Lh0H0hFqNsL+IsX4ev0uq8p3xK32oNhnIuqY0dHMMfo2xY3u0SgU9fa7W/Sgav9V+
         rMYlLpM9R4ijkezIu8uRv3Lf/vl6SF5k7yc/ZIqg6GwuR9V+R3YHFm4ysqERDtQ6gBe9
         y6hIfBc05kUfahH/cGv8ne42/6THsAjDEwPDAHKt4lb5p8QokzgiLrKz6MgJpQCxTqxg
         bn/RU7WaCqKoZoDhDwFps2P6dREovmuX+d344vx5+XsPABXmKFsz+ATRr6SBErGQklWE
         ogGAZD2Pqs4pbSq8u+MapS/j/Bkz1KQIIx7kHy/BQtZ7M8T8Ur4sH3mUlWsrK+cBbTN5
         ZUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184728; x=1739789528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3TsbNFVHS/IC4iUVVEnnqOzTVBqUgDCo4J9C33YERY=;
        b=tCHul8mCpjd5kkloeMvKk9DgFL6Pf2qzs0k9eDTHZOphxBuZLWdeVtYwpR5OFaH9XT
         USPwhKABvc//SDITEGtkV+XgUlERnkru0nD5QhMeE7GB8NA6tuPWL/eCo27u75CRUrXX
         M3TVFOkYA5NIzsmv06TgROPPDNb0JTDa7iLUyh+gyPuUnHJlzDCz+BSbmKvkz0rQlZQk
         xnOMqPM+48DmoAZNcrmyvw5jOw9dhlfjHAnUQ05iaJZ4r3SDvIZzhWBzGggRD6yjP1Rk
         Xc/Iwjkvf7GxaKeP9fha7OVaUbhqVeA6XBBsUZiGT/LwTYEtIJC7JQ58gCao04ev5usV
         liDA==
X-Gm-Message-State: AOJu0Yz0HXOb/H5H9ImqXLOh4AdowCCqvg7f0JFljavpJz91Jf9I4/YD
	/rLYdKF05JIMm4sYFXEon/kD2YJSP6cZxRtaSrudCFH+z+sfo3kdx/yAnMEuH2o=
X-Gm-Gg: ASbGncsHYY0ztpLMGGOIH9YNrK1+D7Rgm3mJ2d973tMKixbNqnYJE6uLaavqDFho4Po
	8/3V22BuBqxWg07COoC0EXi5irTE+UN38vJCx7SzWNLsa2O8Jd95xDR8s5fTQE/nXp7gcrO5NGk
	8vR2KACFkojK0gxp6bOT4Oa7h+Ywo4GyasGl5mM/u1wq5ltDTicYSqHQGd/s48PmyskagIbL7zq
	lAWyaF8ee/HwEqD2J9Vmfu3Eyd1GKvYmLzg7sW9+9Her2fWFNaBmhFp1SCK5kASjtyHzZGGEnV/
	+DXeDhey
X-Google-Smtp-Source: AGHT+IFx774tEdrjGX+K2g7goOYqdE3lgbg6MjFHO4VWjKPEXooaMul9dyJFxepOkUugTJxkMdbmeQ==
X-Received: by 2002:a05:6000:1448:b0:385:fd24:3303 with SMTP id ffacd0b85a97d-38dc8920858mr10829010f8f.0.1739184728588;
        Mon, 10 Feb 2025 02:52:08 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:51:57 +0100
Subject: [PATCH 3/8] gpiolib: sanitize the return value of
 gpio_chip::set_config()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-3-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HDFuarshvnhtSITkzvfZTJ5ikvSyc/L6lYIYqosoVLU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpSf217Wf1JeG6YPA/mU60jZhlxBYHM2RnXr
 T14M8fOvfyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUgAKCRARpy6gFHHX
 cj2JD/9L0JUUmq+8J51P5JZ0Rt3kj/bnafEDEzgrQ/gMTholFSRkpee9phHqoxAIAt1OoznT/mk
 uoWoc/iTpuUDZm2havuWGOmgrkJIuBFWMSko4N5oFTiTTRkmO/0GCFLqFXdu1uFxo3kpSIReBuk
 SwyZwypfcl0gu6/CB9xiec1858rYV/6dlHqIkPaPZAJjpMc49g93UEWvK9wQJgeGDF4U1UwV0Er
 +Oo/jNVyyqIbFyYiRMUetm06idm4R+wcPlBbJuU5kJUwAE2XYOKVIdXfGiegVcpcRQUOvuXTk+v
 7rGsBk2RgVHWSQaJxWZJe/BLcIhZGKP8zb0HL+YN13Ph9YMtG1xzF1HICbHDJV+NNygAoCSjsxS
 cT7fCCmXo77ZyQnBpXTENmgzGzc8gn9WJWwsGd+GOoj70+nVxOCjv4QEjgnFo+3RfvvyXiYNEbR
 giG8wHb1JR2mhUxHuy4hD7LRgHLeQVQ7mOlPoiX8tg3oEk6M2UQ9btdzPgE3DMeBRqSnj9Am5+h
 FaASZH5TX81qcRHMwPNUSZiSuB3QTGL9kd1mlCH1fCD/K6ZtsveRso0PZaPkO7ikmNdC7sQeUnU
 RuS8Qbsvq26JW0rgI5bDBnTI4tlo3H16CgL/kuuOs3xlXD+deznNZxcFJjCa2JZFEtpAG42kahx
 cEzefhqzQ19HmmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the set_config() callback may be propagated to
user-space. If a bad driver returns a positive number, it may confuse
user programs. Tighten the API contract and check for positive numbers
returned by GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 3 +++
 include/linux/gpio/driver.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 42625da7e797..95ea300da109 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2575,6 +2575,9 @@ int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 		return -ENOTSUPP;
 
 	ret = guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	if (ret > 0)
+		ret = -EBADE;
+
 #ifdef CONFIG_GPIO_CDEV
 	/*
 	 * Special case - if we're setting debounce period, we need to store
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 26fcddcb74b8..81c06fc8dcda 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -348,7 +348,8 @@ struct gpio_irq_chip {
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_config: optional hook for all kinds of settings. Uses the same
- *	packed config format as generic pinconf.
+ *	packed config format as generic pinconf. Must return 0 on success and
+ *	a negative error number on failure.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code

-- 
2.45.2


