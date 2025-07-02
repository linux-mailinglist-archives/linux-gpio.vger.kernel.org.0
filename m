Return-Path: <linux-gpio+bounces-22583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE5AF0F9E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD674E6517
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DEF253958;
	Wed,  2 Jul 2025 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="deGiJ0Wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124F5253B56
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447666; cv=none; b=WFZq90T6k4BC67fIKe+2A9TBwOLjkmu6KTMZQLb5i8hpg9rAcINo05U2n0kVjbkqrYoq1FQvmloUksq4Mm/Zlk9Xn9TSzZppIJ16dvEwbaH+UYjCUje5jO508dlq9sMlMCvrTWp+2V2Nh2uqgqsC6oq1I2TaQ2VAtzdwVj7c4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447666; c=relaxed/simple;
	bh=DguSM7EjLtrwVpT0x9yjX3iDCS5eIB2Mafki1V+bITE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fdyztwc63vGyz1KJUiN9d+sSV2DXrs2dQ9NgEqTOs0BfGC4pUhHl+Ku1YwcsCOC9LDikXKLk4qduIe/Mn1T7BURjaP/3MrGFYed8IQBJbMCQ48y9EhKUXVRorg4BtXhVefgiveLiptYzS8P9F4/CCR80IeH2gJRqTrq/beprT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=deGiJ0Wn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a46eso3509784f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447662; x=1752052462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpx2zRD2zETOgoqOp3qUcnPAf5yA0X9HjvfLuJL1NY0=;
        b=deGiJ0WnYhydWqGGsIG5V/SWs4qWXLsGJb6XlikUry/llBeFnpLRnylo26yJ1a5M5A
         /FjVI87Z2YMqiDO4gSMSuaM6+PyPP37rHibMtBkEF8jWkzd+4DsXmb39qNzcVB1kVUCA
         r1cLroc0hhbv3JVEXnr8kZAo/FntXqNW6GnaOoobIZ/GiXEvW7NST/tx+mZoV69P7gmq
         D7j3dPHVXQlBIaZVggB9L3GyW+zXzXY+XqDAeYJhpNq9JKns33DJ7GPJ6TXPw4+Rgxk4
         eLZkPYaweqbkeE7J1fU7iftNOVs4gkHcjs4zCaZO/5EnVLazr+R2BTnduC3P3DiOjtuj
         hODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447662; x=1752052462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpx2zRD2zETOgoqOp3qUcnPAf5yA0X9HjvfLuJL1NY0=;
        b=EQ3wJ54/8ZerKiYiT04Jsu7ZI8T3Ejhy4amJQ0gI7Z0gVE9lDJ3xbBfq6VqEm7wiG+
         pkE34HG+4t9BDJH5JcNTwHJVX+X7XgdQVnNGEZpScJM3xu1n3fyq3pclfZAV6VvFNuAA
         Kiv0cVXRznj6ZFClJ5BmqLYTlXjD1DBGQyuOBEQ6mNIa71dsw/wYp536IxvnxfNb1PMG
         5pLvCzWxszNCto4kcUeiLeO/euY8QIlsaS79ogaaLNl33P78drJx4kTs2uhDlyZenDLO
         91eHOuwjY6mRnnID5BoyalP1WF8+76H/rXUE2pyXaV+xdFBNPAL4asLMg33s/jtmmfnl
         9FJg==
X-Gm-Message-State: AOJu0Yw9kfxu0A5X8V2UK9cOLIgwZ+OIn/HXc9isbc//Uo/GXdfdi9Cs
	gpFXC5jQNFMG7YCeBnBPhoSB6oFuhC4VxKVW6MriPERKneMv+vtMm8r4IsFqx5l0bKM=
X-Gm-Gg: ASbGnctaP6tGlT33lrw97vX5pSKWuluUfanEdsqHD5GuQke3vmd+qAwNDc0irfYtJhe
	DdbCcAuj1+SGt77A57SL7lH4AXTnOytOWmk0TcFw0pUgnh4YsIfLFQKo315iN3c57q8FRMtwz25
	+6f77/WHwTrlVPLvee6EiMKzM76o3iCxHwAYJdhvkbnN9yjKPHR9QySS9BYK8dYrNcxs2QxSnMG
	6Jnfn2Cb3fH9ArInNMJonMwqFNsKIZdBI0fEBiJFxnULnR0FC7ChW8TiWclQzhBGW0h3siq1mLY
	oai1dvwiX90zGMDEE5j4byFnYV/aaog8zkEIxtR1bZ2e/7TRB3du8/I8f67OtHIa
X-Google-Smtp-Source: AGHT+IGVlrwZBWWDYlC/97CvbiHdRC8yezOYirmKDD5NIJ7Sc5+XMfy9yrxtEVYeo1wrlkHfZ9kXzQ==
X-Received: by 2002:a5d:5c12:0:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3b1fd74c02cmr1405354f8f.6.1751447662245;
        Wed, 02 Jul 2025 02:14:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:11 +0200
Subject: [PATCH 10/12] gpio: tps65218: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-10-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Kj1Uc078M3RGsYFWnX/pxEd96G+25cnoGzALzF84Zao=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhhiaZaWrELXTwJFn30XUF5omE+BRuB2Etak
 C24B5i59vGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YQAKCRARpy6gFHHX
 cpa0EADcu4X3M7EjtlErW4yrfl3kbML5suesL9nYnC7QAOJ2pjROvgvkpbErlcxBLY1LLejY0PI
 6RCNZ4qhb/Xnxyfa/NIdW1eNSapxwp7bXQ77oeVzl2SXfaA81rsPG7W6utSW/pd2p3iw8d6vSa5
 +JdGW3NbP96Rc7Uh8jyhKvXwHx3Om/C6SV5i1JU0i4Zov9uV7i/KvtTBG0CRr8mDe5iZekQoS23
 YxdZ9l1K5NfUXokCr1W7M48LiAi29DYuZTydb4rupaSDpX4z+clv8rNpZOFJ8CbZ+Wx/U5s8nKo
 JLPogSlkKEs2OezM8zQDypAejrgdZQnmVEMuF0ASzlghXQ7BIVv2mLKSkpiN8lxx2S78eNWPdtF
 AFz4WtbJO0F53M/sUkCX6MedGyNZuZXwTCPr3oJ3ufpfaBmWO7ijwibvW5oLo/hJplJq/SVLYsy
 qzBQt7ju4HHRvQNeoMe8I2754EYNiWcyZuDbjxBdDtEq+1p68k9rbTnDf8uWQg5E6dRY4iMMUKk
 J5ycZ2EUp+QJVndO/iCk1MWW8FtKRQBStObnZ2z3+MYZCVDgBZccjlEH06/QcyxJq0JpcqvTPKk
 vsd7wirRNBst7l6HEsJVXqW/OVYYtKTQstoQw7AoExOgJAAJ+ef5M7MM3ERljiU0m7CwbhY3cJ9
 clwtEVGfiY9g8Rw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65218.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 68e4f0a19f4eb945b33e5992fdf30a29a40bfc1e..49cd7754ed053bcdbf25a4e51e227287257a5f03 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -34,29 +34,28 @@ static int tps65218_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & (TPS65218_ENABLE2_GPIO1 << offset));
 }
 
-static void tps65218_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps65218_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
 	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
 
 	if (value)
-		tps65218_set_bits(tps65218, TPS65218_REG_ENABLE2,
-				  TPS65218_ENABLE2_GPIO1 << offset,
-				  TPS65218_ENABLE2_GPIO1 << offset,
-				  TPS65218_PROTECT_L1);
-	else
-		tps65218_clear_bits(tps65218, TPS65218_REG_ENABLE2,
-				    TPS65218_ENABLE2_GPIO1 << offset,
-				    TPS65218_PROTECT_L1);
+		return tps65218_set_bits(tps65218, TPS65218_REG_ENABLE2,
+					 TPS65218_ENABLE2_GPIO1 << offset,
+					 TPS65218_ENABLE2_GPIO1 << offset,
+					 TPS65218_PROTECT_L1);
+
+	return tps65218_clear_bits(tps65218, TPS65218_REG_ENABLE2,
+				   TPS65218_ENABLE2_GPIO1 << offset,
+				   TPS65218_PROTECT_L1);
 }
 
 static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
 	/* Only drives GPOs */
-	tps65218_gpio_set(gc, offset, value);
-	return 0;
+	return tps65218_gpio_set(gc, offset, value);
 }
 
 static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
@@ -170,7 +169,7 @@ static const struct gpio_chip template_chip = {
 	.request		= tps65218_gpio_request,
 	.direction_output	= tps65218_gpio_output,
 	.get			= tps65218_gpio_get,
-	.set			= tps65218_gpio_set,
+	.set_rv			= tps65218_gpio_set,
 	.set_config		= tps65218_gpio_set_config,
 	.can_sleep		= true,
 	.ngpio			= 3,

-- 
2.48.1


