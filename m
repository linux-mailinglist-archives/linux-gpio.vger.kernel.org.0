Return-Path: <linux-gpio+bounces-21699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E73ADCB7A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B60107AC4C3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55012DE1F2;
	Tue, 17 Jun 2025 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PvCGOxEE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789A2E92B3
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163095; cv=none; b=cgeyt3478pV2T2GE8QVIjiDHcqqZuuu2vby1oOS8HkHVC7RQDIqCDXdAQYC2wgKEeik92bGsIN39HCsVudwdEiR2PUkO7U9cMg6eI6nTRDAcYONWuoSXz90t0sgg/BJ//7idxggaq1spZOct2NRN1029Xv736dXSovVNgzMfTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163095; c=relaxed/simple;
	bh=COE46zuDiGK6rLwTnt7+1d3gjUwt5RswqdYUD5pUbdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGJIZTkfoso0QfLpxUj57wobOSabgmk/m7wAxa7ALTTCwWnuEYnOo5h9HMkiyCkgGFn/xE0/E9pzrdiciUPpWRQSArzq04ZmmP9yVvoINO3je2cOrk+uyGMIqTwMcsQ1MkR27Z7abtvhakGIDMC05iQBC43EXm7GmtAtPvyHKCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PvCGOxEE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d6ade159so46910635e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163092; x=1750767892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=PvCGOxEEQr94a79NeUbIILmOsyGSMvHtZI6aYBFeaqFHxy3OctobRMF6ZA52CNaBrP
         xW1QCt3npM4azQ/k+1CEicTfhqb/ky3Af8M0RqW4lINOCOlVr1ZG7as+qXMjIhITE46i
         jpHdCClFNNmSOumybgaHdCjQsWTTmCS2VE3fmp2ZqQlfJ56xjPEDuCFayY8qGbNjRr26
         8MH9L/uh7rvSAkwE+nmqzzRwBjowyW6hQ2oukxBoJVYTz16IdEtSz1znmUhnDaDciRbH
         vXMghfD1wbLlCF/9HXeSjSAnmEruvHn7d4uNntgAOrBYik7FCEMXB7+n0OwDFHJUR4+Z
         Wgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163092; x=1750767892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=XOhR1lc7RqAsk8xRmnXVxKPvUq9//XNpW9BNM+IOWj4Z1Or+g8UuyozM8jYa4erIwN
         INdVr2waZWuV812aUP2hzVubzPTTn6Flplxr0LTmD8c6BKperzP7w4p3vOEK+emRpS7/
         u6CaUG+amUuG/p2IZ255ckr+/6wrFhEPw+Il+AQKlyAkv/bB1mO87MQv9QcacAHx18cL
         UBdIc0VV4uUsWOB+SAk/XIrAtXNBK62W4cZYNzU4XczP6Ho8taL/y3tgfCDf9vuIdNkI
         B553/H+Lstyk+wqSKTdzdWeAFWx7nDo8M1xkYXOO5WPN5YErswPf/LDG9SmPMhBvCK7w
         sE8Q==
X-Gm-Message-State: AOJu0Yxo8pW3tGR5ur9vq/Tx5OOxEH/ILVIG6iYNdHPNHiogK19sjR80
	UAqU2UEKdGQphfjmOAbtAjY8+J2Za4LuCdZm8R+5/bhPQ99X2oRBm9iyfoj2kYcdFB4=
X-Gm-Gg: ASbGnctz9Sb87fMSUN2hht77wno3swX+AvfktTzyoCENCcK+LaCy0JODnNW6B8/VmFt
	zd6AGvqPYTqHjPafYzDpgxQfK8BrqgTaEUoGCKIciO3W3MIrRZ4octa/rbx+OuOBUkWrIil8iAr
	CWbX+P4ObG1PtGDEIiujBd4jiHnqsIL6tfp5aucw89C9JF3SatpccS7ntIKNZQGPDDgtlrhVdTF
	MDQUm3YuqqEm+axNCe0xcNvOEyrHXs2XULubp+/SS7zqg+9kGvx7L6MsckG0fHmx8C24dG7H1dT
	y0NTa9dVWzjO91aiFjUcYUc6TCc2C5mrKYGYCzMjfZ8S0ngip8dXd5fP
X-Google-Smtp-Source: AGHT+IGgYH+QDdfuvXiPaRleCGYB4hawdcNCoD+7SQT0TTGxbFuQ1U1ki3nSuWN7vTMRqEzg9ktwWg==
X-Received: by 2002:a05:600c:4f14:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-4533d05d802mr127973615e9.0.1750163092415;
        Tue, 17 Jun 2025 05:24:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:32 +0200
Subject: [PATCH 10/12] gpio: rockchip: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-10-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJZscimERewZNLI5pGqQIjH00bD6YcA1Kc9nHnuKKr4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6INooTRzzb2rM2QZl1UnM7MKBZDkGH2R1+l
 +3ZOEcYOpqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 cgACD/428t0VhbSsaD/sOpTRxYgjJixIbcbX+Imu1fnRwC0NDyjVSd1Ppu/1T/QJA8H96+5Hl4i
 IiSOqn30R4elqtKMEjyYjIKQO9nThTDDU82g94DWFqMA75uqXCEuzb27TrWkdI3y3BSpZ7InJln
 /f6EqcbSFl3ygCsX4e2zM8faIISbMgNsDH2E+imOPZSwXID0nYlh3+4Anct1sls0LJuJDb5CP5n
 feeX1GlDZttcB8DOTG4fh03a3XDE9mNvmjThVWd0uRIBWatKbT0NuMb/0V16FsSXSuUKFG22+58
 0XIAhAJnT1oWWwblp9Hrz0nTqUc6LleqKCD7TW4cGeXFnKMO3xmdZliojYQLJpJG8pD4NhZhEdh
 g11wc9CTKxOapj+j93BDL4Z0JfN8YpTz7TBEM6MdCr5GncfqFWwc41/MhGpZT2z9WA+ILhc/mmP
 aumLjrTe0din4dpouMbsWDzxjCqoDPJFBass4ZvKADGq5vw45LXQdzGnzur1nWfuyuE1yDok5Sg
 bRZ/HgViajvE+2LHwm4Ch607XughI7JiAl9rVNlhUL2qQ5/cPjlfFa9MEI+/986p2yx/VljApYj
 LoFjiJ5p1flBGE5Bif0reNM2afmvMwg6xSA2kb7W9niSulMydT60OYDbBuSgXSkfBhs+IPI1lHR
 yUH3DYOL7hUuLPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 64700a003f9a17947dd38baea23a066e8c057caf..ecd60ff9e1dd1a090bfad204c8b86c4d7fb68ce7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -177,8 +177,8 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -186,6 +186,8 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	return 0;
 }
 
 static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -325,7 +327,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static const struct gpio_chip rockchip_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = rockchip_gpio_set,
+	.set_rv = rockchip_gpio_set,
 	.get = rockchip_gpio_get,
 	.get_direction	= rockchip_gpio_get_direction,
 	.direction_input = rockchip_gpio_direction_input,

-- 
2.48.1


