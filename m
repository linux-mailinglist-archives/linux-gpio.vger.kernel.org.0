Return-Path: <linux-gpio+bounces-21694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2324ADCB6E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10AB617A488
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2114A2E7F1C;
	Tue, 17 Jun 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jUlnkfa1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A3A2E4266
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163090; cv=none; b=uha9zrqTywPihGb4mHnVweWcZB7lp+s29cjBn83O0Rf7vvM1euvOSbDL95ZGkrbS0a/i533TjfFxdR7uCQfmX5AuHH1pSv+zZjjbdf6PMMNYiLPojOHlhhsLwaKSoPaduUkczevwKeOYPdh6HRJeH1uLlNs8DmuByWADwLg/JZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163090; c=relaxed/simple;
	bh=J4/swX60dxFNnGyRxMTrvcRjJzp/EsyWsznOiUYARZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QB/ZXr/o6GMfy1qd4YEh1pzAyxSiIGP5XuJJP6gAv/K8iRPDTCaveky2fo72xb3qmUqOwKDx2TAAxvlfT5W/eTpGyXHcY90vTkqraqQxCUuFuhYpYvdhptTaBZ+zXncbeq2pkMwJ+ucRXT5AxjEELkAAde+igdYLf0Pj3qwAoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jUlnkfa1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso18551325e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163087; x=1750767887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=jUlnkfa1GMep9Gl/vtPRK1MlIvwrtzdFlHtzYS/xG7G7H+tef1OByINB8vV1dF/Xj0
         mPzWF3NOuAHZqAS0d0OTAmfmkAWIlyH/jPieXHQKGxwiTeEMYOX4JAjghBZZvHnH1UoR
         AWl8CC/WKl4GqzmSP6Y+GcP/PLyoHzcORsKOH8TsaDovfH67hD5Ct3Nk8YXY9Wi/iS27
         CZkfXFDG28j6BjkFT6eB+zpSJhaY+91/sOI5ilZ3QC26xEmTaKUQXdvCxA4AtaZAhYSn
         EC9oNXj3KpdZPf96UXhbjVHBfI0HA9FB5U4y5ppf4aKT5KijRHPK0Jidp0rEIzAhEd+S
         oSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163087; x=1750767887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=A5PmuB+2SuU+aIn+lKyxdMzHLuk5kfqCMmHHPOz8cWezGuGTpghwSWc2IKqPiLJFon
         7hXn+df94x+TSJGzB9RrEVi1ufFLxaqloecVS0NJbY+T0yf0GK+/EiS8Bnqjihmo0xLF
         QF8J74UVy/KjuJDC1wcsqw2LxXDk62gYPndfvHAul0smIFR9JWKrT11XEKtDcxYTP5MU
         8yQtf5DbTeV22jLkv64JY2Bo/nagAzXvwTXJF+msiwnzQtaWNlfBmUU2xVx/AVtZcECB
         UD9YCC6q8SHwxN/rDYFtK+TgYkwA2cROrhwvjrviBvtgm9/90XkHXk/L0g16ldy28P+H
         sqsw==
X-Gm-Message-State: AOJu0YyK87r4oXNkg3zTSqbYj6qUWoZdmfZ2wrJB9tMVSnOv5Ip2l7Zn
	uMuK5j0oOy3fYXvODN3at0I7YRa2HI5mSN8OK24Le7H/CClvEsOtOz9i6RrmSz4+gV0=
X-Gm-Gg: ASbGnctRQhFstLKj5SPccP/n3ALJ3jhYixCQUT7gCzjXJyn4TCR/whp4ImHbYcn4bzt
	gll+j6PUt61CJWhYOpt9mHMNd2cx8kyHYn3FvWH6hA3cNgMpPSXJjvfIHA1Z3R1nt8wheJiXmMq
	0azw0PGKiJgW7Zpzmro8EBfcmFTnFlV/GAH2Yhnb2XHRXl0bvECKdlKS/9AHcLL/nkhbZaHpIhw
	yIB90u5ANbqv/cGBw2uD5JEm/UWDYDcHDJSFZLxlGYoCdA4uhHvTHs2SQWTWsycTqQeQOJDWmlx
	BN/0ScViTMmeyXGrFtrR6dMpJvfMyqmk5Q/qhr2hwWZPAa0pbn92jaZeyuhevTUhpW4=
X-Google-Smtp-Source: AGHT+IFSaiKVtjNdh8JpqeiVYaqMnisnI6PtZWZir+IMOwFShpzWggv/UUCBrlgK4mkCKC+HFcgJ9w==
X-Received: by 2002:a05:600c:3513:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-45343d2c0c4mr106531565e9.12.1750163087329;
        Tue, 17 Jun 2025 05:24:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:27 +0200
Subject: [PATCH 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-5-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U5ElyLmZBGysFJL9KcblCpbMCuSewiTUa3oGkohc5iA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6HxHcn+27NvQvfcxrQSoAF+rm4EBXSaiw7O
 jAF5IOHFY6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 ctlqD/4/gbxk99tyQvyLzHrNJeGi24mjwUKkq1j+sQw6ALbBKzoDHmqfnKqIY8OLsCHbUTg8o7H
 WLpHhDv9MDocmKEc2xnBGqdhca8950X2Yw7bJ14AYGaBSNTk2gbnCqPtgwCxyzlGYRTH2e4qSDT
 d0Cqe9mnV0B6Rrrt5aNj8rKTVyt/J7X7uPyf5GAKS8TGO6IUfeQrCewVvHCaCo5NV9pJNG6ejEN
 iQPSSihfNWTzD6SXCjk70tmDN5zhvZDdNYThNj59HSNoqjfynIzS5ktlk6soYs039DHLCVH45NL
 QT5lHJ8hCpm3bAB3N5Lj6YOARL/YSGhm3r/8VevKOB2pp6aaKrKDSN5WMbqgW2WMo/MuiSEmIsT
 gLFIvF8uOCFS7LarA2OvuO11JjHzqQvEy19zMNxiiQYBsEQpsuufELBACem2g8XBOK+GKNUyvqT
 6MF3nTtT8HvTgNzOJGNQ6y6KlOKhDxOqJmi7ry24bP5A2TOapEP02tSoPwvV3cPcsI2DMzYbPSs
 epODKf1eCc4YqOEdO88F2YeJssIJEhbYYpsdYD1zTNxub2CPsZ0qfXV4Hq7LgR1gJ+Dt4xWWa9B
 ZoQi9CaF4e8a6170SQtMrKrtUuDpeBEPSfBGUNIbYbrFnJM6jvj03wxdzhaNOuGLSSRpHY/MCJe
 g3QUwGjaBa2LvOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The lines on this chip are input-only. GPIO core can handle the missing
.set() callback so there's no need to implement a dummy here. Drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index d9b228bea42eec53ba9d0d0945125f530a22946c..cb015fb5c9467484022723910354219e2c98d3c7 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -109,12 +109,6 @@ static int sprd_pmic_eic_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void sprd_pmic_eic_set(struct gpio_chip *chip, unsigned int offset,
-			      int value)
-{
-	/* EICs are always input, nothing need to do here. */
-}
-
 static int sprd_pmic_eic_set_debounce(struct gpio_chip *chip,
 				      unsigned int offset,
 				      unsigned int debounce)
@@ -351,7 +345,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 	pmic_eic->chip.request = sprd_pmic_eic_request;
 	pmic_eic->chip.free = sprd_pmic_eic_free;
 	pmic_eic->chip.set_config = sprd_pmic_eic_set_config;
-	pmic_eic->chip.set = sprd_pmic_eic_set;
 	pmic_eic->chip.get = sprd_pmic_eic_get;
 	pmic_eic->chip.can_sleep = true;
 

-- 
2.48.1


