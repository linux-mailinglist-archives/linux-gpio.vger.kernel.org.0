Return-Path: <linux-gpio+bounces-8941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A19959B70
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 044DA1C21A56
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E70188A3A;
	Wed, 21 Aug 2024 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IEWPR/63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97E166F19
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242507; cv=none; b=V76CSDFTKh5OfHzidj+IRV46aEaX7ehImHwh1vhqL6K5PRfb+ybaK0UjHjnjE7cOEOTiXvNRnUj7LwQDhLOXfetPvO8KbkKDr+LRb58S+U47XG2/edAMb3VHzYX/es9KXl8dGrI/LtMsoO0g8aL+H2U0sXHJ6zBD0RUeVix/77U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242507; c=relaxed/simple;
	bh=8XDdi+wKeN16H5QYAJ149FGzvNNOIx3CUjldgIHNaPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REIIDQNW0vKGhfWSZ+xBiHkSfdEOSem69cagsu1jU/dr6RPzi8SEOUcF4qvM8IdtHyFKZ2gt24bKIcMdy607TBFDyooxrB5NjtfMsCYIMMpMIzm/1tCM43rvrpV6Vy1C/rk9T7W6+4Ni/az8/NIn0PYpGG8R1BvmK8VJ7wSLoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IEWPR/63; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so51313335e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724242504; x=1724847304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTz300t/luXT8zpf6sUHvk2i6OLc3SxIx0fProJbjig=;
        b=IEWPR/63I8bFdt7IJq/3BWLmrMi/wn6+aid+fDWkgy17oRZsSm/E1RrozMdC749IrQ
         +RJhk779W8yJsblfuBBQZ5cMiYfp+zWIZfgfzOVse/rSHtV46/B59Sap/o6vsp9urw9+
         FfGLaanszgBrbWUW+MLOOOkBf3Yv4GBmFDFW68eCOAQFtGgyWa9o0RslbP5SBVOE5eN9
         sWRfFQq7erlJyzXkwd5NwDrXFU7JXTUrIT7ojWQHMKCKREXsxRBQUybrblBaCpt5igUl
         fKppcd3ntthMZygxS7Zq64zTjZx4mtMWM6DwcODNNMTWRpuKpJpz0wVaEFbMmE4KiTih
         hNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242504; x=1724847304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTz300t/luXT8zpf6sUHvk2i6OLc3SxIx0fProJbjig=;
        b=hZVWSD5I2bBb6PreaGSI1b0AOJjpUrDwSvremZf+TSNQf6lVpRNMBx+kkeqqpJqdlw
         boCDWY5Wq1qI5oHbKT1u3T8soSmqGTbMidP1TNytZIx9gvsPlg8cb00D4h54Jx43fhZJ
         m/5MqApeKOCml45Qtfhk0dYk1Gl4hMX3VkuQ6roTlEpn8Wyv5fKNtGgwFqfDuqC2r720
         IjY7gB2zim4a+uatFaZ+4Kk9Jf8dDAV3mE1uF+FwCgfKIkJfRyKV+T/niQgAv094+rHs
         rmwURCfmA/LJjT6ZNvtco2anhci0pM9IQAQ47x4jgloKQR4/l7/jZCqigUi80rndsF8s
         QSSg==
X-Forwarded-Encrypted: i=1; AJvYcCV8z0QhltdmIvfyH4f2CLw7VDbQEbZdWQilmjfsghIPYoEjZmDxQ2GdcLxCeyYET9WkFp+KTcKbrHfS@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlTeiJsKWEiHKqqCIl4QCypamj0dey+Bb25B+C0DIRUskhQSZ
	+5k+oJdcgtVQuuhaomvHQo9g7SpTSotroh3Kh9W2ZqsuWTF9IA55fDVAs+nuua4=
X-Google-Smtp-Source: AGHT+IFNhN49sYxGRaKV6Ju/INhyn5+tc7rma2VMhAE1dPfKeHdY4KqapcmU/kumSKGI9L9AWQLO/w==
X-Received: by 2002:a05:600c:3d0d:b0:426:5c9b:dee6 with SMTP id 5b1f17b1804b1-42abd2449e2mr15984185e9.26.1724242503495;
        Wed, 21 Aug 2024 05:15:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:42a6:b34f:6c18:3851])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8b43fsm23056595e9.12.2024.08.21.05.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:15:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/4] gpio: ath79: add missing header
Date: Wed, 21 Aug 2024 14:14:54 +0200
Message-ID: <20240821121456.19553-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821121456.19553-1-brgl@bgdev.pl>
References: <20240821121456.19553-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Include mod_devicetable.h for struct of_device_id and its helpers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index be2952fdae3b..7f9e66d75c8b 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_data/gpio-ath79.h>
-- 
2.43.0


