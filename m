Return-Path: <linux-gpio+bounces-21720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3DADE4CA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 09:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAD03BC6C1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE60274FC1;
	Wed, 18 Jun 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yrlygj5U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCF1D5CEA
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750232819; cv=none; b=Zf0+0ohXX23QoW1B20HM2mrYASfHjTSoxuF5ws2udRzNrPUMYoNNuD+w45/cB2g+urUHUU7/QPJEuef/0uBEQ8j9eQkxQYYvjQM0/9/D0xwqGFnaZp+T5kiQiGm5d219a5Oy6dsIUNIMyc60fNfHfA+FbqSy4zrbk4i/LZIqdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750232819; c=relaxed/simple;
	bh=+3BcBUZOspt4x5dN8ZzJDpBr6nC0Moim+JtvaxFS3PA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPcJ+ufGnlN+YWKeRXLoKZslglpTIJaqPTVS5U9LuO1td5eojj1wXcGAXs6bH7QPZhyojmHKd7j2RW+PNR9ecux2GKMZvuugxubs2o4ckqy2c/U0S39fQCI+/eSaGhc/csvuaNR4WTZA355iHF1+bp++lOgUYlRXZ1aF3OlSvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yrlygj5U; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so36929125e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750232816; x=1750837616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJg4yyZdyy+SHk6YiTmAb2wt9Uti4xL3zx29Dsfyr+8=;
        b=yrlygj5UJ/nDQUl9TNzVG+dMa2+p1u3jYDC8zlSAQU1K2/l3On75WGOYNurAKNkvm4
         pPXSf82g0H09sgJvoCGmOeqetJ9K8+GtMxvMIz1gd4MxWrVyVMUBIQr++sqxduD5Zi6i
         eZ6qACv9v00MLmvSfd23MixTa/dGKCKFOVYjMHL7sNUU+fs1RqIW+w6Ocnrf6FzUvs1a
         8PBwYVfIomzuErSZJqIAIpoEpxWH1FDfvnlEBrzRP+0DI+y68kQkJoyLdH+UHXKkzlwz
         Acf23bhsCjQ0n9dl/phBoiKNeijJFBoWTpbru+qimfRbXCyvyJ1FXfV6n7yG6T+jZhko
         kqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750232816; x=1750837616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJg4yyZdyy+SHk6YiTmAb2wt9Uti4xL3zx29Dsfyr+8=;
        b=HUIaJ3BgWELuGmoPHbKGQlEZ09VoczKXP/OhdSar+dQQw4G9sdvFm65uOsZyGqrlIp
         zxi6iXRDH7Xb+/Is5elUiwG9H2u/T/SZY8oMnWznz5hCxPn/t02MD12PrMb6bqBX6Xdo
         3dL1zRfS2PfmGVeia4uT/rSxALEmsbLsTlUBaDk/9LoX8Bh6tSioFzS3bMNylV2UnzBq
         pecqP/wgpxTunU38ZHO3gNMViSo3/ctC/tD9drIsvyfM/AkYQpgj808iHXYahggwXptW
         bj18jySD9f00XDT0a1kKz5ScUZ2W6LN2C+Crt0X0X3sWJml7a/DIvbm+efF/GHqHESrM
         syxg==
X-Gm-Message-State: AOJu0YzKknIDgqilWBZRa+BFSREXoC7SGWGmk/ne+X6GuMvFSpNq5JRI
	c0OSHwbxQPpwMA0AJyg1WPQvHf6i4KSPR7QrZodpMcOCu7wST6eoWdATe5nifsBb8B4=
X-Gm-Gg: ASbGnct/S2gXr3mwzWdBk5gsZlS+6E3ZR6QvfclQ0iBheab1B4bt6VQE+Aem0wepq0l
	/S6C27HlAvSo6b3HEonC2VhsN23ZHQP2XH/YQiY6xUEOLPNYjBWrdwhI9NHJvuIUsOtRw/01JhU
	6mkswuXPeyaUhxUg844OlDIHDvKw7+3NJRTVZyrOAEDvWDcQWnySRqiKvakp/f6bmjGrg9gUZnz
	GNoNBGUkBVSyT29V/9Un3xgXKYwt5njxZAYOFZYc8w9aMhc1eVkMvDBnqVHPbbMGCt+59FKhyEl
	+WIlaWP3aGtCQsX3EgVIoGtJDioabgtJ/OupkBp0pEvVm7Q9K2wNw0msKGZeBQ==
X-Google-Smtp-Source: AGHT+IGou4xH8VoI7WSbyUGe76dGESPFnQa358ovfW1YS2dfNymDbQsR3TYihNOw7qmu6ciZsMC1EA==
X-Received: by 2002:a05:600c:3e0f:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-4533ca6e93fmr176950135e9.15.1750232815589;
        Wed, 18 Jun 2025 00:46:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm131384905e9.23.2025.06.18.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:46:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: clps711x: drop unneeded platform_set_drvdata()
Date: Wed, 18 Jun 2025 09:46:53 +0200
Message-ID: <20250618074653.25555-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no corresponding platform_get_drvdata() used in this module or
the higher-level gpio-mmio. Let's remove the unneeded call to
platform_set_drvdata().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d69a24dd4828..c0c8d29d0dce 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -62,7 +62,6 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 
 	gc->base = -1;
 	gc->owner = THIS_MODULE;
-	platform_set_drvdata(pdev, gc);
 
 	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
 }
-- 
2.48.1


