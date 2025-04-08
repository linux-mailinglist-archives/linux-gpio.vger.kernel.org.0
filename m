Return-Path: <linux-gpio+bounces-18415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843FA7F5CD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B70189A7CE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A035C25F981;
	Tue,  8 Apr 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FaONou+0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80E2620C9
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096677; cv=none; b=o8wHMWD3GZwWYuWhb4ShgAD0tRRXligDootbk2B6tx+r3fy1y8ZARMnJ6tfQi9lB7rS4zUZ6g2eWaV0ePk8NtvyLtC5zcAk9eyZoGB+xkx1fBjT0+P63gdTn7wH2VBj1TyuU8cv463dclSwZdLWT67m7qrjpjVrqbSJOP0gzdss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096677; c=relaxed/simple;
	bh=LUO169XweHthkl0x5gh4EBHKDTlbmHW+O/3cx40pVA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6DaSeF76TUcMLcdZI79oB8MNLA4FV1gq3oX15H2DxKRnaCjotf+GcS96dIGvso5Odahwhc8aF0/YY7DgpFd1skpA1C2bkev2KUkFfQcVth7CkZKv0vHlBP2RLvw45dm49kKu8Pq4iVNPE8MXvyQ9dUjSknkNugAcpAPNCWYbxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FaONou+0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf680d351so36280145e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096674; x=1744701474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=;
        b=FaONou+0YTurmuYaYSXwBHKij0TZN3e8kqnDwuXMsizfcukkSI38P9lncuk8f12AnC
         OqlKutqRLQZ4MZxL+U26IIaJ/xlTr9WIfNm3RfId/qyXj0WVDdtJ4Uz9xYuYYfTG3ipA
         dVWb4fx1q3ESavS23D/nQf/bZnYCeOAPBOzE5gH0vK3DsOujCnHwL7AXUoTotbAIrXha
         elaZjMnx6eWnnAIld60LwBTt0CJ64YLM6JnWBAwVBZN1MAYDlsEN0FE2wGlOr7jxC4Im
         bA1Sw2Ji1Fg7zY9iAbAajzQGocUQGJKqTmXhuJbk5tBtvLgukD08E0Y8McvYEVZhfSCs
         2a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096674; x=1744701474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=;
        b=Fq4OtMIMYRuNYnue62015wMjjDcosqReIwovkKjN+q+F48xfHsDABN1zH2itqOX36N
         JGsFT0OBjzTD7vpXvUrH7Hpb3/bk1Xtnv6xJfX4anL+daqKQ8uDCZb/4TFOx0tr78Agg
         rYlJ2Die7GOvEeZdYDN8d0pruJFg1XaXNeh15iJU4PHu5quCWgSi85iLpSkQesHuhgnn
         1efy2fhNPM8y3sccW+LvBFwzXMCuTB01FI94IzuRQ7JYfulubG7YuN/3N8GGnZ5gQ0cI
         dC33tnl4k72B7K0bO4R2eKWQIoP09t0+uTEZU4e3ycSvNkk6RQWEnoUIoS6geaMJwnlC
         KCaA==
X-Forwarded-Encrypted: i=1; AJvYcCUhptRCuVIU1XqNAhXRXhlSQtpjuAaw56JtrPRIFNBEKSa6JiDNkrGZVEQLeH3/Z1K7B+BW7n/grSFc@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3yp+UZ83xmiyo+BBgtYlmgGRFNdwhhU5NLHw1UuzhKFe4+jy
	fqXgtdvIhtb0x0JD+EvftuFLb4U4WCG1kKwxIv4kysEeX/DxohXiZNf3mgLfYuc=
X-Gm-Gg: ASbGncuJx+2gZaPE/eL0xLFpjP2q7eVQbJzWm1sYcvZshwfsrJ8j/HWdPKt4OMctEfT
	Ukkogz35wPoDwfaza37/21ubKsDTvt/tjBps+ryNSGe2FL0tG5yGRg4xjPzBLpiFGGsYLCG8pSu
	fv0htxDFJuun5awlObRU05N02dxXLqqL/zpaTckS3QimdqYzDEN0QwZEsClUx7au9Z2IA9uECFQ
	djMBpNK/4mBSecCPpnyPfbtQ51J10Jrcu6HeX8Rf5XfL98ZwpjxUJlRHSyjLlbQlHkuXhNe3KQe
	4yudxtsQ1jj0paKCCfSzPgYmFb9Pp/iLqMzoQA==
X-Google-Smtp-Source: AGHT+IHrjnllwruX19f7P/GJ6q4XihZ8rfCQK9jOXGEEswSMIiSKCV482ACd4hwI02zSsicA1Cwvhg==
X-Received: by 2002:a05:6000:2289:b0:39c:30f7:a599 with SMTP id ffacd0b85a97d-39d820f7f4emr1793514f8f.18.1744096674126;
        Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:41 +0200
Subject: [PATCH 04/10] pinctrl: abx500: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-4-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nW8gbeASZZPGvCfMjx4XcSCJQKXVyNGKry+o6wrAY6k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZVzNUI3VgRQMzfUNu5ztBdbgFOzKCX2cTD
 gqJRJh5fnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 ckcMD/9lHTxFJCt7mJF9tP1pyTVlOFcI4iTV1L1QK53z5FW2Z3SMIbsg/WP0Ox+KZTEQhQIH3rM
 wwqGzcFbxbursx8+r7+ZvVqkU4QZIBUyACF7u1pek1/n8JBWnexyzkfimQ/4dv84Mg8fblHxX6/
 e9AxG0M296lr/4pAiXZ1OD25/6m9fmgaetnGniuV57A4pLBJe9hlfZ2YzB5mYUgkf1H//Jbwa+A
 6XaU8J7I4WJxHP8tl6QsF4nWHGmtgm2fhT82RFptXXjqk4O4soM7AG+Ss+tjQK6UQz9anNLU6Lm
 rmqduN1o+po7YG+d9QycugTfQLY+ldfFNdSba874x5yFE0yN5u6hWFUlf7kqCSA9/ShGC3h1b1d
 P3SrzAAp/KzpaZ0qz4k3uHr8AWzjtoebNiQLf0np9Rhj6QlsXMPTjpRvO8qu6TwbjgMUVwXs+ML
 LAU2zu2R1fixy6aGTWSrsqOHHB7OOlUsUa2Gx4LvWVk5suCmM1xbfDPoByv89XnsFLphWZVxUvK
 aJGTZoxqeRJVCy+Hfx8X9v29LWuxTlLQC6oNMkvVpk9Pycf8fKsnjpKqnwNQ8Of16WN8gMmVTAb
 w4ONrOgUNVqfGiBiUJqcKD1U3JafBOwIdNX7SuEwqraaSC6bMhiSiynASp0nnYhkZEAuJMLEqV9
 8aWIUWj5E3JEMig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 8cd4ba5cf0bd..2f55f83127cf 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -167,14 +167,10 @@ static int abx500_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return bit;
 }
 
-static void abx500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int abx500_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int val)
 {
-	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
-	int ret;
-
-	ret = abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
-	if (ret < 0)
-		dev_err(pct->dev, "%s write failed (%d)\n", __func__, ret);
+	return abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
 }
 
 static int abx500_gpio_direction_output(struct gpio_chip *chip,
@@ -540,7 +536,7 @@ static const struct gpio_chip abx500gpio_chip = {
 	.direction_input	= abx500_gpio_direction_input,
 	.get			= abx500_gpio_get,
 	.direction_output	= abx500_gpio_direction_output,
-	.set			= abx500_gpio_set,
+	.set_rv			= abx500_gpio_set,
 	.to_irq			= abx500_gpio_to_irq,
 	.dbg_show		= abx500_gpio_dbg_show,
 };

-- 
2.45.2


