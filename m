Return-Path: <linux-gpio+bounces-26814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E65BBDDCC
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BAC854EBBC0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAD31E1A3D;
	Mon,  6 Oct 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KrWyeGx7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F8233155
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750086; cv=none; b=uHq+Tr8TQsGgJWCNNuYMnPzcuikVDL9VQF2Rue2oM0lYLWh98aZf6FkPJry9MhSvQdF2DGQxbmCg58/orWhS+rDZPEvL+y7QEvH28eKijEDoy8tLyEvPbe3zwvEskMg6O/Q/EoNqLIIk5VrRAllju2hAcLnAoANXbzTq/Zg0C1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750086; c=relaxed/simple;
	bh=/d/Aj394saDjf8ZKZply0mVabxbwUCFvrMHspWpCQ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1QUgqjpEwWb6juMTAXBmIgFi3WnkkJVtn/Pw1k628EfYYA4kQzo57ErvihQv7J8CvIEF+5MoY6BruxT2rJBJb2uL01yI7LINF4lPUsEdb1ixjA/zsmqQbqkPWpDgoEvj6Nb15MI9/9lEBod9wXkoTR0fMRJI3qVgjeFNd0orP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KrWyeGx7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3214115f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750083; x=1760354883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Onbh0NBd+W0cW/s14N4bH0blIyY0xCCFGNbjWx9C1c8=;
        b=KrWyeGx7FGK/G7FkFXmNgveaSyfzjUbZUnMJ1EzK/zkkpqJ4pP4HJzJ3qGRtfaUe47
         0LBxPoLLj7OpKCCEcsz04R7twVjo4Sm+pRr+QkWRbRvKrWbogBPr2Fud3N2Lfjq7BNTv
         h5LnGNrav6095D533c7hspnvXJ1oUQFlfunfEhapZ3HB6eFTDemHiPp4I2uAIdWhrHjI
         A6FVMS+lYEoCl2i3DLyLrY5D7TK04U/38kxa3JtegwKliWgOA5JAgVOxh+0h2enHNN9P
         OdosYQYpbmIIkRIf+jtCYB4vJBjjeoKDbe/FVzaT2QenKOY3XDHomtvAZpLwavq6AdJ8
         IegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750083; x=1760354883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Onbh0NBd+W0cW/s14N4bH0blIyY0xCCFGNbjWx9C1c8=;
        b=mafQ5j3uMHbVAzHZ8Vodw8FXnyhqUGcR2kTW63pjhxegDJcBCXqTf/dcu9quk3XWqX
         AYroJL0m2aimr2oLUSUvw4yapgtRJyX7qyOj8P0gbHUunnaCPrzkHH+ndKj1OHH9HCVd
         bXiU8e80LcUYV65Af8vCpvfDtXGeEUW2z6esrxrQPTnrTlzHVwU6SuX5jy1tBYElNzOt
         q9r9vPfx4YmPUt48g/S2qxCSGVRpyhIrbrVNTLMchTC8vLA2pVLscPQQg2L4p2rjREnA
         pFepu4dwUycgYPgRcIC0bM4nptI5K5LE/ZwlupVjtagm64MZeW1+sce52SjvEHEwTYih
         0upg==
X-Gm-Message-State: AOJu0YzDNyTQSfhA5BYD0C2+WSouiCe04bHyy9GsBQHGSKzd/N+gcSAg
	PKW2yyKfWASUpToak7poOF5IsAfc0r9M8wWsEoEjS6c13aOZjxPNn2rGmsnI2nJS7Y0=
X-Gm-Gg: ASbGncthDFaUqMnfG7ZvQi3DptlM6E12Cb7Ify2tKdGwp0ioUwVpmRnDqa5loDJy5EQ
	wnZEEdsxAgITwwHtD4IOpEhwxumh6TOJwuGN0LwLttopzeUnxVTCLw4k+g+WUn2jfceoVwLMy8n
	TC8pODaOxC+fpgodbKyXDzEDwLr9OzdF7qj0UXsBqGrBfwWbaXwiOZjs37maBH8aw8LaYV8jtth
	JcamPw5KK+IthGemB3cH0T4C05yKvVv4w4jUwl6ST/40bE1LPiYeYDGb6SjSlGMxNuecATzFaUB
	/q57a6y9PiUy9Qt0uVKXAhCoWlc3RAoFnn9pfAQmmsNvmpCIHk96mftx0FsU49nvNt9RdXG8E32
	rVeMaLgWqrW8PbecjmnmK60xXOB8FcKQia60FW/mXiZQ5vueNYOho
X-Google-Smtp-Source: AGHT+IGQjUoM5Z7mz66y1j+3Q4b6m43oM6/xxCRA63OZYy7qynZoAFat/+qyHdqId3Ugo+O35dg1RQ==
X-Received: by 2002:a05:6000:420d:b0:425:7e38:419f with SMTP id ffacd0b85a97d-4257e3841c4mr1141667f8f.16.1759750083048;
        Mon, 06 Oct 2025 04:28:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:47 +0200
Subject: [PATCH libgpiod 2/7] tests: gpiosim: don't allow clearing hogs on
 active devices
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-2-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2/dWsynaEkrqT1U7fX4k7TpLTG7yFtbo8Avi7Fewt0o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e+547sNbpqqeOz+jW9+mQhX+gIXlFt988/E
 BoO4KsK/eWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvgAKCRARpy6gFHHX
 cjEmD/430V/QvLS2ZnCa4iCRmS8OwvO/8TlLwzsqpgpgxUA8IbsHsMWkxJCcwp4usORdu8sdPPO
 hm6bIk6/YpWYMMp+4I99s6AHfVTHUjD8qLHDa0UVzwFZG/iQC+pwvOwpwPODS4BklASGHTWsSCw
 lts9p0aRJXy7COcsP2bS7youfWdF3mA1xBwOxp0fICp7pqCJwUr8mTvoWm8UBvTildcYcR8tzBU
 j+AgIO2tJkHiDuzL8adytNt7Bx+V+xZW4THu04EdGZzUzQOcPKM2/6COhjCtPouhk7WvosfmIXD
 vbf9Xs27BvH4xXHKv05MQqRfpPLn/ypW5gsR6x3tt3Qk9lxFTSy2dq/SRAXWyQjqrzkBUfNUCnI
 RrqAaKIvW44KrOXYH6b4nf2jnI01UYzzRcEurlOlUWP5Eyao3Uwu9wmY71uMwjjqtDYKVoJLGmc
 saNrYtMs4zZJOQHgLeFkOiXLYxP8q7SuFdCFaI8fs4ozF4779LZzyYbK/2CWgp7R+D3QYiyPn31
 vS+/gydIN0tutgWwfhINw76AwoTiKgrMIVMjm0KzYMrLK0+/Rh4TvZuGx3yLGk3dF1TbwOG5HVO
 m1yrM6c2uQnu3Qj68aXGCesp2/Uh+TCD71p4D8tVEQSf1U+LboSnKktBg4XpY4ZCepKs7slkpD3
 mU0YZ9UzaXAhbIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Check if the GPIO device is pending in gpiosim_bank_clear_hog() before
actually trying to remove the hog directory.

Fixes: a2f6e8cd3540 ("libgpiosim: new library for controlling the gpio-sim module")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 81bfd574817a1259f6b30dab52051a907414fd83..d48257534b887c8e9694afce80894a895379e1f1 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -1116,6 +1116,9 @@ GPIOSIM_API int gpiosim_bank_clear_hog(struct gpiosim_bank *bank,
 				       unsigned int offset)
 {
 	char buf[64];
+	
+	if (!dev_check_pending(bank->dev))
+		return -1;
 
 	snprintf(buf, sizeof(buf), "line%u/hog", offset);
 

-- 
2.48.1


