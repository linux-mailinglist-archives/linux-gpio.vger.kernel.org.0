Return-Path: <linux-gpio+bounces-19251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52087A9A642
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B74F465F95
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C2222541C;
	Thu, 24 Apr 2025 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JgXxCCpD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D222424C
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483762; cv=none; b=pCWpZ3uFca67oEmlkx/T3tQ+FOlksizHJMkrACjYLlKZWUKINUuemPNLPA8wUCPNcTQyKqltSEpaCZt8CdhWllJGCZrZdWTvRArPe7mIbfKBNhTu0OK5hSxJB5W9iyqjilV/qPOZluGpg3WnWiRdP/7LqSlKb9aejwr3E3kByj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483762; c=relaxed/simple;
	bh=VLiNYPnPf502Mh3wMIxXO3OQ2e/aTVoKkQARy+JefUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVvcRof8uReRK8WoELdHdCQAFfZvut6wlHiMyY6Zof2L/00lh24m6WRXxHu9s7usQ7ZrpH7cDYGGXjWWj2h3qaIgxZCWMVdAopqFM4wBQRcF7PGisJxWxv2YiGcD/o99qdGVPdJsq19a8N6N4uK/mGTLBHcvczsA7+TI6burGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JgXxCCpD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso424059f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483759; x=1746088559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3C7VrvxYzsauY2O9fqA6TSLZH9busDLcB5oYAodWvc=;
        b=JgXxCCpDK1593dpUv4wto1J/Ut4IQ8l8j8FYG2UkBARrTwwRKEiGzp7Qu0w4Fw1bti
         M/bYNbIbEYRRBWPOaD2UXBT8tw68wN5RRWH05Yw3ZPp3aYSDAOtIv7r4WvsSAKi44P9U
         s9xlev/j4ZXVAQCtswme8lyD9NAsWO68tfDCgo6wDCjdcJUlkArM4KR46gPE1WR8I/zK
         Oxb4dftYrAkhG4YTZIKCkF99tw79yYMPS3Mrk6Xs63GLg5qFNYD+cn8Unn3iLf/HE2Q0
         f+zW0e9rS+mWJZlq05xmrbXWP3HfX2zFwZ0/clpTaF1tBOCngUNtlF4oCE17VcRyj3Ml
         gFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483759; x=1746088559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3C7VrvxYzsauY2O9fqA6TSLZH9busDLcB5oYAodWvc=;
        b=NwTW7dmHaplmNgjfhJpfJXF1S95S3H5n6ZsTuW3cWqGlV2IjQZzCqCYgYI77672T5u
         m1ZlVRSc+uB901NKvZwyEx3iy/mMtpYtVOcqxVnjEWEiprM2jZ0EBh7mYp+ESoda8+xs
         VxGMjennVvKI+N0hwA8G2q54K8mdgtjR6Xen9l8qZBRe4w/2jxIofaukZ0FxXgQ3aVwa
         Ydh83z4rFkSfKDRUWAmP109CrcjWWMZ4PlSElziAquA4hnxUpbosTGKv4arxdu1s9lyv
         QZsZlykPpdp7ERuHhcnKR0AQ2fwfuSq95UTiE47K6cqbx4iZ6Ulm9HI09CBBn3B8zEJW
         7NOA==
X-Gm-Message-State: AOJu0Yy4fbQ4xN80ET0mdRBhipq8rTBkdGvN2fBTEO5LDfX97sQCZbSh
	Vhum0/Fben+PMpEHk0matBmvTrCykMkxftOueT6tGhJzfabRJBHQ8rt76+VI2qw=
X-Gm-Gg: ASbGncvIUzDJkxIZtfJkUUBvR/4f3JRIt0lX1qvoMut5J5XD0X4exbVYstG6Vtnktyl
	q1VqzgfFcLoYKQoihCC0csFnlu7+dc72iUJD3kfbS3KVUWKAObKA5MZr88n0PGZzQC2BhTCg7c8
	Ivli/pBH44NnDU5H2CVKoUSq09y3M9ShEPdrdmBXG876gnWrewbVykJwHrIPYMRXK6tm4bPym2T
	zDEA/BxuR+vakL/9Uaq+LfThBPG7Vfsk+yy6CBNSiDUJ7daDZmqOMU+1/Uf8zlJbVqziXKCFeQk
	cwNe3/mUmMsSAwUVZOA4c5iDMyWJynh0gQ==
X-Google-Smtp-Source: AGHT+IEnnIBOjrZ99O5uQPy0Nc6YKo1kNCkEEx0ebNFaJGjHPfyJDtyy3I1rgWZXM1I3Le9gFxfXaA==
X-Received: by 2002:a5d:59ae:0:b0:39b:ede7:8906 with SMTP id ffacd0b85a97d-3a06cf54e7bmr1122286f8f.19.1745483758888;
        Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:34 +0200
Subject: [PATCH 11/12] pinctrl: pistachio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-11-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/7hnqabmKbj9zc0e1PTeiq5UZq78y4tKE7Nf1Bs7XAU=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBoCffdEPoUC5vhPYaWj6u0rywJUatNB6kvhR99k
 aCkmHZ28xGJAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 csr2D/iydanG4wHydJL1ZFZQ+tndFEOwZ6yd6A+ss+6d7RDHHcSVTn0kZW2keFJAbpl36Zn65RZ
 hnsLpH6KbrmYpJRjL/LHcH/7NbHdwMYuVrZ5UoSGGFXD8Z774KxtDYhszhTtIPa50J+L9zJR8x5
 ar4cVfcl/WBSjqaJMBSkhChbwVJX7m/QYAnSa2Fgq3UzHXvWQrmH8YUrcnShqCqKxohVhrCyJaY
 8i+qQ3jFFfITwn5dO+lIDMRRSLpoSUvhLA1PnI8JDwRTqurh6h4B9n3YuVxjHSL2kH7HEqVxX4E
 v22xIaAACCrutV1aCSxkP4YZeKsycSdiLdlqsh/tzA+2Ksbf/jILWTgafuZlhOtG48dr0Q/tyG9
 eJ4q20yXNigAl5+nHVnCDoqiZddjxg5Ab6nev7k2iN10EbC2iw05dPmmkIqGfGD8KL+ynn92Rnk
 rz0YmhHxmeEDJnGSnV/FYYSSx+5e9VoVdHw3wmJD0kHAiKeDp2nJaCcbipsdEqgN1C5Bdf4B4JT
 t0XXOiT46X02l1L3OVAp5FKWB+rZDJPmYZeT2P17R13iyZoavCXR4INacZ+6v8l7ijAg4YoX4Rv
 47sjTr6naGAOt0WWJUf5tdguvd8w8oeFAM4/VScXq3yIge14kHXoBfwJfJl9r6/XPuZIeR2g++w
 SBm4jRS72OnZx
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 8c50e0091b32..e7bf60960961 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1186,12 +1186,14 @@ static int pistachio_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(gpio_readl(bank, reg) & BIT(offset));
 }
 
-static void pistachio_gpio_set(struct gpio_chip *chip, unsigned offset,
-			       int value)
+static int pistachio_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int value)
 {
 	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
 	gpio_mask_writel(bank, GPIO_OUTPUT, offset, !!value);
+
+	return 0;
 }
 
 static int pistachio_gpio_direction_input(struct gpio_chip *chip,
@@ -1326,7 +1328,7 @@ static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 			.direction_input = pistachio_gpio_direction_input, \
 			.direction_output = pistachio_gpio_direction_output, \
 			.get = pistachio_gpio_get,			\
-			.set = pistachio_gpio_set,			\
+			.set_rv = pistachio_gpio_set,			\
 			.base = _pin_base,				\
 			.ngpio = _npins,				\
 		},							\

-- 
2.45.2


