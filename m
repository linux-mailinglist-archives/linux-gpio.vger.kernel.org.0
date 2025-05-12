Return-Path: <linux-gpio+bounces-19960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4BAB3A5F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9CF19E0B34
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B93C21A43D;
	Mon, 12 May 2025 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENmQ6FB6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D65217675;
	Mon, 12 May 2025 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059789; cv=none; b=RNQopAUL+V7WtoZ8jrbOL75pGFfRew8YAOnt0oDOHE/fJKVHnaPsEDFJLWitoNNCXKMEZAQJCVKG0D8NvjJW61kIzpvfUeRr9gcL/wAsui6X6O704dWMrcecUeQBZ3hwmPVPpzkdPiS7agNPML75CFYtdYyvW/DxlCeA6cUef0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059789; c=relaxed/simple;
	bh=tvGeMijQtEl4zbB2adDy+N3cxusRFrtzixcKMNJhiwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXbNgzJmiq9vmvLMfgrvhVGtL/oVxCxs0XPNSANORjSPK8S03195JugTfgUlbSfI3xx1y418BHEhih1dHCBY3jy/9vWUzD0oK71lkbMKl01YflLeLtCyqvQom6n4MTweIHie8luFUVCUDxn7+M0BngWkQonrEBhGxMhTfM2lb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENmQ6FB6; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad220f139adso536944266b.1;
        Mon, 12 May 2025 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059786; x=1747664586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5MMTe/1pPBKil8h8G6mXnsqfuKZKWfjys0Hze7M4Ac=;
        b=ENmQ6FB6F7EteUWhHopPN7XRuaSV0gPcXiZfSp1yqxWXhfhjk8JnO+GcfeKPHeybDA
         gSrsLK45Mjj+/g6c7U5RbcCNhV0rqBU1adjUUiJI/hvRupepv6fh6JYkz1o0JHM36XWz
         VhfgsubBERe1fbCGCyQVRE7Xdr3+BU0ACMJ49tjCwMSR+/I6Ts0DsZ3FU+G6C813UaUl
         apRLs1mfYxD95Ut/DobHa6VUqp9QE+X+KG8rATw9v0jUO1ysViBTdy/6fgAVPEQaCxSY
         iLqZVsKDwkAqJ0aPcjBIBueFLwzSwDkJV84+TMIanwWz8fcCZ7KFFIEXr1om06nA2LGB
         g1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059786; x=1747664586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5MMTe/1pPBKil8h8G6mXnsqfuKZKWfjys0Hze7M4Ac=;
        b=FUGHycCsMuGjDAiKPDsRATDkq2l8nheBamWezt4gcfTzVL4vtDvRQaiSPmHStL5XMM
         +R9A21WkP8BnuQQPyAhiIO61ke0uhY2VRpzqZMF/XruU25Nb4qM/JJKNa6xgazaUD33I
         WmF39bAJaPYrBfC0HPMvhDGugNnqDS1GxEHd+29oVtKmbjMyA23a8MQOKWe9IN9e5n/6
         tqwBaF0gJOkhT5Pf6Ej2ESxRSmfwb+VaKOh6zZRqQY8YzLheEeEuDZI2ZurYBpzzThG/
         leV539ebLCPdkrGHHva3pGzO6MF0M/Pq/DgDB8GV1dFrPdogAdNzPoHBu4T6P+5toxiV
         v8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV3jPFoejhOZZ/1np7n4/I8U3IeoM9ZLC1Dagvafme4c/nLPTVXsSU0yQ4elrQ4xN1/+/JZpdrE@vger.kernel.org, AJvYcCXRGlk/8kSzXjClNO08F4dp1BzquriqDMJKp2r5kxquut7e/P2VY4ioV2eHHGAK69ovGbP1Qc6nEduu2bGT@vger.kernel.org, AJvYcCXxOYnKDrF4zDhHNlbjVqrmV5/WnM4HAHGPSdkxqFYKT8bZ5GnY4Fucmd+LEaS3VwMs95+CkuYbMj1D@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjky0L06SUwKStCp/BCpwER8vPq+9hk+3NtNk3da66PtyqHuo
	uVr9P5EEwewdUzD58UBRghdmRhsLgTfgRz9tpP6m+qGNskOmJ/mn
X-Gm-Gg: ASbGncuXT+rnLlw8T5AUyORK5/teQt/MKca6Ocx1QghLrlnMY25gFzRbPpCpjpyF7DS
	lW6M0reWPl5EMXlMmrvp59obeSK3PYgdLJ0BtRJeGPkvFmIabXu/l0sDOo6PmABtoZYrI+jisje
	fYJGD4Kx1zxbx85QygS+WrNXKLHZm/9CbR0iHBuaIwyxNkRQ+dO9R87G+wmZ53oJ7j6LZtoZnow
	E50P/i2Zj+RUXIzoaa77WiiZ0YDR8E8veRxq82GWZnbdlr0Lu0JJg3woVRX1/9DZ7/2IzncKPmZ
	hbDDIU4SGtVNwYsmNAwumgK8EwKZ93/qN9JeBLEl98hSC6FnvdOBj9m7Aq9IK4AwoP08yoA8lWO
	Zjk4R
X-Google-Smtp-Source: AGHT+IGg6yqgLrxnODYvbZrrlO4v+1zcDtFnVhd7UYNsTtLAVcdwUEoxhvw/4dDgWMUG+hMWyi7rDQ==
X-Received: by 2002:a17:906:1692:b0:ad2:1b0e:bfe5 with SMTP id a640c23a62f3a-ad21b0ec1bemr878356966b.7.1747059785804;
        Mon, 12 May 2025 07:23:05 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:05 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:38 +0200
Subject: [PATCH 2/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_direction_output()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-2-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 43034d29292687e875136aafa530b62479dc55ec..e0c8eebf40588a1b49b80e2a1ddcc2a35fa7c07b 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -433,9 +433,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	armada_37xx_update_reg(&reg, &val_offset);
 
 	val = value ? mask : 0;
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)

-- 
2.49.0


