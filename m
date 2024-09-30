Return-Path: <linux-gpio+bounces-10586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85F98A9C9
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 18:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A2D282465
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 16:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0919B192D7C;
	Mon, 30 Sep 2024 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yKZpSc6n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5833BB24
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727713937; cv=none; b=QZu0oGUfmRIfLfPS3hgj8YjCSini95e2DUXdWRwwlfM9r4b3th16LoAg1FKLgl6IONRKlvhsqQdzOouMmqwI5oyYvAM3OoL4N4YZQ0TogjcXKLvtGnGBTC/Yo22r/HN1kWfmmeXuEPSlMHFFFcheG7BNzoyVnv69WVVWu5Rdsb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727713937; c=relaxed/simple;
	bh=lCFhn7e2lzr6Ehzz90sWdxjVmd9zawC1JAwvJabCaDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppn/QevBk4nxMV3d9Cp5PlsFgVzxVePMHRFcqSjoEccdZzEgJ0kGH6beGzuMSl+6DV5wkLrLFlWt++3SzX7WBkFbqM3YvxAy/G15KyB19GlBHeKr4MqnEf75xzMRwVbdAkkBV7wRkPxjxHMEDa8EUaK+/iL48n0qnx8xTfPyn18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yKZpSc6n; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cd5016d98so2282240f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727713933; x=1728318733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEr/Oxw9Ncnfg46aBvWmutpmkGHYJGKBOjl+UUCZ+LY=;
        b=yKZpSc6nrqA0ZB47Sl2gbCNZexZs4Bp6xcvq9o+Qg+uj+Oot7jl8PlIuHNcAiRywOQ
         hCbXlWQi2jMfD//wQZ9bJdJpUVuq8SouUnM8bWJVDmpxjAbD0eZkKUJGwbIXzMnd2wMf
         P/avZE0eUJaboUw/YfYQfFn7MmLTwue1bdUm5fF/VxYoEm5xdX127/htolo0TsvRX9IY
         fd/2XW1isRtbaS4KssbVOc9doKQDOYBk8ZGN76qQIzxGELfgyManUxEVZoT+2+DxAaLG
         GyCH/TMYVwYW6/BmDURoFL8Ko/x7K1XMXzhQvBmLTh1jl6XnyabCd/put3ypWvK2YY2W
         lR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713933; x=1728318733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEr/Oxw9Ncnfg46aBvWmutpmkGHYJGKBOjl+UUCZ+LY=;
        b=kaQuLJSFNVRp1IMqGmldta1wpeaz3/PiW0o5lvpab1GL8rTH0n+wVXckAkHTVAQBhC
         4vO0KPIyUHyyVK4/+TrnTzpcBQBDEsNzWrOEbapS1CQ15Dh5eUqrEKOStBBk977pjtI6
         7zzS33yqHHbUX9EySD0xwByb3KMcpEKqlAq64TMxN6aRXq4wYkGr+4878wUXkVBYEjE2
         Ww4uGE2pGlTiX85wuiMaGcjXEs5XTUJAeEo83QGYqQnCBHuCe8Mtn/H6BiWQL6nIpWLI
         6tnoZYBEzA0QYxrLMIFB0nMlSCi+oJBocnMMyrUUA0KbcckixufCZAlgpYUZhtwgu1YK
         lysw==
X-Gm-Message-State: AOJu0YyHWezRyUjhvI1SwgUUHwFF8Z1Y0Kp4JeTwfw11quWUuxpUjDyg
	z3o9Yj9ZHh5dlVfWQfbmnpPIsLukH4251ooHWP+NPBMeynfPq/BQPdttvpX95F8=
X-Google-Smtp-Source: AGHT+IGU3mRXJ8Wgr/E9KRt1+fb+zai+1gkk+Suu394wxDlHmgFx+o7pfPkPBJ/DxZ1ZsNEHwcjd+Q==
X-Received: by 2002:a05:6000:114a:b0:374:c8e5:d56a with SMTP id ffacd0b85a97d-37cd5b292a5mr7312883f8f.48.1727713932800;
        Mon, 30 Sep 2024 09:32:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fbebsm9405893f8f.72.2024.09.30.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:32:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: aggregator: simplify aggr_parse() with scoped bitmap
Date: Mon, 30 Sep 2024 18:32:07 +0200
Message-ID: <20240930163207.80276-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The bitmap allocated in aggr_parse() is always freed before the function
returns so use __free(bitmap) to simplify it and drop the goto label.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 38e0fff9afe7..65f41cc3eafc 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -65,11 +65,11 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
 	char *name, *offsets, *p;
-	unsigned long *bitmap;
 	unsigned int i, n = 0;
 	int error = 0;
 
-	bitmap = bitmap_alloc(AGGREGATOR_MAX_GPIOS, GFP_KERNEL);
+	unsigned long *bitmap __free(bitmap) =
+			bitmap_alloc(AGGREGATOR_MAX_GPIOS, GFP_KERNEL);
 	if (!bitmap)
 		return -ENOMEM;
 
@@ -82,7 +82,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 			/* Named GPIO line */
 			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
 			if (error)
-				goto free_bitmap;
+				return error;
 
 			name = offsets;
 			continue;
@@ -92,13 +92,13 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
 		if (error) {
 			pr_err("Cannot parse %s: %d\n", offsets, error);
-			goto free_bitmap;
+			return error;
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
 			error = aggr_add_gpio(aggr, name, i, &n);
 			if (error)
-				goto free_bitmap;
+				return error;
 		}
 
 		args = next_arg(args, &name, &p);
@@ -106,12 +106,10 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
-		error = -EINVAL;
+		return -EINVAL;
 	}
 
-free_bitmap:
-	bitmap_free(bitmap);
-	return error;
+	return 0;
 }
 
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
-- 
2.43.0


