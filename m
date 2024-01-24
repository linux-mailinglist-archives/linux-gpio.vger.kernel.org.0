Return-Path: <linux-gpio+bounces-2496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2299D83A687
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 11:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA49B25EF9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 10:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F032618C19;
	Wed, 24 Jan 2024 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JEd+Q3io"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32DB18C05
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091488; cv=none; b=R8As510eT1G2M/+G7qhP7EvNHRbE8/F1rZ3I5MUbuvrOhA9b8Q1FXGSkoGs1bmHORkqesD130MrZDLkItQIbdG+LAa3v5vh/Zi4w5kuANp/cSmIg9CxSBOUxzuYfIF+pmzmfDDmQfuxst0LWokMZ5VZsa81PxbPorEN9/BIRKxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091488; c=relaxed/simple;
	bh=61yF3inICmlm/ykxX91sgup1JyxWymkd08CgnqZUo84=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FVi1XxGUGam97oS36c50SXgPgO+f12wCD7j4QC/gmuaB3PnFo48lmIN3/6NwIYbs/3PZbRmtUOfOJWiHzxdM4crCwuKvanOkGCTaqua4nH2dxx3FxRxnvYd99U6QVSxJiTgQwggVWV1U0sHSh+l5kF/kjB9U/iVb8otIFes6+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JEd+Q3io; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33922d2cb92so4684106f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706091485; x=1706696285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24t+GKRohivdD9M6HU7DNDIl/pod3q4HJA/0ZcbBkQk=;
        b=JEd+Q3ioYDWxGxjxEvRsU5VF1otSmAd5NEKMX6N8q4riUJilOmg8ICgoLdXztF/u6T
         RDbv0+hvIqmPrIDj6T/CzwscejcVCiWJmLIEVzlIOU4NjQ6fZz+3gn/qe1zmmf7bjuZS
         WaC5LbX8qSyV6ZVEXtOPNeMAWEERt5RvHRA7QE6PuY32RqJCr/beMaKEtOZCzPgUsT32
         rsUoFTT++IcUt/4HMhUAPi/Kd4sVjRDle4gLtl6JEKTb4eWw4NB1NPVZBsg3cAzjvd3t
         6+dBagn2Bmith6siiYmkmAHGOc56DJMe3hokb7MwLhD17JlOlC0o2VSoeZjJMeM3Se95
         nPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091485; x=1706696285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24t+GKRohivdD9M6HU7DNDIl/pod3q4HJA/0ZcbBkQk=;
        b=um8gK1aNIxxuFk8YIsxGFwAXv4qMLOHCDw750LRnMKM6g5hrvE3g/ifYa9LUxYsz0c
         hGlatC8pkYxkQnRfQR/9v89+XcUSpfrBS8flyVqemy9qLbCyMDOQY8VAMJLAovz0TqzE
         9Jeo82iVUtTPdvReXjnbsQER+ThTNkcRu2TZyIfeILEyjnnOhsMr58WZz9A75ibl+zgC
         PgqAkFdGy9L1NAQPYFBKZxbYSd6+dVXG/5S5AWCXTSYz7HLmja768SENlwaXjjprqVAd
         Ffe2nmGnW7i2cIbor7KB1qBEp7wJT/rR1U79ix8AgSWyrHAENJmDL+zF8rRLJ1lYnXH7
         +yTA==
X-Gm-Message-State: AOJu0Yx1x+YAh71oiTBrap+aoahODAvpq5jz7up4oeoTaGDQpFt4C3c0
	9InUYUidfIdZ74Scm056OIdUbs/PzmZdyjvG1//5TB1gaUWtEm0BgQRyMDbs+AE=
X-Google-Smtp-Source: AGHT+IF4HooIIzUkl4PmavjRKA6XsPDhTsbeNuVLTwZ8316Cklr4cZmAd+vZETl8nBN4fmPy+eclVw==
X-Received: by 2002:a5d:67c3:0:b0:337:c0b9:ea0d with SMTP id n3-20020a5d67c3000000b00337c0b9ea0dmr223350wrw.41.1706091485021;
        Wed, 24 Jan 2024 02:18:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e737:cf8b:25f7:e0ad])
        by smtp.gmail.com with ESMTPSA id cg13-20020a5d5ccd000000b0033927ccc725sm11046427wrb.50.2024.01.24.02.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:18:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?UTF-8?q?Jos=C3=A9=20Guilherme=20de=20Castro=20Rodrigues?= <joseguilhermebh@hotmail.com>
Subject: [PATCH] gpio: improve the API contract for setting direction
Date: Wed, 24 Jan 2024 11:18:03 +0100
Message-Id: <20240124101803.23580-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If a GPIO driver returns a positive integer from one of the direction
setter callbacks, we'll end up propagating it to user-space. Whether we
should sanitize the values returned by callbacks is a different question
but let's first improve the documentation and fortify the contract with
GPIO providers.

Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9a5c6c76e653..c1c516b8a880 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -335,10 +335,12 @@ struct gpio_irq_chip {
  *	(same as GPIO_LINE_DIRECTION_OUT / GPIO_LINE_DIRECTION_IN),
  *	or negative error. It is recommended to always implement this
  *	function, even on input-only or output-only gpio chips.
- * @direction_input: configures signal "offset" as input, or returns error
- *	This can be omitted on input-only or output-only gpio chips.
- * @direction_output: configures signal "offset" as output, or returns error
- *	This can be omitted on input-only or output-only gpio chips.
+ * @direction_input: configures signal "offset" as input, or returns a negative
+ *	error number. This can be omitted on input-only or output-only gpio
+ *	chips.
+ * @direction_output: configures signal "offset" as output, or returns
+ *	a negative error number. This can be omitted on input-only or
+ *	output-only gpio chips.
  * @get: returns value for signal "offset", 0=low, 1=high, or negative error
  * @get_multiple: reads values for multiple signals defined by "mask" and
  *	stores them in "bits", returns 0 on success or negative error
-- 
2.40.1


