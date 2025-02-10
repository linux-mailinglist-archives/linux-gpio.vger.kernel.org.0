Return-Path: <linux-gpio+bounces-15674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EAA2FD50
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36C2416691F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE56925A342;
	Mon, 10 Feb 2025 22:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="z4odNCuW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4D225A2C0
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227066; cv=none; b=NfCiqav4+BTDtGccwz9o8TwuIXIoeUnbIt32CRuUgpdpiYccEafcUqw7rdfiOijs7UQc96dDvKRxGVSyIQAduLZ9NbR8varqRwCfcZpVOj8AtaJoTHgJvslR1+ePbRi+YhhEByzWs4SHfNrGFfOLS/u/1U3/RPatufJPadzw0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227066; c=relaxed/simple;
	bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4mOyVwWA9yUgJ19ZdANwRl8iLHoxkR4UKs5526NEvkD1UheD5CsWF1zZB3m9qCtOIM2rrlFkywtJLxQJxxBbvQ9tPvqa+/NwpknbirK/kVIfOdEbYpRQZI99pEtRE0FQFAcbxL6v9qMBhL6y0QqaXrNG6c49ZNKYcIrCe4GfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=z4odNCuW; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3ba3d0433so594176b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227062; x=1739831862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=z4odNCuWEIdXw6egWdAWzvkDfUm2yp9LCjnZQvBCOP3qcsaxfCXnX9ztT4tAzJgMaI
         oDzp3usrGdpGtWbm0FqUkKrpmWAEIq0wPRJUUbuLHncebfsQtZRIdXurTcE0coBezaot
         JCqwfqdc21V6HhF23eOTpr1Hv00Dk390SFpGVTMpKQAG5hTBVYYJCwcIsgcO9kiueCqz
         pcz1nbGaOl3KNFWRBj/DCKZxfPkD/u9KWoJF+RASmhfD3E5roTW7Q9RZbtvCdUfMt4C1
         4t7qWk6gsXi17m+oWug7qVV/Df5lYt5w/9r/5UtGtJtXuARRfAjocCTg95E9CRvg5S42
         AFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227062; x=1739831862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=D+Jc4I4xTvguXXEY+B8iqorh2xod9b4/7XuagjVjIfxLkba1Na9mx8NyBU5MyZXiWJ
         wFEwPmThJ2ob8V3ghESV6exbgxqd6Yfk5/5MMBt5R5NF9jzu07XaOjJN4aVRKAz7IpPA
         4gMo6HELFVxbIcIwiogryOBPAmboTekqb9x8rR4oJfsNqCMZWdXVADgj2I7ATF5SLPJm
         Vgsnp0QBAQHy13kd9wMxnOl5NoFV5cg1YAcaqS+/lgA2sIIPhe1wLsnfZ7UC/I0OjESH
         Iuh/BS12tYCZYmPeN9GeVXQe/MxZHNDdv8ZGOr1pqZ7lZljh2n9s485ABhLeNqp4es+7
         6RCQ==
X-Gm-Message-State: AOJu0YzV29rPOEyGVRGCkCZjCYi0xWHxFhxdUrRlfynep+rp9Jl1hmm4
	uDGNx8t5MwyWZEgpN24hVI8t5qJ5d3kvJlzkiQiCtPv6E3z+6VMe1UBsKlXQ1j8=
X-Gm-Gg: ASbGncsIF/f8im5a54B7CZFuew6o7BzAItqhciGVj70dtzhGDEKqF9MZER9hc0d8QgV
	q4JNzwqXranemQXGDGUbRy7/S+yjhV1Mw07pKDNQA4qdziEZpI9yu0/exbTZ6S1BRzJaIUItN/G
	C4WquN+Y6ttC7/go8r1ktNJ7fVDD6tI8MP/cp5QGDhjqcPwlNinAyzVQk89zNJYiCnO1rqcMYQ8
	sllvJRRNC8lRE1cWYDuGPXCOGpsBDzRYaG0QI6iCp2UV/cZVNJgmmHPvEzbKGsLrDZLwlIHfamr
	ago/9OgSFhydsJLOzDq4rkf3LyF5uOJKdFys4jM61WCps44=
X-Google-Smtp-Source: AGHT+IGCum5h1AQwvUJNh3Kk51lVy6xq7QJ+B7z8EkY33CFant2nucCBaXwDqcXBpkDagMClSCsXTA==
X-Received: by 2002:a05:6808:4099:b0:3f3:b0ae:7998 with SMTP id 5614622812f47-3f3b0ae7b3fmr3901508b6e.17.1739227062548;
        Mon, 10 Feb 2025 14:37:42 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:41 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:30 -0600
Subject: [PATCH v3 04/15] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-4-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..b4c9308caf0647a3261071d9527fffce77784af2 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
 	gpiod_set_value_cansleep(ts_nbus->strobe, 0);
 	gpiod_set_value_cansleep(ts_nbus->ale, 0);
@@ -150,12 +149,11 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	struct gpio_descs *gpios = ts_nbus->data;
 	DECLARE_BITMAP(values, 8);
 
 	values[0] = byte;
 
-	gpiod_set_array_value_cansleep(8, gpios->desc, gpios->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0


