Return-Path: <linux-gpio+bounces-26552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D59B9A6B6
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99AA53BE583
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4140531C58F;
	Wed, 24 Sep 2025 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rkbIF0wW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8ED31B10B
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725536; cv=none; b=BAYvoFWQJEyCLateGjr/6IJKPv7nc2tICCxzuW4pJs/bpfjMFuTwXqYFnbPvtQy0+VwPrm1G14i0aH2L6j/hrEaieQQNHqwiiOACT8DPFrHmcWeyS8WvvVhkVsdjJGR3rtCOj0xmdJgSLAujwrC0KlDa6JR6I5Grm04dUpU/PT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725536; c=relaxed/simple;
	bh=kA7iX9loqcR1iPNQOHLnQ9pDOo+AVwSl3LLk/F4br8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYv/ifIw6VPn9U8iX0WHWBSGadmZuMC76MfDHmhUXhQoAvbWooTH0rwjOhf/I3m8+vBUZU5tLXslPwZu5hs9iKBpvYJ40ZpDAoz+EnW+VmBRfV75iAb+1lbUYF6ImsDHztmaiZN1UXqu+tA1+SzOe1WYNPhiOUCs6W4kDyraVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rkbIF0wW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so724645e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725533; x=1759330333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=rkbIF0wWiiVi3XAxja1+YxX81Ry7Rb3TCnWgON2cQ/qp0VfhvoZS0bdOIAqrNtC60t
         s38zVQGwI4FIKdqzHuzD448DP7XYfsIUNzAITNDCdnEyq6VVNr5zGmVbugXuVIpXZ7NO
         fJfmVRdPqDp/V43lq2E8AKMJh6dsyMkk611nxXhbrp9kBUNNdAlf0s3mYSC0p7R4bjer
         Dq0+gki5JGmFw8iAg8498/c7gGR/b6gNhSjwDyQOom6pN5P19lm8Sxip8umjA6wIX1YG
         ciM77BHJa6vqaI/BdbHuDvXBTZVbmkpS9IMIfBtfI8kVM95RRoGK5zA7ZPTlrosffUYW
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725533; x=1759330333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=msHUUeeafS2H7OkNxcjLcqvRrTv0WXfhwy34jlRiQ2m5/OvbrntzFg1VYcXgCph+qs
         SWYnjAMs2OAJiE7eED6ThkF6GrkC+R7XdW2kys98Mv0DZFgnlWK0dK2XAIy2es7e5paD
         yi+yqKys3GnslDPWgOw+ti9innJ3u9bUikShqSwLETvDByrvxq4m8dNvDJEHMnFgY7io
         fAb13DnuNU4Og+zbn6e9gfZKpyPy/bYl2JLBnCJK7GOWz5V1CeGOI4rw6ZPsVtTh2VlP
         na3Kdyks8Wuc9la6e7FREyUucEpEOhn56xlEvi2beFI200tjYfvUZuaXzxD86iPPfi5b
         5WzA==
X-Forwarded-Encrypted: i=1; AJvYcCVNSZEg277+RV0VZjOHphvnxol4VcEhHxpf2Nv9L1vO1GBF1GfPtgOPu1jWmDvo5benLAAVhpXpK1So@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKDzbEei0m+xoul5/aLEAYHmz7VFoIo4PuckkuXxbMpZln5V9
	0m0uc/PkCDJQWCkdlMHuQ2qFQV0JIATTb7uQhjWLafCH8jrGeN8rzzR5PVbhHd34tBg=
X-Gm-Gg: ASbGnctLN6YGbCYL2ENLq2GRpKcNlWBUKFtADZLfnJ44X0O+usJRIHB/bySORWVNess
	QTER786jfiNOLPjZw73HImzPxxRQtYQcPywwTkjrc5AU9PCIg0jJYPvaUgZDyNSD56t6+p0RXZa
	NAo0qS7NtSkx0ynBmF69aN0ZqjL5qUkV9+fr2GpbnJz61sJ6CFQH+/RLXjFb9XQ3Xfibse8DgdZ
	96tsaHSYnHD1dOEvMp2g7VU59bbB/dCiugyUhLWL+/DUQV1l6pN09PGpmYhpPReDFh0+2gu59IC
	GSCmuX5UhoYh1jzFgiIbvIzPqWAq57yqBXpYuPTbtehilVI08wvdDSDBJfi6y3vutEY4QYVP3xM
	CxXoM/gGocPDXro3v5aHf8QJRV/98
X-Google-Smtp-Source: AGHT+IHNoygF5K6NbFZFn73ylgRAxtpGZVjEv4fnMw43TW4zazr6wr096y7fD1mLuRt7rZlC64ts9g==
X-Received: by 2002:a05:6000:2010:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-40abe093fdbmr2608816f8f.10.1758725532824;
        Wed, 24 Sep 2025 07:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:37 +0200
Subject: [PATCH RFC 9/9] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-9-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xxM5DFs0HrWkdhU2lVlfFzKEyxjnJBr+LeYHk9Z5T9I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGsIAdL4UJeiMya3ALuTFpKjTN7aiOFeRzH
 +UVHZT5JrCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 cphcEACKy+MOIGJFHlexGtoihY6/OLkWdmrBXTUoO645qSw8NQvk7z2y3yUjzvjBKr9hX81y36k
 bi2ATgazhH2Y1qvRZLbCIyviBSlA/Ng/tlMWhAih3C07fcUG4xSkIpQmEvG11WfZbM1/JEdat4H
 oD3+pxKwrYyGakphDygC2/1nRA6QdzY6faa2Z6Q1DULdAyY6UoySb7D4odXllJNuZyJCCtiqxWE
 ubY3EMGOgrUzkIo5o17rtWlh6q+lU86nd59+duDIMpp6jgsUk/A1crptrmnhptqlh4HqNaUyHSS
 rS+ejjtDOTT46Z1nSE5u86Pg8+VJOjulDbM+epJg7NwA8n/Nz4uSLBbYABdnCaq3kG4s4OYHoGW
 2EUoRTdUaKhnQOn2B/C8/W6zEkf+y6PjFboefj7wsslTNN7vlPo4vYmHA7jdCnDzWs4cW3AEdOZ
 sMMbRrfmlrfPatsBaEL+HZH71qMXTu/zBucKIg58ZckX9wKRAS+FWVtm04JHuuqGgS1XtkMwu4p
 Szr//k1rQp23kajM4IU5f9EUL1JLmpeoiDQEjUKcS1u0OiMeqkC+5RrMHwKd4uP6zPFkpkaQcLQ
 VSogCIlRTTQ4/NIBHy7HHxQD5Ehky/V5JKlAuCEStvEZ/XxunMEiLV0qz5adX0fh3iAMdhZ8igI
 MtfsM1m9NuzFvHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa2c9377449e29cdd33e9e8dd28c5..ba60b4de6cab7740cd8aa70c89f6e03e1dc2dd12 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.48.1


