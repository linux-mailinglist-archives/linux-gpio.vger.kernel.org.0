Return-Path: <linux-gpio+bounces-2952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2238F8496A3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72E7AB23950
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D6F168D2;
	Mon,  5 Feb 2024 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d26DncOR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71222168B1
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125679; cv=none; b=WeYWQJz3ifzAPEWV17Of5h99GsgTWHnTYHqlNxFEeVRzccqFKZ247IpZBesfMQ0M65gs98FQ9DI6X4OkSefmt1w88UM8pvG9uDXYFbd9wOlrcRCnbpA9UPpD7a5nt8vLXeTWX8UZEMo2xjbH4C58H+oR9Hr/woBfdI0NXkI8kbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125679; c=relaxed/simple;
	bh=ovwDn1Lb6tSdzCyIZYdd/rd1ePt6cjIadVa1Vg7f7aY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o2+VDxOclL3Bx8ekdcAMHmk6GqS8a8IzSvj4y/TNWAgeosXBb7wWYZcjK5k988SJ6rhzGpGtCHoeU5irtCEKLLB5CLGV/6FGXQXO46nETFwslBntqEnVRmfZdwzbOI9h9U1GR7qHcuSRXn2Uvx/zdiKAptOrmdGwQyOeqvphi8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d26DncOR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40fc6343bd2so25057965e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125675; x=1707730475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ag8nRnrxnEMvnEvUPbNUe/ytaETypis2xHLc3wBVPY=;
        b=d26DncORw3t+yGIra0imTW+0tLdJRc1oa4ZSqyLFvsDHIc45NluPg1seG3pag1eKo0
         VpJbppUYMFgjXnZLGiI8MV1uekgNHm+LRYzqO0MTJo8T5b5NFA1O4uvFz6SHHZfqTUAi
         +F+lZyi7PjhuoNyjSoOpcVbbvCp7jkv/C6QzAmn4YPRl8/UHOz+l6sVQPZGIj98QUIk8
         bIFPXRKh/wMff0+MGX3AKQYrbTXkFNvfkyOSnMPd8yq1M51nOZL4n+HusCm8148bFwhf
         NIWHqPM3qeZU4sFb8OLbB2iFHxSsAYm8QRaiEQr+35+GRwzVJrodQhZTHxP+TtR9w8qe
         InFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125675; x=1707730475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ag8nRnrxnEMvnEvUPbNUe/ytaETypis2xHLc3wBVPY=;
        b=tt6jYb9VSz2GWPoNJn958nn57hg440waUbq1Qe0yPk2qMVdITaYaxu0FAGS5LfJyQZ
         6sdqreL0zleA4rpPVOD/gher9MQFuPkFEBhHmxbtgtTYnV0SYryutWph5JTQ8DOXlM/4
         vEtnuhQy9MipSQypWO/07B2Lee2pSABNEWhQciM4Qx1PCkVxddsybVCcwyLdH4m7cw7c
         zHCvlnMpYwMuGDlYatPaCxFtn+KM3vYPMT9r2g6S8/gkJpNEMCN948kqY6NHp97TlMXD
         cGcXlu+BdDbWVdNRxJ5Xdq+jcToR840Miq1MeBIxuy2IqZoI1cTVYMOsWmLxAv72/VvO
         jDrA==
X-Gm-Message-State: AOJu0Yyi2X0UgotIecEJ2KFeaPDyCDfgbuxSIBh2EBzqRuBfsbMqdCYw
	Cli69KsZZv7s5K1uVWPgoXhLOj/XNvdmxdQpivjj9GyrHs8JVfSf44fJJCreUtOTseTdjw/HPKo
	V
X-Google-Smtp-Source: AGHT+IHSJoTtocwyZLmVaK6jsmh0L0SfYF1jX0prYviYSXwbw76F10dFvCuDdYWWf2UvqRfu8/1Rnw==
X-Received: by 2002:a05:600c:19cf:b0:40e:fbdd:238a with SMTP id u15-20020a05600c19cf00b0040efbdd238amr4414433wmq.37.1707125675774;
        Mon, 05 Feb 2024 01:34:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXdCX/l3wUqepSg30cg8LTd03aaPjbEVI0mjv9Mf5RrDr7lTxGAutl0RuHHzUC0iD87ZFAPr02TW26I7/M80456Z60mAJjmVXPYK0ONK9DaeFtjXvfb6kZdIxRLm+/+gt48fT1DVi7WjtUHYG08yT1JI0prbmnHCIIZvyuu/M9pCSsXQUGQop9gc2FEfmFCdvl9ZsdMZFDKGbVKlLWCoPt3Tj4tCEYyUlCMnOfAm4jaQe4NiifzVAP07t3/spZvpTBKDLRerfFXdLraeWAhrQapHsnzpmZbMnZVWjwevstDEUrRLJfYrSjyaJMb5HQtTw8cfNNg5SrBRie0YLJ+T5WLkQWIx/YHyg==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 11/23] gpio: remove unneeded code from gpio_device_get_desc()
Date: Mon,  5 Feb 2024 10:34:06 +0100
Message-Id: <20240205093418.39755-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPIO chip pointer is unused. Let's remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d49f84d692ce..f77f919dbad9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -184,16 +184,6 @@ EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
 {
-	struct gpio_chip *gc;
-
-	/*
-	 * FIXME: This will be locked once we protect gdev->chip everywhere
-	 * with SRCU.
-	 */
-	gc = gdev->chip;
-	if (!gc)
-		return ERR_PTR(-ENODEV);
-
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-- 
2.40.1


