Return-Path: <linux-gpio+bounces-27197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D80BE24D8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 11:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C20F4F5371
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3583161A1;
	Thu, 16 Oct 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rWNm3s3t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7231159E
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760605781; cv=none; b=f+0FIZuqVtAKKiOmu/+xeeRmdfkwL3bHezwCru5CapiPsQhdw6bstxLExyL55aTjjAiH7PgIuC5HXfd7Shz/oa/ODHt0fPq8LbFk6d43WTzJ+4qaWE/12GJMMkTIgdncj/yi+5bWSfAu0cwfG5ZQ4rz5QL9dxc3B74WKWCjDKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760605781; c=relaxed/simple;
	bh=+TqfTRpPRoq3AU8dHuMcrb7fqxyNtpoQv0+EpVlasEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cerrh0KreMFrGwn08I51+yZ9fhTg7ZhK7ALXK1veCJgtYzDH3Z+Gt/D8Q9zLQw1YRkaFHV0i645sDungTuqLQrm2Yexl8FNAeO7VvSbc6JdQqJUcTSyy8XMiLvZIZx0sVLAw1P58TsInKM/CF73V18l+iLJk69upLo5pxd4vOrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rWNm3s3t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426edfffc66so286232f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760605778; x=1761210578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giyJvu+P/c/zBlzgMeJooxdfh7qZjl2zxl4gZFBxF6g=;
        b=rWNm3s3tKXxptLddSgePlIk+7tm9l3bLUYbeA9lNlPbHXWepAc5/6ANZgUfnoZVack
         TKGTddPCGYM747ujtArBDdvVhMxVes5eRmNgseX4+8055GSpJQpqu1PW/nVr9s/0z01f
         /CdEnwRQxT9+lL1ZLsMDw64SoPtpa/3ARpW92G7FdPpyVhy/Z1FDNbwnG9pALlhyX1uQ
         IGnrcP6nsQJ+xizRWUynnFFu3j/rwzIC+SclleqL/u+3QXJ114ygith1KKO0cv1oaIxa
         SMZwOv6k7Nz76DrOBGwIf/OKwLN6QbXZ1iKi3h8r91BVWLPqK62i64SyL/UUKajIHyzm
         X9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605778; x=1761210578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giyJvu+P/c/zBlzgMeJooxdfh7qZjl2zxl4gZFBxF6g=;
        b=gGwEbGmJAb4ysS8u1L0FXWomXt5Q6aXma6mM5zu9pxJAwdCDq+w4ehXfmLm/FpHS3o
         Dln422oVTgHtKTuSRjBLZVmZXOAYBYB/l/xFG0QJ0eRijnA2RC0SB+1XC1C3C49qEEeX
         Dv6QfXW8DeV3j915Kz3YDc5DhzrIx3sLbvYPANi3Kn1xgK/GxQdnNwAdG27K2/WAxtXb
         6fkXYIPEF5Qe2ECNB0WXaHr7CuDUPJl5A1Ccb2U9p92DJosM8H8YWinlRlyZtnNI+n4W
         FPgT79dFFUE6k9zGln4/XgCFm8EMC5COKHhW2nm7DamQ2zUqItERuc6lsxeckj/46i/2
         uamw==
X-Gm-Message-State: AOJu0YyPV2Giv9TLxQOe8UL0zDLgJAS/bXVMTRPqa3PBaqMJe/W+bq4p
	GXOu8ZmO3nytRMVoWiwwoGHAntkJancY2J5iOYPsL4KoOHDYUSqxzlQAMMBoXIzJX34=
X-Gm-Gg: ASbGncufiGLjqUw05MmtbXUyj+8JefU6XdmzLdjSZ+o8aUcqrYA4Dc41Q6ANfsN0BTK
	wdYJzGJdrbALrOx3iiAaPkXPENiCaRWNGomWI2JzoqzECztd5xNEtzKNxKBQZzRzf+8L+fb1Rj1
	EOWxVgOMt2W5ydBXZa8ewvteFpp+eqlrZrn8Zw8sSD7fdqgC4BszdiC7zqL5tzUOlQVEVlS56aR
	q3tj5sUrmblKLC4LiG6CoibDlTkLft7aVQmKurSL8S9nAUAOTDVW5iVANWLBlPpGpwjJek818fr
	4fK30635vSd3HSQ+tOsh/m5+OwQbLsUFUa+pblB1Ob5HVPsvhRa8uyM7XVgN6r7OytmlN9ukFmg
	103Rk78YEkv7pX/RddeiFQw0p3gJtMHzP++qxikRxdIrU6SNBsSTXN5Z9AHih/vz5KRL0pbk=
X-Google-Smtp-Source: AGHT+IFwQ1Vj0TPDw4e4cKls5YWKHTovuMxKu9ae74FALGIc/dMLGZ2EBvJ6JtiJA1WjhvYyV1IDeg==
X-Received: by 2002:a05:6000:41d1:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-426fb7ab9e7mr2401645f8f.23.1760605778274;
        Thu, 16 Oct 2025 02:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33191287f8f.45.2025.10.16.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:09:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:09:27 +0200
Subject: [PATCH 3/3] gpio: aspeed: remove unneeded include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-aspeed-gpiolib-include-v1-3-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AnELVPWhjXwv4nNT8oy1ky6Ra8SlMALj94FDJwWeEnQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8LZMRCng48xJlmYCAnXgnelIsEpfURlPAafHW
 lkDOwc8RISJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPC2TAAKCRARpy6gFHHX
 cjRHD/4gn97X2frtT0cloiZdcc6gGioOaf4UKJ2xeM/W83SKU24VRhJufxQDYnRAKZUHwS3vM0i
 5xRJI7ZSCBEnwcdXUYP//E4XMsNeG6l2QtsNGOVTiPZbHyJ3ABGl3gUHq0Yo+l8hgkzmtee8CBv
 izSfKQzKXubIdTaHH4hPG36fHFwPfHqYfWgy2SJhEsD2fqmKm/2bdpMKZFQ2b0rQaCjWjMGSCEE
 SnR3F25qf/1xIPbT41uHEwbR4AYuiNPe0jb1OiA9oZC/8zrXc2vuja1rUHsCdGJ4FJ/oZA2c1vw
 gh8Op0XLF4Z01G1BZNgc7VHxLvbokm0xXzhbogh1mi5KTEkK9F+Zt9N24rsbha3jTZkDkidO6zF
 jymTl5YWnc2pOmONTe8zmUEC4gwXBQWj04uOFs2iUw69r3/q02w6dtJkPdV02tyUVE6OFS9HA9i
 XysJDFCxs6ffsLaYUNaL0zsTTHARF7WVLqqp2wUNjix0lAB5NeoIdGq3cUo454LYGRt5Op56xs3
 MnmGoKC7rP88mtSv9/zVDuGuNW5gXczxzLEMiwfkRkEQlIjuSqHTuTPDT/RcD5cmX/4Zzclpi0k
 LBdw9fVriRvRaBoxsYsIScwPxGHPGgGrEpmwKx6qgVMDvzkur6TQ5U6cJXuDRKo2sOF6Xa0n8H6
 uysm6NlVANuLgOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver no longer uses any symbols from the GPIOLIB internal header.
We can now drop the gpiolib.h include.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 3da37a0fda3fbdcb8077c07706aa41b233e9beeb..2e0ae953dd996ec1dbe7585c4a92f28622f8e39e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -29,7 +29,6 @@
  * access to some GPIOs and to arbitrate between coprocessor and ARM.
  */
 #include <linux/gpio/consumer.h>
-#include "gpiolib.h"
 
 /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
 #define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))

-- 
2.48.1


