Return-Path: <linux-gpio+bounces-20167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33744AB75AA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B881BA5916
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8072951BA;
	Wed, 14 May 2025 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcNVZ12y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A65293758;
	Wed, 14 May 2025 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250338; cv=none; b=QGZ7oeuLtRg5s7iGBDsRB5ecA36+0pUNLO1SSwav05bF3Boq3fsD8tLdMlKG0VifY+MVfPtggPxhyAMazk3PQkZFoJ25g4eEElSZqe5CByb0I7Qlhwha4FwsITqwdklsjLyS0sdiZCHe5KL3rITwurS6az5XtjVrTzjKvudPtwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250338; c=relaxed/simple;
	bh=+7qqRID3OgpSWICC3duVHK6vZd1Tbn89NENi8PpPnjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xojcv6VrQU/9p1JHdOgx3Xi6h4Qq4kahchI1HM7uFjaKEEvjFIJlfmsIo/Ujln7uniqJ4luafth5sZYjDe6DnvDjHkZGBFJ9pVoHnSm/ckLnHj5rHVk8dhR5wcP3E38FM4UKUu5cyMOBdXWUbaZz3rjrzB+dpbHK/71xzghCdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcNVZ12y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so1347315e9.1;
        Wed, 14 May 2025 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250335; x=1747855135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaL6y6eAH+cyG0BHc8g4kaknwTTJ0ODkBusGr+TVtqA=;
        b=jcNVZ12ybH7Yph7nLNKSVApKMxSH5TIOa6fljweuvMM2UZJFWcYYL5eM40NYT3Vw21
         2IjH6rpYdINe5p+AC+vtDvHy1nfFrT2XxWjg1OimgxRaTugXTKKwHmVjcrzHOHSU09xA
         rps6QVHNd7O7kZrauVhGY7FBijHgZC969Ku/DZBeaxoQuuRWlRK4TZTS+2RieoYHNN8y
         aflyKry/gemxbo3vzUEYuVtxOHiXd30qo1jh/2wE8CKogDqAqptGq8JDtBVnlNwaaSfc
         4fd+acG9xqi5Nuycf3DpqB8hQp0THGKj7e1L9+VOirs9XUp8VbP54l4tKUKMRDeGU0YV
         v+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250335; x=1747855135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaL6y6eAH+cyG0BHc8g4kaknwTTJ0ODkBusGr+TVtqA=;
        b=jZTiyRYHAJPN1zCxKD0JD3TYaUudgStUL1/hXqZOohxEWLvwtAUZ4yeeaAAOH6JacH
         hzR0JFnV5mMXAoMxbTwmi1mtONMeXdfO5cDJ7D9jahouQyWpB7K4NWSTZDkvjrM4mVVC
         73QAwK3AkAXKbIbDA1OB1pZpS9ZOOCcZq2FovDlhd3wmsTwfMUfGOsWW9kmbEP4GeSbr
         R3j4crI1E1aXvymtEgFFY2pXL0eya2iZPZ6bjtaurwQt64TKze4XvGfUrpxxuIdwjVWW
         8Psu2Nbz+pj4UFwLe/kWklHLkjEZvei//xwZAJ24Ulp9EkSg6t3pLmX3y3znX3iC9MgT
         /I6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuCK8XgJ9dqjkidazRM5olsU8HBASStanOAxY7/2YKCDYGGhtzknVHseEDVc86iR/kOrQnGQYfmnp7@vger.kernel.org, AJvYcCW6QtDDOWwCd0EeAHnTO4c0uzXrVxrvh2jlzLXDnCAW5zXYW6bZhduqFk0zum/PkPwtxE1MEefyk9U857RL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk1N00PVC8bGWtrHg5TXCdwWMj5Jwq7wK5nj4YCPJE4sCjQUfY
	d9LioRLvRQRXvtn6fxPLY/DYE3syQvVjx8BPT3h9aKA/JsbYxCAa
X-Gm-Gg: ASbGncuhd/dfeGxlhf0/+B9IIofV+cfF93VXfCR7dnKWOCl+bMTH41KYMKcJnje71ek
	/CSdlffZdOD+DaGHy3EJHbUwZ+3DuNebwKyssyacbDmH4n5IY4w9/iCpJNb2MxaNKRYS1vPZvn8
	0bH/sn1h0tHY4p8jiHZNuZCsqmtH87C1aJmgWL3NhxjTOg8PIhNDYgVoNzQFTJOQlrknMBx0hPG
	Qb181e2ryK3O5n953Y38aVFPVVGI4sh/dGaDhBOWzGtzrHlnDpXpEMwfwg1tDByyPEEewaSWFFh
	qoaxfQcWbQKpr8vLy1FbDiximhOp/sWsMfqy0o7qerI7TPpbsCZh0qQxLLVj0NSKsCPMiyo6JY2
	2Kl/P/ADBRT5cdro=
X-Google-Smtp-Source: AGHT+IEO8Ku9a6HIDYbQtu7HYkIlwiUHOkaMZWGq1KsWHgfBv9ZWFnMh6u04RTRwJ+/8YE1l6aQXSA==
X-Received: by 2002:a05:600c:1e2a:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442f2168cefmr45995485e9.24.1747250334905;
        Wed, 14 May 2025 12:18:54 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:54 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:38 +0200
Subject: [PATCH v2 7/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_set_by_name()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-7-07e9ac1ab737@gmail.com>
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
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 18c6c5026b26c294ee65e3deea02d2e852e10622..f35bf0cd98c97419ba0ab0291a23d4774a595d39 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -358,9 +358,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,

-- 
2.49.0


