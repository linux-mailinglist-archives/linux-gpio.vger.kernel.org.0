Return-Path: <linux-gpio+bounces-15143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E3A243DA
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 21:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2129E166DFC
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 20:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3ED1F5409;
	Fri, 31 Jan 2025 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NDdrGTEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7881F4E42
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355099; cv=none; b=OxMT6yYeEBwFeYHlf4ccnfqOMoBL52XzhE+naFtjvNOb8NS79/Bm2CvkONPOPxGTPQkMb5ajR/a3B+/VkNbryB4VCgXQmmTRLVL66ujNoIMcBjNVrCriQEKREeKH61nbzCQKl0EHFMdJIgUWhtkcPQ5t8TwPfVKi0PysclD3uV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355099; c=relaxed/simple;
	bh=YRrA2gctgtC9TxPdq1m76F+qrw6XgkoDj0DtVE83Qk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ka20YwXyfBb+AuLqpwKTzekzhFr9F6IL7DGCficfcuycHN5yCXjATc7FRfI568hojhEuORvni4y9VLVzAw0Hbi50j/V4e7FlrI2dZr6RWCczIZ+VmKLK4BbPzKWrFNyl7UIoPPQi+spMkapFdn3RF16a2PdoMVI+AGo+4B5OY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NDdrGTEY; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2b33aabfe46so985966fac.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 12:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355097; x=1738959897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hlyYXLAXkselsSNF7g0Bc64z/LNWZ956QqcL4gqDjo=;
        b=NDdrGTEYz2np6Cl9evbzZyDhI/48wDzwH/V/o9jhCus8B4Itu8rtWCN/G175aqpP25
         3eN2VqFSu9aiy1ZSMHmmLkptNDCz9pnbscxcAVeVAAo06WrBVIdJpPMOJm5BBI8FDoqK
         Eltr9akLCmJcgQsHWwlKFWyNKrPq/TobSsUsiKO7MfKwJYJ13K+JJm3yuB6SD04pnKCx
         X6o8+4mlL90DOWZMwDwgmw+TIt0jiDjrtPdJpGiQgPObMN8rKQdhwmE5e5B8djmy85YE
         2MPRUnZ2SDn0IR9qnz+NMVojogLOoy2OvLOg6eKcXggazySkyKDBDiMcPFstObe2681I
         XOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355097; x=1738959897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hlyYXLAXkselsSNF7g0Bc64z/LNWZ956QqcL4gqDjo=;
        b=bX3zynaZYtkvOQBvzybu74ar0XwFLcxhwz8T9SDupN0KSjBslrDsmAt0g6msIuhF8N
         SB4vjUDQct1sZZesz1MzxDM2ZjZ5hp+BmHPosA8Ws6vRSwfFBXOhZUhGSAWej+CT1E3u
         yHcoS71i+7eJbkSIosRuyEkkfCllg2OAnJrEzi/TnAyBlenyC/iOiKJr2gkb6ih7WoXb
         NaWsK1XPdsMRdte2fj6net8jLygOLP8hMQVafK3aIxBZr53OvE/2gcFeR2EaNyt7pv7z
         GicCw4AcuO3Y06jgLXUwo8iowxt1vZPqemzDqlHg4j+ApCcrZ2jhPvhuW/eoAHid2p29
         ktVA==
X-Gm-Message-State: AOJu0YwzjJDEJG46ksrpAThZe8Skcqyty0TC1F/eq8Las1kOs+IpkKmD
	gg0CyIc4tyesgphlkZU4jGuCBO3TdJe46/WxeB45abKzS80jn2WHSyx9tH5A0v0=
X-Gm-Gg: ASbGncupGCtzZZ7FxmNmHSPu6QBqAYR+rN0MykX8VdAcArNluOULEk2EZvHxmxOAjK1
	2a4rPG1DLU75FaIWYNeOdtIHFWWIpQNqck+Jrst1XDpCF9dCrgA+j6rCBK299Sv7wRlP4yzi8cv
	dLDQEvi0kjcy2c35cwNj+vGzHiYONnCj0KO/chYlNLVTrtH7SKEWwtr5VnDfEtgCukPFAlz0PIJ
	QMdltM8MQFvvqb9wzEe05i929xJyuCTs2+DSico54L8ONZYi1vi8Ur0XNpHvK2ncezKb1ZCgZ2n
	ZPRfL/FVDbO6lQ+KNdEiUEbcDfQB06kEqRejJpp9cGVeO4g=
X-Google-Smtp-Source: AGHT+IG22JJZ1zoEE08gl8CxgOf30mezmJIUs5PEqf+3dMT59zSIuFvgdvLgZxy1Rl/Rs71gFur6Bg==
X-Received: by 2002:a05:6870:2dcb:b0:29e:6647:1080 with SMTP id 586e51a60fabf-2b32f07b26bmr7733897fac.21.1738355096771;
        Fri, 31 Jan 2025 12:24:56 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:24:55 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:44 -0600
Subject: [PATCH 04/13] bus: ts-nbus: use gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-4-991c8ccb4d6e@baylibre.com>
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

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..31ae9a26257c3e0af2ba99666e0c04e882da935b 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiods_set_array_value_cansleep(ts_nbus->data, values);
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
+	gpiods_set_array_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0


