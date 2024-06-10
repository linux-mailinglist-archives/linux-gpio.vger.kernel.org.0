Return-Path: <linux-gpio+bounces-7314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4A9023A2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52ED71F2530B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D963B1422D9;
	Mon, 10 Jun 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FCc1mBmV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54D13C676
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028362; cv=none; b=eh+DovFb3Lr0DxSJTA9Qz+6A46udWppBInRt2JGdCm2hhnBGRle3Aqp0L/8/bLrRD2Tk2sZ7TTneCQoEVgX22pqhv9pHRffxTzevqentlu5SqKrY2ddwXaLVrQPvhY35vMmRkLzp7jfrX6DV3jDWGLHLvkxwecZtWenWNacxxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028362; c=relaxed/simple;
	bh=kOfJiJzAPqwv+oYlxLi+l9Q00ckfBULXh2ejLluKr9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5rI2/UeEiZeDHLUcaPKyA5VJzYlTiaLf0+3BNAVuDMVakHcoPC+6PQhNzz222nUN/PFUudJg0Ak5l9dJ0ZKwyJuV9BxhYVR+tIJcXtfisykMZPfrSfv8aeKGzVUoDgrEvHv6W3zjPvW2hqYlFfOnoix8apMgUZHNKbDRs5/kXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FCc1mBmV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so27202025e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718028359; x=1718633159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDBlyzU3LCghlnbJD04v7eaIgbQL2VqdEI9XHpUZT+E=;
        b=FCc1mBmVVlBuEjXjCvPmFrOmv+TvvHlyCmW1Ztmo8Gf0mtgf46pOHWbhcQ8Glli6vu
         babbiRCc7VF1OCBF+Ooovvtg4F4spAaYB6ph7VGAy31/mvwWUYhnvEyjzTlbLfP/b/JQ
         PKsIeaaP+ZNDaOeT/8Ms4g99UVr10GYRaEdat2n4DCLS7D91A+jpcywEoBNVz2VrW8l0
         SY8p/OzpS6BC5ta1lg3MEMCYlPFm3FLL/fx65OfyZbphByho6sEYDWqoh1CXssOmNi0m
         erm4CqZs1bgJE0TsErN5ZGUhV5tLun0FQTTVBnearZukcmH4sP3J1GwXDxli/OnAliBx
         qONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718028359; x=1718633159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDBlyzU3LCghlnbJD04v7eaIgbQL2VqdEI9XHpUZT+E=;
        b=oenit0EN2zW73wCqmKc7pUqEURtyQhN2vdAruVOKiEERTTxLp0iHFo6E5Fe/ttOQ/G
         +vNT1FhHwgONC+tSndW+uBTo0Vi4dpXF37IdzBuDGci1Y9NEhEhm6KSXiAflaHb+6eUl
         PR6yF8jj1n0yVZnTrCtn6QjkyyB34meUIf/0tG99KigTIU8p/QpBoUdnkrnRWvQC2K6G
         efmGOArFYKGuEDXr0qlzmoWK/z0ezX9E4sDBWEvNPel1l09Vk6yUmOKFu+MzRWrGlwwZ
         UuBOOShM/M6lD1TGx9I+z15yx7qYIDNi1T88fnEq+jw4NkZzV5vJ7RDhtuOFb4r9KbA+
         WZsA==
X-Gm-Message-State: AOJu0YwdzovtQqwYql6Aepfuf1jVY76/EUTsPZ1FWMSpVFW2jgAvE9vE
	xkQGIj5I2AqoHS/1KJmIzfoxeP3ShrtZueTcJtt/80KsrPRJiaaWc6HIuUFbAz8=
X-Google-Smtp-Source: AGHT+IH498v3qN4pefMCAJ4sGaSW3frxsUeK5QkpDqIebe9cE6y0eeKYz7AcVrvfZkyrqcfS4rQMVQ==
X-Received: by 2002:a05:600c:358f:b0:422:1446:378 with SMTP id 5b1f17b1804b1-422144606f0mr14376975e9.2.1718028359560;
        Mon, 10 Jun 2024 07:05:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:b790:b49b:9038:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42217ff4302sm11113845e9.31.2024.06.10.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:05:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH 3/3] gpio: sim: use devm_mutex_init()
Date: Mon, 10 Jun 2024 16:05:48 +0200
Message-ID: <20240610140548.35358-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610140548.35358-1-brgl@bgdev.pl>
References: <20240610140548.35358-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the hand-coded devres action callback for destroying the mutex in
favor of devm_mutex_init().

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 21ad8d87ef04..4157735ea791 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -308,13 +308,6 @@ static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
 	return len;
 }
 
-static void gpio_sim_mutex_destroy(void *data)
-{
-	struct mutex *lock = data;
-
-	mutex_destroy(lock);
-}
-
 static void gpio_sim_put_device(void *data)
 {
 	struct device *dev = data;
@@ -458,9 +451,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (ret)
 		return ret;
 
-	mutex_init(&chip->lock);
-	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
-				       &chip->lock);
+	ret = devm_mutex_init(dev, &chip->lock);
 	if (ret)
 		return ret;
 
-- 
2.40.1


