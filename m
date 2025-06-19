Return-Path: <linux-gpio+bounces-21845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C91ADFFD3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 334F419E15E3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D600266B52;
	Thu, 19 Jun 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DRY0YGc1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CDD265CA8
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322014; cv=none; b=crJg9PwMFntx1fijIaeF/PL/bb3ImqWE03GuA+KiCODeLrJJPmTwLQ9lYPChUzRZHsFUUYKFDTI7UwjPGqayH8hioyWCuVOiRqxy7ZvzNQ8GIjj7JdV7U2nKyOrS2PGKEUitd3VckYrzWH+mTqy2PYe3mxIplYQl6/xy3K06ryo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322014; c=relaxed/simple;
	bh=J4/swX60dxFNnGyRxMTrvcRjJzp/EsyWsznOiUYARZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igjlxD/QYP0xZrnAsA+G7ulkzg+/I7V9z9EOKzNvEfsU37iYJXXBSph0mZXMtrT46hZvl+SyuVhRpJouG1ki4N+exBpsSAVjvkV9MDmxvsYLbMXJzWu4u5Rny2wMLn2XGf1RueWi+mqlk0XqjDu7pdTW67GRelhaTTQJB2JnvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DRY0YGc1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso4475715e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322011; x=1750926811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=DRY0YGc1RcRmMF/IgUeFFp5B4NzPzcoN+oo+oTdcpQdNkX84NHePGFxti1rW0Wdf8e
         pMolJq58RVrHYJL7WzjMiES5VRtBWww8oN2RF7v3hyH2MPSc5r1bzDM2mD0wptTuxkuk
         KZFSTuy3dXnuJUIeBo2QbNxswuADAHXpVEzEQNON5i5qttxVZmZrpS+KttHw1AAhp4C9
         zBk2Z+eEk4GWKsz62/XD7UtazxDDbs0xlPr3vPMEFAmv/5kRpcRgLhuqGh1ptbQ0aIAN
         pr3ErQ6f0PeBy2o/wOS2DnEzEE1RewU6f1zKGeKB6RSTV3QmrYMyNcYwImYxNeHFzFg9
         8ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322011; x=1750926811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=txwF9bXsud4XeJOnMTtjK4eVVRJZlXn50yqvjruwUmqpyWx18SW3YWp/50aueU/DH2
         Zt7dbpNTEQnzUqcT1SqlChR6jTBjcOiak67LO2B1KnWB2s9sgBbo727ZDHoDhCO/SP8P
         TfbIZoPHlaegMTQYsV9lU75kGkJYQoOJDnJIiREKwgRUwRksT01sUlMkDGuHOiSNsWs2
         LPEvTlx/o3VTbdwnokr1m0YVMnuZ9BkGrKvCHvdEsnCEwm1xAtQJ8YUVUxzpNaKKG/20
         27J/ZUAip3JeC1V9xRG3pgBdBBEbpbVfcnMwYkg2SlulYxcEe/57LBSnO2IxHMCerh+G
         VYnA==
X-Gm-Message-State: AOJu0YxQndqcZ6ZFGrhRSNqeU+imZwbK9XYA5FedKMATIG2l4YDgnlzE
	SOmw9yod7RhYI7C5QQvbIKYDn3pB1pgF/mlqTko2qNHZysI3dxifG/nBE8iAvuGZ4GM=
X-Gm-Gg: ASbGnctzepziDJRmkaeiwSKH5IfAqK53GZToQ7F5lBGcopZskQt0G9bCnrecqIeHj2f
	58Q8OSUl8OGQERdLRnW/C/p2phjj3fkvGut+JuiUT6WtyaUTdwWaqbX5AxV1ICouQbP7ACguhQ5
	gaHiMAnZUbzuttBjfyLbLzsC3k6kUcXY83HQSoRMvCVZDo4TZi8gXwOHEHRcZPcREAcgCuC2jAe
	cPU0CjkulW1sxdZH8V4TAyjfPtDVjzbQkipZIR86BjdpwI+8etbien05E6Dxj1TxViSMmbkDNvr
	qy1Wm7L3d/4rVNKNW9RM9dKrmTLzTgmoxxwi9BOkRlaS3+5mgY9k/7jHduh/wqbs8kk=
X-Google-Smtp-Source: AGHT+IFrsPvQBcfdGkjODy+e3yqc3AHlIahKNReGa+rvtx4ektz8kpZyRE1e3BB7ON0JDvQ8oJpUfA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e75f:53f5 with SMTP id ffacd0b85a97d-3a5723a26f8mr17708250f8f.35.1750322011048;
        Thu, 19 Jun 2025 01:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:18 +0200
Subject: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set()
 callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U5ElyLmZBGysFJL9KcblCpbMCuSewiTUa3oGkohc5iA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tSNZDHMC4DZ4e94TG9I0QxUTJPp/knIHoLZ
 ngpzNeMrj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUgAKCRARpy6gFHHX
 cs7tEADbq0rtKcu0CtpTMbhplPaVXYghftiJVLjNx9ls/h6bpBkGrExc9GChQzG+Q7zhbcHnD9u
 C2jZn5ptHvOH7heEQ2vVjh6YD9YrwGECInonaAld8CaKlF9li75bIAu2EIPmnGHnkoeb9y9ejQq
 NUgqfirWA+Vn89x8JYkZ2yYQGn/kYHWSYvjad4y1//nWPlTQsQTXozhafHv/sEoqUlHxI1677x3
 jIxA8nZMpg+TK+DfjalolY+tMbGti6RYt/AYwK7k+OCERsizg+3znNQDgpF16dG4P+duDRsFTPN
 MTuBU+/nvuDmAsfzReY7qlQEGTMvKOap5VGUx2LAXRomlj28hOomYjrSVdQjjJIBgWiArZj57lT
 pIQVrc7vIj2UEAEmDBU6x/vJ+Ap7UpYTduZukAh+BNo+3g8RxfeW9DOcKE7HWjHODvU0Q8SDkVc
 vRkO4k+tvkcc/5lMLF0IalPGBX6AQCDCHOo0b9GoXWVdtsix33EFG9yqiQgu4C9PDP7IcCZfH7A
 K6MSIE73cXim8CvXAXfIpI2/PwV3RCv8jF1+NfxrIApruyfrgJb5uM7HA3n8LgjwoS+ZkywcvDW
 qnUfQrtyAii6SWW9aBhPa+wAwsHcGbgR/x4Mt7aS9QPZh3OKG4KVP3pWFxTBV80w1DGiFHsor0s
 +I4VtQeCui/0NNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The lines on this chip are input-only. GPIO core can handle the missing
.set() callback so there's no need to implement a dummy here. Drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index d9b228bea42eec53ba9d0d0945125f530a22946c..cb015fb5c9467484022723910354219e2c98d3c7 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -109,12 +109,6 @@ static int sprd_pmic_eic_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void sprd_pmic_eic_set(struct gpio_chip *chip, unsigned int offset,
-			      int value)
-{
-	/* EICs are always input, nothing need to do here. */
-}
-
 static int sprd_pmic_eic_set_debounce(struct gpio_chip *chip,
 				      unsigned int offset,
 				      unsigned int debounce)
@@ -351,7 +345,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 	pmic_eic->chip.request = sprd_pmic_eic_request;
 	pmic_eic->chip.free = sprd_pmic_eic_free;
 	pmic_eic->chip.set_config = sprd_pmic_eic_set_config;
-	pmic_eic->chip.set = sprd_pmic_eic_set;
 	pmic_eic->chip.get = sprd_pmic_eic_get;
 	pmic_eic->chip.can_sleep = true;
 

-- 
2.48.1


