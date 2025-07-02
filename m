Return-Path: <linux-gpio+bounces-22585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFAEAF0FA3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 023C27B5155
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A424825B31E;
	Wed,  2 Jul 2025 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g/bBa63l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E17255E20
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447668; cv=none; b=HJJHLJ77GC8fFSLtBPFmUD+3r8ZfTnplULWM8+IZNJ3pftD8Pf4sxORps68lqPW9QHc77+IWWaOMngfQpKY3xDmZc+NNx2sxAEmT9edLcTXKXMrGqbJAlWs6GzQtNHU83deEaA4FgeFXp1PC4IHYFS2ijFgwX/erAH2hcSbJLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447668; c=relaxed/simple;
	bh=NN72aqjpwJSv2irviEDiSUqnOMzC4st1teZcnfhIUJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zbjzai8Et/yNT7all3guU/4XoB//Na9ghKUl6PWPzn+IYUwi4a30gLf5Pn1sBW1PHa3n9IlS9LgiU8eZFC8XG6LkXV3S3hOMpO4qdIYhGjx/piz09qU4LvSlrZd9z97dq7HoExpHP/F7rXyfEzKqEg39gXsu2Z5J9GziW8UOF9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g/bBa63l; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso4406902f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447665; x=1752052465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zmv3tRKIBVq49AP27DBsRvEkqxDC0NdKZdExvK5QdPc=;
        b=g/bBa63lD/jr6iRfDzYLsFEwsb9Dksnzy+gQCdTT3JluZVP8StBAnYHpmzyaLlaktn
         0pkR+aoGn4kxpAIZaLJaswAKVkEESQDR2k1PKQS2CTjITRb3EfPFRvAesnunaGkmG6if
         Tffs+uCl4Lcp6Ti59LkwGVHNqQhDXhKNqJ+fQZMyX+dnHOQzwqNb4+3ixg0CnhKgP65P
         ul5Y0g8zUy99e231hoiEYKR3XQHLZ6MrpD8r0BNhc93LrDlsk79it6I4mMhrpDXDV0ad
         PHXUx2Er89zMRCiZGNNe2gM3Kc3q22ksIZV6onkNXCgwdPWCHtJzf+nNzEgjefX3AerQ
         T8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447665; x=1752052465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zmv3tRKIBVq49AP27DBsRvEkqxDC0NdKZdExvK5QdPc=;
        b=XDapGKeC/qeLVZPvhRa4E92asPqy1krRya/uMXwDljzFSYlxTeZ5e5DpzLi1tRXIxS
         IFUG1TDL71+1CHfE8hAGYqwUm+jftTkmGADBdODwm+76awC1yTILyMZ3F9jEK1Ubi6+e
         Etyl8C4jG4aUUPZvwfsz99vLwXAT5Pcl+uP/vh5VAJsNT2vlKkEvwxB9JRCiJdgXvpdG
         /8npD2Lf1kIIKF1QeaDtxtlf5aAHfhpPixVfl2nXTvHM8SPDRMBlTwbBrlwkVWVB4yze
         HMVU1EMJRwX4ItS35HlRtzrJuU905ZRYZAP+X23DSLtoLhlrSHvRLJMPG3JP4MeF2MmP
         Z80A==
X-Gm-Message-State: AOJu0YwYJR1Gr8SnT7kRVdYaX8x8F57eT/sPASBBMcH3bKV5QCmOkVqD
	cBL1mPZmKwBKY7ulnwulztQGEhD4htIbAxi10fCY/QAsNjDmOheLPIH/59fL3nwJfPU=
X-Gm-Gg: ASbGncsWCtFmjKQQSsX58ly7YmuzSqTjIsrLp5MgVU0N6p6UHVBkYyJKdCKWOrqlXuz
	M6+/n32YbOeqzOuwvRzedyD4FsEy3MUVCfPcFM6z3mUiJ4+lfA5ttZTSq+tueTIA9Oj3PzzUjMt
	pJ6Exyl56OUbHq1nh2f7gViHlSi10142O79qh1FriR0ODOMec16l0bWgWwui0MjUGFE4QIABVso
	gZYqOUjPtVea8+P3eSBXNoG8YqCuZpd89IHvc9ROWTir7ymVrPj3oRlYEW8eqLm00inBwolajMx
	6lFihNO8ZUq+50mymc+VX1dqsuuGbAvxxyrYqMMW8YXQXz2ag2jT1Q==
X-Google-Smtp-Source: AGHT+IGTmm4jTikwN2VGwBNAxx51rzCBt9ao4TX3exq/7NZm6Hiin2DGw8Q7fWQBOSkwwMPNJ/w3zw==
X-Received: by 2002:a05:6000:2509:b0:3a4:f7ae:77ca with SMTP id ffacd0b85a97d-3b1fdc20aa1mr1411408f8f.3.1751447664576;
        Wed, 02 Jul 2025 02:14:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:13 +0200
Subject: [PATCH 12/12] gpio: tps6586x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-12-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dzEZyQb/TffciTBuglIB85TDIVsqFc54rkSmHofFPX8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhhtYULyctCIg0hBfEEWvehjyvTXWYFEXCBG
 SErYwBkd42JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YQAKCRARpy6gFHHX
 cjVFEACPDNGwDFvzi5UCZgFldPon9+X/rScnJUb2vh/WsnJHJyD/0LaFIwkAQtbCOo1CqKXzY75
 D6wnIjv5S7bEKT2CTsx1I2Z8T+Sn7pBZ82Kmz33kLiX6cKNG2ghc7Vxmy1T66bOQIQNQZ3UgURT
 s5YaykSkWDjUQOv//cCjbByPlw8IpEo3oVT6a6hpZSO1AsmWzBTRfv1l1JxAWexfPzwqBLJg8fb
 DGCEXceEl5X6LtC2WvCRbtUQDGNf9qcM2XFLIvYANLs1LFw8VVfmPN44DlwBxbACf2G/Ig5Btlz
 tblCQgh2mbB8V/O9UmbJ60UmJ5iEb/Z2rG8GoIYr10rxm/yGz1A1z6VFH06Uepa1UPkjqQQyHXn
 kYFjn1grhI6OzTB7nUqKd8+ktUppIJBeaPAB7yoU11sr96MdVvBopa2syhHl7EI6RVdc6QmCwxl
 I9UVisYsVV9WOHJCCmE7xrSOBM1ySQMdrHFZpDJcxoWV+W7iuMwKVe05/2zXzgcM2nLZEfL/ISC
 eigHTL3e+d7vFQidKXf2qWeEz09CdSozw/8fhwUg2HwIu/9EyLrw3bNlJ3CN2iqlUTQ/PeYoegZ
 YQj2GmsteV+0fJm3FWKKc7FdD3dlU25KwVEsfqD8jQicxUcPJ4Mn8cTvqexel3TncXL9NSIkmBG
 YNjyg562TerE/NA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps6586x.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index d277aa951143ccf9560bd77d461786f120e46a52..f1ced092f38a5e491378fec2d80dcc1eb1182cbd 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -40,13 +40,13 @@ static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & (1 << offset));
 }
 
-static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps6586x_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 
-	tps6586x_update(tps6586x_gpio->parent, TPS6586X_GPIOSET2,
-			value << offset, 1 << offset);
+	return tps6586x_update(tps6586x_gpio->parent, TPS6586X_GPIOSET2,
+			       value << offset, 1 << offset);
 }
 
 static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -54,8 +54,11 @@ static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 	uint8_t val, mask;
+	int ret;
 
-	tps6586x_gpio_set(gc, offset, value);
+	ret = tps6586x_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	val = 0x1 << (offset * 2);
 	mask = 0x3 << (offset * 2);
@@ -95,7 +98,7 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 
 	/* FIXME: add handling of GPIOs as dedicated inputs */
 	tps6586x_gpio->gpio_chip.direction_output = tps6586x_gpio_output;
-	tps6586x_gpio->gpio_chip.set	= tps6586x_gpio_set;
+	tps6586x_gpio->gpio_chip.set_rv	= tps6586x_gpio_set;
 	tps6586x_gpio->gpio_chip.get	= tps6586x_gpio_get;
 	tps6586x_gpio->gpio_chip.to_irq	= tps6586x_gpio_to_irq;
 

-- 
2.48.1


