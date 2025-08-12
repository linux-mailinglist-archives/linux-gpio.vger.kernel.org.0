Return-Path: <linux-gpio+bounces-24255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B6B223BA
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78AE71B62148
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88902EAB71;
	Tue, 12 Aug 2025 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UBBlWw7k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BC2D3748
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992351; cv=none; b=L4N/xvMgUVcp1SpI0blM//PqG9EVVgGWdADACtPPj+PdIvHwDmmaZTIM1Er6lveF1QudHA+Rc7tGQJUP81vTDZoo/a1LWLUizEp2RFR3I5rF71lDixOysLNyvKCNx2i/0zZiUlL/z2UMJaXJEBQ0i8mmzYDyG0TTc4KhOTSYIc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992351; c=relaxed/simple;
	bh=gsmPjfJ2QmHUYm2T6GbsR3/AGbz0mExN80EXjsadE2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEazujyuQ3LiZCZLcxRdX1w6p7PaUjKK+CuNcFdvNTelyWxSjh32qHfSHJQ7+02iGm9FKJBUOxI5zSEbX5li6LaUFwQXvY+WMJgGGmjeXzs8lQNjK9TItYDLP87+rIV2Stqhxl+GrlhurRI2ndfySWpO9+HGU6iN/QofvOWZ7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UBBlWw7k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b78d729bb8so3034112f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992348; x=1755597148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=UBBlWw7kzE1KBQtzOyBg6bzb+umTFYfVkAwAteg5gPexnhRkPjyjDBRZPCKjv20CVv
         U05V5ecbZ2jKXM8MgJ4Evh5Y/3Hmhhq7wFGQjOoebX602uCVSYjY+EU2kEh9bjzQeWGs
         B8OKXc3FSASidOPmZ//V8vOoJOKzCHJa1pfhY6oBDs4j6cdk/N2hVoq3ppO4wNLEIB8y
         EBZLkfICf1H6lccVC5jdleKnLa4Pad/jgWUJxMIEd3Um5ngR2V2h7xF8vCIBU3/8F2tU
         lmppkGzdeEN2wK+pOkTTolfgp99RL+NbE4lFKict/GelD/3cFMq9+JZEO3xDxs9aXRh6
         0vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992348; x=1755597148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=CFxcphcZF4ZBeYQXwx/FI/zy59rg6gj7oycb5i8XnqpOzyWynKJtOc37qD80Js66b7
         pj6i0UwAHmPEutPxTgO1/ohWym9iuOfUnjUDl16OldLMWZJvjeTmghLExmyS0gLuO32A
         Q47o+MkVDcfbW9D/gwD4lTslxa0ZXkUHeT4gzWbQGHoovyBXfWtGvJOKrDKOX/bCgWro
         lcgdScv7LSp4u0lFi8IvBr9XVy9WefddGWxg5vzm1W3M3QKFAXOAZud3k3d8O1XLCPUF
         xRWg7yH98EZ+ii3y0XA74CQmgFlNQ3U4elKxeHCzzcr3h4QtJixDHtKpvMcvya8EvPes
         zCuw==
X-Gm-Message-State: AOJu0YxNIcAauJ7OpDPhOaHfIRPn13eMr+UmYfp00SIVSR0VmCrDBG0C
	kVDsEOzPoeifPR531XapzYmHMqRPv5bQAUFRdDvd6nYTQxkgpvN22v7tVtRHqrWkAfyBjHzs6Uj
	I2r3n
X-Gm-Gg: ASbGncvzOZjnf4izQnjYMYCBsj15hppS+G47tMEJ57lo6Hct874w46Wt1y446Kj1YYa
	cgrbIrDBd3Fhl9wCT+HW/ZVlwjvlBDMhlwUFDDOZkhqhRxcKVcTlnzrZjjkBL162zl1l4HTnjwr
	s/zlqdvxHbiJGNNBgwSPYjwK+ppfGWwInwLapPBAsyhQlQVnD9ZTmP1HfpCKTPkvJVBxbk/8mHf
	/I/u+8V31xZBEz2F4DWyBqsraRFAd/EuXrUliCMplb7i6wOqonl9cTyYHmUpBdjKIzZbpHTkWgy
	uVTitPMJxrcbT1epfKyTrqsWe2ltJuFGCyar3PpyCU55tWGkmQhpexzHExm4O/lGVrRROR2ldds
	GFsrShDp+ckWhLME=
X-Google-Smtp-Source: AGHT+IEaXb74g++gnnRWRNlRWlIzQG/C+rEn8w7KrjKK2Ka2Ylgk9xZIu5ATuK2+3VNjfEtrz9Ay2w==
X-Received: by 2002:a05:6000:401f:b0:3b8:5b26:b3ce with SMTP id ffacd0b85a97d-3b900b7a297mr13601145f8f.44.1754992347601;
        Tue, 12 Aug 2025 02:52:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:52:00 +0200
Subject: [PATCH 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-3-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LGZlUs6AQDs8ng5Nn7ommqnFHh3w6/vhUJqzq5JniBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7GNzp6mz6xT0Tkum8iFoKh0J5iSYXuA3pFJ
 8nbXyZ4STGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxgAKCRARpy6gFHHX
 cgxmD/497q2XFPdy3fQQUNTYyp+gDsJb0sHRX+VTofvSRmH0ZdkO74xDWvcSMGDe99ZcDOCO0UD
 osIU30qbFlAGXn8dLl36tH/G5aod0oTl1+8JsNgQHXnlglckq0lRPCzpSj4dCmYYaJLj2rcueh1
 7wWIEmGcIWObGgoYw2Ekl3HtMd6Lt2YxIia0e72oWpQbfhBKgE4KkSbyhPpFjDpunyg7MkS1zAW
 5cZ/ph/m2253NOMdtVq/aB8PHB+3H6A6wgWYBJQwXRhEbdpmaiHHRMSi5G4XSpX4T2z/HRttXFp
 5EsQVEOkQt0OA3Nq7DkVVxUns9ITQryOlUWR1gUf01eBT9n5cknde/JLDzmOQ42AN+vcEBshjG6
 yVeheK1PkKiwkGkrQMywnTGMnm2tWXDLbY+DPCRaHXjdDvfNm4RLj1zldaL6jRO/wGJI1yg0zJw
 ysOKCDzvnMe8ytfJYRgHcHtlmWvkbPksICUfGOnEdGGpxpDu6Fq0ZO7XA0cXgs4Xgi8GPVdnIgC
 l/4CILTByewxnpCVfniUzQT229274lX8VItp3Oiv8/Fjk2aOtH2pyn9Bw+MjZ3xSsOrcRFOgofQ
 hoduXd+dwZzH56V0pXT2koOAaHZUXIroGErk2068CRSi/2hUM46vDkKoE+L1xHOKCtGky7uoMjl
 Ih+Bp7CDME2Wxdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason for this driver to touch the gpio-mmio internals, we
have a dedicated flag passed to bgpio_init() indicating to the module
that the DIR register is unreadable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index ef5cc654a24e2327510b872563e68fb0b9aaef71..6016e6f0ed0fb80ea670ebb575452d9ec23976fa 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -295,7 +295,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT);
+			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
@@ -303,7 +303,6 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->chip.set_config = hisi_gpio_set_config;
 	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.bgpio_dir_unreadable = 1;
 	hisi_gpio->chip.base = -1;
 
 	if (hisi_gpio->irq > 0)

-- 
2.48.1


