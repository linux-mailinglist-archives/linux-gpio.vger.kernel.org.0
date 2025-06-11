Return-Path: <linux-gpio+bounces-21327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A70AD4CA1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88194189ED15
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 07:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781BF235BF3;
	Wed, 11 Jun 2025 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t2tscF6Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB67233D85
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626887; cv=none; b=YbLgfKNramCMayoCog/jbyoZsA3CJwH4T5hTUnOAEJrxVc4A2h1DE/lD8UT2D2ecG3SobXNYbuEm0Sw4bu92W4WSCNwSAuK20f7WMR46IIx1jaMLu1V3cgP/9/2abMnMEVp2+yjMRTs0LqDK4HB1y9kO3e4BCMixE5LfmvIsIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626887; c=relaxed/simple;
	bh=yVmzGgYzPpsvarSqDW2/PP372tTPQpqVJ+GOc/oGKWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuQ6IClMPGIGUFzQOHkgm70cKDp3jgxGgTiEgYPzNKXXKmIhrLG4eD6j6S6kprCL+9rqQAqz8Q5OwAr98kNOz7uYEyc5SZBzjIrn+aqPye33CPUokCg/BAI+bWriW98p6MkItmQUXV9CD2q03uBCy4FcBKhQnLuOOcysx8mbKs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t2tscF6Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a35c894313so5543421f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626883; x=1750231683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3EhQp70qH3zaX+UEuYmCaMSBeRCwsSI90EFC2bDZhw=;
        b=t2tscF6QXgaah1kmFa5Gaitt/k4Zuv3HHVjFwfIbRtISTnLEUHUFMrprgkI1MGZpBM
         Iw7RDDj7X98S21XHN2cTpi8vRV9gAkUvXZJLkOfyfVh2+491R3ysX+vIJrYKAB1Jp6xy
         0TJHCCzc9dQnBeT4b6uBFbGNRs/+55Bq0H9hsQcRGfBjC1eKxBXdkZdUwknC5OF3OJCS
         xTQuNILqKbOGOPY4uIO+kzgs+u9m1YLuFgoAU7gNH3yMJL1+6Mdkj81iYjrJ0h4rCZYS
         yrCzNry22rQu21Pzp0o4QNdluxS0QRI/JomArMm11rVlnhvILfGBCEu/CS5PQzekdnyJ
         8KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626883; x=1750231683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3EhQp70qH3zaX+UEuYmCaMSBeRCwsSI90EFC2bDZhw=;
        b=B/R27uqE8rDrzOHcqNvp9s4RtVyohFtYI3NVXDJzWnOT1YszwsVKs1S9ycgOTDRyKQ
         88+waoCMoP/5o1Zn9rPA74SyKKTuaAWsQCLWtRwBiBGgMsodGCMnrPxjjP3F27PeYS3U
         65KAvdCFaj8sqnYBzXq+J46Hvxw8jjmZxeA8Ta4e9QnmsVodvNUdAGfbU7Sng251PVDK
         N0NgQad7UZxrWgwKyIFxsuFH+Bwzn7cEWMiKaji40SgCywhdlL8UU3A4VtkRpdMvsHya
         oho7TV/GIPpdcAtHW4VDqCRjOydr2AKbS2qwuYtcd6vjlgKAZJIty9RNunN8WqYuDEai
         MJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXwyEKd+QFtEWclJj8AHsWGv+kMxe4JtfdmloTcJYwO5JNaAzO0p0EfI83ehT/+PvAlC5MdZjgJbHU4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzslm7OtyYNs+sSP65lEz6dedLIwzF0Yawy11eT2aYOSz5hE/GH
	B2OONXJOAPtGxJOin9PJkVJztby7B4ZNBcWyjZGa3by5JJdLhELUYs/sOovRAbRYAwA=
X-Gm-Gg: ASbGncuzCY55bYZlv4NcddQZDeD5ci/mPqFaSONmOmuGGhOutreLpEz0ZJRcHwaifMq
	WwBPGArZJa3D7XN7aXICVf95YRUfFniGTW+ogSqgDW5qZ0EJQHWV+vS4Dn275DaAlfgc2TseLaC
	HmFDtCPxq9EysyFGBlz/whZoJnvz1nNqkqagJ2f3nBChI/2fQFtEmPaatfzASJN6F+DC1Rea+30
	YsZ3Yy3lJBafNKJFYUZCNSRL1x3CVCd5Gk7tjUqLlvbBNZmkcd1+X/C7njQVtEJazgbjv6ds+FW
	3Z8M6NdmiU6WWm2MTK3Q9ifR5imDMesqroDRGiwYaFtF/xhVy87+2Dqfp1YyVRjy83I=
X-Google-Smtp-Source: AGHT+IGCOfI9OsABR6ZwJzn5YCmjzJfCM3HRsAqGAD69hOl0O0+GwNKUhrrHE4WyoxHmo7aiXOLXCw==
X-Received: by 2002:a5d:64ca:0:b0:3a4:d0dc:184f with SMTP id ffacd0b85a97d-3a558a1a8b4mr1463911f8f.39.1749626883562;
        Wed, 11 Jun 2025 00:28:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:28:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 09:27:56 +0200
Subject: [PATCH 5/5] pinctrl: rza2: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-5-ad169a794ef0@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W1QNIGjpDMxA0+ez52KTCBTigMpTmRu9JngqOUaR2S4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/9gl/0jI3xDL7vGI3DKAGtiuipeoZWlFZtN
 fATdyQNL6+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/QAKCRARpy6gFHHX
 chxwD/0QhzQJG6sxgN5aq0MeNzSbGXVbei54QA12GRaXDpZVuZJGjmsgVbjSM+gOXSYy1WxiGru
 sKq5AlY54se7FKoosLZBKtsyMZoV4a41c3XSKTBTWx3N9vZ/jJHVD4LSVVSuFtAGiyv37wnLlsI
 ze6JXWKUfOEDiNCRO0KewzsodL9XVjn9Ac1S4nhlW+ZagfOWe+Znt+Mokvjgk41+7MBHh2JVVLq
 CFpDDrlZOcip1Q7eB8eeNaqU63k6lGas/SIQ0WTAX42GN+GWFM8ZmNdDmaXWKyk8Yv1GCC6LiS5
 ZxicBUBQsYxl1BUx8xHU31/P+ZvzF4lo40VYpXzt/9UM0Gdj2w3GCNN2j/rm95R+lmx5B2xUAwd
 AOCsWIpXzewy/rKMeBrb3p6FGWDvULwRMSRWRc2M/guKRqZGhWgUVaIktSpOyyge6qrBn8Ob+0H
 lPmxDg81ZWiCE2dy8Y8jDnLizERV8FLXZ2EcQKk/yOaUcNB11ZKUp8xNFMysvO5Py+3OVIKypH7
 s+tCYPBsqrda9D3HTPGXhLi+6Hcjvw2Qb85reD4hhckQG95m0szQlUnbjcX+WY5csizvSamiCZU
 5oPJzly0uq345zi8uML+VzVMKjBhtLEAQqEOia266czsbA15mxbLjbPBK9TraviasNUtRuR/atG
 D6RIJz0zBD0KUlQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 3b58129638500eef61058e43e49e6f39fde3cb4e..1ada8852d4f1258bc955acb044e99c748d250c41 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -172,8 +172,8 @@ static int rza2_chip_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(readb(priv->base + RZA2_PIDR(port)) & BIT(pin));
 }
 
-static void rza2_chip_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
+static int rza2_chip_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
 	u8 port = RZA2_PIN_ID_TO_PORT(offset);
@@ -188,6 +188,8 @@ static void rza2_chip_set(struct gpio_chip *chip, unsigned int offset,
 		new_value &= ~BIT(pin);
 
 	writeb(new_value, priv->base + RZA2_PODR(port));
+
+	return 0;
 }
 
 static int rza2_chip_direction_output(struct gpio_chip *chip,
@@ -236,7 +238,7 @@ static struct gpio_chip chip = {
 	.direction_input = rza2_chip_direction_input,
 	.direction_output = rza2_chip_direction_output,
 	.get = rza2_chip_get,
-	.set = rza2_chip_set,
+	.set_rv = rza2_chip_set,
 };
 
 static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)

-- 
2.48.1


