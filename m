Return-Path: <linux-gpio+bounces-19965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55425AB3A6D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED1547A2592
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C0F2185BD;
	Mon, 12 May 2025 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPcpxdVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D03D218845;
	Mon, 12 May 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059804; cv=none; b=RCQujQs8c35ip7qwHoNI0nEAeULNkuN+gF0DGZfDI4sHWzAxzgwAOyBFiAUeM4SUwTJWRyd9tNstsOirSO702qr4LkG0Wey5cjPcPKbscPYAYRJwhQ6WlshrVyzNeZSYKR8A/oJzZ/dBlmEeeAeTORXhGmAZVRgz3PGyas6eEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059804; c=relaxed/simple;
	bh=tPQCzLZn2R2UK9DRrnxinSUKssq3JGAVyBqb0dtvrEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJIk1GjKyUX+UC50morS6xx8kYSQv73bp0aEvBC/ibffaZoxGWcFHGpXbQlKHGM14oclHVNwhckRSTn4ycCeI/PnVwY0YUbGSm8mJWb8YIEI67g/V30UjNDYU6s0xFlqA/n3EBZsoXn/h21QSFPbr3P1y5EUa3pD+2eY5re19y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPcpxdVk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e816aeca6so6355507e87.2;
        Mon, 12 May 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059800; x=1747664600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gAHy2dqHD8XlNE+NQO8OdbzNGj6fStBzDiksNNBgM8=;
        b=QPcpxdVkMdojOFVWdIht426iF93H/n2bHhFpVyAtCqtHE3naJoxu5rkr/PzsE1+V6r
         f7dlJU5Y22wDM7WHZ0vyqUwMK6REcLKpfiEw+NSWLIjPzxQupDhIR/pzVVhMzggmnk9R
         fO0KAjKrvi4eSNbeLiRYSRlLWuhYBpQ9ZdfugNOB+tJ9FmIk/Aeg2Xzq58LQASavhibL
         W/Acs+/01K7N+99ggmzfeaakIptvAAHrdvisYCiCc27cBmhkGr5V4VuARveIU8ojTuI5
         nVyxUSEOsAm0WyYlFJbjX10sPWl8f4VuKiavBzAcJbND8h/+CvlJSlA8N/z9f1gZHD0c
         c71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059800; x=1747664600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gAHy2dqHD8XlNE+NQO8OdbzNGj6fStBzDiksNNBgM8=;
        b=mK70ZacLELqUVI0QyQxeoQNu59Yip5hEAoOyvxfJwtNOV3Pv+6qLgHq/3n6cIaBl+V
         MA86CgLNzSyl6uGAwo/3/12OVibJllt0rXRI44XwwpjlPYYaPNIAxqMD5T6M5zZ0+1wi
         f2zuf/jdkyi83q5MV2NyaR6SIwYClhHjqu+XSiYA9+uKxYuVW6BppkjgcsqmBwVQvcb4
         d3umRTzFMz/VlzgbTEoDEVAa/zeZRd2eEAXgVH+FeYqfEWRt+5BWdoqCOEoetbsSE7oh
         b5QsrTmsJaDRjp08u/WI8THHl4Z3v8ojkTv0R4S0Z3BbDpJbWrH0Q8opiMylNgigyWax
         oihQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFo7G6npiTxgCkcFxdmFl4LVgE38XpiNuve6R4yI0ASyGIb3MQy3mJnGtcfOT8PzYVKuOwptWC@vger.kernel.org, AJvYcCUM9DGTX23dSRQmyuarg8iAYwukdpqJuTMJOGNjSz4Q85oB0VHYGiZ4I1BG0jErSOYsAe3za4Il3PW9@vger.kernel.org, AJvYcCXGsugjEdmUAcMp9dg77pMknKa3a0jrZhW0gtYZnmgIl8XgAGpkvoZ/j/DfH4MeYtUjBdaGhwc7mAmLymPp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2hNBgnr9cxVyX7BpHaQ1AiVvmBw4hTZ++LVkco5ZBHaxW6pZ2
	tJnje4yQYf27YbErNBTAzUQk3aPYV+Uk3IxsofUez/XBsygnAx2jwsBJDA==
X-Gm-Gg: ASbGncsUm+zA11cPuL1H3IXxZldIwNer5lNcsD1zcWAA4wYt0p5NdqiDM9myF2aPE2a
	Nmz3hM2FrEccobj32GWtELr7RLFHMmlnDROUc2GlxLI7F68x0tPIClI6o9uBeL/5NtfaS5Ma/1w
	a99JGzT6DlTEdzgVuMzKP+Z8mAPG+y0T0p4A1n4ELueGougBRdMyj89FOVpDqwXRjKX8bwT74gj
	bjdGSZrPqDJkc7WZg2KdkijkqKMHtubQbJRDw6mpfRX0XjneWeoyaOT7BmxzAe+3I3AD7MDTOxq
	3yVc4F3GanVN948Md86Xqulm7RyW4qskAGTWyVPINgvrjbids4O0pbIAojnPzpwtz1PHCCo3WII
	2R+/T
X-Google-Smtp-Source: AGHT+IGgwLVhY4Dppc9nKpM99+nmIcpUTBUiHOn5t/pN1WR9JabBYoC8Dok1NUb/mKsm5Hmdd7j+iA==
X-Received: by 2002:a17:907:613:b0:ace:f078:e08b with SMTP id a640c23a62f3a-ad21916975fmr1032950066b.47.1747059789964;
        Mon, 12 May 2025 07:23:09 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:41 +0200
Subject: [PATCH 5/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_gpio_set_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-5-d470fb1116a5@gmail.com>
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

The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
propagate their error values back to the stack instead of silently
ignoring those.

Cc: stable@vger.kernel.org
Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 2e88a0399d1a205064b58890db6477e2202bf311..aed0069b085ced5867993e95e0244df7ccda556d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -472,16 +472,17 @@ static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = range->gc;
+	int ret;
 
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
 		offset, range->name, offset, input ? "input" : "output");
 
 	if (input)
-		armada_37xx_gpio_direction_input(chip, offset);
+		ret = armada_37xx_gpio_direction_input(chip, offset);
 	else
-		armada_37xx_gpio_direction_output(chip, offset, 0);
+		ret = armada_37xx_gpio_direction_output(chip, offset, 0);
 
-	return 0;
+	return ret;
 }
 
 static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,

-- 
2.49.0


