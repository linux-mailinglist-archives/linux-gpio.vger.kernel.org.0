Return-Path: <linux-gpio+bounces-15715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0CA30B25
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA58316553A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5311FCCEB;
	Tue, 11 Feb 2025 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tVZ2+aqB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44E1FBE9E
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275736; cv=none; b=d2gjtTOMtx70cpiEkibWK3i8QSGHvKDGGsYfybaWlGJjiyPEj8Llol7Vpdf0csl41CCNT+0G4zdBBbWrF0YuPzYOxSsWokhiDHUfyZhprOFHBszIxhAkrzSVLwc6D9THIAtFKLuj7mxkUouRPL+j0jz9sz5Ah6vNuN7IdIDzCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275736; c=relaxed/simple;
	bh=UHUYIddf+n4H5dMnEJICjm1zFmW3Cc7Ddp9PK9+vm8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTd/ve2ZCHozjf7feEY428i1r3PUqgQ2Rup9kNZbgdQ3WRSfryU5paZZBH+qAx2EKrb9L2PCE5LMiTOseYBcrDZ0cTWxB2IlHaFv0M5cEEEFvtVvGyGGuARUOhN7qcJPXorOg/uQ8xoEbFVe2D95eTylCqNWk4xEHceUfhq137E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tVZ2+aqB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37325505e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275732; x=1739880532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LXQ6cLbViDtV5N9eGseg4G8vDo8CWaGoGPlt8jHaoQ=;
        b=tVZ2+aqB5Z3QaMqHt07of/aKKe+ybG/ysHStS/kD/dl0tYmWfS2HvrLDoYMGddyEid
         sJTuCYXMP4TjoIhdflvT45RjQrdvUMoik5aJjiH2XkSSB7gUhibhiq4E8HOgyjbA/Xfv
         RYQNIRI5GTMAHogBOSFVqSNP3orl5EQlw/X6fDGe33pwdaZwWtqOOMMCxiG0xQOOA/p9
         dj5fRhBEE1Wg9+QTgo4uHav6HGjTCbz2pIYOLCi2+3G8mDh609FtWJop6oE8HqWShcD1
         p7N6m0ueykNr+rJYgptFmoTWvyKFbLoqnqZYFOujrTDcIooVzPfbEVdxac/AhujY2JDd
         vpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275732; x=1739880532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LXQ6cLbViDtV5N9eGseg4G8vDo8CWaGoGPlt8jHaoQ=;
        b=sfaUXzQ5eOm/Ctcgycu5EajBVrNgTpatrsL2W/waYrh1Dw0Ke1tcboUTyOQHSJQ7dH
         oXQ3hlakgU+9lkvjp/l7lh9JQ06eYPdgA8ldCeEd4hMxR427JdQefZSAzipS8qfztWgP
         loFtETOpnUu7BP0z9TCDL0SqrHpQHinRu/Fb0S4DhkVA9qJ5Lx7aMzplIw5+kkPNghyw
         vPCJTKyLMKMamEJKSG4sav32ulUSe3uevzqY36/pHqwXMbmgeKCJsOgmgTnCz/rfUvSL
         1IFZhgrK4XxYGqesVk/96o7RuXrFrrcoOtLn//tjno5WSfYmc9PfF4xP2eTWUg3S3jts
         q2ig==
X-Gm-Message-State: AOJu0Yzl+Gc6IMR8oWFpxg/CNvZ1ry7ex6ctY0gNouFiTxaPwhm2KlZn
	RKnCWGeT1+iFJuvLp0MEKKP99MjRxLi+Ea+J3psHxnW2OcGZyWNfFpmKNqrPGsUidVOYRlVo1wa
	RCoI=
X-Gm-Gg: ASbGncsDI2M55xc+tVMP9J3Ma/44YY0kyDkiyfd4kF5O58au7SnQVra0DYHuwL7LvAv
	NR5oUeFkQAXD1SBgWKmki7dhA9xiBNvf8vsLgOO8cclvkSBFk96g9p0xHXyBAs57A7aNbpnx4pb
	44MXehVsa3OImRoqZP2v7Jhu2iRM900QlL5q9zcVVzyh1PwrWzUwJZlLr4mUz/OOHR7HaM9SCCb
	9o5V//nozsrmS2cGKiUPCfdiCahFoRgUdfUifps4ZkpdW+Wm3DcF5M6v7p0QxJ5y+ACLn+JUihD
	rw8jTBjYpqAmhA==
X-Google-Smtp-Source: AGHT+IEUjN3gs/vgcSyV3xa8eYF+tOlngAqw3C6M762kb/hbi1cU/0PcGo2jLZC7dcyMer/PguHNxg==
X-Received: by 2002:a05:600c:5811:b0:436:488f:4f3 with SMTP id 5b1f17b1804b1-43924991efamr149129625e9.17.1739275732441;
        Tue, 11 Feb 2025 04:08:52 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393b66f3e3sm86966375e9.19.2025.02.11.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:08:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: latch: store the address of pdev->dev in a helper variable
Date: Tue, 11 Feb 2025 13:08:47 +0100
Message-ID: <20250211120847.42437-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211120847.42437-1-brgl@bgdev.pl>
References: <20250211120847.42437-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make the code a bit more readable by using a helper variable to store
the address of pdev->dev in probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-latch.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-latch.c b/drivers/gpio/gpio-latch.c
index 722eb5b045f5..46cdfb08747a 100644
--- a/drivers/gpio/gpio-latch.c
+++ b/drivers/gpio/gpio-latch.c
@@ -143,22 +143,22 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	struct gpio_latch_priv *priv;
 	unsigned int n_latches;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk_gpios = devm_gpiod_get_array(&pdev->dev, "clk", GPIOD_OUT_LOW);
+	priv->clk_gpios = devm_gpiod_get_array(dev, "clk", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->clk_gpios))
 		return PTR_ERR(priv->clk_gpios);
 
-	priv->latched_gpios = devm_gpiod_get_array(&pdev->dev, "latched", GPIOD_OUT_LOW);
+	priv->latched_gpios = devm_gpiod_get_array(dev, "latched", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->latched_gpios))
 		return PTR_ERR(priv->latched_gpios);
 
 	n_latches = priv->clk_gpios->ndescs;
 	priv->n_latched_gpios = priv->latched_gpios->ndescs;
 
-	priv->shadow = devm_bitmap_zalloc(&pdev->dev, n_latches * priv->n_latched_gpios,
+	priv->shadow = devm_bitmap_zalloc(dev, n_latches * priv->n_latched_gpios,
 					  GFP_KERNEL);
 	if (!priv->shadow)
 		return -ENOMEM;
@@ -176,7 +176,7 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	device_property_read_u32(dev, "setup-duration-ns",
 				 &priv->setup_duration_ns);
 	if (priv->setup_duration_ns > DURATION_NS_MAX) {
-		dev_warn(&pdev->dev, "setup-duration-ns too high, limit to %d\n",
+		dev_warn(dev, "setup-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
 		priv->setup_duration_ns = DURATION_NS_MAX;
 	}
@@ -184,7 +184,7 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	device_property_read_u32(dev, "clock-duration-ns",
 				 &priv->clock_duration_ns);
 	if (priv->clock_duration_ns > DURATION_NS_MAX) {
-		dev_warn(&pdev->dev, "clock-duration-ns too high, limit to %d\n",
+		dev_warn(dev, "clock-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
 		priv->clock_duration_ns = DURATION_NS_MAX;
 	}
@@ -193,11 +193,11 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	priv->gc.ngpio = n_latches * priv->n_latched_gpios;
 	priv->gc.owner = THIS_MODULE;
 	priv->gc.base = -1;
-	priv->gc.parent = &pdev->dev;
+	priv->gc.parent = dev;
 
 	platform_set_drvdata(pdev, priv);
 
-	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	return devm_gpiochip_add_data(dev, &priv->gc, priv);
 }
 
 static const struct of_device_id gpio_latch_ids[] = {
-- 
2.45.2


