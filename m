Return-Path: <linux-gpio+bounces-24264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F2B223ED
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5DF3B99B2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BF82EBBAE;
	Tue, 12 Aug 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DRGB+qg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C752EAB9D
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992708; cv=none; b=uiBavTmxHpP6EFGfwGrh8YpFmD4AocB1YRIkyr8zdmreG3TqAkZyhzIX6t2SWS+VAZry8eet8d36t+Ac9IIVy0v72qa/kiL9EUeE+beqwfzwp0/Z8g9iRD201EeGTcUsTqX35CN+57DUEshFx2klKVbxad4qFG4L8ZYjsioYF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992708; c=relaxed/simple;
	bh=S+8urmUItItM/xWiVUTCqmdfALzfBJBt4ua9Tu1wW+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nz23dlKA56iP/KT3ifheC8ICz3k6dQd1HJVqKHpEXo9XJ/AaGq83HQY57YXFpb1ekylmnYNaS1463JUBuFgqN8D6HewuFaFlk+M3YL11M/JftoLXSnaY5PyF6xk0S25ygPoU0GkbsTGWF8b3Z7y2WwZiuOHi8f7+T6Us3Olj/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DRGB+qg1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so2962106f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992705; x=1755597505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=DRGB+qg16UT4dxX2iDDGa+DkPyTtiZOwSp+x6WAeVBVydZ75GWeeusFSyrIws4utyl
         CQ5jYii481cWhy1lNbPEZZ3Ialyh3DrcDjRzpzUJ2zpE3g6RFVnD0Di2+3frylQUl43S
         nQ+vOq3rOpMeNOOjjbX+Ls8pFx9QjgF5YxGRVtG8kKQT1Jh7FVkjHzXcHlP3bUrsfQS6
         /+4mfT/rsBjjaxkPCUYXgb1syk9i4om+rgJLfq1oeSHEv23OrSHQiBqrSjqGIkC7LCod
         EpuZRtZn5PekxaD1PviTDDssZxy6m1FoS7Chy+wRXco9Ve/XFkWhba+8Hr1X851EaMqV
         lF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992705; x=1755597505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=ASZfz6YEmP3HFrP+yGIDM/ffmwul2HfcASiG0uXIAk+nBiJXnGMiPA8ghZRMoepPw9
         YsppL5FjxFYSi8IBejuWuiZ8ycBeJHascCAX7pQSkaHXpyRSnL/LKjsyF2DeJbA0tHP7
         mf75H+W7ztJaCwMDa1A2Fpmrcei+rVyWI1Fhns1MMT4FrEiCxuuuS0igDao81IPY6gpg
         yRkJD0afn67qGYMoch1iTwvRhEfdwnTAQQ9VOS6Vho3V6gw24L28+seZUiR3mLptDVnZ
         WfCdpQghanc3q4r1oYd/LEokP+HFIqUE2TSKPBppKEbY2tTO0G4XnETHZNufEka+J1oZ
         Bqww==
X-Gm-Message-State: AOJu0YwP/49zOVxjHosgWrNMGrcqYmOAoN/tLg/kGvlpJpjShmh+kv3k
	vVwZ2P0O0gCL3zgXmXFf/4URUpL8wmHGEXzk9foy7qk/sTLUA0Moj5i4iyuDMAUVDko=
X-Gm-Gg: ASbGncuMKlBTF0cE7FnG6jd1Ju4WkHJ3HBCH9/8fojqnT4I+pvuog8KX4BEO469ccQU
	hZLvxKWey9zYJNdq5s7dS19NimnW2OFA00iGrfTp1Mkhde340dql/3rrc6vh3Mv9CLDw86MvLYp
	GXJqMOpspxZwYRqq02T0Fn8e0AaQuEURzoWp0l1TDRBdBxPevz/mR0PpPruXa9KYp9Hv3UVjs6+
	E1cuVxy7A6d7oURpMNv5s8nRLAibk8Xr6J1sOn/eQaN2M7M1cPuMOAYq/qlC/qADSafR6BcJPpk
	EWFzFiTb4zOSo8vjoZ4JLgW3i+54iR0hbULU1XpI30oeZ9zZReLf9g+cc9ZrNbaFmRFql3BUH0x
	Bbk0b0Cc/lpuP1A==
X-Google-Smtp-Source: AGHT+IGP6L8eG0JfYf/ydIlGJwEs9dkq2mdBQy1wTn1tOHW4K8UU3R23oikopgJzhNuW97eM03hofQ==
X-Received: by 2002:a05:6000:402b:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3b911041c3fmr2577263f8f.56.1754992704943;
        Tue, 12 Aug 2025 02:58:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:58:01 +0200
Subject: [PATCH RESEND 06/14] gpio: ts4800: use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-6-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAnfJy2r+LGJ2kqXkPK0iGECTYjbI4ZXi8XQ
 KNobM92MTyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJwAKCRARpy6gFHHX
 coGmEAC7sc5BuPuG0tJF2dz12GRlFExbbIEHvMu4270s+8nuFbTe8gz4pzYdDx3Qd3iIdDGbp5R
 3FXZraTexU0UkjkRcpn2KWW/Dmt5ujsOIF8VLx9YLezeVFMZC1LKUFE1oBB/CuCAbXYGOnkiVss
 q9rN1QzVDkq04yf2txNXD609dPsWbEV9mXN7WI0VKtsf88eaZ/tMH0fk7P8QDkdEwQGar5jpgsM
 41Usa6/AteJuK0Po8IqVv5FKaukQbBd2g9ThELqVHxJ5To1Nz3mbB3Yl3uBx/0QnxHWvTJK9SEm
 MeglxEIf5uAtEEmDEpzNjW96VWc37FxuqpRMDTNuem15i9wzwoMJbiN1/J1KpKO66XHmUhO1UcN
 jMMSxICgkvvoi2ZDk0im5GQrWBbO8jnnnDx/31AHXkiAu0PX0WMMC4BwzpUt9JmbGd2C0ftb8m7
 tYMKtLXaJPXnDa99s99dsk2A2Gg5Lwhq716FETe4pruxfzf8lrZlUOvGoO3tbHJqpUgljcSL4eW
 eTPIRgz1yalulrH+it7rq5BmYyizNz8LyyfbUhPgS818jJAOoSv77ZODkR3tkcJTmQuaXfU8Emr
 SMuwBDKYIimbJLitVPPlBrmOLUJQXno+8OjNENn+s2pMF7wNn65b2OGUEffsOmmWre7l4XGlXnx
 u3F5tCkza4Y7BfQ==
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


