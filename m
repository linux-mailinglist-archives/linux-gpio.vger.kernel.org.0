Return-Path: <linux-gpio+bounces-3629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF885F596
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 11:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E75E1F22D68
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 10:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CDB3C47E;
	Thu, 22 Feb 2024 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="REdHaxQY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68739AEE
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708597527; cv=none; b=hINPYrDLlywDQm6VyHVCU8L2Ceb9ujKXicNYoBp+F/dIC3VVEm+t72T0B3AoPxtzVwy0IvSSPmS9DjU34kBC/fbt03xIDVPQAJBSHHQDG8rqAE3F1r42ReHsB7MX3vJmYIzvZThFoOzM4Z6mgC3oWrh+mpl8eG3yo5Q//rip1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708597527; c=relaxed/simple;
	bh=KJJPX0IkT/cG2OddkyPCOKcbTRd6TfGmDrRJ3DGkUeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cRZw/SJbIgDYPXGGWn4VJDzm7rjmNWGcToabn5bcZaVygML6GUZF3OfW5kF+UDS2DxGoqRNwH50Au7GAeRcUfOyjs3FL4lg01eh/4SR5a+p7BUO3cCIJm8WhIh6T1auhbcOFn4xnTKU6zAp0VwRO1wVh727P5xw7uSmMSczowAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=REdHaxQY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412698ac6f9so4034215e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708597523; x=1709202323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyffHNsivj82P1pv+S3iGiZ7yfsGQjKP2uvBVMCZ2j8=;
        b=REdHaxQY9lXoNrVn4l5clBN2oyNzrEfyijfigs9ICLiRDUMkdCmxHA5RR41Lyw9eog
         EKF7RnyRnudkIDZlRB+YLWVj+3O1x1TJXC7nCF8WU127Kppkqjrkq45/WKM9GCgij/mk
         M11djPbgYPi/J4Zc6Q41FztyUSthNmRqGEWFofsZAkrc+wfq6Nq4urB8xQIo5xExTtP6
         Wj55E+j8bQXzDwbgHACEBL1D8oI1vVPSBbqrYmUQHPubV/KgY4NBMOLpVsuj0OcVDLQ5
         ICjUpoxdBv1QZpysb9mvvRr9lJWraEYoFQVTjAwL8beEg42x4ORxJW/ScDJ+9j5LfXy4
         d32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708597523; x=1709202323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyffHNsivj82P1pv+S3iGiZ7yfsGQjKP2uvBVMCZ2j8=;
        b=hIFrx95+zQJ3JGuEf4ThSMWboeODjkO6o7Jl0rYl8M3S+OEiVwfy5eoPNHJflS1Seh
         zQjc2M3ddLsE2CfCCtHW+5Mnp/Q1jA9YgiMezONY9SzjAnynmAHA5fJXyYsuBeroTFt5
         8PpJmeVb4HV2laiwp8I6LVyhnSgwthCrSnShK2OCkCkW3TJaKK3pCZ8XiBnLSd/atzEO
         kWNCVn6Opl94vd4AGXZ0r+5tPpjxpXwEMioXduML4We3+EReEXTvI3/CW8jnbhZOYMcO
         klP7zNyQIzd++bhiQplOiIdKN5z5zNAVCRJQbk3s30JMdadiC9iPRa7gBlv8RhSy++5L
         LZaQ==
X-Gm-Message-State: AOJu0YxJa4k2g7agnVKRB5q8QKzcuI1x+FOb+/ettzuSijupqWkCYnD0
	N+CPWQFsJd0901XNsweg9uNTbJrGLdB7DOBMbyBBDQkiS/6ARPE+Gd+4qkBWyxU=
X-Google-Smtp-Source: AGHT+IGnQzoZ1jXAmvbq8+OELFRcBxY35KuYkhIW+1qhcSWumQpuDUVZoqDUj/84Va8hINnZJaiZ+Q==
X-Received: by 2002:a5d:5383:0:b0:33d:63b6:defd with SMTP id d3-20020a5d5383000000b0033d63b6defdmr1935896wrv.31.1708597523364;
        Thu, 22 Feb 2024 02:25:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:465e:5c78:c1d5:890b])
        by smtp.gmail.com with ESMTPSA id ay3-20020a5d6f03000000b0033d1b760125sm20632623wrb.92.2024.02.22.02.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:25:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/2] gpio: sim: use for_each_hwgpio()
Date: Thu, 22 Feb 2024 11:25:13 +0100
Message-Id: <20240222102513.16975-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240222102513.16975-1-brgl@bgdev.pl>
References: <20240222102513.16975-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Display debugfs information about all simulated GPIOs, not only the
requested ones.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index c4106e37e6db..88fc3712811c 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -234,10 +234,10 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 
 	guard(mutex)(&chip->lock);
 
-	for_each_requested_gpio(gc, i, label)
+	for_each_hwgpio(gc, i, label)
 		seq_printf(seq, " gpio-%-3d (%s) %s,%s\n",
 			   gc->base + i,
-			   label,
+			   label ?: "<unused>",
 			   test_bit(i, chip->direction_map) ? "input" :
 				test_bit(i, chip->value_map) ? "output-high" :
 							       "output-low",
-- 
2.40.1


