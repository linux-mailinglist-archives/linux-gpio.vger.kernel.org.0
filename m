Return-Path: <linux-gpio+bounces-10941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C48992936
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31854284880
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 10:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D391C0DE0;
	Mon,  7 Oct 2024 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1LyWopO2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918711BE871
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728296946; cv=none; b=bXczsFRJjICD/xdlhNEbXk8MDmr9AiIx1u9j2ROzWwa3WdnbomToCpx0oHq4gUCm5sjxDY3xQx/M5e0wEs5FHW8wCM+WvD2yeRYF2BFbmXiaOWFW34K10hHg16UpqYcamOyvh1Ner8d0ltU8U69lMpU5w70toQtJhkuZsFQrN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728296946; c=relaxed/simple;
	bh=FxehuOAe3fC81LLxRKkzjr5CloSnOPsrRy8C4Juxy88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGk1Z8dMLGrwzf+ZHCy98bzn43TUhLl9Kb4UAQUVa3JKLYm6oKQ0t1RBkk2qMGkJFL+8SUPKZbOzhhifszAFwvqN2GO+yOz/DPGAZHq0MikY/J3+FdAo5cxLpDa0qsYGmDcKnJX6yphRIrhfTpnomvBL0aP3SlvCdlODNN4QTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1LyWopO2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so42668605e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728296943; x=1728901743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vLGxBuGIMJzA7rhlX8B2E7xTcOSGZWicJwrfW/WvPLw=;
        b=1LyWopO2e7/a+M3iWBuyUhe1LVYD+rD6j5PDVP11dqXUENemaTHhKOsyzVUBc9rI8j
         Dz2gwLDJW8qpLIGtG7gRTHkZGsrSVpxTnfkwkB29+Td5WXdNvYiSzE+0PDV2hzyciifW
         oM22WBRTl2wzryvCuydlMuL8Xi4Wp/KhVLlWCoXOXcgSgdiWg9AwDgtk+UNTg9v9UPuZ
         sR+EyhA2jJNfQ8eBxFnfy6beYR7vuZc6QaVRFhwy2sOlu0v89k/EEHR8csvCmImg+vJZ
         042QTwfAEMyvK5WOrSaj4kKwf77j2siMt+lMEBn1DXCJqCAe6wI/VcmBt50hVBctXKtt
         m4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728296943; x=1728901743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLGxBuGIMJzA7rhlX8B2E7xTcOSGZWicJwrfW/WvPLw=;
        b=UgcnUVyaEb6zB/crnKIcx8TIv9OpwQG786WJCDj6jKrz+2b0Fw6nuHhR+8A91a3Qx8
         A8eq1p8QJAOsMPiW/I3TzsuyyBZ3DQW6tjanN6EFvORjKS/Pj/WhJRNDEQkuxOhCb2FM
         CkDwa/rEimWGJqsFKMDMoIBFbGVJjRdErn+0I9pQQJelGBX5BoCa807k29gTbRe1wzGx
         rSmYZSmwqhwK7Ik0aUrGrRPZdM/3IbKGaHLI05yNoxNsAkEUZ7cNdBUv+D2utBOWxHKl
         4vnisUkS3HSTHhP5Axyd3u8ggZnuCHr5dvYTHgCDR9d1mIcOBfoghMILc/pPJWFfJfHm
         x/Uw==
X-Gm-Message-State: AOJu0YwXjYEouR5wfEx54L5k+BRpQxpQPrDnGjd35fguIaQg2Y186fh8
	5/GPU65gVeN1vmoOvf9nmhml96zhnXP5xnDUezUdnFJIHX/DzxyFGLEgF0VT3Tw=
X-Google-Smtp-Source: AGHT+IF41kZLC3dxLflXQrHt+uBj10nmL9Bu+3rLxK3L7MJwqig6tgyGiGBNauYCrEn5Aja9udoPTQ==
X-Received: by 2002:a05:600c:3ca6:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-42f85aae4bbmr75809445e9.12.1728296942807;
        Mon, 07 Oct 2024 03:29:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e89b42sm69850855e9.13.2024.10.07.03.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 03:29:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: eic-sprd: use generic device_get_match_data()
Date: Mon,  7 Oct 2024 12:28:59 +0200
Message-ID: <20241007102859.35602-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no need to use the OF-specific variant to get the match data.
Switch to using device_get_match_data() instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-eic-sprd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index 2dd0e46c42ad..d4bf8d187e16 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -10,8 +10,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 /* EIC registers definition */
@@ -617,7 +617,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	u16 num_banks = 0;
 	int ret, i;
 
-	pdata = of_device_get_match_data(dev);
+	pdata = device_get_match_data(dev);
 	if (!pdata) {
 		dev_err(dev, "No matching driver data found.\n");
 		return -EINVAL;
-- 
2.43.0


