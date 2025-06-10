Return-Path: <linux-gpio+bounces-21186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED1AD368D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA633178713
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8C829992E;
	Tue, 10 Jun 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="js9xeNw6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103B1298265
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558820; cv=none; b=ACKtyr+/K4OhYx5uO03761YW4fDpKnmXBWqbb6s9BL+QuKOzHsayxSMFkCn0dUGelUdLqy1PPVqyFGuDPe1R2hSlIgQdGcN3h9gqDvJKp2mSjEE24/DCg+ELW/weVqM3lmqS7waFhd155D2Fv0S9ARN4zpU25k4lqtGzy6c4VJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558820; c=relaxed/simple;
	bh=4QCGnoq1bJCjjIi9V2/83E22w1djp2GNx3m7VM1JT4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfvhRnBMylDntJmUTuDq1fQRCnUvYel+16fkAMjRMyN8a4llpcfedPiA3oSzBA+AjHYsdZfOOwnkU8CQKnRgh0d+b30NuiwDM6tLq/kF4npMk+oILxMTx+B25oQpF3qSH6UrnaYIT1Y4jpyjHeufMHYim8iAR7eusRmyUhrWcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=js9xeNw6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42020785e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558816; x=1750163616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=js9xeNw6AtNzjm/DI4DYkU/s34MWcIrjX6MjFW0iM3YMdx5sUa4ZKV7AsORG693Ua0
         wvj/iRhlsx0ke2nPiI5KVHW0nSYT5y54TEYzCxhkk1m1DjM5boHC7/3NTdoidhsnLWL6
         yfkrx0VyWANYQMwLrhD060ZZxtX3sc9lxLAM5Ktk5b+/6ae07o07cinxypjyKWU2uu8d
         2dAlC7jE2i+H7u/qFlYpoNO+tObQs0ehtqOFQypDv2JOy+jMMB4MhYMLoCzgsiU9HJ18
         kSp5nhOaZIdKqr4+TV+JYIIqZffDmmWdAHleoDbpi17SwQuQ6Mf57xEKA05RFWWq3dm1
         zxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558816; x=1750163616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=hta+Aq2tfZN0gr/HrGOzCIibaRToRRXwZj8L4/SmOvUBLkIYSNox1sz00xehk47VYF
         tzxetRc6lY65vtZGohRuJlyyuLnNnsru3/h3yyj3GoHXon1t9nq4sbDv5XY3aEHshcz5
         sxO3bQnXtx3uhF1en+HNH4py+n2JtQl4c5vxLs5pAZr4Y8WUc3SAURsv8Uu6VpiJaVLF
         rGKCKhzz946r+p+rzrn4kuNgLDexkIDZcAjIHr3AJM5g5eGp1hD4zDYAafc49ipMrHeK
         h7dGum4KEGVXYHbHMcZrG9u9V7I4RAn1ftllVEUTdXJA9cBtqcHjWODwxGKvFp2eZBo7
         +ySA==
X-Gm-Message-State: AOJu0YyG7YjRT0fg/WpbCFSRJwlHX3shOcK7NJtu+R9Zf6IAPgCh37xG
	67Z3XkV2VTWZLF9lEOzZ5CS5atlxI72zYHcdYmMZmF08cheEymI7mFioaOR4CeESg3n/Ya1yLrh
	klVet
X-Gm-Gg: ASbGncuoZJmCI/pBvWCbaHyZfjFWpiBfu14wA4+nNxjNVuN8OWwwQ50Luju72vMovsv
	yycNojBuirwtoHulYnyZekzTo7KhcOg8dEEV5xcUMqZo/DDYJxEDMwWf5puR8T82YCTxgAtZpx7
	vYSWZDhb+miWzc+qCTnSAcYNFgrnIMLb8QH5FsA2Im/QR/280cYkeO95bV0B6coRVLgHv8x89LG
	uWBuTRxKPLujpklXhpfp0NKN8y+vPobaU/vMzjkF46UEn/TB/9fnhY6WGEXN5REKxCHZysmpLe2
	X1nQ1ymfSrBFc3vfrcfwIDhAJygg4j4QT5Mvf8J1anwPNWLuEuXlUA==
X-Google-Smtp-Source: AGHT+IGEb945pctd/19j/70DlEklbdpCSjS0SXNKlhgiB1IZnKkMVBIGu/KwhCfcg7w0J6nsDegN4g==
X-Received: by 2002:a05:600c:354a:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-4531ceb5f3bmr32427015e9.1.1749558815837;
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:22 +0200
Subject: [PATCH 12/12] gpio: palmas: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-12-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EJnUqbYdFsX+B+uS77CC3tICbyCNOST1Ifh9i66zy3o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQH0s51YOk3kPi1uWti8T4ohdUn/yx53NBp
 EPSYm2TbnuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cl6HEADDb/gC8UYIxfieGcIPlCLMVRxpN6B1QvZbRdjguBGn2V1R4KRaQVA4VHY6bdnfwHfmTEs
 PyBGCdOw5W7KfEBvAHi1BPRg3jZ3AhPL1MBtsbCUu3wkmJaME0MAZRi/9kTVnBd/90m4ady4fob
 ZiVpTNRYaxU5/agaxspedLUZ8yS4ru+4nvF6UhNZ6xCbzJJ098pcxmRPwL4nP3Kk1aFacQAXgoI
 RlFmAUUCPGcr+/1hQ44LYPBhD9CFSxqmk0/peAbcioUE+37xiupVSMPVtmphojgLgRG39WdsAW6
 wHLIbw8YDioA5qjexp3hLxB9k//QX08V8iDF9H4FALJgdECvDhjcNfqx8yoMW+M1koIJkBDfnZX
 ng84ih0EIA0Wh6fqeKTsbJ4JOE6/eR2EdcuY3FxX2k4O2JDELoEnc/UERh5Y4DHuNtG520m7uyt
 D2MG4nZJAZjiBZ4wZ1bDW0t09L+XCI8V/1vpwCxDVmhkEeUduyWT9w1zTgWQ7at0NdbYAgZ+nG/
 jmrJ7UptwMJ4P1yZmWdfEYXlSODp6TjS+tPzWIXQcLoS3eRRpTav7CIm+nr6xe3tNiOPBqNb1H1
 ZqpzpL7iVd8AuUaR4K75BWnU1tcbiTDFsuLnE8/CZ51sfmEAj0VyEK/pDJgoZj7ekTL7Yr/ve8p
 M8J1VvOFz+l99wA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-palmas.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..a076daee00658a9e423a0d78f14ad48d61956d7a 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -54,12 +54,11 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
-			int value)
+static int palmas_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
-	int ret;
 	unsigned int reg;
 	int gpio16 = (offset/8);
 
@@ -71,9 +70,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 		reg = (value) ?
 			PALMAS_GPIO_SET_DATA_OUT : PALMAS_GPIO_CLEAR_DATA_OUT;
 
-	ret = palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
-	if (ret < 0)
-		dev_err(gc->parent, "Reg 0x%02x write failed, %d\n", reg, ret);
+	return palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
 }
 
 static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -89,7 +86,9 @@ static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 	reg = (gpio16) ? PALMAS_GPIO_DATA_DIR2 : PALMAS_GPIO_DATA_DIR;
 
 	/* Set the initial value */
-	palmas_gpio_set(gc, offset, value);
+	ret = palmas_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	ret = palmas_update_bits(palmas, PALMAS_GPIO_BASE, reg,
 				BIT(offset), BIT(offset));
@@ -166,7 +165,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
-	palmas_gpio->gpio_chip.set	= palmas_gpio_set;
+	palmas_gpio->gpio_chip.set_rv	= palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;
 	palmas_gpio->gpio_chip.parent = &pdev->dev;
 

-- 
2.48.1


