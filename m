Return-Path: <linux-gpio+bounces-24292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B1B22680
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 634C71B63D00
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18742F1FFF;
	Tue, 12 Aug 2025 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YlgRiJlY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B52F1FC4
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000781; cv=none; b=EXeF377CB1746VoN5qX30EUxqEeP4Hd99jLlp12A7pNEsxJgeMhj3GutR9MD1QM4nVgC26oSdHKLTjRfBrZ1nabxglTWEgcdEQmlEqZMP9Tl9hiZkHGgdwbG/A+bLrie0xfUIx80S7N4upm86d/ognfcM8ph3D5LSavI2bljJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000781; c=relaxed/simple;
	bh=S+8urmUItItM/xWiVUTCqmdfALzfBJBt4ua9Tu1wW+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mt17W4Xxv4o5MeWdpZX7I3WH9LtSbOzhkk4qs9B8l7OUSQ0iYZIURYXLDAEGKgNZwvza0J3jlKGe7FOeFYH2yuC41pxFEH+y0iSx2wwuct8eutKmDXVHfOb4YMUSvcgYIjSIo9ehAmMYk17SF9kEb/X2M56QvIF1AqRe00Pmgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YlgRiJlY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a12b3f4b3so3880215e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000778; x=1755605578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=YlgRiJlYfyZp2ci9Jhi+xcy9K2NG5QWehivcUJrnkQrFjj+QpeFK4PaD2O26J68dg1
         Xr2NJj0MRTzEtRVlh5GntjhGS2ZemPEurb1Kj0gUnQbnSXEUS4QTc0EEleSqfRYatTQ/
         OfCuN77T1XgsUloZXJdbJTG58A+A7ChfJLGnvhEtLzBbv2v4KVyRH9LEpfcQsTGrWDUF
         Uy9zi0np6sEPZGDiO5783RsJ4PLhiarN8JR1m9ytIDVH+ULK5deczLDXbuzlH2+95cKe
         n7N44RhS4UCwri1J8t02yQpc511COtzQeMkjoBI3v26nblOEGOwgsVj+UHbYPSnfrWpY
         OkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000778; x=1755605578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=lxn55muh3J91kw7H0AywKUBYXBN3GuYnsQISpUjVJPqmfr4x9FONwSaJrfZkJM7IUv
         mboosrP8vO+cNAvpgojosnbOinIc3/Bsh/hawtxRNYq88kwtRzG6BSJMlOTpBjK4AhkN
         aEheBtP5dBIGsepDwQvkNguISmJVn14l3E8qt2vlMrhUzPDsdKSNrXAy3hkAgiLsd7Fa
         VSKpj7Zd2JIzMZ0W9drSTC4oljBVBMqqr+uDq48T8Jhnss8XuzQJRkBaoZb1RXcWSO+C
         gYjBz3XMeTaon81Vm5k5vO01FGXbrtTHVzLYycv11Jft1DNVz766+gLQETZ4uJhHIBKq
         lENg==
X-Gm-Message-State: AOJu0Yx1zmUzMWlvyh1TCkYTFElYTmqXbS1rrdqwdTfx2HXlTvhtP+DV
	eqrNLRFSid1NibSd4T9c4dngePDbG2mar3UBC0Dcy5wz5/PzhylcpKJbVh2UTsT7qNc=
X-Gm-Gg: ASbGnctUM7ZStJWQUw1/jbzCafRvti1vOP7EQJPTAYfT8wK5k6zgc3zh4VoenLPtWgP
	jHKvssqiIKWmkf/4HcraW5zGcWelPCqzZQG2PYkUIBuASUihZMJThUQvGXdn+EtDd1x5aVrlHZB
	3VYP5fUSKaOpkfiFChNMnrUJhn1xtNbfxdbmGgNX/hwudnM4qouAiAC2Cka9dm2AqiceEiir7/w
	qh5zamyVRDH4DiFwBuuOm5k+ekaTZl47kHMmAfzangAdacwv11iDxx5gqEVFn0sGbobR7LKyL1+
	Qxb6ELX/t6myzJbBfUadoW2CmIG2fzEgsdjnZhOwcVY4sMpgZL5WSoCKT62IZZmsrLFoLwlSDkY
	lQQlt8s4/G73mzdpcRa1rJ1CwPA==
X-Google-Smtp-Source: AGHT+IHw5CvbsO/+//TLW6vU07wlWKt9OhY4KdTCKw7kDY2ouaD3KJYhB2udEhSB6VhDjWhTy/BT9Q==
X-Received: by 2002:a05:600c:1990:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-45a10ba2e85mr33107135e9.13.1755000778093;
        Tue, 12 Aug 2025 05:12:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:48 +0200
Subject: [PATCH RESEND 06/14] gpio: ts4800: use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-6-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/Ad2G9sZS7ICkDDEmkSScMmuRpmIarjRSCw
 eKwaldFODaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 clpND/9QxoBvO0B43u50QTACc0vPVPlKp7dDSnRaclDKK3ELzWruFYW8rtT4Cvlp1QD55NMx719
 E9hj4fAwjGxzRv7Wz0wwUxNEJT+7WJ1QV5s2DyrhCHV1+IRlaMZlKjiMD61TPnsjLfcsoCFgtf+
 6LjOV1z01yD+PWAcWOovSa5YWyGLZQctaw8lk9Ydjzx9jBNk2Vg3A5/vSRKBku7wmAN0MqGiuwr
 N/V30Kot2L8bzhXMNK4nDSleMacFwg0cId2n5uP6J7Cf0SWpXLiUb1bi9VsCsZlg9M0PUw3rcFl
 Q7avGt9kvozTD6gW+YZlfHahh4i2onXR+XqeRdZiBj3ii+VsbitUAiuvxQl1X1FSYid+lOEfcnE
 LUGXDUYikA21nTJ51OaEOV/R4K3qWc6sQTKZ1xa9t9iPsTbmjjo9e+CSZrZm8Vxi+uk5O9rkJVx
 ECkv6/yD5quCYmO5wJQbrkM08Cp0dCy5mTs8KeUQpThjjjV4BLNbQ0FGx+shWVkxm8k8dN76Z/b
 hTvsLHH3djOh93GTG++z3iGu64PSLsfu42+yHsjRZ0ri3VhUXFTMZ9SyoB2JsEUg5UzVb5TS6X1
 YHjNtd9MX4WPXB3FoLh7QF/QCG7xvRD0UObXXTBlHi1RAEn8lCNpjJdbMDtP54hRGBJAovrPYXm
 6X5bGIpXpA5cxAQ==
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


