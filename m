Return-Path: <linux-gpio+bounces-18447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83587A7F693
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED151893039
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6063E264633;
	Tue,  8 Apr 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n9k4Zg8F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1702641F6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097913; cv=none; b=GDP3+piklOvMm943EG3kdM52z47mcxOIthf2O+xuG5LkoIenG02yTYL4Bv3NlHSNBYrjVqDdiODgxEa2kmfH6vUi7KwxRpGrVuWjJkIvJsQ2Dtx4fXEck++WtCr4bcqIB/w+7wrppv1s6gHGqIHmQojnp7HImzs5Cv33yimIobY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097913; c=relaxed/simple;
	bh=L5T41Ha3vwVgec+LKuywfKYPQFYp4488ZbqdSqHolQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cq31sykvuhRkkTsL4wkb9wDD0xOQvpBm0J+cYVqhnAKsgnL1PoIiUyzCSuKQPIb3ULjFnodFIUaZuiogu3g4scT7sesKVZHSE4C9rv5gIukIR1Z+W9cD/C0wIz4EWzcc+2IZI6kNi268E35psnCTIOHtpfuDrAxfbrYFdiwT1QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n9k4Zg8F; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3860068f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097910; x=1744702710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfNXJpntX57p6p2HBzuwOXB3bKScNMDPqsKUXLptGlk=;
        b=n9k4Zg8Fzv9TYnpvkcRX5oZwtq5Gg4ZgfwQAQNr6Xh2uwyqAYzTIMObHXN8qCfbMnW
         XAZMAPleouJhR2ZrBo3yMcRJHvaHQEXqBuMiVRQ+yljhn7/1yh/zLDJKDOby+rtF4bJR
         y6RqJMHVOO9CSuZaPqgNn1RbS6y9qhnizMWfEU4nHNOHI/BtDGZuMyG/0StcD9ZRRKWo
         MmHxIjRusJe45Gj3AYeZjyRLOuOUWsD+4hnBXKJ1lvKNCYz42Zoc7GjSR2EzQ/lMLlpk
         di0/SPUoeUHnxA7ux4aoMVUBomYVx8brC6KfHgLoDNb5LJTbGMu6orM/GFv5X84i8NQR
         Zn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097910; x=1744702710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfNXJpntX57p6p2HBzuwOXB3bKScNMDPqsKUXLptGlk=;
        b=aW/lnTMWl+dc9n+43JJ4POZBUrvsHFtn4hNmx5TPeTjyYD3u6wtR685aWyN3Y4QuFE
         g4f9sUD76y3AdKFObNRAtP0eDoZUojS9bDOONHNZD1B6gS4sy/hQe0QD5qKY93QCcBDq
         gW5Ia4/g3umYRxk/5h/eUW6oYi/7EVCqn8xMz/c+ReEqElUoW3Pwkn5CWTCdhEtSKVIG
         52gYyvk7EjB32iLEgW3eoOiIm8tydxJsF9UcuKJvLbvabY5aV6HSjUlBOe00UbPB8TXG
         Kj9ETDx5a5zJnq7NU9rx/VaLkHp2L4LZx3UQOaPC3kWqqxguAT1OPZcTXZxidqLUoT4f
         JCjg==
X-Forwarded-Encrypted: i=1; AJvYcCXJijRQjLFf3whDkXVAi05Bd/qV/8IQCP+v3QkNggHf+mIYkLtDehWi2anUU+Oz7vUUwfQ2PJduKDvY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35ddKLPxn6kUwWxvC7zwMoOrDH6bfRAinX2WwZL6ug9mLDjmF
	HL4u5j6ddpXzpYAHP3VofIJXxwL8N8ubQhHC0dlDIk7nUg1wgXtJnHcYw+LTQV8=
X-Gm-Gg: ASbGncsfRNc9ARBIQP6duQKjzmIo85Ym2exkF26tbtmXzNUczBjJK/G2tbm9+U6/7vX
	4HyccuXUWYtUaww+ZqrFyVDGebswfMteNsxqHOOSQsvbBxaWzpqg3EZSuC74QPWyCFa2YJYerfe
	I6wsT5rnpoHFfyl0YsHXTm3uGCd0dklMEueFQClaK8N0boMFc+0egqiL+Q+Eje3YRY+e4VdfzLA
	VCFz6FdaXe+PJZwqR04hNaXApByFxtOrAwjbqup8RSClEe7BUQa1CUGVEEODhD/vC5C/NuhONEy
	fZJXJOudTbfsQ/FaSSA8Cf2ob3y7CaFlN1v3M9Vl8AMQL3P0
X-Google-Smtp-Source: AGHT+IGai8x6sYMmuQjTZlOAl2dV2nu2vKt8bzQLfSxIdLBY64Nk78lnf4JieYJi/KN4Md8XEpVpoQ==
X-Received: by 2002:a05:6000:42c5:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-39d6fd07bf6mr6383862f8f.58.1744097909723;
        Tue, 08 Apr 2025 00:38:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:22 +0200
Subject: [PATCH 04/12] ASoC: codecs: wm5100: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-4-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eCAzJxR7BEmKW+OrHCqV/0gcI/0bn9PMYKCV9A4MflY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJuHFaP+AQBZcqqOWYXn8VtjZ7+6YS5jQ2Yv
 iSsM5UIbTKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbgAKCRARpy6gFHHX
 cgTPEADGyhEutaHz5HSjjOvub/MGRI7gGFYns34ZiHnExD9RqTS2SmEQGPewtRQFwJNhqTdeSAi
 S1IFub04yf5rbWpFBOMWY1qWi7I/mKy0SfiLVDn503ZVYP0CXdluH/CtCjuVhMq2lGvN3zWSJid
 Bq1rtg8FjHY6PP2EN1aPEMhUxPeWI0nGfDAVarK/pREI8d872aah8LCRD+z4kKOy877g7aU3lL7
 Uh6pvQ4uCM0G/rC50TiN3SxT7lGkPLLR5S50MTzXqs5D7xh9TgT4QDilyP4qWkFcOlLPb0l7tWY
 Y7GQcn8TwJNCO9V4e8eeDtV0xT6MuA/FK9o6GWx/8kRwpqiLy1GbmV1BLAfbwqMGOk9/5RsZB39
 LKyp7SGgJqXBqNP3zYIzxHnB2WxMYhqFDM+2BVz1UQ72h/Tq/jGhWhvr8LzKxdm/bMRVQGixRWH
 nbW6ePGGgPuHKs1ZPh2vbE5PqpwsG7tlAkdCrpsrN3WNevF3t6E6yZWng0oA/bZ2K+eb9c+daCN
 oeIjo9NkSsOBnYsYdSMp+nOf3kIKmcUtOqc97wpPJASRfrPZO8TC3fAbc8UjXW+JrcNzsDJ2iWz
 mEumGp0stghYdQc2IYVk/Pj1+apmtveSSjjDqUCi8l8e2qwZbXLyWNx2D+DkI7VicdvKjyeauzG
 rSJ+aCq0NBIq+OA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wm5100.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index d9e5762324df..fb5ed4ba7f60 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2236,12 +2236,14 @@ static irqreturn_t wm5100_edge_irq(int irq, void *data)
 }
 
 #ifdef CONFIG_GPIOLIB
-static void wm5100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm5100_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm5100_priv *wm5100 = gpiochip_get_data(chip);
 
-	regmap_update_bits(wm5100->regmap, WM5100_GPIO_CTRL_1 + offset,
-			   WM5100_GP1_LVL, !!value << WM5100_GP1_LVL_SHIFT);
+	return regmap_update_bits(wm5100->regmap, WM5100_GPIO_CTRL_1 + offset,
+				  WM5100_GP1_LVL,
+				  !!value << WM5100_GP1_LVL_SHIFT);
 }
 
 static int wm5100_gpio_direction_out(struct gpio_chip *chip,
@@ -2288,7 +2290,7 @@ static const struct gpio_chip wm5100_template_chip = {
 	.label			= "wm5100",
 	.owner			= THIS_MODULE,
 	.direction_output	= wm5100_gpio_direction_out,
-	.set			= wm5100_gpio_set,
+	.set_rv			= wm5100_gpio_set,
 	.direction_input	= wm5100_gpio_direction_in,
 	.get			= wm5100_gpio_get,
 	.can_sleep		= 1,

-- 
2.45.2


