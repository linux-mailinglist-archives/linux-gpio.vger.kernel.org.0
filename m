Return-Path: <linux-gpio+bounces-15680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A85A2FD6B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 146B5169398
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE72260A50;
	Mon, 10 Feb 2025 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M3WvfM8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A2260A37
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227083; cv=none; b=lEyt7e9sP0b4FJbJ0S4ythE/blzrgF1fJRLQLqCO65O6blY7O56YcWphAhJvw27TC7QpBDmAXtSdowZjgmxmkxv1XpCJZcm+vVOORxkWcuHPLYo8Evhd8kPmoJeFS3V/DI/SytWjNCCnoiNot9O/kywf/b9OTJS5DB4PXc3wTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227083; c=relaxed/simple;
	bh=0Dd/TwIMPTa1NXxF+RDclsVv0WgpIYcbyrIZrxifJTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLXkh1YPZEk+r+m2JA77kaTgP2LjcTFc7mMNPQYDmCRHm/jBESE8XR0qYCf+jebvSbJ+zmNQKGmaxf9E8B2rVU3FoCfw5CUP2xIQkKACHjlD7aMuOsLaOc/8QmrIeJSg/8eN41BqL0zy62y8RDqISsh7EtT1hXfJQJeRqKN2LwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M3WvfM8y; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3bac262f9so587028b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227081; x=1739831881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aQTsUJHgsqLkUdzEeUSjaVO0EDwfbxDIRSr93MsbW4=;
        b=M3WvfM8ymctecf7QYdHpg7RaqGEsSScrBBIP+Sm8JoWZiIhr1YQWZYm4I49UrOti0X
         4XZ/AUUmkJVqIyITioaWP9A2CIByRnd15BMVkg+7lgnMkbw9e1PIV9+2Kt3Iu/s/YCiV
         dNixT0lIbp9WZ5zStWkZdKDOerMk4C+L9IdKdMBpUWGi0zEJMhewdOnwbmz6kNLOLWvk
         8RTyGRZ8WMcsHMAyw99dkawyekVFF3t9u34sR/jrDW0m9l6Jw+N44mdF4HncsBbkQ75c
         jwxpbxNm8EbtpTyE3mfHY9oauY6l3DGauHoaF8WcpP0vnq5E/AxtLGqmSMospizOgeNA
         qAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227081; x=1739831881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aQTsUJHgsqLkUdzEeUSjaVO0EDwfbxDIRSr93MsbW4=;
        b=Y+BuDCqDuJwQ8cKGOelXaKttgtzzzMOdCtBFaF4DmEodiwQcGxiWo747pqfp6Jbe2G
         E1Wft/bePpiS0kdFHLLoBDcRqPMoKEHOh731Wnf9iCgUSMmm8cLkedwTL8wyirxxzamF
         YZkbctBL8/C32S+v0+e99ss9WX3XyeIKRoPoSFp4NGMODItysS2UkCWmInxlkSz2jkgB
         5/sWNQPbGrR4aeC96u/XjjMj+PaDi3TZYZHT4sBOm/AKWzO4WjtgGH+10ZI/o30Jg7Su
         +4DP3MnvdVGLZoHE4urefBok0zWbx11rWC4zw/a/B+Hk1JeEFC+i7LbqJojv/T6eZS2B
         2GRA==
X-Gm-Message-State: AOJu0YzgV9Wj7lcQIibqPmO39lmsXN7o0AJoZ0bDPyJcE7pmvImNhs2X
	AIgOqUktN/LupkDo3ffkeCzkmXjNnwKVuVXYZMvGAPX4IAuU44/lLZN0Zop7Cbo=
X-Gm-Gg: ASbGncsmMxnxwBHARYZejpv55z2ZBv/ZuOjBGxZSGm1bSl5+9VMxRcUx195FueUVVIs
	5wASG8vg3CeZwQ3Z57DT0kKrDp9+NPnbjTDArHBcWw5GF1lu1K+Mo6NZUTQ3YCIwNZZqo6zBYOI
	OoMvEtMWmOpg/gY3rh2hkfvRA3l8XQaESkQVLoyU15TnDNSM7ARoxXuL5BBYOPp89wgh8kGHl4/
	bwwfYw5UhPkFG9Mhuyps3aeUC/LCl9y4ZzR++f87zSGagte/nO8LvT1QgMAAtqJko8QQvLMiRYJ
	IcyXMpfxMh3kJ1Q6EGporoEghyt3n+0riwpVxkHxULZ37vE=
X-Google-Smtp-Source: AGHT+IGzPPZHWL9nm38yMUud0RRSbV/Ra+QmKEWIgQuJSF5KnPaRf3ayet85Wv9392Tvxy5qCKs2yQ==
X-Received: by 2002:a05:6808:3c8a:b0:3eb:4681:a895 with SMTP id 5614622812f47-3f3921f0b9cmr10552910b6e.7.1739227080875;
        Mon, 10 Feb 2025 14:38:00 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:59 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:36 -0600
Subject: [PATCH v3 10/15] iio: resolver: ad2s1210: use bitmap_write
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-10-d6a673674da8@baylibre.com>
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

Replace bitmap array access with bitmap_write.

Accessing the bitmap array directly is not recommended and now there is
a helper function that can be used.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/resolver/ad2s1210.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/resolver/ad2s1210.c b/drivers/iio/resolver/ad2s1210.c
index 7f18df790157f1e411fb70de193a49f0677c999f..04879e6d538bce664469c5f6759d8b1cedea16e9 100644
--- a/drivers/iio/resolver/ad2s1210.c
+++ b/drivers/iio/resolver/ad2s1210.c
@@ -46,6 +46,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
@@ -180,7 +181,7 @@ static int ad2s1210_set_mode(struct ad2s1210_state *st, enum ad2s1210_mode mode)
 	if (!gpios)
 		return mode == st->fixed_mode ? 0 : -EOPNOTSUPP;
 
-	bitmap[0] = mode;
+	bitmap_write(bitmap, mode, 0, 2);
 
 	return gpiod_multi_set_value_cansleep(gpios, bitmap);
 }
@@ -1470,7 +1471,7 @@ static int ad2s1210_setup_gpios(struct ad2s1210_state *st)
 			return dev_err_probe(dev, -EINVAL,
 				      "requires exactly 2 resolution-gpios\n");
 
-		bitmap[0] = st->resolution;
+		bitmap_write(bitmap, st->resolution, 0, 2);
 
 		ret = gpiod_multi_set_value_cansleep(resolution_gpios, bitmap);
 		if (ret < 0)

-- 
2.43.0


