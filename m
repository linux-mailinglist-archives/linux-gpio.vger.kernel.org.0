Return-Path: <linux-gpio+bounces-18312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB224A7D613
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB71016510B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9A622A1CD;
	Mon,  7 Apr 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QXTxvB+u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756E1A238A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010718; cv=none; b=exorW9mJlkfoZq8DLDQWpZTYPnvRp1TmfgIKTr8TKzQifEkFKmvY56etMXioSgejBa4t1MgHCwJHq/0aDxHLXdW7kei+Ncokq0MwYzqK1hCvCQgurgb9EtmiMBHg3LD5K6UUsvFBXRVdOLhQ4bzHs0DNlnzAzsWNmXQnj8hnlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010718; c=relaxed/simple;
	bh=zPFQTxsu9KrfRO7qIWKrD8w2tFvy9Vh5/igl74bqvnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HENNydz0ZhJ+f0FE6NL9Hw0ZI7hoHvAtjjVqgo+RPmgUo71ChfVmlIm+YDaKjKoL2oxba/M9OQTAnYS265qIAxSOg69dKQyJJiTq3EvU3wXKNgLbX6HXEqZIJVW7lw6IymXUFYj9HRaEW/4gg6whPSEyiYkNrUUTCRzrGoOEQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QXTxvB+u; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3581191f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010713; x=1744615513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUo/CGbtBVvw4imrMqD2aY6g1pYyX/Iq7KegZMsusa8=;
        b=QXTxvB+uqrbJjQhfkriNvxpXRuqomIeJaFPkTfsXT2O912jk78burkdykkqaDitUQI
         VxtZH6R0j8RoBs0Sqsb8RIG/AvTpcyoTYvQ7OgoenrY0juS5Bjj34WBy1WcHSXaWP5r8
         jJvFwSzsln1fr187X3ZFwrF0r2RGrJla0HULXwXYpA1xWpZSskDN8fzHQG1ySk6sbW1v
         tNfTr9QaARauvlEkDD1XdZNl69uB3zvKRTyVHokAIh337vB6OlL5ZacqMbRvyyycd6Xr
         2NKjc+kTIt8CtZVP1mM0Xgbwkxi6s0dyD7+RNbuv+KxwcqgS8UjWiJh5aCU0+ty5VUB8
         VVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010713; x=1744615513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUo/CGbtBVvw4imrMqD2aY6g1pYyX/Iq7KegZMsusa8=;
        b=SaCTrYCY54lbRU6ETUQiSJADmuyXz2B4YzP6Ju64BX3OzQFdnGgLcYWLK9LStZAXMx
         0MojXCb48JW4w+TWrF9aRQOqYtkGKRzf1jcegAoijH+2/rCF0WdraaooYNE9HYL3ozva
         EkEhb/UNhbA25QcReeyUDF0894UlC9sBUjuWmXY4xUPB7NqXp9PMbUEXzgRokPvkwy+X
         WE3DyZ/Hc4vgoRA44h2jeewSeTeiNigHmH6IAWcqV4bRiG47HuGBIZeZYyKlgxh+G6K5
         ZM5wt6rAf0sGuDgyJtMw3j1LVHZMmBejEgsIOpU8nD12HwmnesdFRsJJxVEFH08seJzD
         3kQg==
X-Forwarded-Encrypted: i=1; AJvYcCWmesY+n5wkTNM95kwf32dXSZoar8Z7tCSpQ9ogBatHPs18X2hYJuEt+MXX7cVv093pU12OJcH2lk0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz1l+52W5m2zygekLOo6I6MZDLm72kKPoDReLspSt9aEOJhsY3
	fHmLYt0ls55pad0ivUMVB/w5gMLKNQX92IsP2L7FsiBVpi++RDVX/QwRss69A4U=
X-Gm-Gg: ASbGncseLWCVm1XeEcaPFyW84tvRKcz0NoU2nZRG1VYgEQbiK05cH10fOzht0JtqSE8
	SEXLcyALWdGd5yPOkkGXUafGbJfYvc7i463Aw3wrf4MwR5PCCkTkgzwhekL8pVrhJxAz9X7bZq4
	M24qIQoT3/1J6tp/IA/6BePcAET91LJ2CzRkeYxEMSbwNekHtgRpfs1sz5OO+YcGGSXzVfz4nuA
	2PlSTKAFgvsOX0Bo/c/uuJ21wXkX3QxnQb9HKq622t2jt3EI9vRMBZ+GUWiEcfsBUsknQ01y+GX
	I9HRUPRuUSaELZfbj5zhIZ2xgdG6Ako/Ku/Htw==
X-Google-Smtp-Source: AGHT+IFZIu6StM8ElkRE+r6BIYiBUWx6cTIS/f7UqaoT/hdn+OorxGZiBS8LLsETi1nO8uCS+7rsyQ==
X-Received: by 2002:a05:6000:1886:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-39d0864b966mr7660682f8f.8.1744010712872;
        Mon, 07 Apr 2025 00:25:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:25:07 +0200
Subject: [PATCH 1/4] MIPS: rb532: gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mips-v1-1-e7f74a4eee2b@linaro.org>
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uG5xobKQ/BCqBbmPWIob9NsHTVtZMYwi25uBBftiBYo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833WAv5DpLvQ/18Q2vsoL0ibVRB6cyZ0AoLfy
 goRiAcKusmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91gAKCRARpy6gFHHX
 cplDEACpEWXa+/sW0az+OMmWA4dZHqyLntzrc0ZqCvrhHPe/R4wI7JV8uLW74+WppTO/GwvAtGI
 NwOAI3x63sYa6Bw2F9UuVTchSJCKTc7Fu7Jk4IXy5KDqCyM8Rx2K7ZPsJAijoP8AlSnsni9fUmI
 Hby/KNJlIMn8jABhNXo1mwW1MJcUEL55/lzebyuut6OEWud1BQxk9RW8vIq1ipOBf/q1baQAHxQ
 IxuVO0MlPAvg7aJRNbGQNzqZIGAQOdRMyTvVZM0K/MxSL7VydjwjgZlaWKUxSfnB8uZJ+5+INvt
 MdTL0dDHnqGVt65nf2r0yNnFmLVRy6BTBoj7eDU87MXk7kprt1jvPt4KLUp1ywlMoN+mqBEfzP4
 eGwELyWO8AY7FQfwJKU+KW42oam8MLsBaWdzVPVeNx2jRrKe6r/I31ROfwL85Gou5cDEiBhOipn
 X7pks6NXTb1Zxk+mZK9FvE7EzC10P1E4woDAIJWrZ8GBDeMKzQMIoC0jDGnbGmEBP+ZDG/+R+HI
 T2WqB/CxlNNwwmpy2VeS1RPVnRSoDYPIBYIg53W7U6dyKETPwNxsaszkN4A/eTU19/USccW/sCZ
 50dRsahzy0p/McaOlptmTXREd0SyMzxhlhd94EbE0s/qi8BswRxyiOYudjO/bjPho2MOgpa5y1b
 5mZGodWhpbKjmNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/mips/rb532/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index ea6ebfea4a67..0e47cd59b6cb 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -105,13 +105,15 @@ static int rb532_gpio_get(struct gpio_chip *chip, unsigned offset)
 /*
  * Set output GPIO level
  */
-static void rb532_gpio_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int rb532_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rb532_gpio_chip	*gpch;
 
 	gpch = gpiochip_get_data(chip);
 	rb532_set_bit(value, offset, gpch->regbase + GPIOD);
+
+	return 0;
 }
 
 /*
@@ -162,7 +164,7 @@ static struct rb532_gpio_chip rb532_gpio_chip[] = {
 			.direction_input	= rb532_gpio_direction_input,
 			.direction_output	= rb532_gpio_direction_output,
 			.get			= rb532_gpio_get,
-			.set			= rb532_gpio_set,
+			.set_rv			= rb532_gpio_set,
 			.to_irq			= rb532_gpio_to_irq,
 			.base			= 0,
 			.ngpio			= 32,

-- 
2.45.2


