Return-Path: <linux-gpio+bounces-19181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEFA981EA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10DB1B62703
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36C6275852;
	Wed, 23 Apr 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vBU9ilyS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFEF267395
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394846; cv=none; b=bgNf5gC3Sb2G7npCRbi2oMCd7v7oR6T1JTDp+foDX16qVbI7016uLtqlI9ycn0JFDe80oUHYQewQnCE44CXa9wXHTgYmQ4+ekLoKRWViAEZ3pmvcNouMoKSR+yzUCKpSmLLMRIMnNUbZi7faWaEzYh07I0emiZts7tRVzTWJhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394846; c=relaxed/simple;
	bh=sCy5NeyycV32ZFT/SmRZqkdiozOKWMJ6jALzEvjVFEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMKxBHP9Kil01JkjRN8IjxBeymvZi9DizzLRfMU7NUjbXWHC1DYWG5P+JdkCF76YWqbKFMcTicsqJr4Z9X1B2emlFrE7tVJ4GBqH2LDrk9mSvMzzO8CsrtxZEEirUeW2KxU7ucwS3A1yG1Tu6H/QWYH0z2fiWnWXVPtYNLpTjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vBU9ilyS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso5906453f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394842; x=1745999642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yu2B6Dfdj7hXwrKNPHrcuBuguJrhn9KHB4prAy73JA=;
        b=vBU9ilySXIUPoTG3iQbj/PbG9CD5+lKsJyTj1w9PWLdgoT9t4o+6eiyq3NG33yacTr
         ouUgMxmLxPArsotpZyWyO5nXLRFGeP2JrbgRpQ1VOqnxyc9BrkHTAPI1kv4cvlVq4+g6
         DtSmNU+oGTtpJEeRdhyhzWgrLc9V7eSIsJ1wNhoHceQ2yBe4ugo0GcT0rhQqGs9H3YCL
         +QyUmlQa85be51mKmXJsoJsva4IWn+qsGU2n0KSAll4p1PMW4Oo66x9gp3sUYOUUYoUb
         1YxUSyhx3J/QVDd9Yp7KhK00kHhhjzjwhcj2EL8CTG2S7c86XvfgxfIr7K+fMgQyuOp+
         nXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394842; x=1745999642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Yu2B6Dfdj7hXwrKNPHrcuBuguJrhn9KHB4prAy73JA=;
        b=utkWJbzgWSJS1+wS15s158RNU8GDE4K1/JQUcKWF0z0q1vYBQNmZsTCTGhESo2hhtz
         6JWz/jK2VR0VyqzzWamxDcYkYtktLkFl+39EYuTLqiHIYawzbRF/ZbRt0WCMUUuqN6Dm
         Nnarz9C0xFWT1E52iREMbyUq885pOnHl1Xn6qft2gSqPxbHJ6RkYQZ6WAD1zs3yNV1hS
         1FMrP7e013kwq8NXNQhTdk9wCMCiwurlLW26vRUZhTof7M0VzYXlnwAfLwEhVht6Lum3
         DfMpU8RAJkZ6KFKX9Lui4CK9S0T5ao/P5z0Wm8JJXz36BOxj8irRJnGnLImfUyvOdSLG
         Hs7w==
X-Forwarded-Encrypted: i=1; AJvYcCUD3n8piFadEuQth9gpDtMcbDEbcg+onpSnEHtFCBb6L4z81HwxIchBlcyioSjH3B0jeTIvHolshN6o@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRCTYPt2GLoU2GU/QndN0gwdJOA2DUONCIRNHl8NLhG400MDe
	UnlhBcnEfNvdaLIyEEn5/URPQX5G6cPBM3AelwLP+kcwjAMpUDQLmgvaibYkROQ=
X-Gm-Gg: ASbGnctFuZRtjo/k6phyoGYQ3MVhaCE2eQ1aPAXLbf+vm7pfIymWN/uTUe/6DTi0+IU
	/mz/4BwwH2LzLyvfRthjIe1fUxTgSMwj5wSV2QnfmOvnTkw53BBRAiUArlPxMjOdM9jigw6Tk+U
	LDYocdxz5ehIxTYdYkmoKRz8EamiTJt4Vg9Y1hjbJbn0YMXozNJdURisRTM4XcH8XTTLEgdnlwb
	I2SS0Si9PA/tjdBjcLzu5/2chJJYq903U50VrJ+3p4U3MqHGcLsyfl0EqLdh47Zc5PRfwjJ1SPr
	hlhvdNaUmajL0GspZFTjLv6PNfvn5d3DmQ==
X-Google-Smtp-Source: AGHT+IHatYCxnScGlxG87IK46dtvJduo0XuMEsaC1y7/BEaXRE/DSRM5w5YythQpUe474HkAYKao6w==
X-Received: by 2002:a05:6000:1ac9:b0:390:dfa1:3448 with SMTP id ffacd0b85a97d-39efbacfc53mr15450031f8f.43.1745394841674;
        Wed, 23 Apr 2025 00:54:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:50 +0200
Subject: [PATCH 1/4] leds: lgm-sso: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-1-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=K5A9vi+sTXjh4YAzZucX9KK05Nsn0WvlpjHF6gNLFV8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyX/mB8z42UH7vVXi4u6OPF6UZICjwIQ3yLE
 HkQSNpBofyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 clLhEADKTRSWatjKVRUHVfZtcveYdXevLl6ot2u8ju67n79RYjtXSYoJZNSoUhLJysJx3uc98K/
 Gz5Hk1uqM0IkpMDd+5wSXvadxG3pGF212nev9ze70d1fdfkTbgydPWhVYrFkmOvPumcFjOXAYpE
 3jUiTpUV8mRCmlD6xUP/uXke9Zx++M+vO9m935xjeqZJ4/Y31u05FDd0C/P3FVAEjwQIQvg6i/9
 V+6TxINRtHoLqnTc89xJnnS1BlljM+LAH/bvlNJfQZ6y5psArwBf5FUFv64xqPIDWS90hLy6TT6
 G6LY7McaSa6o66JvL+qudztr/kEAiDEaBY/nVLzPD+p7gs2dXlzPcHaDNU0yKIhFwd2P9BN7H/J
 5HiA5m+29RGUax0cP/BuX3xvwjQ1MXP7KPEQgd842OHvqFsVFDcqgoDP2Yc0iLJPnOdnw6z37bC
 aJig3cuBo3YNjCLcGZAHoEWBLb2lFn9otAgEMe5/ASUTnkg5hmHGFrCZsgqG8BVc9t8WmMtaaRi
 J1LOobI6UMC1kZC830TwHAKa5TjiB9I4B1sfKyAxbMr9mIR8JuLs1ZkoXmO9XsLRKFYC6/WuEKY
 hZ2m5B2oc1EutgqSbKRZBtYYQg3VX5swPxGuYFunNTZih4eqG5/thwyeQjG1QE9m6TSqgLi9iFk
 E/mUMgkgAUeQrUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/blink/leds-lgm-sso.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index effaaaf302b5..c9027f9c4bb7 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -450,7 +450,7 @@ static int sso_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(reg_val & BIT(offset));
 }
 
-static void sso_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int sso_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct sso_led_priv *priv = gpiochip_get_data(chip);
 
@@ -458,6 +458,8 @@ static void sso_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	if (!priv->gpio.freq)
 		regmap_update_bits(priv->mmap, SSO_CON0, SSO_CON0_SWU,
 				   SSO_CON0_SWU);
+
+	return 0;
 }
 
 static int sso_gpio_gc_init(struct device *dev, struct sso_led_priv *priv)
@@ -469,7 +471,7 @@ static int sso_gpio_gc_init(struct device *dev, struct sso_led_priv *priv)
 	gc->get_direction       = sso_gpio_get_dir;
 	gc->direction_output    = sso_gpio_dir_out;
 	gc->get                 = sso_gpio_get;
-	gc->set                 = sso_gpio_set;
+	gc->set_rv              = sso_gpio_set;
 
 	gc->label               = "lgm-sso";
 	gc->base                = -1;

-- 
2.45.2


