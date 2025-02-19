Return-Path: <linux-gpio+bounces-16232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F4A3C269
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBB11718E1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 14:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D981F30A4;
	Wed, 19 Feb 2025 14:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gew0IX9/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB201EB195
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976246; cv=none; b=CDHd72AoQB9Ukp2iqNMNj8LzJFGwK54lX/Ok/YrqbUNe0O8ZS7O7NQan7Rnok3RMidqo56qSyW5Wkb9aNvYcjBtJfPtaV04Jb2/FXUpmJMa4CKzAYgw5jQ5bkTGzb/txxVG0p7jVON3zmbfTfR/V4IM3OZPXuhxSzsWzbJt4JUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976246; c=relaxed/simple;
	bh=JIJ/E5tjz1JLehb66AzAvqmd8vmktuXELCPYG3qQBiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pM/83m9O4i5AYrxlA/+MMHqnXqdd/C9e2ybklwnTaUFwOoSHlfVxt99maGzJYisDfkRxOVw+l7Otz6sKlH4k+nMLxHHavA2SMEaYd57vQvrppw9Mf4XVff+456/k5yttM80TfN/WkVAZ/vH6VN9kTlQJOxZ77YcaKoOP0RjMGGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gew0IX9/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso75113695e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 06:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739976243; x=1740581043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jjafTz2s5QAjTYhGL901I5LpQk//qv4ffra6sDQC6aY=;
        b=gew0IX9/GzGT915p39fe2L1YqJUjww9MeT6cs79Q4JP0c181CX8ck8t7HmYaetL0pZ
         ZeHPEuKxmIbbKDvkqDO7BNwJ38mRtc1vMS65hG16S+YU0MtgrHDT64sHMgGE+6DRbjH3
         nxn/y6n4DRU3O7U3NCJzmmbzuXYVSuqDCxGq8Hp0snUjfigSi8qyhy0gCTXQtZpLtbny
         0EiZKMCviZ3irZcPRyLRggsoRBsITPNjvCaWAGdbp5ieXyxHHC2yTRm5jCG6YJup6/Yl
         y8uZTrQhwR/GGdU5gkyND7JgDRxPNnbkfAPXoS1myge7fxy0iB5wSUH7uekEE+u3STtJ
         ydmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976243; x=1740581043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjafTz2s5QAjTYhGL901I5LpQk//qv4ffra6sDQC6aY=;
        b=p1VaOPHTBsRwVTrnkoYIp2v0cKEkCbsu4fFKMAAT7mbjGN1GH873Vgl74yod9b+TVc
         jWemSP+9UWzRkFIlUlZ2LYpXYvq81cr0MLz6mm35rRRexQhDOb3wFU6oFphZTixBjudn
         gW8I0fKqxDrOT151k12vplnzEx3Y0adTq9BqkXfjBct9xgL7qFiOS5SbAliEeXwbcWOk
         fVPqykkHOh1X0MIUPhCUHpsu8i6+pTFr3gKeEUNNwHltFqVaXBMxQMZ6bROq7OBQL4hK
         LJ6btehVZSH7ZLnV9t+PFMthVs3MTH+8HyF8CYb9vpfi3oAw4DY//z3E4ROcMBgYOnh4
         fNhQ==
X-Gm-Message-State: AOJu0YySBM1wyR/L/UCG6JX2rGefp4+CzPftlGay44iI1OLnDgxPEj3P
	3gfUrBsf2Mqqc/cmdlxmojRVd3j0G/R+jpoU6P6UY0w4L4F0Ih/1AI+PYnb4PjQ=
X-Gm-Gg: ASbGncuic1F1SRE/YcNAxOlb1hlXu0t2ehNmJIbTkhQyit+0wCjCv5Mpc3n2gFzMET1
	d5yLUTnM8PXyIS+PsU8u7KWyIoCkd7smK7ZJ9Tl+LCXCLcJrZ7sVI/XzcNn10K0JsFCPHhsckCr
	8QoF6bsQuo0tqOUzk8bt2wn2O3W3V8Nl/gRf76/g1DMI2HM3Zd8wvXcpsZ6tbG9RzxoazaxGPK9
	W+Rt17YaCIabzniNLolWN0tcRDnCJoIO0Ar1fJa20y1C7OqNjGF4c7onewNsKitqewiDn3uk0rY
	e2Cy0R5+6Fo76A==
X-Google-Smtp-Source: AGHT+IHk61Hym0qgekYAmPlkGyuZ3YcsegEJqHegHLnwBvZNjPjl/N8SXL2g7SZnxZqdvx9UkJKgPA==
X-Received: by 2002:a05:600c:3b02:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-4399a40ac9dmr31659175e9.25.1739976242610;
        Wed, 19 Feb 2025 06:44:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f0ed:3532:fe6:315c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43984924201sm92536685e9.6.2025.02.19.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 06:44:02 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] gpiolib: don't bail out if get_direction() fails in gpiochip_add_data()
Date: Wed, 19 Feb 2025 15:43:56 +0100
Message-ID: <20250219144356.258635-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since commit 9d846b1aebbe ("gpiolib: check the return value of
gpio_chip::get_direction()") we check the return value of the
get_direction() callback as per its API contract. Some drivers have been
observed to fail to register now as they may call get_direction() in
gpiochip_add_data() in contexts where it has always silently failed.
Until we audit all drivers, replace the bail-out to a kernel log
warning.

Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk/
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 704452fd94bb..48cf1bb23e24 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1060,7 +1060,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
 			ret = gc->get_direction(gc, desc_index);
 			if (ret < 0)
-				goto err_cleanup_desc_srcu;
+				/*
+				 * FIXME: Bail-out here once all GPIO drivers
+				 * are updated to not return errors in
+				 * situations that can be considered normal
+				 * operation.
+				 */
+				dev_warn(&gdev->dev,
+					 "%s: get_direction failed: %d\n",
+					 __func__, ret);
 
 			assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
 		} else {
-- 
2.45.2


