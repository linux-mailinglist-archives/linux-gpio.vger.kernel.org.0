Return-Path: <linux-gpio+bounces-22851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CAAFADA6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF05717C345
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A675528C85B;
	Mon,  7 Jul 2025 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mmTA8PcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085A28C025
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874632; cv=none; b=oiSTCSeigcBqX6v2hXfSJT3jL2ce1GZmZEacSt8wOc85upfJK4o9wwaXkr4L264YXhlWlCfU5KJ3EDwuLp2B7Ta2cfRIvThUW/q1LYB84u41FmrOJrG28Bhqy5uL33u4EuqzB/1wpd0wwTgDsinQzDXv1b+8dmDv3K8Sm/ntYkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874632; c=relaxed/simple;
	bh=DF8g7z93gK4m1xDXfctS3XNuY6lY/Bdhe4tMyGbYlp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWi9mpCfmY2UxROJao/fUA5fSA6NwfEcn+hR0daiP7cY6umJ/KcSqhyJQ5x58JJzV8GMTHIyhnukxhIL8wIuH4WsmxtsuCMEcS+NHrttZNAh96JHWS2oSKsPzhZQoPpV4FzzOco6UokP0ehKUcZMPacldhMgfsMELHE9JflqPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mmTA8PcR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2592180f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874629; x=1752479429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnquyqvd+FVIVtLd1Ux9gRwnVLnxC1Ivy7WluAJ5AJU=;
        b=mmTA8PcR93vfxFd//KYI6NVVJ9MgwKGnMnMu8UdJtj9YOi9x0yb3D7r2KIzSnRaza4
         jbPvsQuhs0cUuBiNMKnYCem/PpVqhamd2Z8BVcXMgfsB5ZCeiJvneHGPEW3qWZXvsrl3
         B0vYxeYZRziFlpJysGg7Ae6tISrT5iYCmUNfR2NOsPQJBwV2mlgJbWcoxbLmiisBDDEj
         XqoiIgSfCI5wTA4JNHnWyIMZdt378O+htxSr8Kd8pWnKT5aSKivvONwa74FmBs5BiOaL
         6XPTnVIq/NOWd9VJXQMsinrwKKeWPzAuvzGJ+ToY8ieN706K6kgGxUXl/+Jqyel77XUX
         sxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874629; x=1752479429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnquyqvd+FVIVtLd1Ux9gRwnVLnxC1Ivy7WluAJ5AJU=;
        b=O/mkAlhr6CKNpoffx8BDs33kIzdUL+IvmKJxmG6J1NKWKFZZ49aB0+N6xjsPIYPpHz
         9812HDfP/EVmO+hLwTTxtr1ScDHSej9T18Ycwl++t6E6Qe9AiJjKkQuR/A0gMWqnb/hH
         usbiLu/3z6OKbHPIwkurYCrSFGP27aksuR+02g8FLRYxzZHoW3OgDDE/MJ7s2UVWklbH
         k0H+bTAkm3w+gv2z0okCOp/YqWV049zptmQ6/PUnKke3SMRGzUxDj8+my7bNfsodOww5
         JxvekKD+u9qCcla+gwfFz7rjfpVrrc/1C1Wkk3/IHVoJtMt6sp8y1pDRYrhozIAzS5rd
         aduA==
X-Gm-Message-State: AOJu0YzuU9JhvksIjr6TR7BVdT0kkoIQF2Mvqw0u/qIAKZLEq9LGgxno
	Q9m6Gp/miHYUabjvX2RiOT0d/Fmt0NHdcVjMMbwS0aTjmM87dcs7rNT+tq8Y2EyynsI=
X-Gm-Gg: ASbGncuZlov7BPX15F9Tl4ijaN2O6tq/WQ8v0oj+tNuM9LyimkcU+JZ8T8BDDxbq+PT
	7Fzk+BYDXFxZUU4RUIZBvOhTX8QkIOD0+f6gKsr6ZF0hHtLALQmPvIrA6XIByhUF/6U8AxQeJ/V
	r6MPFHs/W1LZB6DyNlFJ+qhoMry6qVbM8yD9BjikJCVNgeDaP6ikhKSy3iX2XYca6NFW3MJ/Asw
	GYP3w/u+9AOtMTW6ku1ITyL5Nd0+T67nyrianwq2JnR9SfkswZfhkxjRNLYrXV8gvToSAgpR8ML
	l1LxHtboRlJYN8A0ynyeo6Rfw19VpQBt+N8Ab3luRwn6NfEn15+H/OZO
X-Google-Smtp-Source: AGHT+IHgxOKlD/HCW2fuVG89O4d1zyNRJfWgVpguHMzHEibk0vk9GJEv0seQmb613A3MAdd1OnnO6g==
X-Received: by 2002:a05:6000:18a9:b0:3a5:2cb5:63f8 with SMTP id ffacd0b85a97d-3b497029583mr8019614f8f.29.1751874629034;
        Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:19 +0200
Subject: [PATCH 06/12] gpio: ts4900: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-6-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Hxwco5xikujaT/ZxkZ/bggRaPqpzZXsQM3Uycdv2rNE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6jCJ38rKBLEmVT/K9IQDFTn/kWS7yzy5e+
 8+YcbST3eSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 cmJaEACRTemPq7dQtszLFYGQQhrB8GbuvRBdwmylDUTUzHrV0C6NHTU/ixPtpoV82APcyrZBhoA
 IaeLMDdzRNCMbbppt5EVyfM3nMcxuXYbynZ5TqSETkVvGWRD0PKDVcB0uguMi3/9AGgztW+93S2
 1ULcFIewGcEFwSAMT9jPQynovXVkg61ZXo+ag8i/ZHKM6ARelvwNFXZC8itqc6duqYu0RrCZa4x
 h8GYZsy3uDIPyqlBkdo1sMQTHr0/mtzzpfoI7ej1PZS9bdh/wrA7J+QsyMHSDWA3vtVlxF0OryA
 nbXpATzt5JDkV5XP0cih30xwTD/AdEfsbCCPH/7bPVxHLnGC7N8q43eYBjEsQYLUZ4l4j5p/rkW
 duJ/fTvLljmG6LgPNWmchFPUUmum/gk6JSQm8YGGOAEeRFjBsLuLMVGOCUbcw6BeCJBgC6ZPoW9
 rkLqRLCW8Ut0txVrIjT9GM6vGuuhNkjSq9sq9S629v/BchbbBqH3PLaVoVEIyL3RUtVTuFFoFjf
 8hFON6qCC2J+k1O7URKJ23Z5spVoUEJLuLlwY1pyfiVW4bHpplLH1y9RgylYZ8RJTMiPQfHCTI3
 WnZ4OsWJihB8iUPMtsW8teAk7g66+Xd3TPqUF3grAcJgLyc8qrsJCfNsINEmwC10yYtCL82Yfnl
 UisioaJnKelhkhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4900.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 5c806140fdf0d6e60f2225824aa18d393f61b607..35dd2d09b4d441256f01d9ac762dd3a2f0a47352 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -95,16 +95,16 @@ static int ts4900_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(reg & priv->input_bit);
 }
 
-static void ts4900_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int ts4900_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
 
 	if (value)
-		regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OUT,
-				   TS4900_GPIO_OUT);
-	else
-		regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OUT, 0);
+		return regmap_update_bits(priv->regmap, offset,
+					  TS4900_GPIO_OUT, TS4900_GPIO_OUT);
+
+	return regmap_update_bits(priv->regmap, offset, TS4900_GPIO_OUT, 0);
 }
 
 static const struct regmap_config ts4900_regmap_config = {
@@ -119,7 +119,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= ts4900_gpio_direction_input,
 	.direction_output	= ts4900_gpio_direction_output,
 	.get			= ts4900_gpio_get,
-	.set			= ts4900_gpio_set,
+	.set_rv			= ts4900_gpio_set,
 	.base			= -1,
 	.can_sleep		= true,
 };

-- 
2.48.1


