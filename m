Return-Path: <linux-gpio+bounces-20161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7BDAB759D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1D01BA53B8
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C5828DB69;
	Wed, 14 May 2025 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdBhjPDq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BD1FECD4;
	Wed, 14 May 2025 19:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250330; cv=none; b=P6pGToPpwKyGwjhVC9MWVpO/Q4NKnEuV0u8itgr8XCMAkFknGmlGol3K9lNlEWqUyb4NSkMFq6qPCJ4pD9s3qGp0d5PtudWiRBg2fvScomKxNfIQ2UrB+f8Z2yhr/NfAW6yUa8nTFZWNkxo4Dqx/MttLL6PQqUhpqie4uQqQzbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250330; c=relaxed/simple;
	bh=HWrCWD/D1GcLemVwToyXg/euxJc5Hy8JhNtLCS2OIDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2pe8CYQeaYMhml0+KvSUx7k8pTyIhLgLEl/PvvBUo5J/+7WXRpa6c+JBu5wAOeehhJcsmiKlPBjyx8lSzSKzH8nmCNWIBKGXqX1pKP9lYq8B2v71ldcFOAv1JEcB5FwJQ6KU4BUt+vaKca1+Mz71nYjqGvOIx7Iimk3B++Or80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdBhjPDq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so1719965e9.1;
        Wed, 14 May 2025 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250327; x=1747855127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+3rMB7TgpOuv4MciTDXaw4O2zORwfW5g8/Gm6AF5Sc=;
        b=IdBhjPDqzl486pMGV/GvFZSYRVYqNWqwVkC39AL6z+Sq4Yg9I+BacEi3WojNLB4JD1
         lNatPYdLgwJ0dSxW9aXiiUsqQCDU7Icp6s/R9P/0DAKwpr6VLa+LKZOa1s0vJO9bZoNs
         fYRH1eXY7t2TQtAtr1lm9Ph1ECpqc8hFf3y4gOQ0+RDnClVJzcQnvXYMVE301eGawffg
         c6qokxuTG5fgHHeeSPozFixjagM+6MyG2HQp9ywRCzs6H8t4uIWy35135kXkwupZYQwF
         2Yp+qwD+Wi/83UlPJtj+LoCGqk5invNUDEHkSETM7GTNaS92Gsmz2l3kwesWmjMx+BaA
         KgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250327; x=1747855127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+3rMB7TgpOuv4MciTDXaw4O2zORwfW5g8/Gm6AF5Sc=;
        b=a5SaAoa83+H5QZqbCVQr2kr5HLjGJt7rafrcoVWSOXElZ9dld/nATe5GvSSwe/iO0U
         IS/8nuF6szZg1ComqkdK73mMC8PMlUUDd95+AvAH9yxpCij431TvXr7VTj9gCG4QpIBS
         qAmeRNm0guBoRK7Y5a/n3NojshQVl7+cluKiFlyrx2DHW1tFj/4osx1TeGi6Pp1aQqva
         +MVz8GRtPMR2zZEfZTE9kw0RUlx1h4jqWtLXglFgzzTr1XGTD/+L4oqr5g10xSAr1sJ9
         Q7PGBcebFK9HPFn6LCyJQy7eN/WclaqiWwn/LVhrds8PgF4GgTxN3m2J1GaEDr1Pm2R+
         NHaA==
X-Forwarded-Encrypted: i=1; AJvYcCUY19UcXw+nRAh4sd2d7xQX2viNojHAJI7/2A9rzUpOs9XxNOE8R1+6329qVP27fCit598UKPmWbox9mSO9@vger.kernel.org, AJvYcCUjDGHEP0mPXXxNafYwzV2WltizN7piVXOA8nSEwRBq1erz1afLR9x8EW4aY5LqqTe7b8efMC2U@vger.kernel.org, AJvYcCXPB81ehopvTlKmtABWcN2RzaQ2/DUm2tDvDnQYmpKVgd4AaNxbOn8AvXffAkZNPtCM8JqOMk1Uq9iA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9M4w9abHzK3CxTLtBowQkPfrjBnS80pq5sg906VjstDtul8G3
	2bMhUIo5c7n+URPHJM1OP8ypg6NmPEPuV3D+vK3oua2iqVtZRPi+
X-Gm-Gg: ASbGncuoS5ErKPhfuCm6RF9mMr9uHfXJBElsS7UebR8UGkgQAJKnB4M1DKSJlabFVyX
	iG0hnwea+N3lbzRxaplfu7g+iyZt95hlvpyGL/QG4nTqdtWOle5u1h4+wSQpwjuWOITHmLa6d07
	ilj9HvXJ6e7YWE3haufAlcD6VPw5WZGjsNXzaXBpocc8tkbfCE0pGFLvxi74+PWHaGUGSX4l62/
	0QGiyt+LcX24WHibzEu+nvcCiAvCfSdyajy1LCQZ1k0RwxBn0VdP5EhP8uuZAw0g0PY7NfCPVIF
	6qIj80BnaWrZHOhT/uyKdWiaPhZTAcXPv2spD1MxGiJNFkUo03WxeDkRtvB5gzos5O3bFCniGk2
	IEyu2TtjW9itR+xs=
X-Google-Smtp-Source: AGHT+IF3E6LnoIX6JTtY3lxfeZ+NzzfzZnch+kPaMH0wTlfbXodC8lOmf+uaRXXzGO1KAKLVlDBUUA==
X-Received: by 2002:a05:600c:1f96:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-442f2107a53mr42040395e9.15.1747250326663;
        Wed, 14 May 2025 12:18:46 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:32 +0200
Subject: [PATCH v2 1/7] pinctrl: armada-37xx: use correct OUTPUT_VAL
 register for GPIOs > 31
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-1-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

The controller has two consecutive OUTPUT_VAL registers and both
holds output value for 32 GPIOs. Due to a missing adjustment, the
current code always uses the first register while setting the
output value whereas it should use the second one for GPIOs > 31.

Add the missing armada_37xx_update_reg() call to adjust the register
according to the 'offset' parameter of the function to fix the issue.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 335744ac831057576473dd62c5533168b243a656..43034d29292687e875136aafa530b62479dc55ec 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -417,6 +417,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 					     unsigned int offset, int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
+	unsigned int val_offset = offset;
 	unsigned int reg = OUTPUT_EN;
 	unsigned int mask, val, ret;
 
@@ -429,6 +430,8 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 		return ret;
 
 	reg = OUTPUT_VAL;
+	armada_37xx_update_reg(&reg, &val_offset);
+
 	val = value ? mask : 0;
 	regmap_update_bits(info->regmap, reg, mask, val);
 

-- 
2.49.0


