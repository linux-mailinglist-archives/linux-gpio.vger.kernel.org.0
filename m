Return-Path: <linux-gpio+bounces-16933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16573A4C1B0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F8016EF79
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408912147E4;
	Mon,  3 Mar 2025 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RWQwNS+s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55335214229
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007931; cv=none; b=NwWW5gNfIIXdgwxgLOwZOvxCeQtQW93T15p+sp2HkoyB2myD87qtqSjLDZQW8ZUu44bvQMMWE7oJP3ORW2jvTk6VwcL5S/96IQz+L1BvlwOHOqEg8nTwil2kAp302BWbqsXyHZLzrK6cn11xXYEC4xMm5IE5YPVb4lJKoGGnBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007931; c=relaxed/simple;
	bh=aiHZJQb821lhfiQdy435wijwae4OL7CouAwmJZyOTG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk4rHxZwMUAIhopZsuyoSKVOnqqEqB3TiFJhoGcTYE4gFD3gSYUPFu75eTLOPYkEYfSwoHExjuI7zlr2B3rcMqfZLp3RoCsOOMiBCAwffJLtgDNQE9Ky5i2HtbJDEiML2zmqedwR0MGW0aeUup6WfHXvS4wG9XkQm/axOeCRuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RWQwNS+s; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390f69f8083so1966524f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007927; x=1741612727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Eanl17qUXG71sYy7CwEaQ1Eemxd4O2oMCTK+HJwW1c=;
        b=RWQwNS+sgkXas+mhfPJqzMLzvslK0qV7odkrnY1Smp1yQlZb0zuGdaVOQ+9R/fRF/N
         hAoAGpu0PTn8UCJAZO3bPiVVZDa9zVYbWm9rjPZ6SStfe/gIsop9y0qSEQRMcx3bDCRb
         43eWaD6ly/cpg7AcBBAKCwEEvItojQUPrWvl27BIUiAs+hl9PvSGhcRU1SREQmQcNg+j
         vzk7CTUpSxmmghz3dWl+0NhjsM7hghspHlXoJkIkegA6d9/XEY7tw3O3k7cni99sOhOf
         tKcIrrst65KOBVUz8+gkC6Pce9j9Y0zoZl9513VvVvy8wSLj3ULN950+p75+ml2/Ckmn
         B1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007927; x=1741612727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Eanl17qUXG71sYy7CwEaQ1Eemxd4O2oMCTK+HJwW1c=;
        b=ZURadGxMkJ+ncjyUSQxb3r6SynCEVvMKNDaPcAlGGnnGt3B/4ERWX19xgLUhKrbPJd
         Ej3caw5xBPQtyAfYV5GyQwPImSIZ6vQCBou4cbdJfyiGaVtpJrf04w8goYarUrbm5BBr
         8akReXRh8N1wJODgsOfVf+PDGL7cdVp/pIRDDT5NtblnJY07lTP6xuX5bbHUnSeb2tTR
         x6E0CLgI1BaBVeIB3IGxCX1WQUgQXlYCFdIBNAs/5RISsMyVNV+Cd+vl9uZ8ZgI1BY0U
         EBBwzwexW9N61DPsUuVuA+12HA6HCns9Oay3qhKKndgjs/LC62nur94D7gng/gSaVmiS
         +R2Q==
X-Gm-Message-State: AOJu0YyS8460IydeBxi1uj2gG4TszgquLebENJAFCWsgF+lGxUg+KPmA
	bq1o10OpXRj0D6qoXbtkBPAENA8MYoQC6KboKQ14+NSEeHXNeRSuSwVJm83w7XE=
X-Gm-Gg: ASbGnctwni+1+VR5CX7sP6JgvO0FyHVLNK2jDEX1AdZOx+83o2DMMe5tvo0g4ReLeUD
	PlMmrRzDH9LQu78/NdtuKlyJVFXXHBPf5oB5/opBGV8lTCxzfIOZxceFgAdwsIp6fjW179c8f36
	41bT8IHQxx2xhFD7XPHvmYSmJIdXOc+UGxb9HGIU6+TYA1ToqwWdr/wY6ok8J8PaTTu42cWxoaF
	etrO7UDXVCvYMDfEn6ngGD+VdchBeLq35d5csEuC8nBOtuDE0Vea6kWZKSMVBg0sqrgLgNg5zeI
	akCJTnKTCq2VTzqND9QrEBDkZBi/noSFsYWSDg==
X-Google-Smtp-Source: AGHT+IG8W48OymLU+IHB9XFSJz4Ws6HhZ4oe3cmcpMbwh3yAlmIGNVglM90Lo5CWs6gLp9klDtqeGg==
X-Received: by 2002:a05:6000:188c:b0:38d:e15e:17e1 with SMTP id ffacd0b85a97d-390ec7c6743mr10583036f8f.10.1741007927451;
        Mon, 03 Mar 2025 05:18:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:34 +0100
Subject: [PATCH 09/15] gpio: amd8111: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-9-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IGpiMZp6L9gGWujO4qnSAPvX9iEEZxJHKKOMOCB/YPk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawrsUI2RWcy6gYPrX/W+WpNP5fdKL0VhBngf
 HbvtbNwL0SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 cn7uD/9fLib1qmXJVVjOojHi15zCxHxK9YZHqSAzCp7rH94PpJrQVFK0/4M/9A5SA7n/43yhQJt
 q16nhbWNsd656/N/6DKOmlP3alKPdHDzsIIJLWSCtEG/DUuKltm5rByCe83Q5WN+j72Ppw2dcXM
 0QndwPOucqxkqiqLUXTCx9n6rgL9K4/A66JfBJ3k+fnOIKWlQYRad+5Ja54geRp5RofS1D/RWVr
 r0dy0roFTTJ9ZB4kRj0pkWd7EO3pEYWcI7kSIl0y2+RjrvhSrYLQftUvg/JPPXEXds/8aiJ1Ew3
 xURb2djMwd0qp9hk5BgCX8JH8I20ZfXCGI4qWK80k6cMIMu8O3qyTd4CapXeIhFIHj760lTqZLb
 98+Poi2DamuEmj56LQN6R0v4nx4PIQWNEWYclzSyIMD/ThQZwtG9+MThzU9Baz+XhENutJBT5CO
 YRWrfqqV+XAKVNMeeE9szHW2C1uPqGMrLIar0g97JpGjqpHv3qPaIaZHWlq6E9tntQctjiMJ4se
 XimBq7eoM6qsxJRvRSXx4GSUb0TkysTs4XTpOZJf0LeCfU1UTnlQrIAPP5scSCe57es8PqKeVM4
 NhHNMAzFCUJvtRyNFSbOtJziCjPmw/weTEqrkCmM3p9OIBCRqEtfHh8aCuFfn13QvOXKYFsU9fZ
 vV6G4nC/fyB2SOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-amd8111.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 3377667a28de..425d8472f744 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -94,7 +94,7 @@ static void amd_gpio_free(struct gpio_chip *chip, unsigned offset)
 	iowrite8(agp->orig[offset], agp->pm + AMD_REG_GPIO(offset));
 }
 
-static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int amd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct amd_gpio *agp = gpiochip_get_data(chip);
 	u8 temp;
@@ -107,6 +107,8 @@ static void amd_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	spin_unlock_irqrestore(&agp->lock, flags);
 
 	dev_dbg(&agp->pdev->dev, "Setting gpio %d, value %d, reg=%02x\n", offset, !!value, temp);
+
+	return 0;
 }
 
 static int amd_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -163,7 +165,7 @@ static struct amd_gpio gp = {
 		.ngpio		= 32,
 		.request	= amd_gpio_request,
 		.free		= amd_gpio_free,
-		.set		= amd_gpio_set,
+		.set_rv		= amd_gpio_set,
 		.get		= amd_gpio_get,
 		.direction_output = amd_gpio_dirout,
 		.direction_input = amd_gpio_dirin,

-- 
2.45.2


