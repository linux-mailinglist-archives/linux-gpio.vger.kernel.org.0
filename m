Return-Path: <linux-gpio+bounces-18448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3284A7F6B1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC493AAFE1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4D326561B;
	Tue,  8 Apr 2025 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zpKGol//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497826463A
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097915; cv=none; b=t1WzDbtRWlRsWNeJ4uSMyMzUcBZK56mfDQkP+MflwxJqG4/CRk6CeRmScxHA0Lbo9/9UtUYMKdJtrBCkit8jDXAA2XqWi7MO6e7bhA2kFlVO0HHRBvu4c/wGn33j2e84I5f24LcTiqwCiIIMF8XrjWD+bUnP4cT+Q76NdA//NNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097915; c=relaxed/simple;
	bh=gmKssN881RyaMdbX9IDKos6vpe0C9x5lclww+lbf4e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1j9h7rMMYeAsuAvAUtBRW0/dgUAz3QqhjAKiFqYp9HGZ0buPCR44Jtj24sZEF5WU/00hVhNMPFbfh20HIgLrO7O3RYUFG1eEOYL/zjuLV2Bz0b1DUTV7mLoCFxycX0QOtwtFfrf4tWEO/5sqcQIkqUT4/LazNCOY0uVmMWq/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zpKGol//; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3860099f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097912; x=1744702712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQVmUT29V2vBtC9E+gdEFAxcap/8e4R6NNrtBDHE7iQ=;
        b=zpKGol//Mt5OILiY9yqXj2vaJ4bvigJlZ+KtIIfWpKOHQIcibL7AT2h5z7nwcgNBWf
         664teir3Gl4Y+XC2chp7oqu5MwKcEJpkoGImMKwdPKUhyEhggXNHPfKocpHhEj/NNMWa
         WWTzwkEH4DeHWkzXlHzFkoe/By8LA8rJazGlXvRvcJjDwLiBqEXmOLdXIIM+Soh4Mqi0
         xzZvIdyuf7rfCDsjmciLWlS8OrSN7sdmSQU79mk8TKshaj6oNJKFz/IdEbw+v7dcNKxX
         btH6xZa0ieEurCxreWDCsYvtKVwVSzEVkm1Jph86qZuRn1z6CBxVlTUugm20roSMiN+d
         FUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097912; x=1744702712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQVmUT29V2vBtC9E+gdEFAxcap/8e4R6NNrtBDHE7iQ=;
        b=nVVRvV7+YEcSLXBQizPJiIUFLAbKcmSxbEOuNY1NUZqdJqEqsI6/dOnixFnnXbiBAa
         tAmbEaN9Pv9aHFlGR4fT1tuZ9Q7gxHqZdKfVm8QBzhpcV8+ARy5vSRQHnLYiA3ZagMeh
         YIRsDkmAdISh9Ch84ulNTpYkKBFdVlxpq1CSD4I20B0+oFU4jSwUilQqP8M26fvEnO3j
         76iH0YhRE0sAe/bj8LxB+tF03J2yHLmKRaswBoRhPwz7lvobFR4YytI9Gl7+EjHXnA7S
         Q797WKXppS8vnaOuCIobMFcCDWvKKfK14vcY1CdZOmTiox6sExGeSFmGR2VgH1b7K7kL
         VTsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRd/qVcrOvlP7bsO92Zv1pWOsEN2PBM/hm11Puuz6YGeMLZx7JEive30iYqdij2HZs+FOo/OWhEowi@vger.kernel.org
X-Gm-Message-State: AOJu0YxyB/8h8kdw+LQ8hkWkU11Vv152t/3saaSCrThPpnIYnSh3TQ8A
	9kSa322jTea6/pED6JxQHn+2B/YYcM2gnW8kW4zTV34kMD8KgCyKG9eiyn8rZMo=
X-Gm-Gg: ASbGncumzCEN70ZsxgvLZR9rTDEyRsIIyMWXY/XcyEDgBKs0t+wR0raDbbDZnbyW6ZC
	Buyc0QkLUpGXAaR+XKaHnbwKISOnOdjoPlqjMopBS2dtuQrjBVMXA/r4+zWAdPO6N5ZHR92/t7W
	cRzA3W3CVM1suFoM6nL/dLr9HPpnJB2YtYoaKfU4zxPvShnSOrmkzaFeehQLeveyn84E5OWx4T3
	5r7k33OKOgwPNUoREVuagu6xMJMeKEx1ABh37lK3WC+kjRNhQnzZSo6vpukAR/LQQ8prtEVjjqH
	/G8N78D5oounHgKhCfoMLECmJAcanZFUUe+5xg==
X-Google-Smtp-Source: AGHT+IGUJn8Zq34HDc5Dha7/WV8HrI2iZCosrT+ksBpGa3LxTqmcQ7HJ8H3bhYBFYza4iwBG7cA9tw==
X-Received: by 2002:a5d:59ad:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39d6fd06913mr7779430f8f.52.1744097911839;
        Tue, 08 Apr 2025 00:38:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:24 +0200
Subject: [PATCH 06/12] ASoC: codecs: wm8996: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-6-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J+UXKSUM53U2y2pHQ+9DPWteN9/2otTFvDTKRKmiZUs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJuvYmZB5HOytKdjpF+bXv0ibp4qgHi/JhNO
 UlbOT9UwHiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbgAKCRARpy6gFHHX
 ctRxD/40q9HVEWkMEU1CQ2bpA1xLXRmNnYTvAA1+Rh9v+2slXDl8EpukoU/ntP7Zcb1HZqDmdHB
 As0sbr1Xthx002nsTO2ykfLst8E1tfhiQpGo2/YiirvAx5S4g9CAECLgVNBa3vpm/bvdxqP0ZB9
 YliQrDQSyolU+tdSU7F0ZDjwLf/9QnQMSEUU2NJRHe/XhUOJ6Dn31c/sAVhCD3/w5NjkPqNwD/R
 kgXonWNMNi0DvCJq83xI8bdTwID9JF/BdSM6mur2PPpzhnhiPYBAmoUWecdLm8VDKgjbdK1UF87
 rtIQJBU4lAbtxRiyn3p3qHPTmLNYDbnPI0hYRi6Mi60rAoqLZqIrXqmjkC56vDzVg+tajH8C9+k
 glVthIuYXvAblFH2dVsuWzFclKI4mCCtUweAbyQXhflJOD+XNdqkAgIGnQlFsY8nQ0/gYhZa/v4
 uGG6YoTTDJaO0cNlWiqGEtJVt/C7CZcaRJLtTek9DYqWHap+kr/vCEjP02Cv62+z/IOdCty3WwS
 mIEfGgYqsjeX99tBd6rWTZUIVqLLDoNjCHWgp5wZBrG1zu0PzIvpeCe9rTV1MgZdmtIrjE/8eG3
 phAnYyMls+IsW2vudz+FckW5zGScBZgs4t6oPuRhEXE2vnTP/6IPkkFQmyHCRAfOjl86CNz9gxh
 pnSNCdM+uwGQMgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wm8996.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index c2af8d7ecdd8..e364d0da9044 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2136,12 +2136,14 @@ static int wm8996_set_fll(struct snd_soc_component *component, int fll_id, int s
 }
 
 #ifdef CONFIG_GPIOLIB
-static void wm8996_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8996_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8996_priv *wm8996 = gpiochip_get_data(chip);
 
-	regmap_update_bits(wm8996->regmap, WM8996_GPIO_1 + offset,
-			   WM8996_GP1_LVL, !!value << WM8996_GP1_LVL_SHIFT);
+	return regmap_update_bits(wm8996->regmap, WM8996_GPIO_1 + offset,
+				  WM8996_GP1_LVL,
+				  !!value << WM8996_GP1_LVL_SHIFT);
 }
 
 static int wm8996_gpio_direction_out(struct gpio_chip *chip,
@@ -2184,7 +2186,7 @@ static const struct gpio_chip wm8996_template_chip = {
 	.label			= "wm8996",
 	.owner			= THIS_MODULE,
 	.direction_output	= wm8996_gpio_direction_out,
-	.set			= wm8996_gpio_set,
+	.set_rv			= wm8996_gpio_set,
 	.direction_input	= wm8996_gpio_direction_in,
 	.get			= wm8996_gpio_get,
 	.can_sleep		= 1,

-- 
2.45.2


