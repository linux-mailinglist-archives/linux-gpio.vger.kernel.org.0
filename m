Return-Path: <linux-gpio+bounces-22846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5AAFAD96
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3870717786D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C4828A1F6;
	Mon,  7 Jul 2025 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aWtqhzVh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94C289E06
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874626; cv=none; b=o8qvQCRm0tv8y8hhbwOIwRcJ5WwXHJpwiCLcBYAUgtbI2bIkYLXFDmZl51Ms20Dv6ACLNiKScHKjmF6MD6mevA+m1tm9lpmI8+7G3WQ+kbhkrvMvFHXRoLWOUaIcybN/lV3dpP7UnkpuMCjKKr9NwQGP1haVP0l/GpqNZfoc4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874626; c=relaxed/simple;
	bh=qrjnrOxmW45fhK7/mXNa9JDty8bZczGoHahJSnh7lKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPWF8sedZ/EoYzNXaqIm+vGCZa58kdmkBrSza1Ju0UI9PIb6Kdx4PsUaJMRJZWHPf9BUexX0KiNxA8TXllusBFwI9WnrsZytPgS9tb4j5tW/kpiSSh5l7ZKlKPxdk0QZ/yE+QVBeVUiPArJVlkVaHZm4X9EI5k+5gz+WZaz0NgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aWtqhzVh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso16558085e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874623; x=1752479423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdiCClurppsFxV5YxKYx5Kg1pHWscHH18i/Vt5HSlV0=;
        b=aWtqhzVh7nMGYzghehORoF3BGaDaWspaEuiuENg+7PACHy5FlP6lY7IpsnQjECYhCJ
         gzJqjvezS9unlb5l627dEvkLg3mKSoZFzlnX7jnJP+s3H379dLkT+8sDjC/o93Ou2AOJ
         gLJRmWAAco9kKA4/3VhAW2ouhJKjb22GKObTIzE4se8VJ1UkXYDd7xaBJWkeQftvbXkK
         sMcNlgUdhYT6ipfnlk8smU66GiX7eB50ErtMbvS1rUhQG1/sIys1wTTHtb68JWPpDfTR
         zcMQ/NkSZ+XtIUUHWSvUs9sSMA+6A6pBIIHaB2YlxQs/pOx3LYKYHHB3lASOoVHESd5W
         zSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874623; x=1752479423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdiCClurppsFxV5YxKYx5Kg1pHWscHH18i/Vt5HSlV0=;
        b=WE6TuWdZd2RkeJodUh2G5uyKnIh6yTpI0xuFCtyoQ+KeNJrhJZD2aYYTkalk44fnPE
         tjIZA82tp0Ifwtw6ofoCBmdwZgsDUP4H3xWYThn3zBs7yZ8JHFkm8vPlj7ESffdzoyjS
         eMNR/My+rKgRO+5W+w2fFMtv1iHRg+Sp0SIrvLBazUZuYzQbdC4MPIW0mLBYJwsQctRT
         KGMN/FucjjU5KeLnzfILOuw7CTgPqyUUxwizgWYPvNdnWIRquMUsL51h/E6LBkF2unTg
         laIKioD44hPnkhVk8jjjfi9Daw+pM36UEY5xgIPMSFl3fBC2XvrRle7ZgpgQU4axOFfF
         AVng==
X-Gm-Message-State: AOJu0Yz9+lAZh2jOAf01wHYV98UtFvInJJJORXCcJ3soQV/368SJ3jEm
	3Aenjen9Y+9B6KDDzKe8Q5Hrs5hGwYr4KAimDighLEd6bQDb66CXtmmEM/HxNYNWiHo=
X-Gm-Gg: ASbGncthgngSrWAE9RGgGSDQrcRtQEgSzFTm7gxdcRt0nyucmgcqWGv7yeSy4CchR35
	I0m+4rN7roSeZ+0F5XHdtvVDsp5wCkg50OGc40JscQYOBIka59q9TVtCo0tSK7bsLGpglAmS/s5
	DNJORNSHhwPAu0MKyMgMMCWsVOQYBTDIjpb+kMYAPpdT3J79gHWLfzlYEP5RqJ1LYrVA0m6dKvA
	fZ3a7fY12tpMZzBExKN0lhEcKJO/J5On2JuJ9YmbMH7BOpjorutGqhmwOHtkwCNjdJaIBMjGFwX
	hczwpZlhyyJ5sGwdxCAMcNSrDENRrjBcoEFNStZMVY+l8XvbxnSkStbJ2N4SShV8jJk=
X-Google-Smtp-Source: AGHT+IEqgmgxIURs05JAfURUG58d/fGTkSoIF5JMBPmDKs1K/hlGMbEHQjWnpi3xLDwDfjzJ7sz0Zw==
X-Received: by 2002:a05:600c:3f1a:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-454b4ec2132mr112400995e9.30.1751874623379;
        Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:15 +0200
Subject: [PATCH 02/12] gpio: tps65912: check the return value of
 regmap_update_bits()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-2-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+7uULFUSxltf0ex+UB4BzvFmHtS6LSFM3eN2nv7RH+A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6rlb0lKZwordYdSaGUHH6WK0vpLXF/FNE6
 xp5MrGNYi6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 ckQND/44rNk/9q1R3pU2Outz5DEqJduBUn/8U3Y1HOSmQdGKsD8tdU51T5SNnOeQ2Dd2PYxOG2I
 0Z5Lei5qjeqHDokhfnNQPfUbgQSnOQizLklwP3jkkWKYApDwyNBNbIUVM++5E7DUJ3pdwP3Eg4o
 n/HfqLvpgXbfnkmk5XVHECV1wV45SFW16SA4ii/gEaHUe5R6v8sxCo6J5xzx4EEHknlL9YaunVh
 3as6mh3AIsN+adKhxlHOxvL1IGhEyUSP5ye5RCbfhw0ikPXpd2yo3hzWexAV6HDGqe/ASqFlnYk
 T+J6RT3IZ2EDQlozxOdjtyITvvyctQAnInf5Hn8RLOa97C8/iKwhnY3Wm3mcrWUmvDg3adykPhP
 oz2mGgsq5Effp4JrGCfyScXay76uJwpzWNEFwNB2WEJgWtUdT3jXRXkKgxmq9bgLkg6SWCMt1Hd
 1ow1fsFiOtLq51Z2WQaMjTmrejwCuAYDskBaJYXXmnTJgyp6jsPHa5KRq57W7KmK7fg+jjT7PdX
 CnltUX1lL+ZtFCCpWPuJYgkn8odAcUppUxhc8LCqb2gSTfd55cMInxCRx5R065/1CepadX101H/
 lYsgt+hSV/SPOH4bql717Ym28hXOrQEHkNmRSrwZfhpvfEDZW3K+660pMyexHTAIn4iO0zFeI90
 GFasRoCC+NWTPpw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

regmap_update_bits() can fail, check its return value like we do
elsewhere in the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65912.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index fab771cb6a87bf05b1edc3c062f846bea70ca825..bac757c191c2ea0d103eb0577710065611fd79aa 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -49,10 +49,13 @@ static int tps65912_gpio_direction_output(struct gpio_chip *gc,
 					  unsigned offset, int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+	int ret;
 
 	/* Set the initial value */
-	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
-			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	ret = regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				 GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
 				  GPIO_CFG_MASK, GPIO_CFG_MASK);

-- 
2.48.1


