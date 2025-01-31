Return-Path: <linux-gpio+bounces-15152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E9A24404
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 21:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A29E2162EF1
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 20:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4D31F8AEC;
	Fri, 31 Jan 2025 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FbeReIqM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AEA1F892A
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355122; cv=none; b=aRmtDyroIkGV97haskNSAen/rjdi0Lt28acOLzLYFXk1Je2aqeW6u8PKqeafLF51tkbzEoJ3dKbCf+2deT7RlM/NJhquiCfakJAeVYO5P+yS1jmqXIMlAwMB7RO5XwfNHmwDRsBy22Ar8pCQtAdPZwQlIAxHZUbU80ROENQZaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355122; c=relaxed/simple;
	bh=Q5q1Cf62xGuA/zV0+TKjafPv8tjFCx47ZmXmvjB7zzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htJ5QfJjj6a/lheL+QYYTNsPQ5Yir5Zb7e6O2aYXsCVSl1FPm1S83GHCE0hAFM3etmU6IPHgBxjhSc3IWqnYOY4NbRkTu39pwDbc3lXOZbp0gFGXnZjoLDTEtEVau1qr241vuWzjSRlsXw0fL3YNyiCtQflw8rJKZdwRGAVaTO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FbeReIqM; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so1421549fac.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355120; x=1738959920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9cxGVlfrmOEOQA8LocUnneYPfclUeeeatGnfm6leQU=;
        b=FbeReIqMO8vnYpLBMq/tCQ0Wzeek2MVG2PLNB7Yw48XmSR91lLUE85YYll47wHcuEu
         KycvhEOn+wigv6T6KB/XPC6dioLkMKuCOjMedEl4BodAinW7aFP4eqPQQ99l0fu3cWaq
         gL2G84kObRY7oQq7XO76+72cpJntOeMqOKS/xffF+kT00xJqHKfs15kGwTrKa/ctI3TQ
         77d0pr/L9NTJqbNgESKgZy83jyDmvTaegIUUhESKXVJFQSNXL4ADZVNr2ACMFqyVI1q7
         uISHy0u6AS8n/eTyhSwV2M7LS93hU2/mUq2Kkd/UVI0onUxYS/iy/TL1dPzrw+s0oVxw
         cz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355120; x=1738959920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9cxGVlfrmOEOQA8LocUnneYPfclUeeeatGnfm6leQU=;
        b=XTZ0QGvg61Wue9gDYA6y8VzuhtIxpqFSW6GwVEFnotz6n3J0N/U2JCcIN2OpDWQihn
         13m8eTMnHmvJaF4OD2gw8B+eH4Mrykt/pgyOqhAoEBcVyQurVEGy+RQs+bmbGmLxn1EO
         f8mVhafTDVHsUTQsOs6N7Jjko7MAcR//zf4je8Fv6T4TJLIyzpNtI1+zb9omkBTEeceK
         jr5ti3ZLHz9qRXBZo2hN8+pTH+9D3x6qjstqWABb15VUNHJqeq8IjAvIPneXv01jP2nM
         WwoLfqtGUzfG408SG/9XO6SB9Tuj4ChvhpxrQNUWY/KuZKTZoxZcXKB5+fN4fJX+1Vi1
         w3/g==
X-Gm-Message-State: AOJu0YwdLPw8Kp+g6pQ/gexUnbmxTVlNVxfyTeSbJtI+F8FRzqOU1zTo
	aygQ9u3oQ7YXPTGEKzzeXxrbbBuzt9mlICLJiJweKgYh3m2GrxPuiNTj/+em2zU=
X-Gm-Gg: ASbGncs/qi2iJN18eJ1RTxeKSQZRXy/qOkZiC5YWQlDk8lH/BEKzrN9AoSR3NX+leD9
	avHRiLqu4H6xPPdRY44tKOptXwCahp3yrzFxmkx4H1k4Zeb/U/vqPYYnxzyzVyXosFKSREENnYl
	fUIW1s/+S9g3scCUEMUOzvT2wVifoH9ssK5nnavyjmoFde4cxJgtTOj1o5nG8LjQb0k5L0jADR8
	K7hGZRHjIve0SHzlDY6HHj66ZB3K4djvRxt1ed/RPyDi0uSiBStCHp9PaPTvNfSqsz/O3kvXgwE
	Xx1y0k/6sv+lMctltBkQs+tMV1JzmOYMF6TJ58xLaFhkToM=
X-Google-Smtp-Source: AGHT+IGqg3uaTvNfsfu96auAGMNqMTSmH6qy7PdoMmcZZ87lNXJHf3Cu8HBE7iXbpxe/5j7p/ZYumg==
X-Received: by 2002:a05:6871:209:b0:29e:20c4:222e with SMTP id 586e51a60fabf-2b32f2f8592mr8795453fac.34.1738355119837;
        Fri, 31 Jan 2025 12:25:19 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:18 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:53 -0600
Subject: [PATCH 13/13] ASoC: adau1701: use gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-13-991c8ccb4d6e@baylibre.com>
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 sound/soc/codecs/adau1701.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 291249e0a2a32df7dde81904dce2f6be143fc2d7..d3e6b2763950f78143c0feb07c36764cb265441a 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -325,9 +325,7 @@ static int adau1701_reset(struct snd_soc_component *component, unsigned int clkd
 			__assign_bit(1, values, 1);
 			break;
 		}
-		gpiod_set_array_value_cansleep(adau1701->gpio_pll_mode->ndescs,
-				adau1701->gpio_pll_mode->desc, adau1701->gpio_pll_mode->info,
-				values);
+		gpiods_set_array_value_cansleep(adau1701->gpio_pll_mode, values);
 	}
 
 	adau1701->pll_clkdiv = clkdiv;

-- 
2.43.0


