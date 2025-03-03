Return-Path: <linux-gpio+bounces-16930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85FA4C1A5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 382113A967C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F01213E8E;
	Mon,  3 Mar 2025 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pA/y60mj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF12135AF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007927; cv=none; b=TpIGWCF7MN1WihlREkKW4aDhgCD02KGtYHkSGqnVUlCW754CitUM8zo8h1jHXuZOrMtj+jWc3ikQCAQ7FshfhkGBbGa3+9oRJZATUvhvFspmeoP718CTDouAaTH4DU3YOtGB2oQNZWj9zP4zaoeNrv8xrIYmKFg/OdpoUxHngKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007927; c=relaxed/simple;
	bh=xE+GYYb8RqNByXe+j/oss04d8olPqhLTWGg+X/7h734=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GN8qvTTEqr6qt9CZ3QsktThJSy09245aVsc09kBJ+5YLZ1EBxoVBxkOo6GcnZoz6Bab7kg8iDVlEyPUuAHfNHM0d24hwMBySOxTypmZRgErjeMoIeww8ckGnswPnDJTIl8yFT9U/7/nItZfl14azFkSo7qLYAAMzUuhZ9HiHCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pA/y60mj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso5379675e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007924; x=1741612724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBMDp7aHXRNt/RwICrg1q5Lp1fT8OK4mUnztK4V4pSU=;
        b=pA/y60mjG7h+aiCmK/LAfDv9gwjzDB9moFONdvRbeoKDDnq1K/WLsdn0mWO5s0m1Ld
         lfzxGUIcuJkvC0L2hvLcnxehf9jqHVG+oAq0fKvipjt3mZ1mbxnc875L1VXslMKAtZwH
         oV4Cldq7DDi7+iWnB+TBLuiN2SWlMVrY8VMLsRPv5dsfjFPBm2k/xdNlOwmZ0Y9y3BZx
         dxzsI7+/ezH9WAjuQOEHkhoJcGdGWaNn0qaGd+tD07R+7NgXKNf+F+BYtFE2FNhbhLOJ
         cJYA90c89S21tnqEmXFuhTNuRVWiciTFsTtD09VBZueMgTNDDXqsVdY4kWPUTNPvpfA4
         jP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007924; x=1741612724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBMDp7aHXRNt/RwICrg1q5Lp1fT8OK4mUnztK4V4pSU=;
        b=v8dRD1IIIo19tSymAiloJu7Kk3hHWClSlOwd8U13fk63eX1udYM3+eoGS4XEl69d+D
         2Pxrpqj0xSWaGDEalUY0JeGpt31MCANNFZFdtOuOj7TZ9Enp4JFFW9bkMcrGHH+kAq1M
         Ys1zRs6LN+0fLs6IqGYrppGA4jUflBqiToXRG/GjTqg3QneOOzVU+pHwgjwr6JVjkD+5
         SuRWpVH8j1z+jrezDEl7QXYkPmwBON4tBklhwfUziclvoPAxNmPGKuu++xIc7/hMHZJc
         RIl3vA8LK42+7e4YumQUtbBbrfjMrb0ZwpfKWan1U0+ISVAHV0+SwnWzaNJ0i3mJb+ti
         xSgA==
X-Gm-Message-State: AOJu0Yw2eUaYAHjVp6KlGlAa67TdoLTBjwxoGGrIfx8SGTWW5hhNRVkY
	UQ44EcBb2ydTulbZJh6VfZ0s9jfGhd5b5fE3VjWTMOQFlA/jn1x5yk6xai/WSyY=
X-Gm-Gg: ASbGncsynr6UQXgMdAs02GhmVpsZ46hxN/zqvVwqy/HsGun/9J5134Xgm3DUNxAOaF5
	/FmO/S9D0mFPPvvS9VDeUGnC4ypWba/iP31K8NfApyugoZdNYxMFofYwcfaDA+rDX7zykSntXcp
	KQUnrT3XaZMiZFPw7eIh3FqNGR8BUTVoR0D8tQkBOJ7XF2tONsQohAcZG1NEWAFhdgQaHmyXA1T
	r9jzqK8R/6wt3c+MW53zYkOGWm7lBy9lhYevcrquYVsX3dOhEWpk1pDg1PbEq6/RN3DwHgeYrta
	BQJfdjAe0wFLeIIjfJVucnpTa2+7XcYuQNMyyg==
X-Google-Smtp-Source: AGHT+IGbJY5Jo+WiS4mPjsCw+ExPOHOSH2GviMjPeJvWFYMKh5onFXn1ZivjmcF8FlnAaeL3hMO2aw==
X-Received: by 2002:a05:600c:3b97:b0:43b:c7ad:55c2 with SMTP id 5b1f17b1804b1-43bc7ad56cbmr14809505e9.6.1741007924329;
        Mon, 03 Mar 2025 05:18:44 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:31 +0100
Subject: [PATCH 06/15] gpio: adp5585: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-6-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rFPESwnteTAwQY6BOrgrkBqbk+imePLRfwcTrSAG+yU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqPjfHUJ4WPy8suyZvHErNCeJlzfCBlVJei
 RnIRKpHR8aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 ctpjEACiBsM6B6IoFrKlVbwDZcEaVstk/hylqUDuoVuEF8O+FEE9xkLlNz44NsSw8kzO+pguH4u
 HKN9AaGuVpIcI4vAQv5lislBsX3xuBv2zHzm49rk+yv935TLT4MKXOAnVI9S2TLfvlEFdCUqjYy
 xakIdKPXiHkiWCmNrwmy3tqB5HwwbQ9p2NEM8l2+W/TCkmT+Pz2NJ3R4yT6JAjSeZr+2k0d5a0u
 eB6gdaikIt6DKTSX6pjOtXYEszgjOhzEYBmgB4l0cF5S7EuY3tn9Dnr9UA+YHaCbQ80J5IrMP8d
 lRK3fBqv5nJHcj51oVIgAUqYZ6xp0rXFaFCfTNRpbgYiojTCkRsX5kp/E0AMt0pPzA7HhXfsdvw
 0i6HG/qKEnEk6oOw+kUQKCQKZMKIkHKjvuNgPz0i6mVcAoXFGcP8qSyMEVBIGPdpMlBVkTXxqk8
 HI4W0A+4wV2DnsAZIfTNrPfj5kzl/PZ5znHY9+rglJipUo9/pnLLBDLrvwNtJUAtRrJEqVpJcRf
 Dt7hopEPcrdBWBcaJdswJw2xmw1GScQ6wfnCpvkjveGWaZFpnijBCLytD96kbhMOzY8qneMcr1t
 yXEogC9FoR/nvMjtW9skEXcr1twoXt1t66yuuNXqbz3LYy6olZT9klECCt3qO5JXfkKmt6lzIW0
 4rFJI+Vr50GJimg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-adp5585.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-adp5585.c b/drivers/gpio/gpio-adp5585.c
index 000d31f09671..d5c0f1b267c8 100644
--- a/drivers/gpio/gpio-adp5585.c
+++ b/drivers/gpio/gpio-adp5585.c
@@ -86,14 +86,16 @@ static int adp5585_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	return !!(val & bit);
 }
 
-static void adp5585_gpio_set_value(struct gpio_chip *chip, unsigned int off, int val)
+static int adp5585_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5585_gpio_dev *adp5585_gpio = gpiochip_get_data(chip);
 	unsigned int bank = ADP5585_BANK(off);
 	unsigned int bit = ADP5585_BIT(off);
 
-	regmap_update_bits(adp5585_gpio->regmap, ADP5585_GPO_DATA_OUT_A + bank,
-			   bit, val ? bit : 0);
+	return regmap_update_bits(adp5585_gpio->regmap,
+				  ADP5585_GPO_DATA_OUT_A + bank,
+				  bit, val ? bit : 0);
 }
 
 static int adp5585_gpio_set_bias(struct adp5585_gpio_dev *adp5585_gpio,
@@ -192,7 +194,7 @@ static int adp5585_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = adp5585_gpio_direction_input;
 	gc->direction_output = adp5585_gpio_direction_output;
 	gc->get = adp5585_gpio_get_value;
-	gc->set = adp5585_gpio_set_value;
+	gc->set_rv = adp5585_gpio_set_value;
 	gc->set_config = adp5585_gpio_set_config;
 	gc->can_sleep = true;
 

-- 
2.45.2


