Return-Path: <linux-gpio+bounces-21701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44FADCB75
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAFA1894764
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7EC2EBDC4;
	Tue, 17 Jun 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CDmMpoXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2712E7F33
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163099; cv=none; b=TXTyAi/seq48wwmdxz6IaGgZNPzSHcSwTyGOIugzcKpsPKx3yi/imy6VcEGQX0ao4LXqcp8yrKbuTvx11iwtUIZmF7ycPMNaXX3Ej9csnQUvAxLMbWOKlEIF2hM/N/V0bqgwAIypUwGawAoQNZpgNwYL7NEn6FevAV8dGg6Dzjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163099; c=relaxed/simple;
	bh=eEv9Rs9Ob2RKbLYMX17232517BahJV9MYVei3h7Ywh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4FSN+YhGudSbRW+yAx+kkT47JYqSIbCfY4NjcMwR3wW8efe32HOPBPV2gh0FuWI2y2KSZWc+5oZKFWcA+SJC45pMgATDtYBgHTrgZxOd2Zu3lo5lwDSwDHOUxHNogUrzS9dA37743ElVqFBCKy7oUcK3zIyGTQq7Gwdf5FQcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CDmMpoXb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so63144035e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163095; x=1750767895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=CDmMpoXbxEegq7QPOKmmcINarHvc8jcxc8YT36fh+03SQl/OO2MqlQxwX0XtggyF3e
         D+1aucq85xUt/desvwkZWRXMQAeUzCSCS+Lu/TKJSNhdPncgAS1VzJICKbzh9/vWc3Jb
         45GKfuuyjpJ4U0nzaC0kXGpYfMmEQFUXroSnZ13eJ7gbvPG7XkpQ7DWe8Wl338FQ2Vm3
         GHpudH1ktgXvvOaKhYjFi0uPRnTnO2bkJmkCYmkfcjDlnbWmGjCbCiLXSxXLABW2LJlF
         xl82wTqB8w46R8oMJwG3ZT8icTnMy4IveJokuwyiu5i5PXxrJZUNITmtZM+ZaYlt0RP+
         558Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163095; x=1750767895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=C0pbDTRMfPSgwf1Q56EujaXig36Md2hHesOVvoXXCrD5W28B1z3CU/R1hO0qmv83Sb
         tOKxk1PSvNa//GkzVE+s9Bf/XrRZC4ThE7xzxY5QIM3H63Bc/kmnsBX+oTITcRuiV5XC
         wIBO+VbfWejm+Gcmcza0KM+eHSXnijd/yrLsFSY2GoS9ul1Z83eLHqZgYGIuNtiY5g+N
         ZF+HxVgsChKxDIrtj+p3sqam7r1cZxaqhEZgLDxsz3JSHo/lLChubNTO/JesjrY/DHwy
         S1T3RCO9qrJpIpCAfIXCL6elvZjo2eswKgA5GgIhS6SHk/U5jT4r1TOdwIkF7T7MjpXO
         0jjQ==
X-Gm-Message-State: AOJu0YwpGgSQaqPua7E2kOu8WJXi8uSfJDrXFkn/auKi+Q48GhWGMj1A
	c8IH/ikBpgHN4G1RUAAVT9mQJIq55dcM98VO3dm+AjHEumy85U8fY3gxBLUV2iftgmw=
X-Gm-Gg: ASbGncsLtaUAvMhSMuB65xL+TlCcJ99jNIFO8l7hnh065J2DJqb3HyVBHaABmySzTEv
	T/Q7PknKqExBmY1razmaq5ROTZnHlw4nWTRSDfYUyCYapwVe9YUzowBAe9zvDB0XMNzvWfMtGHj
	/Vt4RgJ7BIGOWKHEt8BFtODkeDXWfIjvcqdmBvU9aOf1ZIjQx5Q/WTWvEvPntPjtwPKs6+rz4Fq
	PG+hTDMvARr52+j5EWjtr3pXARy0O35fYsu7bbdbuaH+SWtTjqWwoacTFqZ4xhk48Q1V00REV8k
	a+oIdTOvJECHlXwmx9kpKSSkmaUnZ4O1Z7VkcJzjifSNkaJ5ilC6qPKp
X-Google-Smtp-Source: AGHT+IFsTWQIKZSJGIY/CXmS6lZIJ3ZenpODtlq8yK7uNveBH+mmtvLiQ+k6AgHQE4CwrhnHTwO8nw==
X-Received: by 2002:a05:6000:2382:b0:3a5:3bdd:6cfe with SMTP id ffacd0b85a97d-3a57237e161mr12452604f8f.26.1750163094424;
        Tue, 17 Jun 2025 05:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:34 +0200
Subject: [PATCH 12/12] gpio: sa1100: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-12-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=c4Isjx61IsXwy1L10lydMFlqZBELu3z3ba+yBwH+QRc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6Ipp+OYSt+ikqj2UvGKKNMCmar+1zqMNgVE
 W9N6iQSuQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 chTeD/9I14P9RY3COUbCjQedgou7h73GVSmQAfpsU1+oR9NX67oKSF9DMr17US1TFf2xZifaFyB
 +A7PUaOjWr19fNg2617gbOaCxUfM1fd75XPrCYVHaR6PUWMzfvo96J35H4Aq1E4rp3nv6j8oYnp
 39K7mMEvi66do04dqvXYuAp3nGAPJ6+P7RXanRnhC0jbJ5JbGuJdG2pSH4gX8+YW3cc91WVrb7d
 4GxpxIYGWe0bGcDqZ17neqzVyzrpEluCO/VrPr/e81YyaUppzx9GoGtYMBXtNCd80QGyeAzfkOr
 FavT1ZDpRsyWPsF7c+aJ5Lk2ADy5FyToc5wtk1/IEhbCOc0ecPrrl28VY8mITwHwVpRtPIb48LK
 40+TDflwhqQkl4wvcZUGrZQJYaGEALsIizpjR0LRHe/nQxSHyjrudyn6DrrgfwWkzY9UBJsQMA8
 skB+VxmtuPO4gOKaUTkFlDa+LkasazYamiCrWNrJvXwY6PWop8tn0K8svtQ6P8S5HWlzSK0N6UZ
 Rxn9y/tS3F6w2S7c6XQTEEvtzi1V53Z+wxP2I/VELpg0AZVFcM1+55C+GTwbWshUf1qcMltwGSP
 vupnX/UiKGo9M3TMglMKZkB2CyR3GvqKjQ2rjUXGTgNK2IXSeKzrZbsyRGkQiOJDgGbpYuU5p4B
 SKaO1D2IiPKNZTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sa1100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 3f3ee36bc3cb19a7baf530def0575d2ff09dd3c5..e9d054d78ccb8485b9f662fcec385fe0d0edc0d7 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -43,11 +43,14 @@ static int sa1100_gpio_get(struct gpio_chip *chip, unsigned offset)
 		BIT(offset);
 }
 
-static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int sa1100_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	int reg = value ? R_GPSR : R_GPCR;
 
 	writel_relaxed(BIT(offset), sa1100_gpio_chip(chip)->membase + reg);
+
+	return 0;
 }
 
 static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -96,7 +99,7 @@ static struct sa1100_gpio_chip sa1100_gpio_chip = {
 		.get_direction		= sa1100_get_direction,
 		.direction_input	= sa1100_direction_input,
 		.direction_output	= sa1100_direction_output,
-		.set			= sa1100_gpio_set,
+		.set_rv			= sa1100_gpio_set,
 		.get			= sa1100_gpio_get,
 		.to_irq			= sa1100_to_irq,
 		.base			= 0,

-- 
2.48.1


