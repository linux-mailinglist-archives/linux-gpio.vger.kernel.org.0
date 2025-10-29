Return-Path: <linux-gpio+bounces-27801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7EC19FF2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B65D4647C3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25B3338914;
	Wed, 29 Oct 2025 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1ffMZes1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD543370EE
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736876; cv=none; b=HFde8x0sbERjLGL5/xkbOhsnEoEhuDqcSwz+IeomOfxWOfG4n8UDuiMT9G1dGnx8NcaO0oIfEw5mvlHdLeDHw4iuHRkPHMVt4srwfV4/g3nTRsGq2dzSBvt8sTmwk/dYaPuUQTA4V6uxH0avxOkLgygzolAecVl4zJNo1S4oB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736876; c=relaxed/simple;
	bh=wXk+3crOirlJJ3BTqf/pNqQ/QmJIbx5e9hwDeEFKhJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlNFwNOTF6fs/wpAqujJ/9OTWAM2W5kiFiA9GihhGdTxRdtrZ8QsmbaAej2SPGJwoxr8T6ln4emsmZi4B+m4Oqc1SVM7TtOtSZu/DcPtUm+h8L4wSfYk+fQ5bbRG9F4mM+jR6wUHzyIBpWXePS9ViHqdiJiG/hbl8XDf6dPZslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1ffMZes1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso5385178f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736872; x=1762341672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=;
        b=1ffMZes1mOU8fjR5o7wC+L01273unHdM0Mb+cyZsJ+3wUzEx+Ft3MEEL56PJxDOode
         /HuB0SR9xAgTzY5pJjKat0O+eT22V5ccFiXfhUqNLPCtE+dB2Gld/P102X3cMmGaTmVl
         y42s/dO1xeBhzqQ4PE3jS4rvuuVDMwwJy+R3esjwLF6maZ2pwXRfE2ZGBq9ET0kleItX
         28zh84HnXqYfv2N3oVQCo3FnrsH0MxNGd3kygdPOV2ylBKRfqsfBlG7erlq09KaEJsBF
         TG9YkhnZaPiwC7FYeMI3F5Dq0TVwqdPmrITyK8wzWZGkOyXgX7rcsX1sERKwsCAC4PJs
         g0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736872; x=1762341672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITkYH5qq6p2spjReXhvHRadCK4LlO30xMaO7HYP/79Y=;
        b=FrvZnV5TrxL32i/zEcRn9mAtfLIjFT4henqv1W2BMetj2fEjQ/DSauiZ4RmUwn2zaM
         X/9g8XjZ7e0fdVz32xH9M6ZdrkRbyjnUlk9/LpTozQ+o+7qaMi2ls9CLi3edc80Wy+Bn
         /nF4nJBlTKD16dVApYsTcO9DAaBJ+Cssxn1fsTklmCjI5rFXo+oA3Jrc46Avw13VNrth
         TNgcDhviA6AjBkPAgl+FfeGkUfpWmhpE5D/1U6df+6R5lxDNzCc0DwJpcOUJtZENJau+
         enSf2Ha3pTs/W9KN1dNFErvGi0pN+hh1Tq5mfWEWUXb1levsh8bOhwYYEL3aQyEtNeA+
         B6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNkE1xcgeP0jo+OzWRyV7VmRUTQxWxtkGp8I42+j3Zh/3yP+ADdEdJ79KTHrYV9+5+oFteENkClgSk@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/+prhBuhyXa0iE79GYtkUztZzpg0snVsalmPW8MWWjnlLHnh
	gLOwI1Ro0/YcsPusOYDlNb0O6BkzR6sJnJNJT0HD91McESnlo6cnmT/+OHRwi06uSz0=
X-Gm-Gg: ASbGncu+yVrrBv5uz88GOuCymdrlJrBgOsV1H7YWWHUvETM0pv8rtSm8+AlZRA7maGf
	QcUJ0Z2p1cEXmjlooFeiDW9gtYnQJlvhPk1KMtY6Qf5H+CrLm1Qk3bQJZQBPshUZK64JF4WqK+O
	z+oNqvNt5mkOTXxC+hJyX33x4g/FjhScT7t/pPZc7zK8v4IEbygnw8f35SBsgn0w/IDa3NUA6H6
	VUYzIP85JhZiMQ2YN12jFu+DiP8kRQX+WL2Wj15RGR5JM3gSw1gZq9OJ9Vx6GFfmSVti7YT0qjQ
	/XqTcfUp1X4EJ+32jEp0VmXOMQb6g/k4o3fmT+QRHXQDm/6CNdJpcz+rYyVeYPIJ3yfKe4ba/kp
	2/Y5rg7dVF3X3m0pW5eezQzoiDwTH200AZt54QTNtDhwBEWI2Q+xPrIWDFAptam80+eoHWc1qog
	WiEoFP
X-Google-Smtp-Source: AGHT+IENSqWLO/JMNJLWEfyUHP3Mjq4W26Iv0qEKH3r8OB2YkTy+FUkLuZiv4z7uvfVY/XuiHdrcmg==
X-Received: by 2002:a05:6000:4021:b0:427:60d:c505 with SMTP id ffacd0b85a97d-429aef78e49mr2088157f8f.15.1761736871599;
        Wed, 29 Oct 2025 04:21:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:44 +0100
Subject: [PATCH v3 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-8-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iK0ZywBEmfSVw6xPFQX6Oke9nUVZV1pPcQC7Xb1WLtQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXKnnAKknhcraojtkxn3HXQvIqfHbyL+bzN
 EXTvAFatICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 csiEEAC4y0Ps9nRfERWW+TIRHLw8qrds7gW3K+kxaWsNsBT38vOQRrALl8SNYm7GZ94LluEso9n
 SSL5AT5boIXTnkKpKhUsNmRhvoaLjsuUtlE1AA/iJvZ6//AC34+pn6a3lOlQZ/s8M5rvRUvNzCc
 /AUSqSkyyElorHQnZsVm23TiMb/h4chxqFQ1mzI1M2CaFDVugOHv3SZyOV5Yus7GI5c0uvt97Cy
 sWYE8PC4I3Io8+souZC+TdOkjA+DJuTjKURoijR4yUrYmiWAVyrz+0C9W9B7orM6U2G+o9DMJwi
 KQplI+8j/Hvq/9j7BdTbgEJmjhj6o3haaszRDVGGKcVhKQZT/hMfO5WOtpxcXUnGh0a9PXeCNvT
 ybgTvSQChRrkrZ/suBk7OAtLas9JNP/AV/ADIwkvT1Qg5YcFUQywjrBccQJaA9XrZ7dUQar+4NX
 plHV0zHPlCYaVSBIjTfUFKER/m41CuhFiKhU1CaIife+NIwemkfvoJNWoYcUDrMwT7Qx4H47jDL
 mUHV3+jE1kwsAHpCEE5EvjKnsgl43pw/R1IxgYaUrcDQxeyO3Bqy+8l0FvyCD9yINbpQNKIwPcc
 JtOZh2FqyA8AZW2dDandfZl9eVndB4tdKfVWQghb1jzvvn2MlVP5t04RU101IMPqdKH51lxIBFj
 yj8vFSO/EhCgneg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1


