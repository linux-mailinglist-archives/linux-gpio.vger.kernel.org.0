Return-Path: <linux-gpio+bounces-21421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08462AD6971
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 09:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0853AE1D6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 07:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA8D21CC43;
	Thu, 12 Jun 2025 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SBXydNzh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648081F3D56
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714526; cv=none; b=gEfyCz254HciwNiA7saibaG7VTRfgBZ3pgIdEJIcwkvpBRlKneASXA5dJRO4VqgxcbNBC8Qo0rvtbNKNZQUWKtmKFLfzL1+C14uIexFSQh9W/01JA23SKkHM6zvA8N5i4Q90YmcRHAPbogsw2qogLCCqWRhNJvgsqJp28H1W04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714526; c=relaxed/simple;
	bh=WkPpAAZN6wiya3x1lfspsnoQ69Jw3+KU8DkWcXoaPlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naEQXmKs4OpvnoiVUNgPy2j4qiWXIUHoPQHYIC6UnNLgTUeUIaRf9lJM62sRwTKfM9V+iTNZLU8v3SgioVbtRnY6/pdRbUoyxnItvCSmbM+aCo2VnoeFDnb6K+g+7+3foTrbXR5Inx4Gj/EkyvemYNySEQUrTpdl9zyqC5dFFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SBXydNzh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d54214adso4754705e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749714522; x=1750319322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M6kbazs5dYqqqHnTBGLekJlCVKFOup+/Gt2I17JMQJg=;
        b=SBXydNzhC5rByHXbAmTjGEC5yQTWwG73guwr7CDgfwJinOEfHKc/Byj4ahndCwvnD7
         trRvZa9kXh6o0TV9ICEmq6ZRQ6Ilf9bbt0abnz4ZGf/mbr4EtJbsOa8HtGrtFx5kAVEO
         mRq+zJGBiec6yqlgubRB7pB65f8GbIfQ86byO8HwhCKLllZnqw5Jrjjcm3ZmSwXZ4hVF
         NmCDJ4x5Kkx2zYuC4s76xC156I4vEuIXjszDtSpqZjgpEYfsxwc/FHAKaGPEH85xRRDM
         tFLSLe6gH5nfJ6Ml9lnpmkUiSHT8g/O/C6gEvV8/fFRIVYyGjJBNT18oMWwY2nIy8jUz
         pmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714522; x=1750319322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6kbazs5dYqqqHnTBGLekJlCVKFOup+/Gt2I17JMQJg=;
        b=J/nKugnoCupiCWaSSon3B9iw/rK28bvE54Fb2NuijLILxrbWyFeC9zQRY+7n0BojVn
         fO6Cxeza5Xr+cTQ6tV1mJtZ37EmMkJ6KvebS05zBpvL71boCynuyWH5ZhkPuP460p7ny
         gGeN9y8lOWXSl16uYkkbmsCemqmsbSQRUMPmko/MZqoqCfUTNSff3e5UmsxBLDTF1maL
         +nZrj3oRgh/IArHh+dBFWzoBITF4t+KLitBK/hdDlulBIzglHvfxx4gIyBenTv2fH/ka
         kwCEnPlzqAIxYIBxTvvPy7Hu6M5arHIRKKcPunq1So1S+tAbgT9Z2IH85QDMl/15CEle
         eCIw==
X-Forwarded-Encrypted: i=1; AJvYcCXEWC1Opi65X87EZdAjmI5ARrY9Zt32Pwdw5c/sn2G/YPaqqOfn03DFrCHO2So2Q3fHkkRRPwtV8/ry@vger.kernel.org
X-Gm-Message-State: AOJu0Ywazp1GyEOiZMM5kmR0nhhIT3WH8fr1ogEIGJrHGUS/0o8+diIJ
	eTeGv7wxNmZzJZetNflAQXBScm7oNAH23GPWoukSVQAaGIUNgs8+MmFgKdxbZ7wB2LE=
X-Gm-Gg: ASbGncvblC9YH+ybjfE7mRVDZtodLe3PPvFXw+xD/3Rv4OniH0BqVfn3WIhsMGdG1ZF
	gzXqk60UPn8jLppzaxdvfk7+KtJ2RqgTYVW2pZ+T5XQ20RI5l6JQKNTv3vBEkO4MqbtD91gk+86
	luPgAh3Ln6TmoZ0O0w6VgEze6SambWxcn9eGaNt6wAs3+YP+ozqfZLIXQ6oNBF9jZCVeX3gtGzi
	wXfZYuD955rNWxXNxlR2ndx66/XUAGzdUVXTqgwbdO5mf2gMcXNlK0JcUp1taqNH1vZ4tRj9cA/
	M7ryUXJYKTxjkQnKm3fBJZ0QpJAu7YB9LngPj1IjtzA1IooJo1Vu7CYYSBlJKVf7+rn/WhDZeg=
	=
X-Google-Smtp-Source: AGHT+IGfspKVbS1RMGhdM0mqEwwSe16gt1zmT0hxrDLfPBZvEF5ETRkitqYhctrTwYTM+zUgT5aL1g==
X-Received: by 2002:a05:600c:8587:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-453249d2072mr43594245e9.3.1749714521536;
        Thu, 12 Jun 2025 00:48:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm11983455e9.40.2025.06.12.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:48:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] platform/x86: silicom: remove unnecessary GPIO line direction check
Date: Thu, 12 Jun 2025 09:48:35 +0200
Message-ID: <20250612074835.13800-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- remove the now unused variable

 drivers/platform/x86/silicom-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index 021f3fed197a6..63b5da410ed57 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -248,13 +248,9 @@ static int silicom_gpio_direction_input(struct gpio_chip *gc,
 static int silicom_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			    int value)
 {
-	int direction = silicom_gpio_get_direction(gc, offset);
 	u8 *channels = gpiochip_get_data(gc);
 	int channel = channels[offset];
 
-	if (direction == GPIO_LINE_DIRECTION_IN)
-		return -EPERM;
-
 	silicom_mec_port_set(channel, !value);
 
 	return 0;
-- 
2.48.1


