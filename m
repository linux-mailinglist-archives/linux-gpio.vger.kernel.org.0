Return-Path: <linux-gpio+bounces-20166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F28AB75AB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5CD861821
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432A2294A11;
	Wed, 14 May 2025 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FISLwmRe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC7293746;
	Wed, 14 May 2025 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250338; cv=none; b=SS1IHO63XyrAUUrMNotiLaw7MR1uCuzRRJWwrlfZnp8L/oQtNUQrKQ6wShlODMI2akLYDXM07wKaVPKk/LQU9CRYRC+MO2jSWVZrfVg1tYWIrZunaBcd5OK081tqZ/Zl5KFis501aMIe5CA6ZDLviGwCeTPP9hhfXxv0UBhWZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250338; c=relaxed/simple;
	bh=c162Anph3qlAPGzo2CLpqBLKtsxPBThotJe6YKAgJZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3d+pRwU93OruB1ldHCq8MF6RX3v+/TCDAfh5oFxK/dNiAH6UMq/SkNkjdLc6nq1qy2bqUvlcHoHJpKTLqiUH2XO0jLSantNnLu6qkmIbvE4FTVJiOe0GA64qvJzyn2gjBE+FTEdY0RaK7YzEvkZ0iJ4rAWyLMx2DASp6NaGFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FISLwmRe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so87031f8f.1;
        Wed, 14 May 2025 12:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250334; x=1747855134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JH55QdZJtAaACW1NAFT3cE1dsxbphEYIr1BTgO2aG4=;
        b=FISLwmRecUnKV7+bPJlE9iWF+npXyPH6Xpi6/FYrHX+y+jgTAt2MtVnlRX0VkkYGI2
         +TuN2tMlVZQuViUWbMse4vwkVNuWTLD9jE3G6Np9H+MHgjXtfZ4QzGHrMF2g/tfaBucg
         PezWptj19pAcAjl6/YYl5Ex5ylTC2mJB7RcgNCCL3lcmLr5/ddEntkUeSqqhscZstSby
         65pn/MmtY+r4QYwkKPbSklis8lRnVU9XMaObUdx21KQOC+tf+7D7Upypdpjh0uoTH6ZZ
         8qFLoavwwBgMu8z8BoI1JFOmEJgCJlX+HM/f2j8/J/3GAwLWvqbztZUb60VQxuyLicvL
         SIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250334; x=1747855134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JH55QdZJtAaACW1NAFT3cE1dsxbphEYIr1BTgO2aG4=;
        b=su0jFvWjDcBuQp/LtcSo3PlhSOkCAJfVN8GtC7se7uKly4Zwh1TAChrx/Faxtz/pZ6
         sVqheRSbJ9R7F1/jk1JoJ4yNAItVQt8V14/akP7eNpXwNAqB6QXL6guFJ1qXucZ6bsGy
         sW5vVYuc4ihHlhAm4szVGJBegnUz/SgYeyGaTNl5jqsEdNI8lF9yNLhuyAwvpRQWY7WE
         5LoNhCZR0/0rIDsQ5TGxbgscrzQr/SQJ9ig5wgeaYKznK0ZT3hoBLXxHfLN+tBmgIHR1
         LzqHjppNbKwwBSAt0NLy4md4+L0vfbJ+DxwAFi9+OmV8v2s3TaEjm9Z+PgtkNZZp0LVx
         KIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5YFmGk4lS05v3wtpCFUBEaFQtKJtoYfKJFakoM06x5KupSKHso8sw1o/G2D6moTCZfqXzgiHC7LhAuTnh@vger.kernel.org, AJvYcCXmISiBpWWBZov5WSLYAnbvDN+AymOWU4QgxAvU2WXlcXavVjqz6DyWNyh6r3fqYFEDZjvwdWCHRKwh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4Oid425MuiI6zxx/Ksiw6lczgXX96oJVT0x60KUE6MqOpTda
	owRpq4gAqZFveJz+i/ZVhkiqW5blc8qwowtmSGXt11hJpN+SDyCR
X-Gm-Gg: ASbGncu3A3zrBQl0mSAG1lBgoE/gke7/onZfbxj7unPWIGYuQyi1b58Nli1PL+HWQ6h
	61dg5PhRO2A+eTDDeo5QT36hXoSYvoyD4vInwlddvmlxRnt2Hsun3CLaUqFJ6Gy0d/wx6/9mjDJ
	HTHbD3t65fTcqdpAdPRUE71pW4NufufLGvQOA+gaE44DJ1xua48nuD6voSEHM+uKOSqo4t5K7bt
	bSj1+2qcZ5RI47uiaBwUw4z3ST0h2Pgq6Jvir+lG1EQREyfG/z26Fx+yEUlbBf26MnC9YKA4z53
	S6ajmqCxk13x+DVF0S/I3cKbaN2ClolX5QL6+XSpfbYQZlJhrDHz5T0dI9HnqWXnmGiLKSbYzge
	TaM5m
X-Google-Smtp-Source: AGHT+IHzNZaFCgyXoBk/vI3JWqPShaXSNalLho71Vx1hM7ORoJVxx3uDSV4erFJ5/o6LPZDyD2SVTA==
X-Received: by 2002:a05:6000:40dd:b0:39d:724f:a8f1 with SMTP id ffacd0b85a97d-3a34969487emr4027229f8f.10.1747250333647;
        Wed, 14 May 2025 12:18:53 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:53 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:37 +0200
Subject: [PATCH v2 6/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-6-07e9ac1ab737@gmail.com>
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
index aed0069b085ced5867993e95e0244df7ccda556d..18c6c5026b26c294ee65e3deea02d2e852e10622 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -402,10 +402,13 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_EN;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	if (val & mask)
 		return GPIO_LINE_DIRECTION_OUT;

-- 
2.49.0


