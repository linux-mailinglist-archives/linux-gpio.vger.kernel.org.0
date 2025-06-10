Return-Path: <linux-gpio+bounces-21217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 291F3AD37F2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF4277AC566
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81C2BEC42;
	Tue, 10 Jun 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eeHJtNGO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F712BD01C
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560339; cv=none; b=BxgcGlFoNWxabQvPyd7wb6jOtOTLkg4HUlpoFnVMN/Vwq8ej81FQlgih3OoMh2hJK7/cMMRY9Ii+PYxOHLrv0uFbjYP5TZfDksnDeTZZOilaljKZZUfVO7hnNKtY2KwEcM2Tt9hCdRhlVpbYmdU5guae64uatQQiT+eJgQ7QOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560339; c=relaxed/simple;
	bh=17xCbJ24nw7sQxktnCslGe/MRxFJ2bFt5zYCSuRk9uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2fOoohKkyZuaLC4f/Nv8frQcmsmSr0GrRN+2KHCOFacrmQUrDlAe+DU1kzECkWAvGqcJZ5KXYzlbPL+gsCUY5geBRP5ovnBCDqEUotxtnX+gAH9vx6vj++9NuobKWkuqur+ShFxEshf8BxrjM4atoVRADqkyM7BUMIOIrL4Jec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eeHJtNGO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1471618f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749560336; x=1750165136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CP0pr1RnwJJZDVZHWlvpAZF1INYr5USAQasxBrkQ0FE=;
        b=eeHJtNGORp2c4gs30u1SpExUu5dyEWsoZcqeKqrVgUbC7cl3Co5kU5ZO8dGsZacQkr
         o/FyncMm1Ma9MlJJhz7RybCQm0Zb33lMX+fj7OgXLer/NLJPQ1qdOlw7kTvU2iSew8aO
         dunC/+9/vYOf4ESS3tKCpyoga76miKQC2rYvEhB69G4vCWAKT8YfJknvI/2jcpGVpZLk
         YrjC/iPczm0lJ2vSReaxR8PeER1Jr6OpDZ51qJ636KBIyfD1WKlGNmYk3t5w3wywSlSU
         T8rtAXp9p6hxClkx5jIrwDUkyfmFY4A5E4FwbZHPnvOnXeW9YG9NIGQUY+0QSkfVGzxC
         RHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560336; x=1750165136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP0pr1RnwJJZDVZHWlvpAZF1INYr5USAQasxBrkQ0FE=;
        b=EBKuaC2FM27qvunoBW3/xk0a9O4JxHzOiJdcIahJNaae7d8rTRuUVCI7Jx8UvzyEqE
         KRYnqhpxa/rvv45Mc3cY07sT/57FN1U/Yqs2Ymbatsf2QwI3vEZMweFB0GxtoQPggPpP
         wm9Cbb/vlxKgCDDekKcwVx3KQaq8dC3T4Xy48LqI4CFjd/myX/CaupBL4ZmfE4XLAMLd
         xjMfQgf0uE26bfPaibbKGaMcYjFxqVvK608uCXlzidOoP4oVtrcQPTh6b4dPs8Y7p810
         yr6zNbeWfld1Kl/wO+7/dUa5xiRWRoOATDvMhmbtr68I8Xpkd7kko2bNf5KcniugMaFq
         dvsQ==
X-Gm-Message-State: AOJu0Yx70LTUVBDhvYMV7onpFqxU3lUpUYHUpbFcatGH1IovVaoF0Nmg
	mHDhFJIUZIBO9ESueNehhQpZiIXu6e7ZvgX9sdWjfFP6F4hbKZJExV/9ZvdPAxuIQM2ucEArsen
	amQC4
X-Gm-Gg: ASbGncvyUNkvV63P15S6f789pwk0eEeFk3qnU57Nv2A4pLRYpMQncs4GQeu4EpUuMCl
	Fd0QE/i0VlM9c/WEbuZTznF8ckn8cX9hJr0Effhlqc1dPHiK9jemgAqRPKCYj7PbJ6cqTBCoJne
	9QL+AsnFBeZOALdk+shOq/SAYw4Tj2ru/1NzZc+1Rw+5ZkDuo+Lhho6KwOLU1OiPbPS4q7U/O30
	p/MeVZZ+ySb6jvLzFUDk4wxOHl/CQKqXn/3hnK9HI2WsenOQ4Me/MCqhR0nZpu6oiVhznTMOgUw
	JDx/33Qzy9UVYGKmkH2r+VbsnqpVt7gDcgQf0zKZa7BIliivUGzqEQ==
X-Google-Smtp-Source: AGHT+IExRR4e9dlTcGN0ufmc1c99ii86pLeqcP2EuDaO9z8bj9vuw25+GX3iaPffRFFpJyv3B0e5Iw==
X-Received: by 2002:a5d:5846:0:b0:3a4:e6c6:b8b1 with SMTP id ffacd0b85a97d-3a53189b3f0mr13321169f8f.17.1749560335886;
        Tue, 10 Jun 2025 05:58:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce17f9sm143671135e9.11.2025.06.10.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:58:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:58:49 +0200
Subject: [PATCH 3/4] pinctrl: intel: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-pinctrl-intel-v1-3-d7a773ff864e@linaro.org>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZGNRH3kU8gUncy2AaRa7wuxQkW9WPpCNaL0R2YfhoJI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCwMdKsPhgfXUHquenNk6O7A/jRl4HMET9q+Q
 vCVfzIewKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgsDAAKCRARpy6gFHHX
 cn0mEACuGd8lWVugJKtZTsp2ckp+ZOy5qIkiOu0UNfHYwOVPLUVQqrU4nIf7sFW5kEcLyb2GVmR
 l17L0oGHkynm2j9qDNkIpDcy7wAgZKMELOxF0DDtrrk0dZDahrNR+7ovYixYvIivlcZ6ViMyBnu
 g/PmF/bj4bkm3+tGcVcx7KnZroUmn3ygekpd7WI9+/VwnqatFqD7hNRoFfcvsaDHxiDs9luvYli
 RKAoInuHzG+O81vY7hTSjEeajfxLR0oP7T3MX5Rcn9LkX7XpUWhjJS/MmOvYpXXbMcv5O8xXMGi
 URhroPZQajcaRMAW8MKbcurtmRRxEJrwLczNNXAd5MrIlN33/SY1Fp8Sifr/Fe1EpbfXy9FQFHx
 eVXJ7mHNAOmPjviFKkOXQVpzczVkmR8i8ccjUttwHIcqTtLk6DdcWhW5COLuj6t8EjTPVYtLyN+
 OZ0qesKfituFBYF6U+s+BrlL593yQLFtl+DDqvTWRawXKDmIkRYH7oSfMzWYiiXQQbka83/scO3
 8A73lDmyky/V4FBpz7j3JSYhQ636mPn0FBoRt5ZiJNUUzdbBrA+T/OoZHnuxKt/p0JgJtGpUPUI
 qcXE1fGfrq9c98zvbkgzqlJIvppyHPYRTQpfiswCO5dTaIYmQDhideWchlvW1x+Ohm8IMDZHy7o
 Oc65rVBuouZ/J+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d889c7c878e2d57eb075f4147a3eb2e2ae05ec5b..846b25ed1cc44cf9549aafc63192c80d8e66a797 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1033,8 +1033,8 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(padcfg0 & PADCFG0_GPIORXSTATE);
 }
 
-static void intel_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int intel_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	void __iomem *reg;
@@ -1043,11 +1043,11 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	pin = intel_gpio_to_pin(pctrl, offset, NULL, NULL);
 	if (pin < 0)
-		return;
+		return -EINVAL;
 
 	reg = intel_get_padcfg(pctrl, pin, PADCFG0);
 	if (!reg)
-		return;
+		return -EINVAL;
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
@@ -1057,6 +1057,8 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	else
 		padcfg0 &= ~PADCFG0_GPIOTXSTATE;
 	writel(padcfg0, reg);
+
+	return 0;
 }
 
 static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -1094,7 +1096,12 @@ static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offse
 static int intel_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				       int value)
 {
-	intel_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = intel_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -1106,7 +1113,7 @@ static const struct gpio_chip intel_gpio_chip = {
 	.direction_input = intel_gpio_direction_input,
 	.direction_output = intel_gpio_direction_output,
 	.get = intel_gpio_get,
-	.set = intel_gpio_set,
+	.set_rv = intel_gpio_set,
 	.set_config = gpiochip_generic_config,
 };
 

-- 
2.48.1


