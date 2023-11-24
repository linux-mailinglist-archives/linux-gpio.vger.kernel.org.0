Return-Path: <linux-gpio+bounces-502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 588807F86A6
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 00:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125372822E5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 23:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1993C478;
	Fri, 24 Nov 2023 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7IgrSt8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D041735
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:25:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso3604481e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700868348; x=1701473148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JG09yndkEu639f4KTRkyZKsAldPT0yw1/lGIrHycfbc=;
        b=w7IgrSt823VjG7s3oVAFRbVPz3Tl4EH0Ph8ZLgnYklpviAMiB9sdhYuAt7Prn/q7LH
         zIOZEtzvqEky3+pDjCXWTJjulkQK18c/YTKDkoS1XWuMndBAZoEkilH01E5gTfLCd9fE
         zQKZ2WtKpqmKMDu8s+p95NWZulG+evca+BSSwHcIBm4spACmu7VS2ubo6u296Akkd+br
         ZJZ13MQjbIDz0wSaQDqXV8wo7hqycljr+QokySB4RfQJLYRj5ClxLZ7aHLZhP7wtp8HF
         +ccxWo0tdmOUIBJeA4WqbSk34fM1t7DnI6z5iBQ6nNUCHCuCv8RoUt8dqL/qBtB5YDrW
         GK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700868348; x=1701473148;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JG09yndkEu639f4KTRkyZKsAldPT0yw1/lGIrHycfbc=;
        b=tJ6vX3t2SR1Tfc3tx/GzhfSUi3MBnBIFbn/QWTQpqA3bBY4s9V1wqbHKPdLyTvV/+I
         xQdnZs6TR9nrPf708pfcqD1qDhvaEpZgDwJU+BN+ybSxOsd07Du3h2pM4aavDRV1ZFc8
         17qKStH6N97rYQM0JG36EOX5U7XVhj+V9VdbfzxIwi5tnBZAVtSiHDy4eURH8FSCx0Ir
         jbCd72QatiUEq9HwY8Hpk4jBaPA108Txg4rd9XhsafJIBRvNvpPlDbmLZDkK8hU0jwv0
         tNkdwTtlyTKErysduo51TvNoffOH9MXgzcW4UPUHtli4oYQbONWOmi5hNkt/n0kI9vwm
         JZDQ==
X-Gm-Message-State: AOJu0YzPaK05zPRLzsRpkqJpVRVu7aWoIurB0IFXtGiRggDTpIp4rnk5
	TpCsD5UHyIyt91h1tB8hAFNYPQ==
X-Google-Smtp-Source: AGHT+IHL4UO5xgya8QptvShrVia42MIQfcwsotShbKqPYeoh6HTSXN4MOL6Tq2601Y12IebD1WZlig==
X-Received: by 2002:a05:6512:1314:b0:507:ae8b:a573 with SMTP id x20-20020a056512131400b00507ae8ba573mr4116472lfu.51.1700868348344;
        Fri, 24 Nov 2023 15:25:48 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f19-20020a056512361300b0050949e41d36sm635489lfs.253.2023.11.24.15.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 15:25:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Nov 2023 00:25:47 +0100
Subject: [PATCH] gpiolib: Drop cargo-culted comment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-dropcomment-v1-1-15800415aae0@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPowYWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQyNT3ZSi/ILk/Nzc1LwSXQvLVNMk8yST5GTjNCWgjoKi1LTMCrBp0bG
 1tQDNwiCXXQAAAA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This comment about the gpio_lock is just completely confusing and
misleading. This refers to a gpio_desc that would in 2008 be used
to hold the list of gpio_chips, but nowadays gpio_desc refers to
descriptors of individual GPIO lines and this comment is completely
unparseable. Delete it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 95d2a7b2ea3e..1c47af866bf6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -86,10 +86,6 @@ static struct bus_type gpio_bus_type = {
  */
 #define FASTPATH_NGPIO CONFIG_GPIOLIB_FASTPATH_LIMIT
 
-/* gpio_lock prevents conflicts during gpio_desc[] table updates.
- * While any GPIO is requested, its gpio_chip is not removable;
- * each GPIO's "requested" flag serves as a lock and refcount.
- */
 DEFINE_SPINLOCK(gpio_lock);
 
 static DEFINE_MUTEX(gpio_lookup_lock);

---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231125-dropcomment-89e5b7b4cc3f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


