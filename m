Return-Path: <linux-gpio+bounces-20163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C965AAB75A3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEED38C6EA3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB84D292912;
	Wed, 14 May 2025 19:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDkM3A3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A228F505;
	Wed, 14 May 2025 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250333; cv=none; b=gBYgDHRxcWHtlML54v4Mbum1KKskc1NBQHJr7ytQZozNny1g3Vcx3AyTord3PyLYVm3SsvRrSfZMs4EeyKZpcQ4HPACimaayvkl0qkjv1M0r/3mAtd+7zC8iu08q19upKm/fC5jVIPWPv9xT1howbc6lfamFvWhfMWULkhyvSOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250333; c=relaxed/simple;
	bh=ykZXcE8hJxsykp8VNTUTsaJ1m9LqQ7SpsYliElzTU9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ye16sfAynU7kCiEMw515QVz8X/hqROah6Vd0R757z2owredAx6rP4Bmktgj6cPrKGGGbxl2eHnyVpqxmbmdvaUlagaFZPplVWAirw07Rf0wbKYqgIkA+fGHC+H/1sR6/gZIh8+5Rdu5LUcPatQQcCbm1V+B28ayaAZMpMrF22sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDkM3A3h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso1305895e9.2;
        Wed, 14 May 2025 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250330; x=1747855130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPNeg7LLw+wPjDBNhjdS5KhhZROy/LV2IQ+NsavxOkc=;
        b=cDkM3A3hXXH+UD2M/TKu6bavMDTFIrDj7R9efTFypHsOJnBARjOMWiSYvqB9zUllBR
         ZppQ7Cez8JfTPVWnOGgASwByDfNwc+e8FXSx1V8hpPk9PGt57fg82dQ9gJtYH1VrAUZN
         8byS53TKkcafZM60kw9QDxEruA4rimImNA1ZOcCIrc9LRgu0xaB6XYgCcW8k7kKiciGp
         XxvMij1wZJx2M/Qzxfk/hvuvomIcz/c2qhJomZER79J3nLkHiPCFGqpu8bvnlh5Un5E5
         Wp7WKdN9vMCMj2Cfbi7FI4XW3fEEIZ8TlxXn+Auughby6FPxU/m4j5qYl5ZQdFy6UyfW
         gp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250330; x=1747855130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPNeg7LLw+wPjDBNhjdS5KhhZROy/LV2IQ+NsavxOkc=;
        b=HMZQXOchAqvs4/9FuEiwr7pjsUSkM2ROPN0cvZm/qx7Qbf+v9EHZX9twM9upGDKt26
         zIaWwASMUjGZn3zfiIm3vhzWhTAiQO/PjrCRC7tgmU7X7yjio5WSPKRirG/PZJ0LDblb
         58xBVxgIlJaYdpoEzoHP+UAUClaYKIVgj/sacdTQZlvDpPF0ua+lAbiPXsXMDFclI6iR
         ESROy3v5g0Z/AWgY/zj6V/rmXC1qYD03cafm4+hAP78Ji7aAYwDfZ5VsnFnJnANF2vFT
         1vr4ncytKBZv9pD9E+f+68St1nIdxb2qDPfd5Egst01mSGJD4exMD3iUOPZa/0l2lLiF
         /D2A==
X-Forwarded-Encrypted: i=1; AJvYcCUShkCAD15cc9dsgeFr9dxiowzDBQtPHd1tiHstCUwVY+BFzGOp9KkA+3EhVbiYEn3MPrv5blFL8pLw@vger.kernel.org, AJvYcCXQnjHnX7wA7YxlyqieO5ZbZC68yyhL/VTStwVskoiLS+9GAS5rg4zbWiaegmZWJ1AGpsYs7DIDykRmb4xF@vger.kernel.org
X-Gm-Message-State: AOJu0YyukQU5LD8UyjFSJVacgrYtVOOFOvn2us9V1s3Yj39hFYCQQc/q
	PrIIO0IOXVGhZQZjpfdgG1dvTBmvZ9mHA4GkXvGUAfrmAogN2KlO
X-Gm-Gg: ASbGncvWroIj0WXGGJLs566XZhRZoisqym8ncYHMfs5He7izBaLsS3QqQbECRqkhj0t
	8ej/UzOtQLGnBvmnJSiA/+kjCL7msA6La096CkgYhXoIbdCi51o/YWOEiNwei7pqr3nIv9Xdo4K
	/2AfCEwfrsLz9+vthHKSXaz5mPSRNRLorAoDoKe4h3QPl3beUuOoRVmUayB314E99T8yJV2UeA/
	+hC4GeabtXYlfPN+uWpENRCvwknkcvs+KgnLrlEm7tN081barOX6CB1/PAzJkJ86ncyh6NX5MXA
	LYQkHjZ9HjwOX77mWYKubrYz1mh5xk0pI70f/O/ktXwpFNIYfJIG0/sZUCDCgNTZzNuUzWrgem5
	3V0TB
X-Google-Smtp-Source: AGHT+IH0E2mXP8h4czOWxmxTLcdTr5dOwlDwwjHlT7wewaTCIuF6I9tuk+ZWHV0gFhyASv2QPYJl2Q==
X-Received: by 2002:a05:600c:b88:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-442f2168c5amr42844645e9.21.1747250329820;
        Wed, 14 May 2025 12:18:49 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:49 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:34 +0200
Subject: [PATCH v2 3/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_direction_output()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-3-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - swap with patch 2 from v1
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 79f9c08e5039c31acb170d4f38b516b1454fd9ea..8d93d36af63ab9496376219454214c05db30971f 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -432,9 +432,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	reg = OUTPUT_EN;
 	armada_37xx_update_reg(&reg, &en_offset);
 
-	regmap_update_bits(info->regmap, reg, mask, mask);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, mask);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)

-- 
2.49.0


