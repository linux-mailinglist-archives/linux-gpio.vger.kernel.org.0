Return-Path: <linux-gpio+bounces-2759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752D842571
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305E02905E8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEE06A355;
	Tue, 30 Jan 2024 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DUZqnO4K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4921292F9
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618943; cv=none; b=lHONxfBwWPgw+fh4sIgxpQ7368yMH+cj8RwyD2ScPQUhlrpX0Rr934C4vP7CT6GkInyaIwq9FeVHDFO0oQ5WoaRAVBH8rSg2kFwhHzaOl/R1jijtnDiuy7bc2IPAU8+lr8b1eGujIMLkl2k+e659/78e4j0F38Q4WP7JkxYrVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618943; c=relaxed/simple;
	bh=p9qFxfRDRuKahCeEITtAp/nZTu9vev5Cmk1NVuQ7PFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DYMrMIMUoevIFlVEoCczaEmBu3WGmnYDINbA67P+/seLeIdpxuOxvo32ZLk70g0xISSV7s0n8w1qkomCBQs+7grJXb80xIBybYGV4gbjJB/VjDQxR0JLMV893QTcAV8dlcDcZy3ZFzmOBpMuYX+SdEh1qUkyOZpT8zwN5sYvy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DUZqnO4K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ae7ae1c32so1714656f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618940; x=1707223740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mlp9NoRNWG5wkw0gnE37vvJcfWnX6lVcfqfuQVzAw4=;
        b=DUZqnO4KCNJgb4pBBA8CSjJuCPOyuE5s5ZjBXIF8c9XkSAI+3UYiRx+9uW8F4jNf6v
         6SwOc8D2sxT4Gd6tYe6aahVcH7qt0vNZwdHZX+hdwJG/BLPX4yAzLSyKmwhhSmX+oSve
         KWD1TDGzEJCcu1Zg64tiytwBXoVOCF6w0QonbyBkiTKOmEW3CQJT0wxIIwBhKNwoy4yb
         TsjFmBn5rch2ha6S9FDlspKMx+OP80LQ98PIYMQvtNeKK3ug4Wb+/eGPeGWcrhwCgwzk
         nIGNMMXUTk0ML20ZXWlqpvLpJyTPitbof+A7sfSHijHFF3J41o/B12Pu1ETEPz8uG+0a
         ozJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618940; x=1707223740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mlp9NoRNWG5wkw0gnE37vvJcfWnX6lVcfqfuQVzAw4=;
        b=gfqvDUUGTxXMrwX8DCSga3kB+zt+RYn8K+D1uqAmvJHVHqlHWFhE3w7yTGiDaPcizl
         yCtMTJnd9o5Jut20HZyyBGckYU0cacMVS2MalVxTgnm8LrAyUWpgfjSU2YWKYP8rUkKi
         RtoHI+QV/gB5yeuPp5+iHaFVuucXghSY5wVB9LyW8gZW9i7xdDX5OuUIo5xgv9xdkqA9
         hzuiD3phqmXBcPolg3zsOPIPOs7Y32doJn2Wm5406H1Cb9tUNjoT75eGjdEt6R4K8t4/
         2sxs0A9t9XR3swRb6pSYR4AlsT+1TJHQKE4GxGFnAqWUE1VpH4A7HUG2NnsySSDJMztH
         +4gQ==
X-Gm-Message-State: AOJu0YySnCmOBm4kn52qd9bPJoOo2lK+aRagI9sevGpG3TKv8vV4FZiw
	58WCc5Nit/aZNOpoGP2DBpfgoiMgiejT/yPsmaZ6IOSS+5h7HPI/dId6yYPIekE=
X-Google-Smtp-Source: AGHT+IGDWA2iBJpdCn+igJe5tAk5amog3d34nSIBkescrm60Rf5It6dm8S+wfa5Hoowj22tI2nU+Ng==
X-Received: by 2002:a5d:588b:0:b0:33a:f4d6:613 with SMTP id n11-20020a5d588b000000b0033af4d60613mr3528661wrf.69.1706618939847;
        Tue, 30 Jan 2024 04:48:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:59 -0800 (PST)
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
Subject: [PATCH 22/22] gpio: mark unsafe gpio_chip manipulators as deprecated
Date: Tue, 30 Jan 2024 13:48:28 +0100
Message-Id: <20240130124828.14678-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130124828.14678-1-brgl@bgdev.pl>
References: <20240130124828.14678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We still have some functions that return the address of the GPIO chip
associated with the GPIO device. This is dangerous and the users should
find a better solution. Let's add appropriate comments to the kernel
docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5741bbfdc178..7ecdd8cc39c5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -211,6 +211,11 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
 /**
  * gpiod_to_chip - Return the GPIO chip to which a GPIO descriptor belongs
  * @desc:	descriptor to return the chip of
+ *
+ * *DEPRECATED*
+ * This function is unsafe and should not be used. Using the chip address
+ * without taking the SRCU read lock may result in dereferencing a dangling
+ * pointer.
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
@@ -275,6 +280,7 @@ EXPORT_SYMBOL(gpio_device_get_label);
  * Returns:
  * Address of the GPIO chip backing this device.
  *
+ * *DEPRECATED*
  * Until we can get rid of all non-driver users of struct gpio_chip, we must
  * provide a way of retrieving the pointer to it from struct gpio_device. This
  * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
-- 
2.40.1


