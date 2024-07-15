Return-Path: <linux-gpio+bounces-8214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271C931B30
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 21:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63CBC1C20F95
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 19:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3634139588;
	Mon, 15 Jul 2024 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RsyL2VoN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EE139584
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jul 2024 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721072642; cv=none; b=NqUG8D+9Gbii2Y7meK58CzRIOP5JrlYLXVIgQ0lDUdjHP2Ct3zkFdYXFgAswgdfd+s3WxLUEZWYQ+4oER3CFhE73Xuwf35iFLMfzNNq9008AfBNKxjRzItjDCPo97yAcXdPzK1z+5fP94uoyaoijdfgCNjfy7OkzfAqXhd/LNz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721072642; c=relaxed/simple;
	bh=OBSomm1NueyFP0axSqSOBRjPVudTiu4g4HPmqq4+Qdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QmHuPqSfn6HJHm+sTOCO1qzX9GJL6TvBmHD+REKA8ERyVgclU+mqE5hHidDfdkLoGJ9m2xjC0yZVU7FJfQjT2mMbb63M03RwGf8OvNnoXRtZMXV9nql/dPFqZTB8CO1aRSEfGrs8jDFkRmAkWRRiRa2+wtcgx2WdfsihXLaSQXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RsyL2VoN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea929ea56so8707438e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jul 2024 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721072638; x=1721677438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWmWve64BfzWtfSv/48xa1xYVAIpz0dlXrl8SisDMwY=;
        b=RsyL2VoNNFrmLXXHoM9Svaoyfhwi8k2VyoypgWS5nUZvDTDJh+SQJZlQuL8QYpbbNu
         y3MPvRwhy0LzKUgYvPCo0eJDe5BLVradGIHoPgqb76UXhox60XjX40xfZkNGw4UhU7Ia
         oCx3miF3zFjVu5r9OqSCMUE0v991YD86gg4mIedqnvf82y+qP78SQ/8DuNB01A0PxWXh
         YtsSgv+01hEOz8FXs7ZtiftfjXr7ZuJnevAM1LRCp6MaV+mvuMIfkHD9vf8P1QqVQxvi
         rK4ULe9KGqi5cjrEPOuO+UhT+aKk8QaxnUsc/lFvcjHsPkTUVt7kjAW9nrgcKdxlzsaA
         gHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721072638; x=1721677438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWmWve64BfzWtfSv/48xa1xYVAIpz0dlXrl8SisDMwY=;
        b=i+gr13+liCH2WkU1Gx7aTDpgeYq1qpdC0m39gD2xQEY8FyPPqKqDxBAiI4u3zv5Yv8
         CNH9odbfDcx0LphUJRRiyuimeDAjxyyHctQNvMGueeged2VwCcSfbFnMGWoDqn4DDoDM
         /j5Wt8Iy+N9X6B6nJwjcFcHQDY25bBT+XdNwbevipDzvF5FZN6gG7go6HyJMb0A0JoVp
         SI+pnkAIxaZ2MJ/sbbsc/Lhw/RvlTvVeDSr5zyeHsT2snjB4lLkWJ1rn8kfVVd9f55Be
         l95kLgD6eHnAKHGTZM10LbiCXs+4hc6FcOQvID1VwywgUFQ/7Xe0VXdFBTwFGe7+i2HV
         JRoQ==
X-Gm-Message-State: AOJu0Yznb5JPWtNtuafWYA1Tu+RdR6aYmMU8KOmvmowGgfIn652a33Mx
	DSsy8Cs6a1e7pGM7SHlQ4RuYNVWz80bbSqQR/BDuiBCH73wKtlDbnazlBjYwGtQ=
X-Google-Smtp-Source: AGHT+IEP8ofRoQhZ7pMyRsb0EUe5qnDUBr7ZIRRYPt72kQr/1CMcuKoBdGshizzlNoqrx2ruhN4wcA==
X-Received: by 2002:a05:6512:e9c:b0:52c:f55d:44a3 with SMTP id 2adb3069b0e04-52ede1a556dmr391632e87.19.1721072637557;
        Mon, 15 Jul 2024 12:43:57 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5072:8a03:5253:8c0c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b83bbsm236460366b.81.2024.07.15.12.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:43:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Mon, 15 Jul 2024 21:43:40 +0200
Message-ID: <20240715194341.1755599-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=OBSomm1NueyFP0axSqSOBRjPVudTiu4g4HPmqq4+Qdw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmlXvt+vN3IMgd7hUaHYTf44W2FHr1/o1xnaEik f+75NyWSc2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZpV77QAKCRCPgPtYfRL+ TlRsB/4thMkfD1+b47FzH3yqtkcr5k4OHS05jS4HZ5U4pr6Fe5y0Fmn5Ml84X6vaA7d31bzIFom 94XO4Stn1Nw3NID2/d3R26yRJAxKJWj50Tl5KX+IhgEtMscY1jHE4/tqwAv1JZbX3i//QyyHhL7 yzPi2A6ko0kz77I201wpk80l06kuDfAr5Zn8SStNf/KKREfubUrTpktwPsAgV4ugboXiPy0JLW8 RsDj95EYyyHYSjoe5jS5XLgqw13ioqmvD9y3sFW7w9LcwupZHRJaboFPzmglzvtwg3+Mjwf/xoe vscElY8R3bKVebyWOByYVsK9g0P8IcKfGVJNXe/0qXISBziU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-fxl6408.c | 2 +-
 drivers/gpio/gpio-max7300.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 991549888904..86ebc66b1104 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -138,7 +138,7 @@ static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, fxl6408_dt_ids);
 
 static const struct i2c_device_id fxl6408_id[] = {
-	{ "fxl6408", 0 },
+	{ "fxl6408" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fxl6408_id);
diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index 31c2b95321cc..621d609ece90 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -53,7 +53,7 @@ static void max7300_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max7300_id[] = {
-	{ "max7300", 0 },
+	{ "max7300" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max7300_id);

base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
-- 
2.43.0


