Return-Path: <linux-gpio+bounces-27964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D6C2C576
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 15:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 293F9346A37
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 14:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4E1312812;
	Mon,  3 Nov 2025 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eHeOqSJ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0F13B5AE
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762179101; cv=none; b=U5e95nuy1e/i4+hCCi13WPXilwe0Z1jxkhomqee3KMmpGFcvWsOJ66AiYpgvPnpbhNglBb1/jSJ/27Zi57HDE52oE1iRtmGcExVFXYPp8uP/P5PgSQlsB4GrqLtgm4xiYlIwXILFKBGRumnRfjeN6lIK6a5VFxa94//Kp9CRZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762179101; c=relaxed/simple;
	bh=HQnWneIti34UKpZAUQ/is57Ufibb6gI6JwNgJWCLHsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIPuYQswMQAh8i+1DbUtyiLJSAS47sfJ0NROAYxtB00p+P6gOa89X7uOGfdwyzpKTkNkDyC6yZD8EHxSmW2tIfLZB0OYp7VFI/MGX4DuQrVxkvW8a1KarCcu3kSYb3+PkuXIwXxDxZD+2ar6tVfMVlHYVHuL4sLU/v8nahlgARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eHeOqSJ1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42557c5cedcso2623543f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 06:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762179096; x=1762783896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSzljl2vSfB2KsK4vQvqhLRyJ2e5/WktwTioP6a1UuA=;
        b=eHeOqSJ1J+eWEx40aYlL64jAFrNCmuCkEb4bURwQDUjfs8MGhcD60ZHQhN57PXaPqE
         GL+3eLHZ+psvGeNjmxY7TArU6TwFv0iAwzkdDmn5eOUFIhWINiy94gYB3OJ3bA0DNHEn
         Z6d51sl5U8Ka8jbpeDRn8XcpD+90zfJ3iNGDSYLxmla3K2UY2fHARriHd92/FJO6cIJT
         NN5Nr92ENXzywkVeik+A2CvKG9+6xk2K+MEaTsbVLeTrgNZIZYVnVvehtx7ZJEfSPw6K
         DdXDtqgbz+sY6W7aVDJtyyS5x7YBmfOpgQsoggNpRVkQrVwpWc0KeGZ9Hi7ykljYCZOu
         MZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762179096; x=1762783896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSzljl2vSfB2KsK4vQvqhLRyJ2e5/WktwTioP6a1UuA=;
        b=wSEB3+JgkjwIwwriZMtq7+TH9dKoWWIPUQkI3qThP/Us60R50cHVq8XPrhfpl7jRZ4
         Vg+QwocFm9oT6IH5S7FhSCnRc5//ZQyv+plLqqhZJJmZ0x0VyAeyG6qHRCh/PwwX9nw6
         HN9BtafkvY8iJTvMIdNpvSQD8YH/81tY1dJ6/2i2L3OJZ0CotR8zC3SJUI08188RyeP5
         qBXZdwCeBNycEaMJkcQGYdU7Rq8ojlvW1SZVeDhkTijL4Dkv4FqHD8EFn5oEfbtkhJlA
         U2Z2XROgwBCqW7TpRD+DmTooAumuucLgTIaVRKfIO5fn/xcqXRCFgCJwR7OT7Wshmb0L
         MonQ==
X-Gm-Message-State: AOJu0Yw/HE5IQLIQCBlB6oeaMr9206zrDD3Raop3b2C5PlhialPAsL+9
	cvEOmHiYB++7Gxs9EM0RwXMerUg+so2eKyupMQmJ+ROOFQNqMJBu0i3uK+GF/cUshsg=
X-Gm-Gg: ASbGncs2SSJxNsA9iqKGZ+Sm5qVu027ns/ry8aNFT86Pd9CBOOpiS+QF6ej2Ui7t0Sc
	C6yEGAIOpJqLOHEa0CcQ9PeTBeuRohFHJXnN/yuFKyNaUibH8kki6E4vR3maIg5JiVDk33Lma6o
	EGDy9B4IRJy7jC4gmpYiqmkDd/EKDn7nn1m3Vle4AUhx0Z/zZGIL0ik843i5ATZFRUC16TIuPAt
	YKaH3fKd5IYKT6y+FDv8g334OIpI5vN4BrpRVCcPfS7fZ8lyLg6JKlr7Zs/BMGnwRyggiqDJpn3
	y3Xrr+kXdySAKtYnHGFwB3YFd4F8LTT4mrS372ff5Kxd5sNnOctqezC+73/xJ9jrnzPbPM7w9Wj
	8RJWxgVOecxZTAXQNs5p/E/fCUfXFxIicjM6SxW8hveWB+Jl8+ZsXqDaGlvvJisxTp9qNYzU1nk
	OUKffL
X-Google-Smtp-Source: AGHT+IFqqYKfmT7bErWcbRpXlobX5gBcmK7QP5Ztc3+1VYs+/djdxU9hq3cWC/5L3Nbzh8ctVpY7xQ==
X-Received: by 2002:adf:e197:0:b0:429:cc01:c6a1 with SMTP id ffacd0b85a97d-429cc01c791mr4262232f8f.28.1762179095990;
        Mon, 03 Nov 2025 06:11:35 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e0311sm20284249f8f.30.2025.11.03.06.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:11:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpiolib: fix invalid pointer access in debugfs
Date: Mon,  3 Nov 2025 15:11:32 +0100
Message-ID: <20251103141132.53471-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If the memory allocation in gpiolib_seq_start() fails, the s->private
field remains uninitialized and is later dereferenced without checking
in gpiolib_seq_stop(). Initialize s->private to NULL before calling
kzalloc() and check it before dereferencing it.

Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Initialize priv right before checking it for NULL in
  gpiolib_seq_stop()

 drivers/gpio/gpiolib.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a81981336b36d..3659acc600d96 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5303,6 +5303,8 @@ static void *gpiolib_seq_start(struct seq_file *s, loff_t *pos)
 	struct gpio_device *gdev;
 	loff_t index = *pos;
 
+	s->private = NULL;
+
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return NULL;
@@ -5336,7 +5338,11 @@ static void *gpiolib_seq_next(struct seq_file *s, void *v, loff_t *pos)
 
 static void gpiolib_seq_stop(struct seq_file *s, void *v)
 {
-	struct gpiolib_seq_priv *priv = s->private;
+	struct gpiolib_seq_priv *priv;
+
+	priv = s->private;
+	if (!priv)
+		return;
 
 	srcu_read_unlock(&gpio_devices_srcu, priv->idx);
 	kfree(priv);
-- 
2.51.0


