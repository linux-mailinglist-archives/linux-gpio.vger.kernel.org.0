Return-Path: <linux-gpio+bounces-19959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAEEAB3A5D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 399803BFE3E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D302185BC;
	Mon, 12 May 2025 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk+pV71X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAF1DB125;
	Mon, 12 May 2025 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059788; cv=none; b=KsF0F6Tl9NsaWxKA28fSHiM+9bCQiJSrh7ar+AK4px0knje2SPlIF0x3y2u/TdUgdDpLTD6ME/QI+HmRIe4vtQ68gqIKYN2jCSbf9DbiYlXqvMIcUBbx5W/Aub17XvOxomd3u24uOQm8UgTwl3GCRHCWe1OKSOmrAn3xqEzWuH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059788; c=relaxed/simple;
	bh=UFJT5Q/sXMPC9R7Mv07uxju5+mxc7XkI5fQRoIg/6JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9NFyKBsNdPGpZnpujfLUubMduUeiVxJefTGez8f1xZjBUd+g1x79yN5yo+wRSz1+KWSUl7FYy3hhw1wPShsrQ9+2/TlVbvyynLTIG6QWvsnqggLz0etIiBVLzYz5fdFOzF7sn/EwMu6TCFLuudEABC0/htN8uivDOkWqEqHWLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk+pV71X; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad24677aaf6so209531166b.2;
        Mon, 12 May 2025 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059784; x=1747664584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77V/U3O+cTLaLaQfV/pKGfAWbRyDYwBVlD6FPlR2wRI=;
        b=jk+pV71XSvwoPEwyr8S36zkZxiYzW8s64MtPuvyWmuDTS5ZtIt7S7suoKfP6cc6AFK
         X8vcKIBYwAmZxryLJfei/sEYqVzJ45DGYJgFKHl+iO21X8t8pObh0PlNQBYqVbmvTvvo
         pIT78NpwX3uBMO/aYHZIIAnFd+kmFQHFiEoHI9XxN1JsYm8OiQ5XvYtPT0cbrgWqobAH
         m8Ql/w2DqtyF58sLSLVNsFTfyHVDNMLo1QS018nmZmhoT3kbS7UagVnc5itZlLYvwzXH
         c1Fkx7eA4ik0liDhBkhe+uV+4yUSyGRyGHvwKdfIdqnTE1pSDQcfWkxFCHsl+3AgUTb4
         ceTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059784; x=1747664584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77V/U3O+cTLaLaQfV/pKGfAWbRyDYwBVlD6FPlR2wRI=;
        b=MmlDDxCmDReu5vBrOPlPIfSPQ1UyZRDjMTAq430/6Q/iwIT0+BBsR9WUyoZBjdhBW6
         Mg0MourTYGdqIBIcQF4R6Ifrnj5MfO3b8eCLv8ZHmfPLxSHK8kU7WzdtBgTR3Fn3uPD1
         /uwo367aDsiJeRJvRgHsv4NP27RHF7rpwMX4ajxlarNh0VsQo/DDg80xbweo8PRFy+eu
         d/2Wzs1n01e+RAtbh1iv437dbmjpn5d6NGLLDN5g3kv4hPrBdyEcdV85AAJRPvy+Wj6W
         zGje9x+uCmJhwXowdgst08KYEbJjO/gpVnsFPyWUyjIFQlNHpGGUsHn3gw0WHlh3lUFn
         G8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxpBbRbWBk/N/mKZan+tG8f7UygzO84WHXLEhffUWx4zo9iO19u77aLMmkuQZKHWJ1JGhFyxCZ@vger.kernel.org, AJvYcCVdCxWE0c6sMYsI7sOYczRw8GgD4T2IAs9+vyyi4pYUcIa51YxhYx63tg03rFunR9pdq75x5QCGpE0pzoji@vger.kernel.org, AJvYcCXfrV331XKW/OhQqFZmImGiTcbp95KXNuQPipU0mCW3af76DbiCKfLvXeKofyQ9eopStavERWAAk+tq@vger.kernel.org
X-Gm-Message-State: AOJu0YzuWs+AkDjw5XDgAvEMqo0KX+pPLWtv3JDLZqiLoAppBYJI0YxK
	kI1L8nWjMfxNODBqiewLFcktr4hYjSnQGMf+WmPYw8bscrDDe5dv
X-Gm-Gg: ASbGncuph+BAQlRa3JHYeVapsDQTKXhmhPSjcL/zRule54+Fz6HA9cHPMnFffKyM+oh
	vRLKeSEa3oAhE2y75KAXsVgrnQwOjfdZFWmhtLFxTJF8nhijeZdGf5mJHm7Ef8CzegzR3ETzJRo
	hKK6LcD2BLo75N3woz/8D1NEq/H13nYh7T8Eu9Ewnpxm5tzFUc7PbFp9Nzb+FNdV8wPS/hXVzdZ
	UrzQXjV7/m1gjxZB0fgJFTtoQfbWPyzhkZ87sc38YJqbJ59VQu5ik9kO4E4PQeRD54aELiLpMgM
	m5N50OOXwiPlp8LmUJVBjFUmOIrJ08KnqtseUfWm8DSdBSKud67ZcP+FBigg57Vd3SEPmz6r2lS
	6oykB
X-Google-Smtp-Source: AGHT+IGkK/w/ZuLuBloF3PZd71dqrbQ/RypwZRAUlWpdxXu8MgumDQHdx4Av9Rps6vM9mbswRaiYOg==
X-Received: by 2002:a17:907:7208:b0:ad4:d0ba:ef93 with SMTP id a640c23a62f3a-ad4d0baefd5mr32106266b.11.1747059784452;
        Mon, 12 May 2025 07:23:04 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:03 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:37 +0200
Subject: [PATCH 1/7] pinctrl: armada-37xx: use correct OUTPUT_VAL register
 for GPIOs > 31
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-1-d470fb1116a5@gmail.com>
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

The controller has two consecutive OUTPUT_VAL registers and both
holds output value for 32 GPIOs. Due to a missing adjustment, the
current code always uses the first register while setting the
output value whereas it should use the second one for GPIOs > 31.

Add the missing armada_37xx_update_reg() call to adjust the register
according to the 'offset' parameter of the function to fix the issue.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
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


