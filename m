Return-Path: <linux-gpio+bounces-3260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF37F854457
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63CF71F28FBD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2C27475;
	Wed, 14 Feb 2024 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zeo4ca99"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C2BE48
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900774; cv=none; b=pMePR5KZW3JEqDYViHLgpB8D3jFDaB2P9BDPegk8Eqxh3vvVuzsiVqhW1TK1Avg/VddH0p3E39TdbXEPMgvR3NkpSkwStkw45PkPPTi+AbcSxmRRJsG8w096nhjui8+mq2dA3vMoSZeBko+HjaiOvNA7rCvQAw6XZBfLfufW1Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900774; c=relaxed/simple;
	bh=hQ9upSJtJJopYunhhTAKlKaEeg0GayiBtpkQagMSQJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bQ5Ag6qpjf/JMu/kvSVhRPm0M/XspDTyfYqt/elC2nISL6vqdYvJ6J2gH8XJyu+ZkeVDcBs8Af3S2Ylo29J/d+VoaUFsDcTvMi0rvf0C3EMUuoy7qCvXyLiF3EMh59Del0Msix2yEngth7f08pARW00yyRtNQdyhkqnNnN6enjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zeo4ca99; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-411a5b8765bso2866985e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707900771; x=1708505571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vGwKYokw3i/oEoJO6fwQAxXGHOptGWFu1l6NeZyDeA=;
        b=Zeo4ca99HYQetiv7RIFxNnMb/eINkCVdUq3+35KoRJX3i3Orwd/iRTfeLmT7fKKEgF
         6bvawWgd9bY4PJsz8MTxlbussTOA2Ff8KNEa/zFg+XTGPLnGGADAt1pOqCF0wBuvZkHp
         5C3h46mBpDub2Vw5pfinyMa6O8KESKSzaP5kRKv8f431p5bCECxsZ+0Oz3SMOAaopDyt
         4xfKovkd92+Vgggr7EMjrgQ3b8jACdD+J09hBQE7gF8jpdukf5oNM7BbAISACDCSOXcI
         qZVRURiq2xnyckuqfkBIG0y2vR9Gnq8hUZSPMoy0iJOqIw4uj9Jo13XoF9ZHt27/H76d
         QJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900771; x=1708505571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vGwKYokw3i/oEoJO6fwQAxXGHOptGWFu1l6NeZyDeA=;
        b=BXA0PnvbGNlJtRAjbKSaiV+gJrMkB1wvGxXbreE/YQztl1pXWON8wjsklCYQKmbDhc
         wZ5NdZxQ2lX4sdXebycnTkY5sdx27U0lKCBzElc5vICuG7hq+PN8VaugmDVo5l/A2knf
         s3i1MV27M8dGXNlAsp6pZQPPOM+QjapepYZ+d5KSCUyK6qO3wpro4/BKqgT7eVlSDNsR
         6lncZtkLdBkWaTSDerMhp8u/E+EOOGAe/EIJzuDFe3gSyeipKtDxPH+yjAv7f9Yl6dSp
         xxhyww/mN/soNPLrxUUD6yL+bdO3fSKDRp1TBixqVxRImxaRw72/Zn3ztZQq6mw2qkSj
         FOJw==
X-Gm-Message-State: AOJu0Yzq4LjWk9fS1G/w3LQ8xbEDd6ketEadO6bDIjZ7OxzA0GJh5xAG
	801mqPQmF3UbiicJf9UWTe+C/UyJG2pGGufd/mIP0ddaUicfC7/fRM46G5g+pvvZpCmUw3s8F4Y
	g
X-Google-Smtp-Source: AGHT+IFrFqtfG7itu6rycup1Q87PKnKv6wvTLWd/IQHkcqxYR1jvUiN3YfUXdpoeb7yhU6GzbKNoXQ==
X-Received: by 2002:a05:600c:3d9b:b0:410:c9cf:73d0 with SMTP id bi27-20020a05600c3d9b00b00410c9cf73d0mr959845wmb.13.1707900771447;
        Wed, 14 Feb 2024 00:52:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/3CA+LZTtKSYjuqCrIRzIdEf2vyzkF0EpyyyXtxTgbx+MJaJnlFZ8N+awafRT9NMvoi9FztGD1QkP3piz4zMIvw8DA3KpDl1sq2/Tt2tSPwsJTkCXP7ylh4b7Cl9MxveOysL9wMhNtEZePtPqWToCNZK1PV/afePj/R4CWtI6kJysX33ZILDL0HzphGHYDH1uypOJ5Nr5XdNsysnQopl56e7UcyJXvjdVBKk22d0ZDN8D2ONwxHxt
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:cfee:a5b6:1f9b:9c9b])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c379300b00411c3c2fc55sm1247672wmr.45.2024.02.14.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 00:52:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sysfs: fix inverted pointer logic
Date: Wed, 14 Feb 2024 09:52:48 +0100
Message-Id: <20240214085248.6534-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The logic is inverted, we want to return if the chip *IS* NULL.

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-gpio/15671341-0b29-40e0-b487-0a4cdc414d8e@moroto.mountain/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 6285fa5afbb1..e4a6df2b317d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -801,7 +801,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 	guard(srcu)(&gdev->srcu);
 
 	chip = rcu_dereference(gdev->chip);
-	if (chip)
+	if (!chip)
 		return;
 
 	/* unregister gpiod class devices owned by sysfs */
-- 
2.40.1


