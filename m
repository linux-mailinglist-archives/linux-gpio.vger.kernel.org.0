Return-Path: <linux-gpio+bounces-24905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09649B33BA3
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381171889192
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE5E2D0627;
	Mon, 25 Aug 2025 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tyCgKaY1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9F2D1319
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115340; cv=none; b=bNgb3raUPRbfwXxp2LqchUXPb/boyaKMz6HpfPhhZaWh59HQ1TOWS12hJIMId2mRTYBn+Bvj/IEVyIXOH79+PQLv8yHJrkCnJwNAmWGbrJy/RqZGPx0/bY0j9QthXJRPXH5sE40miJQrQC5MiE4VAgHJeSk7ESR4NLCVCbYPZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115340; c=relaxed/simple;
	bh=S+8urmUItItM/xWiVUTCqmdfALzfBJBt4ua9Tu1wW+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpyS4YzHZXVvLi+LBFfjD0wImnRlp0daCZb+/VUWMD9emLWTtU1DCmcZO2AZx6j1m1FS691RRE1mS1LKFiu2HqLl6ROQqtrzvglgfrOznhtOhhrtwdn9Gmy263gf+k6p5/qt7EOtxYhix11ZDnCwFskEtCskvDGg7RXv6SXBsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tyCgKaY1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so24108455e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115336; x=1756720136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=tyCgKaY1s6eTO0y53n61fGn1xyYaUh1jSnaiQbOotK8MNIvZno8jM6JToTfORSLrkN
         C9xltPdJwmPo/TDg4aTVIEO8/z2c2Jl3o2tTn0bh0ErYnywukbyGwvRRzep/IBmeXP6F
         V0iTjxQy8NBHH9C7RXCUY8DqwAvtg4Z7khybj/HTaDASFGP82Qnp7ajTJNG7yM3Oi1a7
         vyC1Yi9JrVOog6QMN8B5wTs2f4kcay18E1hWp/No+9tTxifPyLfnly/VQPmnrHB9X4bm
         wm5BfkM7MiaVuSeTlTLBxIuqC7BgL/Zyc3m890gg7lnPGR/mWuqHxoPy6AgCYbu70Ya4
         pcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115336; x=1756720136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=joyerh7dwWOCiqnw0qIjgJIe2zTeReoPaq8vkcDBvyvakRUgw3bhN0xDPFKI78gQe5
         9VD3NABVAOgYIFPirNzP9/pLUwez5d0Qu04/qzkXeHZ/Nk9FO15PWteufwgAibBSfaXL
         WozZ2fyKT/855tqGa81orTILqksa8LWMkvNrgQn6ky0bN5nQMSA4oIyN9o8b0UAGXmKq
         d/r6wSpRNhfNgNZOlO0Sas5X0mPbW3PeBmRaSdCtdR/U8NtMl1oo6AD5k1IO3uJBL7Ok
         rTu8RWM3VVa5u+ieUZwLItQ9wQh7V3cwljJtB7DpIaYlIFrjaJLEKr6WZbRYbP3Nmo/d
         4PkA==
X-Gm-Message-State: AOJu0Yw1Z7u7QrzVytPEIQlNoQ7V6rSs67A43v+syXHVmyP12D9X+Bxp
	kDoFP1Baqalh5XK5gVsZTtP1prP0woRcXvNF+aoGr5rA0F1DOL0jpreWizVQIrFhiYI=
X-Gm-Gg: ASbGncvIBa18BYnWmC8Sb+jgA8UHmR1sypm0JqXvZ3qw4iYBSf/8bmiZRjC/Hc4Kt8a
	CP4nSJnFUVasXsYvmUCw0pIeiHnb5bCuyzi27TvizOiILQfFbM87ACaf9ps7WQCapRIRGXosdr8
	8/SfY5xitlHPELv63TMq8YqFojFIU90H+eAK3nza2bBF+E6R4561dlBMSpJQCnCs0ZokLlnDC4B
	cydsYQKcH/x6kcUccQR0G2tBxzVcyjhAKkZJtmO61fDkMlIqgRKXj2pLOKHeA6IZJCyEPzgUBJ9
	0Dbz++QqjhmBZqxVXhm7lHuZxk4s3WlNPtOBymbssSVAkEevMInPLXUbFowXcopcbULGuet0r+o
	Wt7Nm8jjEQr4ixdt41iMf173xBGlX
X-Google-Smtp-Source: AGHT+IFBJgx4FrBDAeV7RwKnXB4SffTSOqBH1vBajjyVNmLRVpOgheodFv/ptAil6rsqIWLKje7MnA==
X-Received: by 2002:a05:600c:45ce:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-45b517ad7ebmr96898065e9.13.1756115336507;
        Mon, 25 Aug 2025 02:48:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:47 +0200
Subject: [PATCH RESEND 06/14] gpio: ts4800: use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-6-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JVVbThM9xH2PXWbYe03tJE2jElHw1ibdCVrW+ltAkLs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+8MVnWu62SojaCwPXpE2o9XMFUOy/ngGTn
 33rOc9+sWOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 csMwD/9OBeg8LCNmIrMJvqordPa+1PIQrwXU7oe7UmmAIOXFub+iDU4uYpvKPNSwH9F4ei69RM4
 fqo39MKqN1YL/FIXHPkGIu47yS1arMAJeQdeio/KF2NDBbfJXNzY5GvsZ21PIvVDjcvCNKVuS/V
 nrADfS5P1szrVWjrwR/Nn/W4NMyj+r7ioTNEipaa3d7giZ1pDEoTy2zlcyXfs2zEEcNwArwMgJM
 f/dGdlxFI1MJN5AOwwIyB/nKLg8vMHxNkmiYwXY6k75S4Q4kATCltDdBYXz9/cNOW/bycc2WpGd
 0nfudGpSYFUYvsOiWNTyz3A+7o9duScuKQtF6WhEUgqySYrs3OaSBJQFhUg/M0lchiI8kkAZ/Uq
 uxkAEyMy9AlSUaGAL2WHpNpWyHSYcrsqT+ycAE/rDTcv8lhhMf58QxpEmLHTGe+u+AV4xiINPHX
 Z3hUafIqsO6ee+MXUQJOAAy9Y5D0+9doWoayYT5264DnK/tVHdZ3HOfkuXEsbue/d2wL94fpoBK
 AzG3FivhUAd8v39Zh8GszWBQUfCba1xaG00nvPF6u7Hi6o/IgdgN6VE4ZHcYz88GooWrBUjFhLx
 leN0gQmcH95+fMEK0Mk+Wv6B5poKD1WV81lVAscPIdkY0nrtxGESK+DWY22kRFp8H1F7b/lV2yb
 6Yxh0NqHcK+jjug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use dev_err_probe() where applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index f4ae87325393c909c66eda3bb7b2f849e645b7a4..cb3eeeb1e9df9aa687e880b16f8d0a31b04a3b07 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -40,10 +40,8 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
 			    base_addr + OUTPUT_REG_OFFSET, NULL,
 			    base_addr + DIRECTION_REG_OFFSET, NULL, 0);
-	if (retval) {
-		dev_err(&pdev->dev, "bgpio_init failed\n");
-		return retval;
-	}
+	if (retval)
+		return dev_err_probe(dev, retval, "bgpio_init failed\n");
 
 	chip->ngpio = ngpios;
 

-- 
2.48.1


