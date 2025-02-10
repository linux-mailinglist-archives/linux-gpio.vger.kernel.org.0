Return-Path: <linux-gpio+bounces-15676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADBBA2FD58
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35232188AFB3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C2125C6E6;
	Mon, 10 Feb 2025 22:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JSuLsJIu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B51253346
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227070; cv=none; b=CimmYkFdYx7OpeJTM1tSKi8B0aTVfrwsomYUtDVvsF61uOLQn7W+67ie7FoeBf8dM1x7VUFmNB1qy3FQTB/QU0aypS9gUQ2fy/cmOAPEUb6/0g9QXaO/v7XzMBwPkXXMCzVn3yGxNRysL97sCESJJO9TBjnnkghlAxuPUmXqN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227070; c=relaxed/simple;
	bh=LctkGb8pv2p2rQX9wrZO/xPsAUNTTxqNczAZXgDu87c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtbNDvrD6oPTn8Rqvm97AfMc+9baqkLK0GRk3Cb9OKMuIiGxLtCovUG7bwdo3MpYyuFX8sSzdyU3n0GVQUd2TUccMI6BvitID7zTevOrg+ZClT0l13Lsh6IJEhP0w5WTKNdifuaWxV3EcOkOgsQ9AVtCIbN1qVlddnO+0HbxkFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JSuLsJIu; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-726e5aba2d8so348356a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227068; x=1739831868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXHiG48V9LuVOCVuPYOg0jYRbGMvcGRS76/y0RlN0SA=;
        b=JSuLsJIubHBSOQF3wLWj+iCM6/U9leKY2xdJrIXTYB/Ln+EEvCyBucdC3O7xK7+yjg
         +UXX9Xh8D+egCKgFE/HB4zzq14uH5zJKE8hzBMMEYKM8JPwsCk9NxqKuuAr2Bm7Ac25H
         zW9HtmlIp1YhAudqNG6vA2twyN7AwrZi7V4fW/s03pOnm5cQsfR8ETYqbh0u6mzK2V5h
         Ac7+R55B2wD/ne9vPaSiOU0sWD50XAUm6WcKFqmOCDglpSluMpvXz2+Mc7mCCbowvRP7
         +FqWlSj8UETjcdjwyhYHUxb6orF7xrrDPf837dnQ0MsPCvwhDzBldHlffteYLRTmmIky
         bwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227068; x=1739831868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXHiG48V9LuVOCVuPYOg0jYRbGMvcGRS76/y0RlN0SA=;
        b=YwmLdbBB0j7I0XnPR/IESMWGrrRUsjDF7VB1AV13jHdEBWSfAIj06pAQ9Z+i9cnqaj
         HUqo5Xzsbl7sU52Kg5y1+IX5jsMZ/BKOKOFVjenHhEwk9WOCmUvx+GvjPbCNISPwEPC7
         bm4F/vGgI+aA2diavGWFzDgZ5sE3OdDq+/62oEIDkmEi6Zfar5G5bW8DiOMjUTPSEmnQ
         WH5HLbiVRCB3hPKYqO7YF5l/Ve6ZvtuHI/Dwo5i3SQP9kpJKlvpJzMLD4/yUF3IYo7/q
         i4uNdlfllGBw7oMUqfe/5iwLo4iAmEAoD7XKfGbVUHHIGDEtgt5df5HeU0nRChDaJZXI
         iUhg==
X-Gm-Message-State: AOJu0YyEEnDgslhLnWDnKuyi0PByRzCVfnawwuerYIcXBIsi7cKb5YTT
	cKgUzeZ8RjJ4GL+Pry3Zt96yz/MDnQDaLc3hOX6FwuzL7U0bTYrreCIuk8Ci1Lw=
X-Gm-Gg: ASbGncvOM1bWNqnbVjQ0ENq1fCw2tojlCg1v6+toSrY8dLHz0yG5UOeFolkFAr3uKTv
	Bn5p5bSbsD1WXc9G+ul7cTMw9ESuSIwp54nS9eZvNLlyuBEjuevYRsAvHq2jcJ7TbM3fgl2E8IL
	lYUj684OM3LAyXDmBE2lpXpOmp6vEMmYi0aZ94QQ3tcrJwlftNvKuOCVAuAHJbwfPwbJb0xsmcC
	Sbe9pR3t/pPv1lFd20iGGhD7rBQ1MPrjRdxRSWE9sG6JUCuf46KDOsVa8DlNYTVuvbng4SiDh54
	4J8sHxeTMKE5B2HLr6OdPiaF6guMPrHSTIaGVTF9JR3C9/o=
X-Google-Smtp-Source: AGHT+IFehF7HNx0K+6D6lVInKbCaf1fMxaCHCpkyg1GkxvFsa7pSUfnDQ2Sc+6Hc2oSsp+PH8uo0Jg==
X-Received: by 2002:a05:6808:2f13:b0:3eb:8d22:b6ef with SMTP id 5614622812f47-3f3923b0208mr10855482b6e.37.1739227068102;
        Mon, 10 Feb 2025 14:37:48 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:46 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:32 -0600
Subject: [PATCH v3 06/15] gpio: max3191x: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-6-d6a673674da8@baylibre.com>
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

Also add max3191x_ namespace prefix to the driver's helper function
since we are changing the function signature anyway.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpio/gpio-max3191x.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index bbacc714632b70e672a3d8494636fbc40dfea8ec..fc0708ab5192bd518bb0e6362f737bacbd549d61 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -309,23 +309,21 @@ static int max3191x_set_config(struct gpio_chip *gpio, unsigned int offset,
 	return 0;
 }
 
-static void gpiod_set_array_single_value_cansleep(unsigned int ndescs,
-						  struct gpio_desc **desc,
-						  struct gpio_array *info,
+static void max3191x_gpiod_multi_set_single_value(struct gpio_descs *descs,
 						  int value)
 {
 	unsigned long *values;
 
-	values = bitmap_alloc(ndescs, GFP_KERNEL);
+	values = bitmap_alloc(descs->ndescs, GFP_KERNEL);
 	if (!values)
 		return;
 
 	if (value)
-		bitmap_fill(values, ndescs);
+		bitmap_fill(values, descs->ndescs);
 	else
-		bitmap_zero(values, ndescs);
+		bitmap_zero(values, descs->ndescs);
 
-	gpiod_set_array_value_cansleep(ndescs, desc, info, values);
+	gpiod_multi_set_value_cansleep(descs, values);
 	bitmap_free(values);
 }
 
@@ -396,10 +394,8 @@ static int max3191x_probe(struct spi_device *spi)
 	max3191x->mode = device_property_read_bool(dev, "maxim,modesel-8bit")
 				 ? STATUS_BYTE_DISABLED : STATUS_BYTE_ENABLED;
 	if (max3191x->modesel_pins)
-		gpiod_set_array_single_value_cansleep(
-				 max3191x->modesel_pins->ndescs,
-				 max3191x->modesel_pins->desc,
-				 max3191x->modesel_pins->info, max3191x->mode);
+		max3191x_gpiod_multi_set_single_value(max3191x->modesel_pins,
+						      max3191x->mode);
 
 	max3191x->ignore_uv = device_property_read_bool(dev,
 						  "maxim,ignore-undervoltage");

-- 
2.43.0


