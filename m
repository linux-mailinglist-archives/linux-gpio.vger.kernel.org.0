Return-Path: <linux-gpio+bounces-27786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E58C1953D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 10:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFCDC3A6334
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 09:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C17231D751;
	Wed, 29 Oct 2025 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sNZQQqO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD431BC91
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729105; cv=none; b=lp0Ey8msH9pR8vnbj+SpPu7MG3susSL0pOwV61umpb11gZxqioamNh9x9b67f+6DQoWhp5H86ZyrAq7q2VZof7QJ8TvfPIbvEg9qOTaELu5VlqSwL+i+agVin63zac9Lx8SZzYHPawUELRwj2XMNi/EMgMLobwrTw5rlLJCjEEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729105; c=relaxed/simple;
	bh=v1RlcqU+jzCZ92shMGmfN/CxGCYCmXWYYW9AKLagie8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1VTkYjIbjPP3bnB9EZBRjhx1/JrnT21cZvvEzScQO9mMwX4vQLctft3AsbNCn2Ibhd23wnWGu12jUCfEZcfSUUspL0H/UqTAp9zKZ/hwmCUzFrwwYACdiW9wZkTEBJ4J7apVJPohjuBi+OiX7hKPvv3FZkD7XF/IMPlBkLmFKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sNZQQqO3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-427091cd4fdso4010938f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761729101; x=1762333901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7yTOb0DBw1VbIj1gPXYjKXMO6PHiSPU/ZLQwHA7s8I=;
        b=sNZQQqO3F+ZglloCZfPP7PJSzuKSGkq/5reOBp4lTzUfGKROViFmtSNMGUXDkZ1Wbs
         D4skoB2nrt2Saw6qShitrbOBQdSb+D1YhKY6mYrgv0qyegvdUMgKNViKoo/S3wObOzAh
         A//GOEsFBto6G5XacRjnl9HHlQSV9xAvcT8xSxmeVj7dq2uct6EoHBfuK8hYGlAGU662
         iN30hLCbHYT4iOJCO2iqe7e+jQNt8+TXK3yOl0vI2ZkDsi5iyTnUQRUo2Z3n6/15AmYH
         o31mRk2BBCh5Jy1clUSpB3mavkn8Nae9tKu8Uki4YzBADLYf/c0mSzGqGcV58fKf+qi7
         YQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729101; x=1762333901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7yTOb0DBw1VbIj1gPXYjKXMO6PHiSPU/ZLQwHA7s8I=;
        b=E2hs4mtOVQHwhdCOXEDiAxXq/e2DzBsFtqpczf8um6yPTmB8C4Ec8RH11l0JRHe5Yc
         53rKqZ1DGqGWaFS4uJAmYKkZyR78WJ89Lx5VXUkLB8/T9qYrieR/dNOvCditgKwMnGf9
         ZEFTTBrBro6Soa8UzgrpU+gJ45Oz2YGuj9onjE74qr3zA+fDa2RCKZ8zCRTWTSzn0gYC
         sPgg44sCJw07I1l/nw0kzjmmu8VfcawP1NiPP72z7nq+thiwHWmtzofVVHRamFyiWA83
         WQqcjciiU9ocSxu/D4rab2T0c/GkaQQ635tNMxu9QeCG/I+ZICJ/vpKHbc04NArNLg3q
         c1tA==
X-Gm-Message-State: AOJu0Ywe/7g6jCLdkiFRia+RtZ52KOPk4XA3m/dynkCD/7TfcsN1lJaX
	5DsxAI0amkAUk+7/+dRVQ1RiyK+QiVJuYZLj+MKyfrOK/2lM+8L0dQKwvfIA9o0I/VaxN7Zb3q+
	MjgV8JhA=
X-Gm-Gg: ASbGncsj46JnNUJhiHaIxO2P2FIwHSsaDgSP7JXkXeVEQ3Ar+aVG6+Y5SLfGFawvwze
	dzjGmTkykkoKRc3dRKoaqVdByq+OeEZt+AJFeMgzx0MVsuxsEdvE0i1CfWizhmlns6jukZyboPn
	4DuuiAKNwtY0MLlzg/7cBwhc50/c423f33NOrnMnwAGuLquiUKK4VpcPsml/xHBZCty/FJHvEQI
	Ucy0qZ2vnkIGbEtTfZXvA+Ca0cBuTNkeXgeWjlu/StIQRTpTTW9ZqsnJrjM0inp63bOSFkaLEDl
	uy3B0TaquBL2ih1ZK6NATPMyqaZvJSWOgOY8eqTJnMTF7dZh3YohL200T9HaK3R2BHbrz59HfUS
	XCiUvfIocEE7yg1DL2V++gBu+jhaFkAE7rd8uQ/eGS4TOfLRT7MhQutGMv16CTh60wy8qlOlAx+
	h9as5NG++DkQ8=
X-Google-Smtp-Source: AGHT+IGDyulGoYcyx6jU9Pxepcswwi8toc9gOJoAK0Kv095CCsZqF5B43vi69L++DfHx0JIkYMss0g==
X-Received: by 2002:a05:6000:2c05:b0:428:55c3:cea8 with SMTP id ffacd0b85a97d-429aefca395mr1382550f8f.50.1761729100844;
        Wed, 29 Oct 2025 02:11:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196b27sm39871275e9.8.2025.10.29.02.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 02:11:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: mm-lantiq: update kernel docs
Date: Wed, 29 Oct 2025 10:11:38 +0100
Message-ID: <20251029091138.7995-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update kernel docs which are now outdated following the conversion to
using the modern GPIO provider API.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 8d0d46da40c8 ("gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510290348.IpSNHCxr-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mm-lantiq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 3d2e24d61475..1bd98c50a459 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -52,8 +52,8 @@ static void ltq_mm_apply(struct ltq_mm *chip)
 /**
  * ltq_mm_set() - gpio_chip->set - set gpios.
  * @gc:     Pointer to gpio_chip device structure.
- * @gpio:   GPIO signal number.
- * @val:    Value to be written to specified signal.
+ * @offset: GPIO signal number.
+ * @value:  Value to be written to specified signal.
  *
  * Set the shadow value and call ltq_mm_apply. Always returns 0.
  */
@@ -73,8 +73,8 @@ static int ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 /**
  * ltq_mm_dir_out() - gpio_chip->dir_out - set gpio direction.
  * @gc:     Pointer to gpio_chip device structure.
- * @gpio:   GPIO signal number.
- * @val:    Value to be written to specified signal.
+ * @offset: GPIO signal number.
+ * @value:  Value to be written to specified signal.
  *
  * Same as ltq_mm_set, always returns 0.
  */
@@ -85,7 +85,7 @@ static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
 
 /**
  * ltq_mm_save_regs() - Set initial values of GPIO pins
- * @mm_gc: pointer to memory mapped GPIO chip structure
+ * @chip: Pointer to our private data structure.
  */
 static void ltq_mm_save_regs(struct ltq_mm *chip)
 {
-- 
2.48.1


