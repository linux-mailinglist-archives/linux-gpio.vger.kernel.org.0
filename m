Return-Path: <linux-gpio+bounces-21458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C862AAD7193
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD013B3E24
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B3B25A34F;
	Thu, 12 Jun 2025 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w7BSmqN+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BEB25A344
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734143; cv=none; b=Aok9QLPu1BPIFMn/pAVjYIFyn08oCFdCSe8ZqNLfiXiRP0oSn9PZzpeo1ura2TEN5IS54UjttORnWIcgxNGaBHtaRmOzkgLxpgNIfjtGYfAmTON4ckSyJa8bO5cmCmyHLYF1obmki7BT58hR7T3tWZyzXA+lspc0DqiJ5VVewBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734143; c=relaxed/simple;
	bh=FlsshZr2pWaa66OdHrYeRpFA8c2RWzue9ZDkcpQOBWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYdklvmmD9vu1fd5EOo7cZkLNKYfkl7RzKiO4482Y7lZTUKK+Splo+s4SWTVA/fWDpnZ0B9bYpJ0uw0X4n8gmcTpo6ndLPcI00KnANvJsxw4KyEjIBEOSpfM3iQer48127Caes2TejbzeUFUIJZM7fbiEdI+FN6EmJpB79PjG4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w7BSmqN+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so11736545e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734139; x=1750338939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kdCtMGqd8snTnoQ+DvH1UQEd/O3oxtCQF39dSuJ39Y=;
        b=w7BSmqN+JGvYmLro6g0UGCAusPV5vZ32lCxMOv8GtIxVX02LDyXFh1TTQ0f9SBXo2x
         y5b+p8VA41h3NnziWOW8SmYOf0wGCffp+iCPOFJi6kvkAKcwFzc9M5oCt4ilp7dOsLRt
         S+nO/WcQtLaENpK1StOTdKpJH1hL31q4/BRGbMk666fpIez2GuHis1K+GNUuusnz7zzc
         DYn1QUOfWiyD5mHlzEkQXZ+gC0rqvozHNkdgL/ZrN4Yy/ydPxBRW8uGnWHlaeGVxNVSi
         UwjJLgF6/6VNbS6H91LY0mENgC1crmnua4tla4dq/I/YxLojD7zFXNF9IWnVU9AKOkPc
         4g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734139; x=1750338939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kdCtMGqd8snTnoQ+DvH1UQEd/O3oxtCQF39dSuJ39Y=;
        b=ZvpmfAUQENd3kSvQzYiQWe/C6X0u+5FhD0O2MUapevwdJ7bp+plNhZdJLfxlTYtkMp
         w/eqMNf3qzLpyWbZPX4mOfWQH/aqJVi8gb3+B4ODaCzSYi1QMB1KpWIqAb6BIMDsEs4H
         Fbovv55jxukIWdu+qReSWvkcw3lZv1hmVSJ9bq/VQ5PSXcGKJ7y+bxn5jUlp+5Csaq0S
         ZYSdgqGlhcxlNVs3qbiRUcfW9nYnK9N3yVdKJLM5LqVy4uPtnXtG6SUMf6f8w9WnjU6K
         ZSbIGSVzuYi8dzN4Nl1WeRyKxueQxtV6mhRZtrskEP3ViN67CO1gRSpk4b2Zfxb2Ej/s
         QCmw==
X-Forwarded-Encrypted: i=1; AJvYcCV1YHjlcbPniGUtIKwdrsv9QJOpcpy1xFxIsDp6Zo8qoZolgfxI2blLvk03YjqElUyO5uBHzrpLcuoI@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYi/gZ2aXVA+41k2Sohzc9IFVARlsiVtvqyV82SQ5oyYCDqSz
	8uAoLvolGu/H+kO8ta5+sat/FbTYNOr87nbmJTmLYvkkhN6xoZjaLfxDli8Pvh/eJ5U=
X-Gm-Gg: ASbGnctBk8LyN7N4rMT4aNwf9N0gP9JR/og+fgTLoab39pRV5S0QWmE3G+57knxH+22
	YwbO0b1I9NJfeaUeMLDu3f/eJW/hfGJdsPKtmPl51Tfh1A0FoPxLGRFG6Pq/A2r88tX6hv4SwHa
	j2zyoTiaGDNtBs3AkhLBcv8ogOm+2xgJPuUFT7P9lCW9B0lOWBmTnk3mYfnYGKGhps5Ib4eP3dY
	9j6oYXzJ04fsLkFQYMeDYdRmkoboQeY6EKpgncunLpBW/jQNXcF3dWSz9ZwhKZNNytYPyUKBvqc
	mOZ4ILeMNwvOpz2nf1FLU1dgRSCjCrGvBgn1vsJsSCvdAjoqU0M9Prf0t6louXqFQw==
X-Google-Smtp-Source: AGHT+IGl8eW8WnL+cIAddPc5eM66HwVHrNHEeYaEVb5oP5iPREXvfn5SVQ58c3fSGe7nsIDDe/S61w==
X-Received: by 2002:a05:600c:1386:b0:450:cfe1:a827 with SMTP id 5b1f17b1804b1-4532d3299f5mr29713045e9.31.1749734138978;
        Thu, 12 Jun 2025 06:15:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:21 +0200
Subject: [PATCH 12/16] pinctrl: spear: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-12-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Quh2BKoDNlMEGO9ydmQRx8uUPC9cI403NRhtbznDNiA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmiiG0NS7y222qXdi+UK1gYs11zyVNle3ll
 7695Du5fQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cjHTD/0QOLxxD5opxxXzFfIt89ty+lC0lghLR0yZYrf36EMOnwkkHtmGCsjxHfOnT0/73ea88cP
 BravFuaTrO9sftxm8SdI2BAQv37NtThvkmJF3q0Qbfp5EFXSC5ULs9W/tIdqsYQl69+EvGegQhe
 CDjFPkxd5m2z+aag5lFhpTsTXq3C12nMbgyUA1ycXYTndObv0TbV0zFIYxHnJSMGdkLwLJPQFAv
 PG9wjwBT4L1FzNMTYG98IdDTisCAYEpKsTMq8P3CCHB865IaWhxMRR9b3jKlwY5Da6ChTYY95F6
 VQOHgQrVo6tGqs4P3E+5QmY9RWj20w8wfoGxN187W2WGFS1maDLwfTNRfq1MhixKopBADFwMZfS
 +9d1ElgztrQhn4tIxBfl17thgN/j5PWlirVM7vscR2L6GvE+PXplIUVYURjbz2X2ZJFuSY8x0hy
 GHFLJqI2/2oid1h7jUJJQAPVsJzI9h6fagO8QlxKFWnwQlFieKd8fp7J+o3FimezPmJ1iDZ+Q7j
 AeVH1PN8imcKdY2m+hCwoK4XXTn9Fd4fPAFYRSO8abRFNbd0PcvXzmvsVENjXQlaUTyblsm6txX
 gxDyv8i63/C/D2iK2iAr6J77BMI3gKO9NsdJLWsU3y1BSLFNzNpe5REp2gyzX1i7MgaAL1bA2fS
 1tzGhBqfBBHQqOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index a05570c7d833d9b8268989f2a6e54e1873d20de9..e8234d2156daa5ada8adff5848ee4cf136257c3f 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -181,24 +181,27 @@ static int plgpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return is_plgpio_set(plgpio->regmap, offset, plgpio->regs.rdata);
 }
 
-static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static int plgpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
 
 	if (offset >= chip->ngpio)
-		return;
+		return -EINVAL;
 
 	/* get correct offset for "offset" pin */
 	if (plgpio->p2o && (plgpio->p2o_regs & PTO_WDATA_REG)) {
 		offset = plgpio->p2o(offset);
 		if (offset == -1)
-			return;
+			return -EINVAL;
 	}
 
 	if (value)
 		plgpio_reg_set(plgpio->regmap, offset, plgpio->regs.wdata);
 	else
 		plgpio_reg_reset(plgpio->regmap, offset, plgpio->regs.wdata);
+
+	return 0;
 }
 
 static int plgpio_request(struct gpio_chip *chip, unsigned offset)
@@ -579,7 +582,7 @@ static int plgpio_probe(struct platform_device *pdev)
 	plgpio->chip.direction_input = plgpio_direction_input;
 	plgpio->chip.direction_output = plgpio_direction_output;
 	plgpio->chip.get = plgpio_get_value;
-	plgpio->chip.set = plgpio_set_value;
+	plgpio->chip.set_rv = plgpio_set_value;
 	plgpio->chip.label = dev_name(&pdev->dev);
 	plgpio->chip.parent = &pdev->dev;
 	plgpio->chip.owner = THIS_MODULE;

-- 
2.48.1


