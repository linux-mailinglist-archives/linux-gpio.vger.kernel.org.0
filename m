Return-Path: <linux-gpio+bounces-19666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3DBAABE1F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80D63B1434
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202F826D4EA;
	Tue,  6 May 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bMiGOidQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A12690D1
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522121; cv=none; b=S+PaWgjkymQ3mW/R9591LQJaFyewbmv7xUlmETgLJI7er21P08beurmut4UjPnN+M4biC+EBOu3smRula0lAKFUtkYr8shaIMxS/QNf4J54uGtRp+hsEFfmCX3VMrD+aJIiiWRSeDGyk2s3nJJjwtQuiPEi+LSuMcxvXqCOUsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522121; c=relaxed/simple;
	bh=/euti+QuooeNdB+WdZUjDlGE6JGFo/o5Aun83gK9Nww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pR2F3+XIiLRT/E8v/Sc5nwZn1wiyf0ERa02MTOEHbb2Res0BELYSMysM7lxvgCEILROZYcKHLmrL7zeqdHuJuM8xMJkNBPJrWwF4Qx2n/TddQebnevRRMajt5iugAyeV292ztf7fBdVbIQjBqQDmJpYkytxlvGwn2OS3jCSK3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bMiGOidQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf848528aso39897595e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522118; x=1747126918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=;
        b=bMiGOidQ+oEdZHJ/IiwTPDM+zhtGtrmvnbojczCBzeLJ7ejRe159xq+RSLhsVcz73C
         bK0XcwJeWl++EZPvtvs32B7aJBt0gpOoVhZPiD2dvF1jjYt9LGpPHaJ5zBv7knq/Yl0w
         XKSm9qqPY9Rb3RKgcXB7p1pQcGUdK1bqKBM4w/DMyz72mCdS39NFev7Kxytol1aRxNqP
         R3A83QbxvnvLixgp4WQxEcKyE+zx2lQDSWRyMpF3oLjxOnVOVllZb5iDgzVwxyi96ADQ
         jMgL5cvdzQyyiRLE/+/vsgieUjpHFQ3RmDcH19cQ1LtLZtm89E+oVUIgzRP/jkqbphu5
         SnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522118; x=1747126918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=;
        b=XOmppMKekrFp7jMMqhqnw6tbP3upDrd2dnRlJPGBW79yWdVk/4VVBQu+ox3ngktdJN
         LIGxecNb4oWV1MCBrbqEjQfeCiYwrLh0JzQ/KYrPqvrHasOzZCZ9g0MOfrQtj1egQODt
         MFXwJ7YLKw+T3Dlt8tqB3w2n88R3oK48YKW49A7casRfT1QqLWqwNpDTXMQICXDSEd3m
         rMdxIiK35l688lYmgiBBfgGKccNs9oB3NC0UxuAZ+mCl5INGFHSaQ5eDQxRsZjxaTD1h
         JrsL/XP5KxLA+8F0jt4moDD1Hr9Ub+zAu1Cyk69QHbKzkTDTqcDQfKqxeOAHfgJGRGDD
         6zNA==
X-Gm-Message-State: AOJu0Yw+UdclFvD0rsqwnUjNkE4MbWZmH27CUND7Vuye/c4YmNxBPIkK
	KFyPajThHRtGR93aKqVcvDxwYHCU5lYNhioPtFGV98SEmZW5iLGrJpBxiFfYzeE=
X-Gm-Gg: ASbGncupKlSkGL+Bi6/yR9/GciQG12au/Rty1qQMw4+ZY5/l0g5yo4naKgQzPU/a4xE
	ojeArhmjzsc+HNVlGctKPB05jnNfZFtN3cydITmwxG//h343d20NKfjab+NXMijiDJA4hkn2COY
	PLCiVpy+2BDUOhMCmvGl6nBVoB5SguCRGdUO0q6zgAV1WVhAqugLzJ42jjccy1nnglxq+GOF1lu
	ox9C6wnmoLqfEsZHJMC8vejQQmvntoKnmtAKbFKeFmFJ3+aHFP5aN//WURmBQ/kd1Gp74aEcakc
	dP7MErVKeOb3P7A9SFmfRZaFjnpchM7KjVQ=
X-Google-Smtp-Source: AGHT+IHlrqVIs5Aw286+uquukoDPpnOG8CuGZuW/5Q7O+V4/Xk4pBW6x/ZhR+RATXx4lWatFtAIZYQ==
X-Received: by 2002:a05:600c:3c9b:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-441d0fcd574mr18810665e9.14.1746522118135;
        Tue, 06 May 2025 02:01:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:48 +0200
Subject: [PATCH 05/12] gpio: madera: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-5-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VRF/3N1EVGTtM6WG9zf061j9Cu7jjnguKsupmm1lpOk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9HAJpDoBjHPguAUrkQ2bywcX0IE4BkH72+
 gedeertAESJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 cmW4D/wN/rp+VApidRjxuIIZZuw5p6GCIcK7pifUdrQJgNqrwknypL7yMfOuZhfzvGJtf7Pt0aZ
 ANnCXCR6wj0ZptCeqhSAN4cR+cB3sqy/D7AiVjPwEF/dHzLauvNZviX4DqjpkfpZ/cHVp61q5cP
 pS5dluslaLUqUlJhpN47WpCdZAfy0LEyMgGPjyjWJvB7+m3kTf6il/Pt22y7Y5QJkqbLp2rvsIl
 kYltmOq2+ZDnlt+FTSrM0zpOBmnLsOe9lmXeeSlIlb8wJdbOtzLM6aAKDcNj1UrOUKW/6yNnxrT
 HKbqSA3kIr3QGEE29jBCD8sdNysAsSYvXIr0BSmDJmVL5GZihzsPl+v4ghss5DB5yj7HJ+P6Bv8
 bThnZPd+f4niokXgcKGD87GalnGPCESS63IjePPCIQ//CLa9cgZMWIw3drkFkYZIROYxscxwf1B
 lPIwm9ptXGE6IDQeAYZckd2EwXftyWs9WBoC9bHaQ+oxeOxLdqmEqqHqofitTxT2r3iBGEDEXba
 tFcGhWZyg5Aac7bGW37Qs9QkLEO9Q7pf7drBBnXLqux2qfVqCU+HY+oebMQc7MmO2DSAqGvPQPV
 a7HASDWQuejDmEfxkjjye+/Aj4H3A2M9Xhvc0BqfgUB2pXj2FvhWMKiRqisY+FrAzGjcASUDc05
 p3o05soZ+uWZTXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-madera.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 8f38303fcbc4a..e73e72d62bc8d 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -87,23 +87,17 @@ static int madera_gpio_direction_out(struct gpio_chip *chip,
 				  MADERA_GP1_LVL_MASK, reg_val);
 }
 
-static void madera_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int madera_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct madera_gpio *madera_gpio = gpiochip_get_data(chip);
 	struct madera *madera = madera_gpio->madera;
 	unsigned int reg_offset = 2 * offset;
 	unsigned int reg_val = value ? MADERA_GP1_LVL : 0;
-	int ret;
 
-	ret = regmap_update_bits(madera->regmap,
-				 MADERA_GPIO1_CTRL_1 + reg_offset,
-				 MADERA_GP1_LVL_MASK, reg_val);
-
-	/* set() doesn't return an error so log a warning */
-	if (ret)
-		dev_warn(madera->dev, "Failed to write to 0x%x (%d)\n",
-			 MADERA_GPIO1_CTRL_1 + reg_offset, ret);
+	return regmap_update_bits(madera->regmap,
+				  MADERA_GPIO1_CTRL_1 + reg_offset,
+				  MADERA_GP1_LVL_MASK, reg_val);
 }
 
 static const struct gpio_chip madera_gpio_chip = {
@@ -115,7 +109,7 @@ static const struct gpio_chip madera_gpio_chip = {
 	.direction_input	= madera_gpio_direction_in,
 	.get			= madera_gpio_get,
 	.direction_output	= madera_gpio_direction_out,
-	.set			= madera_gpio_set,
+	.set_rv			= madera_gpio_set,
 	.set_config		= gpiochip_generic_config,
 	.can_sleep		= true,
 };

-- 
2.45.2


