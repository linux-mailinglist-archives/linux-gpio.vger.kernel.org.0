Return-Path: <linux-gpio+bounces-8809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0CD956E8C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 17:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F06282881
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 15:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07083D0A9;
	Mon, 19 Aug 2024 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Osb214R0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3691C38DE4
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724080640; cv=none; b=ZFrrIBpVVfg7miFHS5aT0I1dkQyK0JwOw688W87UKDFytKJyCyPHfY8X887Q0cB6d10oHLNGYnjps4Boxccc7voSDvGUUFkyjta6wpSEpuRzPIUoMY3PGFQKWFgNSo509LaSD0mtcd0dixyc0xdzEs0PcIyVpK7tIpv7Z8qrD0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724080640; c=relaxed/simple;
	bh=j5udxdIWVGHFaedMJxO5+4BIfCOKJA6HahlitIk4aiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwbjd/1nhFnC9RHOy58gmTtDil6fwSAtAh69VREc12xfiA40C/6Q+xuwuqwxFvex5wIhLbzFUB3IvVoCl4xfsXQTtkxoPoQyEoYl/ygOPEjn59OQh0rvVDBBFKI4H6k58W5boUbXMpuK3K3XkoMhdQ5NMe92XvnU8vPxMgAUGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Osb214R0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso48956805e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724080636; x=1724685436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqUcdqoma3yEribKkds5RbXbnSPHrBvT9Ses3Sf2wf0=;
        b=Osb214R0A5WpUy8Dj4htFrmnfH6JoxeJ670Q5fQ5MS18SpT4sXjHMocxfGh2xeCSX6
         9VP7HKckTn3vmM5uKAz5s0tOCU1lSYb5XCFFDeX8xR4jdVINdiKoNIKAWQxplSgOJXjE
         ZMWgGVnsrsCmxCR7eYFUlyYJcNxhNHS9ehbhdl/V1g88e/oAxFdewAKWWYAJCCs86fJL
         GQFAWcZCot4K278jUuSx0oUwWj2hrhoprmMBJx45zPP/kcr8f+N7XI2r8JoVD/RcFjK+
         SBhry3XV8D+DxVqDLpwT1OR2PLCuCmI05AEnyw91pfL+7rtWVMJfFILiHS6V/6++BnAK
         MI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080636; x=1724685436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqUcdqoma3yEribKkds5RbXbnSPHrBvT9Ses3Sf2wf0=;
        b=szop2mZrdWKsCenT/yaE+leqGczdQj/ZxZ/bSS2eih/zyaR5nCfL9U/kXCVcAM3mRe
         dj3azFYCrAYpoAZDRxaLS/WzQ++jY/7Fmc+B6QqlVbZXZwG6V/dTxX+Hii2BEBdrr/MJ
         udRy/gIoOTZ5UbLsonacH1TDrQamG9auEBiiooD6UiJbwh0jLEwPl/yy00sWA1NpQ1ZP
         kmNvChTSYIOsxTYJiC6fXwHl5N61i6uzaAaMEDgHGKq1irobxmY3NeQ38MgrZw3LBydS
         EPyVGFo4gPqoEjBtp+j492h0ALZZ5xzcH5L5MqOYJcCkAViXYeejxunbOtEl2vmW0lQ+
         tz5A==
X-Forwarded-Encrypted: i=1; AJvYcCXRh8VwpzajKPugRG7qBofFLNGKtpJkR+jbl2bPPBqN7gX1/FjKQBOARsg+bRCc8aS4WCu+uqBuuuyulFSZSduwYYbNQOIdNn9eCQ==
X-Gm-Message-State: AOJu0Ywi1f38nQU/wFt462IML+MKhrdH9KgSfc6Lk1KYhcHtimd/xOQ1
	0bZwNUz4/8KHxJ+IpnCtK9ic+pQRbGnDRRMvN7JaFYHT9G/uFcUby5pMYelNysu+mjqlMD8PucX
	nj0k=
X-Google-Smtp-Source: AGHT+IFycE0vkMb6t+Imzv6t2U25JQV5b89k+Yg0j+IKsM2yvax8C7e62XrWiuukNLdbHjhhJ8Kj+w==
X-Received: by 2002:adf:b34f:0:b0:368:7f53:6b57 with SMTP id ffacd0b85a97d-3719443d292mr10026374f8f.18.1724080636071;
        Mon, 19 Aug 2024 08:17:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7b55:8f70:3ecb:b4ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aad70sm10788324f8f.104.2024.08.19.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 08:17:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: davinci: use devm_clk_get_enabled()
Date: Mon, 19 Aug 2024 17:17:05 +0200
Message-ID: <20240819151705.37258-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819151705.37258-1-brgl@bgdev.pl>
References: <20240819151705.37258-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code in error paths by using the managed variant of the
clock getter that controls the clock state as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 7763b99f814a..b54fef6b1e12 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -446,7 +446,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 {
 	unsigned	gpio, bank;
 	int		irq;
-	int		ret;
 	struct clk	*clk;
 	u32		binten = 0;
 	unsigned	ngpio;
@@ -467,21 +466,16 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 
 	ngpio = chips->chip.ngpio;
 
-	clk = devm_clk_get(dev, "gpio");
+	clk = devm_clk_get_enabled(dev, "gpio");
 	if (IS_ERR(clk)) {
 		dev_err(dev, "Error %ld getting gpio clock\n", PTR_ERR(clk));
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	if (chips->gpio_unbanked) {
 		irq = devm_irq_alloc_descs(dev, -1, 0, ngpio, 0);
 		if (irq < 0) {
 			dev_err(dev, "Couldn't allocate IRQ numbers\n");
-			clk_disable_unprepare(clk);
 			return irq;
 		}
 
@@ -490,7 +484,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 							chips);
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
-			clk_disable_unprepare(clk);
 			return -ENODEV;
 		}
 	}
@@ -559,10 +552,8 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 				       sizeof(struct
 					      davinci_gpio_irq_data),
 					      GFP_KERNEL);
-		if (!irqdata) {
-			clk_disable_unprepare(clk);
+		if (!irqdata)
 			return -ENOMEM;
-		}
 
 		irqdata->regs = g;
 		irqdata->bank_num = bank;
-- 
2.43.0


