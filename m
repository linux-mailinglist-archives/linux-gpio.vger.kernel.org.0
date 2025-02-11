Return-Path: <linux-gpio+bounces-15730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92DA30B5A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5D03A2561
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCB124E4D7;
	Tue, 11 Feb 2025 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HkuweSds"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1124C67A
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275818; cv=none; b=OKrAUfu+pmg5oLEzGtmYYQZSL1Jrx2kwRobv5woc1BfSbENvvywGqp3Qu5d8Aw9NgM90NKaAavWlpodIcBQ5itKSnkzN70xDLzPK29VLKBXzYgVMJmXVpjWrEtaWQmZOXIm0/34YnQcHnrXyEtBclLYHmkQzVcSY6DQbRFyRaqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275818; c=relaxed/simple;
	bh=bHBkkQ3gwrzmNpAMzNtD02RKPcIOd8kTW4JbUoyfFV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3iFsdbM5ORGqhIBUQlxn+zrd/6G8yygNxN1x6p0d2SOhSZOTrIJPtG7395MNSeLW0AzCXQBcH4c1uVq5skRVdZNlOGvGKhsDsUGnCq3GW2/2UOIkwwj5TEG9GPx7j/DeXOSQvy50US0pRrtLnVX+I4WONK225RHF82EsLlzG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HkuweSds; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43937cf2131so18674815e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275814; x=1739880614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWAYSRpQyGW1MmOUzWp6CZEaNkYKfy89Gcg/wUWpW38=;
        b=HkuweSds/bfFj2FDg3cU3m1gb8cFRnaraTsQOD5hIO/eHrgvTQr+gY0ngKYT+F4pbd
         9YzSl4fkpW15VVoGFmUcoWTSh5EmRC1CsP46JNph+r//SEE/8dAqxTLX/qzUZFzj4MA4
         0PXZ/R3YtrnVnpHBXlkHyf/CR4NNtEMMBVuu7XLNqnZ0rd1ShrC6JR2eY7wBMpY6dwEl
         qzeV3wdvZb7+Cdf6OWCB0SVHy475bM0vMykcdWinXxCjl/5Q25Yaweq1zDy/PEW3morn
         8gcDHebakzyEuYjAfSmH8NHrbczuNhX1tF6Uw1VZgUDX82jiHS8ip2/ht1bv4Zc3kZT4
         HEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275814; x=1739880614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWAYSRpQyGW1MmOUzWp6CZEaNkYKfy89Gcg/wUWpW38=;
        b=BpTq6GurlqZ8vTCgxnv2CDwnw+X3hW/3GjbiGYDRhFEO1maxbib4TlcHtlDPIOTyW8
         l6eR49wTigWLBjfFiXS7UJw7B5yhBclJLPAuHhGfGyYmFc9p4QFbS9CW3p+Xn5DlYsz7
         zH94XDV7PfH9ToEj0dKgipTSp+9CjK7IpgPRd/+oeXaQ3mnEmbe0gGpqgPVq/tJgbPGZ
         tovoJdAVqD0l2RUzH/EtcScEdFsaFmoTXmQ3/GtTuzmv7dvXmHknQS6Ggmo4gQx93AM4
         +QTUyIOvVM3nTsBruxhhdIBbkowMw0K+9JKTkyFdq0XXedskXR8EuJfcBThMBZE5NLoa
         H7uA==
X-Gm-Message-State: AOJu0YwJt8Xx+H3a6ePPOu8DXAnGaeEkmnvmFNFdLImOBBqQvjTSj8s5
	7ijuUgMI8MCmQUCDqcyfeZ84MGJC9C+qpnR8JVYP/8kA1hqJrhK/hv6OP0b+YlM=
X-Gm-Gg: ASbGncvcKXOQfYrYs+W+pNzqHF3S5pe+SlmMKDStBbndKXbx0Otf7CVp8Eq6TrQsviF
	d+uTl5+BxAVFbFI+rXz044vkb7H7gagh0b0npjVsxdDOHWMBOkK6usl1KkcL78vZNmUqQL4fUR5
	2k5euCcQedmDVJj4rC9AWjyPP5I933eFyY4PxbnJpAk7OqZrJPmXZWa5R++67z7CjAKnifMFH8o
	R6s5iNAadN9MK0wmPJCj18+7CYArq+Ld2yoKvdyojsuvTXZpeti8hWBq6CklCNuvztElMMwP+5Q
	3nok/y4=
X-Google-Smtp-Source: AGHT+IHYgYYOaXEpCdGY3z7Bd2VkYJBXiycDpU53N+TlhIMT/SWdj99wXGUXUo6mOipeYCRicV9nKg==
X-Received: by 2002:a05:600c:1ca8:b0:439:3d5c:a028 with SMTP id 5b1f17b1804b1-4394c81a33amr38392455e9.12.1739275814586;
        Tue, 11 Feb 2025 04:10:14 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:47 +0100
Subject: [PATCH 13/14] gpio: davinci: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-13-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yf93BY6UtZ3z9CvJxszbP+L4YyMx5+aznul9fLO8j0Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4YjmuswHK/ySgxs6vkxh9UOnLtF49m+HYhw
 kEk7Bki8iKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+GAAKCRARpy6gFHHX
 chwlD/9zW+lnpiPgLXbElhrE9+pbLjQ2E4wbziINynawEf9Y1rEgv29XTE28fO9Om5SdY6yvMzi
 bQbAf9MA0YtwVvH2NhyDNMIicUx/lECPglW0WtDX806YERgydsNPcowpxzwpV86Rq4kDdJy6X5/
 AyYtg8ucPcQBP7AXgKsI6YLfqImcjahAc+c7FkN7RJvTMNQtQqMvX7dk0Q+iYIYhY4z2QQZUH0C
 bQFfqBme6mvn3FDLOSALr//ITeFg8zX98CRPFaN+Jkjtz+QEshMe6t0N/5gCZQRFF19O0SGaWWT
 7yYmtdo+01jdh7eOtUFsFLTORsIa11wtKiBbmoZb6xjPc0n0cnWsDm2iogGJ4WnIXPbN0RZxqJZ
 aNE2fywbdg6PSUgreOKplFn77Sn+uMletLUpQbJMXaeVM0liZ/3hixVLdc9cXgYbdQG2LPREQYN
 EhMy713GOGXoWh66FCQH4CdKtvkc/KwRo9SHj9kwDY77vn25G77vplG9BAlU0+HJ9ldg6d1jjLp
 8CTlUEBle6etiWuPIh/vJEab9TgwvrTW04j1UrkE47R2f/q6kd2g260X9hs/W25H4wGWiXTVVgn
 hhwM87DBACNCKWp8MuZo077opF/SlR/MkrKLdI+FSOTmbXwYF8Ov1RUgsvk09W9Gp4EDAzjWznq
 zUMwfdpHgDO41/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 8c033e8cf3c9..63fc7888c1d4 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -139,7 +139,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 /*
  * Assuming the pin is muxed as a gpio output, set its output value.
  */
-static void
+static int
 davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct davinci_gpio_controller *d = gpiochip_get_data(chip);
@@ -150,6 +150,8 @@ davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	writel_relaxed(__gpio_mask(offset),
 		       value ? &g->set_data : &g->clr_data);
+
+	return 0;
 }
 
 static int davinci_gpio_probe(struct platform_device *pdev)
@@ -209,7 +211,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.direction_input = davinci_direction_in;
 	chips->chip.get = davinci_gpio_get;
 	chips->chip.direction_output = davinci_direction_out;
-	chips->chip.set = davinci_gpio_set;
+	chips->chip.set_rv = davinci_gpio_set;
 
 	chips->chip.ngpio = ngpio;
 	chips->chip.base = -1;

-- 
2.45.2


