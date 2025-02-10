Return-Path: <linux-gpio+bounces-15678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4CA2FD64
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D8A188659B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F324025EF8F;
	Mon, 10 Feb 2025 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vujvn9q1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777C25D540
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227077; cv=none; b=jxSsqwt4ZfB3Rsd/64CbYJ7bfnaQQcG/FKFdPsCWb4VvgQELn4BNzbIx0Wr6/asbNbhM6tGvhAlzAZkoAtGOZ0aQQ5FPZXaVoiWgel1HwHgTpBgJDU76Qi03u9uZ/lc7t6tZYJv8IQh1vr+P2QQpirc9Kfh8dtHSB69TEDQbApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227077; c=relaxed/simple;
	bh=DEtDLgJv5UYwZaak4CnPj1ALmi7rrV6hWuddp/nLJio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXYU28OZa19UtOKS6povsYxFE1b/sECzArbWDO8CfddkYAPyB1AZdPxpDJNdkaOy9FQrRdENa5DytKLkp1ibz6FPK1xJx3PRowoIof8ha5KHmNgSiaNjla9zzsXS5eV51CHH32pjXOC5TQdngD9Eum694MwH1vOoLwbh78F4Ekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vujvn9q1; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f314ff6ffdso2853776b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227074; x=1739831874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMcrxDurUnSK2SHairVKflMalwdh2XVxdj0wjaWv8sM=;
        b=vujvn9q16sHkCxjODesonUK7YfToaWCovqp1meHYAiAMGuxuvuxvtjgT7kb4u9Rr6V
         swRcw0YIojKyBSboU0wstCJdaRggX8BRWH4M6uBpGT8p1fBitXYbaydpvLWzCEQjAgyH
         NK8GDJF94FCeuET5MshCx5YbGjJaWqAgw3WdWfpWFRjlu/QtI/QggzM5FO97TiYmaxBz
         PAABk2lpH9oFI0pUI/2JkcpFJHdPWUeviNglFTcXNGwMqsgsZIHJYDsnSsc9LP95ZXSs
         ERAcFCFmZaDh5TkuKpoMUw8CZYx5ReOtYpGtHricMbLSB2JZJizhsvkfgo09Zkf0S9Pe
         pc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227074; x=1739831874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMcrxDurUnSK2SHairVKflMalwdh2XVxdj0wjaWv8sM=;
        b=OKHNdlvveHLnVfEC3YgGwkBX1GU2nIgSV2iWNiUQ1KAXb6qvzpUVGoulLztY9ANAhw
         2VAR3DmKYIDQP7jMSqFg100dmLR11ehFEBRZwW7XyLtqdqldHs9YH6glOTyk05NhsHS2
         cpgFr5X88gZvFaEzFXKGl8gBKZZZfOuYDJazSMTbUBhIqOBcH14qiW3bFdcUalLG/ubP
         zeWr3L+WjgDNy7/6O/gx5eeZKmw32CKLBj+JhsmY0QfDRQAus6jGMxiyfqBA0IbHVA8J
         EIqndLLfl00NoWW7rnO/ZhQp33VMOD2WvyD6/72UikS3hlAzcorsqEZE/vCQOFQA3yxP
         gdCg==
X-Gm-Message-State: AOJu0YzJe73N4Rr4YDSi9aCE+i4qh5kbH5sI7BNPsOmeH1UE/hjF0fvx
	nqxXckJ/Q0vR+Zp5D1khoG6pP1a/r0vJPuE4X1nr8V9CCQYwtP5ONGb7g1PTcow=
X-Gm-Gg: ASbGncsljbiAXvuY3AkiwQOIjW7Upvt7Mka+sO1g9/P9LckhvpWFPrXybIltsvfkpOU
	bxfXY+3Tpd4Et9Z/VF+z/30w5z8YmeRi4NFGSGCmbCnWdgRLPvhJu5EWJL225RGk4Txwep+HKi8
	2Xzknc8YoM4d45gZG80CbFoDp95dLKsL+/mZCgbxyoJ47sxxLcnUxgvl7r7aQqTFEC9eyDvVC4Q
	ORQO0ACR89J9O2WxYfhKJGTumJg3ef6o9MVB9zZkoUC0YeY5d6XiSpamKdj7tFoSemzSkya83UP
	FbdBa3pRIYXc6L0NpLjAzer93v/i9UOkXtKgwOB/kyzyHY0=
X-Google-Smtp-Source: AGHT+IHpQCMO/UtYCFM9csSv77tlAPoKshLmX0/bTL0+YDtp28Q6Z4e9EVZz3B9NbqVlL1P+vOnPrw==
X-Received: by 2002:a05:6808:1a19:b0:3eb:39f5:de8b with SMTP id 5614622812f47-3f392362d24mr10975894b6e.32.1739227074492;
        Mon, 10 Feb 2025 14:37:54 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:53 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:34 -0600
Subject: [PATCH v3 08/15] iio: amplifiers: hmc425a: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-8-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
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
 linux-sound@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Passing NULL as the 3rd argument to gpiod_set_array_value_cansleep()
only needs to be done if the array was constructed manually, which is
not the case here. This change effectively replaces that argument with
st->gpios->array_info. The possible side effect of this change is that
it could make setting the GPIOs more efficient.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/hmc425a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 2ee4c0d70281e24c1c818249b86d89ebe06d4876..d9a359e1388a0f3eb5909bf668ff82102286542b 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -161,8 +161,7 @@ static int hmc425a_write(struct iio_dev *indio_dev, u32 value)
 
 	values[0] = value;
 
-	gpiod_set_array_value_cansleep(st->gpios->ndescs, st->gpios->desc,
-				       NULL, values);
+	gpiod_multi_set_value_cansleep(st->gpios, values);
 	return 0;
 }
 

-- 
2.43.0


