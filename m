Return-Path: <linux-gpio+bounces-3396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557AE857ACE
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 11:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AD24B22A31
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4672255C3C;
	Fri, 16 Feb 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xnk0vA7X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D956776
	for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708081183; cv=none; b=aKpFdnekhVJLfkwYCekc52um5Dx3wULJgvTu1RxxR/K0Tx2ajr+laQRcFdTXQcySEvn4jwYhkaKtFNeVL0PXv9rSlxm8gV2KmCLGnY6XuZAEpxUtS0TZIN/bjkT/fogrOa+Pkc5bEwjXMAFXRGCLKwYDuGX2qdAVpRDQhwJGSbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708081183; c=relaxed/simple;
	bh=0+W7YvnXsbigDW20wUUhl3v3SbWmF/ZQM4L9pAdvkn8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kQc7xxRVtbBNlj7t1vs53APX7vFKvsXMaKCzcAsaOzldiPCaN447RrT8EnWOwNoBZ33FzkPQJh72/j/1CNLCEYgQVkdXdVsH6uyeT1k0LmU8DzDytFsCg7qkmwL+xF9UrYq2J9XgEattgNSbzur4kjCbey9Xn2wuS4B+xMXma1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xnk0vA7X; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ce8cbf465so835970f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708081180; x=1708685980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0chfNNhs8bBmYgWUUEe6ZqXEIPXfXJhTDLop2ZkZRQE=;
        b=xnk0vA7XDmXDTbOkY77VFVUdFbzqZ1rAD2btF2V5YJBf5eP8gpEO8/GwjCQL7NRSgG
         fLPNouOBmdlSLgWQQ20TLGDz8Ekjs73O/uw/5+NQnUYY0+4Hui+MR+4fnKZmxUzpLZAn
         pGl0DAwwObr3pfTGGedhTQhm2HJiFyBM4NwgW0TUZCo7pIsdfLYG+jdoPqoeu/F7qW6K
         n3FTwg7Riy1H3cPICkrejcB6Ycb9+YIGAXvXlRHIraMzXRuj1PcYVB9Kv33Sa5PDZ7v7
         xXSr5fHYGm7vSYq46s/PEFR3xGUlR+1DJ+pH1mmHyKKiCWDo8l7uVq98r9/LVeBFtLR5
         O9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081180; x=1708685980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0chfNNhs8bBmYgWUUEe6ZqXEIPXfXJhTDLop2ZkZRQE=;
        b=gnvj0f7mjLSURghGE5qjeT3zEc9XYwIgCmK4xL42rb0QTl06a5n/OCTVV2Gmfgh1L2
         z/rtaN/m4z2FrrKnIEctae0n5qYc8kKUEnsLtJnHZfkDBjUCb0pCi133mRiu8fwPrHBT
         ajggFgakWXyEo79ooeIgUy+CYDTuxLNJeggNONCFJppVtytLssQsUt5yiwLkQu/qeLY4
         TN0+h53IFDe+9DttTGdJRde9QUz4TQ8+vc46plffQt4V+gdWA15aJAetv3BQJnbZgNeE
         kKXU6z5f7OfoAqGpPG+gsgRL0Sq6E1nX6mDLmk7HoL1n+c/CZCQPZ1SjMQWtwRK7rPV/
         260w==
X-Gm-Message-State: AOJu0YxfDP+LLdU+gi77LVowMLpGtiKdNLRhzlvXWhyeCC7AQamqkoe3
	W4IexIDR9K8bFlB0Ah+c3892VlncLpt/PKaBSLeT0DXB9rS2MvMcs2mV1YxCtIA=
X-Google-Smtp-Source: AGHT+IEbZWK8/FIIiShmTZucyyUKH6SVCkbFOFG6fztKHXZBfziSGGMFocQi+qchbIAutXv/2TbwXA==
X-Received: by 2002:a5d:644b:0:b0:33c:e2ff:6c81 with SMTP id d11-20020a5d644b000000b0033ce2ff6c81mr3223015wrw.48.1708081179462;
        Fri, 16 Feb 2024 02:59:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7758:12d:16:5f19])
        by smtp.gmail.com with ESMTPSA id k3-20020a056000004300b0033b79d385f6sm1874079wrx.47.2024.02.16.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:59:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] gpio: cdev: fix a NULL-pointer dereference with DEBUG enabled
Date: Fri, 16 Feb 2024 11:59:30 +0100
Message-Id: <20240216105930.16265-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We are actually passing the gc pointer to chip_dbg() so we have to
srcu_dereference() it.

Fixes: 8574b5b47610 ("gpio: cdev: use correct pointer accessors with SRCU")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/lkml/179caa10-5f86-4707-8bb0-fe1b316326d6@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 85037fa4925e..f384fa278764 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2795,8 +2795,8 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 		return ret;
 
 	guard(srcu)(&gdev->srcu);
-
-	if (!rcu_access_pointer(gdev->chip))
+	gc = srcu_dereference(gdev->chip, &gdev->srcu);
+	if (!gc)
 		return -ENODEV;
 
 	chip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
-- 
2.40.1


