Return-Path: <linux-gpio+bounces-21692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63574ADCB67
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE76617B037
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940AB2E2F00;
	Tue, 17 Jun 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wf+JYzOt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84382DE1F5
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163088; cv=none; b=uw692rbNotg+3EPWIwUAxeWQzYfW5egBmKsNUNIMQmJuCPgN+gVrdaWhHl9f5PgCIlBzCCvf0g6P3GcRLLEAlcRM5pjmvaM8drbCBCcyXTURvbprzG0E05FgCE5pfvJFSTVdbyBQR1RIUWgZb/rKzK384h0zRLBja3m+sX5oWFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163088; c=relaxed/simple;
	bh=kEfiCA9+OheiBriw2pdL33nAXF823N9SCYa1haJTgFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuDfGz+MvXeHZpLaCWK26qAeZX5Y1vLzBddPPXHejKItFTOklMpEG3Mivtw3mDxXba9XVbqtUvyd0ezlgXxYFdIqaqB5Sy7ceSQviGJTUMZrFCZrPz6jsSz3rqGqhKHmKlxhTLfKmkPXlzVP4sm+k468wvG/Wr2bN/4Z7as4Qi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wf+JYzOt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d7b50815so47719955e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163085; x=1750767885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=wf+JYzOtVxxK+GraGdBFJUY2egrf6hA8gNx9CwNYQ4bMMlZBibKD5Y9T2XJ/6XomWr
         ELizPUJb+8OPVyMX8mRfpLuh1iwwnG4iqhJqmkIwZKxNhuB0brJVi/NSWRgxQRrkdELY
         hn6gu+RQSv0U4wd0+AO4Ki01k1KpdCXYUPcVOS2tMAhlxbdrpqKD0mjMs0umhi+zR0Iv
         u81JG1z0yRiiGkQk5L6MNu+tfQG1vi1Vpp8gVKvIuSDgwQKh7n3upAGaCCsDXqukxYGr
         gurlNsLt+IpJwL4La/8GXGntu5vSy3kyHGf7h/QNZYVSmN2zwKrrKLBW5L5N6d6BAgzo
         QkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163085; x=1750767885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=JtpU0rSwrVXQ3Eat+P8J/0Jg09aor2XZUFbc9ESHb16sT/UqdcJqYAuW6lkmuysUjm
         eKyvtqqPJYDutjq+oUXSWU4pVn2BgqFk3ENUYucpjYttiMdfsQC++cqFM5Tl9LSxFyWz
         e5CgZHY45dStpe4haxwVlAk79sEkF2v5QJpQJcH42bXJLXoxgbFYLq+jDbbPWlowohdA
         Lms3auUpojN7UCSauG6o9AJ99Vg4dTtSRnQbsZiXtVRWkADX/aTRCEL0BMVRCAsQ0ixI
         9LHTywBHDsr9L2GrA8AVsF3no5QcT9Mr7Bjpw8dFYu5eXiTD4ldbCgztu+Mjge+HBzyK
         Nj6g==
X-Gm-Message-State: AOJu0Yytj2GoGXsjVEwwrW5CJzFPz75QYXAiZbVhmHBDCAv2ndY/lQgy
	I568o9E/lJNPOc88Q7yzum/TCIinS4BHiZUrKRJ2l0mV/NP7IyRIyyd0CBiOzItKlKM=
X-Gm-Gg: ASbGnctNNEl3DKVdEHE3hZ3CzSG+NWkRqiHJGip2Pa7P8RqWUubkbzLVHCW6q54vafN
	bwPOqLI4DPT76gsDgxE9UthzCIhHaUvkd2KTiqcRTmeonbqsk3MUpzzFFUVo+c3Y03C0RJEue4J
	lplol3id6O+k4oTolQ0XSRfG2zytQAtntMRrbpXqjlhmV0yc+qziRkF8MeTPnP2EqHzauDNrt1+
	LWOzQIxLzACvmlYceHlzNsFYO9O6bTclatksKhcV3M1wofHY02yTrQlYJzQY6YslCl2dYm291vi
	3dHV2frtf6QxyEi4pJtnmPnIDZV/OpyiYBqWAC1TCOrVzWUZVyYirN6ysGC101qI8IE=
X-Google-Smtp-Source: AGHT+IG38n8yT+e1ncHPeSEVdH68o2T3Sec5cbPfOxOX3fgfc6HVuUUwfA/G8YafCEi55IS/XLmI7Q==
X-Received: by 2002:a05:600c:b95:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-4534b4d8ad2mr71541235e9.18.1750163084982;
        Tue, 17 Jun 2025 05:24:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:25 +0200
Subject: [PATCH 03/12] gpio: pch: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-3-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mZa8mgQmqtI4o68XMiXnsHjV4blkeihaJT265+ul6Aw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GBgn584BsrCfQRzkIjI/k7X2K32+hBm8cd
 O+tckc9Rs+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 cjbdEACbzA8JpfrD7XUVbbPk6TErktnsgMRnasgtasnTq35ZQ7HTTM56J8h/KEe46L725xvuI88
 VuGInJdMnPsCIINM2YsdxaBMunDAu3WvbcjoFDvQI0fYBmUpwfKouTrWsAL6gT4R/4PHH+DwaiB
 X3xZE2T9O1Coo94LvdLCNRg8C8V8QcfPttoO8tkKhDx8TSmOpBm8USV3IWbEwaQtxg61tGSuHrR
 xqYJGCe9WHkzvi/HN6Jk7z6E4ZXeqDKb19RnFaVjuz8rOMHfsjluKQENenMk2bvC4Cys5xKEuWh
 U1c+BPAPmK9AeO1byW1GlSYvqhxH2h6/uPs9P3e84RMlESHHR23QrJU388WSaJgIijeFcs4dFYm
 d7sWvPXNahCRoQZ4foUQbd2FsjPBWi78q8ZdG8rglnJYuetBj/5YGaESAn+Fc7sALIJrbLVgZHU
 k08mlvs0JGIuVvO+5mNHxROprqmNCR3CvQ/h0PrKzgg+B6j5SC7gDCjqGew481k0A96cYuU+50u
 0+1F2SkqTVVjfOSV/czlhcWuv/5MdprAvks21HPS3vRN45BvMDvcr1DaAlkMvslrxVo+n1Kqy44
 IAd9NmvSk1D/Yl9Npe3DgTVDHRuQGo4yD2n3P5wGzVXMpo12sFtubyoyJT5k9tn5rTZpd5Mb96j
 SaNb6luqvXivClQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 63f25c72eac2fb98156eb7682e780247a893d7e7..c6f313342ba06a1386d8ff8a882c9344a9e809e7 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -99,7 +99,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
+static int pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -114,6 +114,8 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 
 	iowrite32(reg_val, &chip->reg->po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
@@ -217,7 +219,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	gpio->direction_input = pch_gpio_direction_input;
 	gpio->get = pch_gpio_get;
 	gpio->direction_output = pch_gpio_direction_output;
-	gpio->set = pch_gpio_set;
+	gpio->set_rv = pch_gpio_set;
 	gpio->base = -1;
 	gpio->ngpio = gpio_pins[chip->ioh];
 	gpio->can_sleep = false;

-- 
2.48.1


