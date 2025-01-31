Return-Path: <linux-gpio+bounces-15151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF85A24409
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 21:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E368188B553
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 20:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45001F8ACF;
	Fri, 31 Jan 2025 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uPUzRuuQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926691F869B
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355121; cv=none; b=VsuMVt9C2lJaApqRpYGaRGKdLoCsJS1/g1wAtUJOBVclarbZi+wZuEZxhknD5V9NZQnzl/RI0rRyfLm915TAbM4Xd18VAHRf8Ic61UH/Y/JMzSMLw8OCP8JMxA6jsc7rSPsnz33XAdmFaBw+5NVJl/MZGv4+KNpRZeUv9P8LpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355121; c=relaxed/simple;
	bh=rmBWKBYHCI+WuV2jjWYGUn7c5T236U0xlpQEPpz0oeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4ajjrm45oeQcuKa36ScyrU8w6J1Bjzp76oYwEupEU74+ydl66/7WjzT1Yydk+FqyDv6blMovyDXBcWruLtdKrYNQEXMx999t2ctbCu1ovKVxkcl1zGwPSVgP0lQRZpxA97PaNRaa1q5qpFlYILwrQktr30gHX9wkPZNvB/aDF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uPUzRuuQ; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29fb5257e05so788412fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355118; x=1738959918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzzIwzQtyYUR99JIrJ6how8p6bj9KukV10X1RHN4Hv8=;
        b=uPUzRuuQm3ZGPf+v7Th3oUHvv+dGvhO4XsIBcA/QvMsizBApe0tGtAB7+nO1P7jy1q
         Ik/cc+vEza7Pr28FhufIO5AhgNywlFpeHhVthF2ROlZ23MTfqT9DC0/fPVHcfpQqKK1x
         kzOILKZEZX9col5sG0JKUv9gD/6s4Cc3oCTkY2HUjkGPU6GRoci/acai9Itvr6Qp2/SU
         kKWD+BuyBLR4hZ99kKwNJdiWIWD6UX7ascKxVB9hBP3OJH7zJg23t4lGgvJvfcmyLr6q
         QU/xxC/WfSqs/ZrYSf+pAdMqu0PJ/iCbo21j6K9tQFnuf4+j/WZhIqaFOn2uSzUKXEVA
         TSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355118; x=1738959918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzzIwzQtyYUR99JIrJ6how8p6bj9KukV10X1RHN4Hv8=;
        b=OVIoCWORNBkB/GuBN8hZencMXanFmQCqs5t25EsSeTkZCzywJpIMLYg9EezVA4X9PB
         fis+LqENoZnC1Ir1bPpQavbNtgNnqJ2MxtX70fWvSY+hyyMnUmmBQxFyL8q7lArRTkhO
         2HLbK7OBc87+uYQlSNwX3mJh/ztDJOoWqjfgOKjmjB6HU05Uy2GxLmZCBmUaZEwI3fKi
         GQ6ecUzmmSWkL4Urix0u4iqphRRcAwAU4YkaAZGeSxjdpmBPxxez2ipKYLHMtCyQtQIT
         xiAxLPRAwHW+nronXIX92HFIyVZgtvfulKyEzL3njCyEFcU0hODtbmtmk8YM6FxYXmOO
         ig/g==
X-Gm-Message-State: AOJu0YzRlm25btVMXRYOBJ6RxNdVOQB/QpJDNLl3cAYaqbA0k1k/m2ME
	yH3uuRGc6RtMgxcPfH6q6yxdG1IkRhpuM0bMBsDX29kmyLbcP6cXfxH8FIjUCw0=
X-Gm-Gg: ASbGncuYharR7Q1B96QV3rQI7f2QqsYOaUBfNmZBU5+ZS3u51o6jQKfZfoFC3+wtOQG
	1W2r14pafV6ggZCpr2d5jegQlSYe8Ki7wneXNss0CBi1H02YurAy86UdH5hfsUOpZUI38uKe3D7
	WU2W+CxkYoTMdtjQNf+rNYNXEOi1AuE4B8x68DQ0oFq+MgJpnzCWRtTEPQVtGbE2V1JDHEw5OXJ
	KtPXMMLcK7W3v0lOWZa8X2hDIZBwNGTNEoqf31aoLmf0vaBmOcJ6M9nX560WlJVrozuCTZEa4U1
	pM0Qx2hmdZjQ+7ADWEgwL2YCExnvmSFz+7qNFxLbiksuzvM=
X-Google-Smtp-Source: AGHT+IERsKIHS0RESeT1aGghrd2e2VbJU3Jew/L2qRirwk6axnCtq0WNFwypLdr9E1c9DhZObl9GKw==
X-Received: by 2002:a05:6870:32cf:b0:29e:255e:9551 with SMTP id 586e51a60fabf-2b32ef5a830mr8108456fac.2.1738355117684;
        Fri, 31 Jan 2025 12:25:17 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:17 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:52 -0600
Subject: [PATCH 12/13] phy: mapphone-mdm6600: use
 gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-12-991c8ccb4d6e@baylibre.com>
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
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

Reduce verbosity by using gpiods_set_array_value_cansleep() instead of
gpiods_set_array_value_cansleep().

ddata->cmd_gpios->ndescs is validated to be equal to
PHY_MDM6600_NR_CMD_LINES during driver probe, so it will have the same
value as the previously hard-coded argument.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index 152344e4f7e44de0f8ab1cae6ae01a1f1c5408e9..8243bab6ac3af2ee1394ef743aaad12a19c8ae36 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -177,9 +177,7 @@ static void phy_mdm6600_cmd(struct phy_mdm6600 *ddata, int val)
 
 	values[0] = val;
 
-	gpiod_set_array_value_cansleep(PHY_MDM6600_NR_CMD_LINES,
-				       ddata->cmd_gpios->desc,
-				       ddata->cmd_gpios->info, values);
+	gpiods_set_array_value_cansleep(ddata->cmd_gpios, values);
 }
 
 /**

-- 
2.43.0


