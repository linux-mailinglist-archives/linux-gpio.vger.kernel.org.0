Return-Path: <linux-gpio+bounces-15495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D844A2B5B3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 23:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A7F3A8637
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 22:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A57523CEF1;
	Thu,  6 Feb 2025 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cG9pwCnk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91614259491
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882116; cv=none; b=lYGGe/LZRimWc0RqzDiEnARhBz/oSY/Xvmw2zl9dwpnVoMED49qc5B+/QCPQpVSVopNuq33sMrY9sKHeJgmB0BSEd62irrILtr6CXDxeh97P+Cb+TzxtSEQ6Mg4+P9HX3yWcyrXWRgHxepm7wsVQAe/MgaQr8dmAI9xt8aqHlC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882116; c=relaxed/simple;
	bh=HaFWSgBdfXggpkPiEPQivtzXY7Xojib1tG2MzfPUdgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXi3+5dSAeCneRLh2Z6oWv5uaZon2FQeiU36KSEFoE0Q/flewoB6J3AjRwTGK7kWQiBSRmvMBDrtAXayfyo2hxyox195l8iHoC3pQPQDkABD06zLlvC7+StRjM2DAIy5u8doMkFbYzzQaVcgh/KQhnrjqu8WT+6GbzkLnKIglqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cG9pwCnk; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71df1f45b0cso1308393a34.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 14:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882114; x=1739486914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hnz0az7lntDGiOpb5KMBiHYUt+/ZN1SFQQir1JT9FNk=;
        b=cG9pwCnkAGhREeCpqTup5txOFp23jH8qzyvN/AXhPm+HsbSzH7nwbiISN9/J/pQjCT
         aRmMwKOEOaAH2ejG4ZtdJiNaTDSifLuDQRLdTOUVfGsHWnxRO1VUYIIVER9gzUJqTGoe
         zX+XAFX3q6RAYoScAzRqwFo2E7gjIhM4t7fzx3om1IKQ49qYCyGvgVsWmtMUjCPp3Abs
         E83O3ZRfdX3y3DWYApFxut4GWdUGhVZ3e4aBoGd8cyrqTO50Tt2elx+LSrqP/iQUh4w1
         /G20RwOZDyTyPs0ERRJSW6FzBeqGR2ZhJWGXJyvp3aDhzsAS5U/VhRHlFK17JXQwHREj
         5IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882114; x=1739486914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hnz0az7lntDGiOpb5KMBiHYUt+/ZN1SFQQir1JT9FNk=;
        b=MN0HmMa6vgPFEk+o0M0oAz8sulS3hE45FAUKFY+vektIP2mEVVTpCO/23N9UZvJh+w
         wQ+wu3ONlYH2jVuwJTP5GLJX+rWl8L+5j33EbzyV58zJiOjwaFLLms+qDvCOr7pCTyX8
         cvGDhPEuuJ9t2Zn9enlq34FN/YpSJraTyPNQu8JQiOPxsnOLkiQ4Qm02364rp6jUEXme
         NsPrZkCcdur8dxuDrlhxjZpXMFTsaywmErYbxrSh7X1vFkKLp0WG69uhQa12HRj4rUUw
         Ue9nR4aYyvkZe3OkZcb0Y11nMIiPSpPHAPLLVIRsz3F23/Boabz/5t3e1h/t8gwA4I24
         Od0Q==
X-Gm-Message-State: AOJu0Yw+959WZAtZEHuZVkKY3G8gyr6ayArq73S0AS8jHwl93WmhDjY8
	vuPkt7A+II/bWHKb9vrAKSpBQ3KDSpzbSTuZGeM07sl2Ho/WK3wa9T6643SjDTw=
X-Gm-Gg: ASbGncufPk3TLnU5d8gR2nQeZ+vSALWVUy2Uu0OxaEn/eyvYZ9yEHWxlNTn3NhYYRFK
	sGmVdndmQS4agkJ31seRDiOTnAJHaduOg/PVLCEF4wKa7kmnEBpF66s4iX/Dx2U6OAKKxOjNo7g
	sULIXpZs+sR9Sp1btBsNNs/5ZdptpWbd3RWqno+OLo+UH6XytFFawH7Mtk79VkuW4FdaBuZWNbz
	yf66joJneGqaJZA2E0Pm1UsLpB9Z7JAjXa34EdsonJ+Sy3D0tMSB+1e6vqMMWyAoRpDjkTswbgM
	R0HkFs5pr9gFSVpP1cbNZeIp9cxIPeGDk374r/+Pl44wmMc=
X-Google-Smtp-Source: AGHT+IEVknGonsegy5S/Aw+PLXi2TjO/wnkH/rmRbYYU8mAcrJGwZvntuKEgjA/jQ79DrZ7uQxsojw==
X-Received: by 2002:a05:6830:3981:b0:70f:7375:e2b5 with SMTP id 46e09a7af769-726b8f3ab09mr416555a34.6.1738882113893;
        Thu, 06 Feb 2025 14:48:33 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:33 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:23 -0600
Subject: [PATCH v2 09/13] mmc: pwrseq_simple: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-9-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
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

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/mmc/core/pwrseq_simple.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
index 37cd858df0f4d7123683e1fe23a4c3fcd7817d13..4b47e6c3b04b99dc328a8b063665a76340a8e0d0 100644
--- a/drivers/mmc/core/pwrseq_simple.c
+++ b/drivers/mmc/core/pwrseq_simple.c
@@ -54,8 +54,7 @@ static void mmc_pwrseq_simple_set_gpios_value(struct mmc_pwrseq_simple *pwrseq,
 		else
 			bitmap_zero(values, nvalues);
 
-		gpiod_set_array_value_cansleep(nvalues, reset_gpios->desc,
-					       reset_gpios->info, values);
+		gpiod_multi_set_value_cansleep(reset_gpios, values);
 
 		bitmap_free(values);
 	}

-- 
2.43.0


