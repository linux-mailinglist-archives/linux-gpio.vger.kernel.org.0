Return-Path: <linux-gpio+bounces-20164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36466AB75A4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C648B1BA57C5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369428DF3B;
	Wed, 14 May 2025 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhJUA7DH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E9292915;
	Wed, 14 May 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250335; cv=none; b=pbTiXg/XJ7gkPVSSGFzBhJXJhH64PxgKaPvHxNDFgRhWxYX+SBsQGI8N6kdCkq6cVFsynOOSYGKMBVJPJkOZ9g/cCAvmDIRaAxvdCgMz3OiJ/yaIqjB/HIm/EGSCcYIJyDe1UU369S/pi/E60V+MnaxP6VfDgcQucrbJ+lAB2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250335; c=relaxed/simple;
	bh=jlyE/5zTgoPhjJoVNnSQJM7bQxmZU/bpkCu7beL60fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOk7ilbVFMJ4LsvVj7E5RP/hg0pezxaCAisAWLBK0/mvE86Wrb2HjvZ1XOGiKTqHzveopjBeKQL7gZBjbnh5na1yNGdNlhfVSQBUT6MjqYrx96AXnV+umxNFk1kLMcM8q7Fqlelr8D8mrLq+VWgWTUdhvfjmgcqN73yABnLXtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhJUA7DH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b6773f8dso89622f8f.1;
        Wed, 14 May 2025 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250331; x=1747855131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/w5xa3ncgd49kFJyT9bhO/chzYmHK3SV50+YzkQ82VU=;
        b=ZhJUA7DHy9IbAa2fUT7tv10t0tlWZRWELtrOOkWOlFm+knyc3QgzZn28SGuzNUFR4J
         YZnIDNyzTcvwgPBLtCkmQykk6dtNsPyqUVrGDsx59+o100H6Cy6brOLLCdHVDl3VeFBb
         aN03M5mv4JrquPqedplLRguTSmvwV0a27oNKmEAtzc8MMlAMKI8uqy64uhav+jaOUqy7
         OtTdZL0/lEv1OgsE1wfFpY2LmLwbGGGbSokH+X1HoK1sQjonlJUihAwgjLyhBN2Mhtbr
         iaV+l1rPhvBFy4OLy/QviPYUKSCUgwYCmB9bNETpLTo9uCwHtUxTgB4ohH1AAgHxOZoq
         BhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250331; x=1747855131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w5xa3ncgd49kFJyT9bhO/chzYmHK3SV50+YzkQ82VU=;
        b=cj3VgfIuyDJByMG1NGiNpZIpxxv8t5SnYcvHzFuIXOByJhgHKxsXRxILzdBqoLQk5v
         OfJoQuRiRQW9kRQaoF1oI5JBfzesGLvID2ouGJcFpdIlxLDKmuJhF0CRSVxcamkKAPpJ
         AkgiS3SK7nMMTOn9qsmMqSSpF4+VpsNegGGqYibx+1hixXdfDSn7F8LzL9ddATiS7pnJ
         gT+zYJ0qxFq4OmBHX+StApb2wo4AdlSh2lE3D17NGRqlUWng7AkfRY4JVPnY7kPYKBfW
         Xk6QF8EsHkWa9heROWE3EDPWZoy2z7lRiKoKo9Vo40PX0zpYOTqaO/olzDlS41N2A51h
         GNPg==
X-Forwarded-Encrypted: i=1; AJvYcCVE06PwXKiW1FYFxYjM+HNXTR/c11Xb1HwGf9FD1v6mjM4Sqk7MK48fuSrxjjxpXAOxP94S61yLNSL/@vger.kernel.org, AJvYcCVQnu8QZoxw/s2F4ER69J0somjyq8FL7BH1nCliTSxdcTBCOwaB0qvrPjuh0FLS65L9FelE6XpWIqMHRl0U@vger.kernel.org
X-Gm-Message-State: AOJu0YzN9J6u3SRVTlM4Au9qcVKpM4MIx7vw7Ujoo0Sw1DyULcp7yjEr
	ugtEkZ7LThtlmkPAvSJQKFe0S6T3sV9rRnhCxAwlFRPOo//p7WIp
X-Gm-Gg: ASbGncupGAsiD54XE8DnhdZiduetkMU/y2/LWlIJ38jnTnei0s7HGPQbbTgtF15J/hs
	vRt/Se5RBF2D+KAMMWnLcIS3nZiURzPCH/3rOgla6bnZcr29iuw826DiewvOlsL3vJLzFi2O3lG
	4/HNMHXJ3Sz+Vdv915vRGKh2MhBUtm5v44jO07DiEJo9pNlBWnAew6eiqfUb0GaPMXjwhGWlwi/
	dgcepPrYaDOhWQc+DBJIsb4hmTlL94qIubrQ1C1qUwDMYOGQjiwwlAPAFlk/fZ1wOA6THNrVii6
	2QJSQ6/BrxmFGicwimo5ykGERmTEg4+bfAsh5HVAjRfur5sUIWmMBUs+KExfpPLp/AcSfnxqoxl
	bU0ix
X-Google-Smtp-Source: AGHT+IEgJuTYC7ocCZO4XzaB8x9Uw4o8jNbva79UgC8DZ96g+uMc/4dsrtA/ArSqnVslHqk6qc2TAg==
X-Received: by 2002:a05:6000:4382:b0:39e:f9e8:d07d with SMTP id ffacd0b85a97d-3a3496a497emr4133973f8f.20.1747250331033;
        Wed, 14 May 2025 12:18:51 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:50 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:35 +0200
Subject: [PATCH v2 4/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-4-07e9ac1ab737@gmail.com>
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

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 8d93d36af63ab9496376219454214c05db30971f..2e88a0399d1a205064b58890db6477e2202bf311 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -440,11 +440,14 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
 
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	return (val & mask) != 0;
 }

-- 
2.49.0


