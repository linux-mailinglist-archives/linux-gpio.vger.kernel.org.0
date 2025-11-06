Return-Path: <linux-gpio+bounces-28215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572DC3C6E3
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5571D505396
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8E834FF70;
	Thu,  6 Nov 2025 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYqYR3EY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751A34E76E
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445808; cv=none; b=mJQ85i9AMfNE5B17Q/3rbRKmR6zJ51wg30noOFbPmWWzVYR6CSe0Sg9X/eU3ELaY7XWjIr091tFucsHzpeK/GphHpelBSfEsnwxSF9ChQC6xDtJG7cmK6kJGR9NqbUuI4NQaHTZawTECrKQ5ty3iBWrSOBqJIaMeYCIZHNa9BUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445808; c=relaxed/simple;
	bh=KyCK4WaX8DTPr8e9FQEpVrY1lPGKIUEEeXomozdcgIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOouEFRoY8vDMSDk60S0luyxuoOQtboIedns9TXi35AX21DL/xc6Ewo5TLcB9QRW0SEfwKPNTamluOx7B4urVIfuGSrGCzItfiR4RLHYZuz6WAwzbO48+d32uFCIpULXgdBLaq6Qj28kC/m1co/jgMxIY6BJqYVpTu+epDtq+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYqYR3EY; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64093f3f7ddso203316a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445805; x=1763050605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNxxLoSaj80bOvxwS+x8aO/LQaPqTkbFKbIYZM/ccx0=;
        b=eYqYR3EY1SGVHnzqn6o8bJcAx2GD0uMt9befhAT69J/qFgfL/XJULmb2l60UVV8VwA
         rGfmmTIhdjSS60/olz75EDibyz0IMhKWhDPNCxoQ+CG9DguagXAtHi262iTA0HLsZOiY
         dIZFx9BB5eUp4wS2MsPXLpKxcYjIJd1EbLuDSDWj2yR2kLdkXwVXUYsMByTLr39a8H6F
         tt7/GEvzn9oADTSWG6+Rl2hgmY60iRd7qMLKBYcb3eaNmFI5E7gPkWxKq1p+QiyX6TUw
         +StnFAUfv0/IZ5fYo1kGEmFmtVCjWg4q9mrQSeOOTG/q+9dZssnvxyOOWUCtuKPJQwL/
         uT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445805; x=1763050605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNxxLoSaj80bOvxwS+x8aO/LQaPqTkbFKbIYZM/ccx0=;
        b=O53xnsSEooiOPDoS0Hd8k9Alc+FJRBWeLEurCQQPdD5ydUT4sejLRHY3nAP3Bz99dg
         q0CKbhQVj5MGugt1PJjxZ17Hd6YA69tPsTTBgPW99GuYzfu0I2Ya/eiVigZ1EFH9zstM
         2+Pw9s73wZ3aEem1qs5Q3S//nzQGw84ZoDY29YWWNtkhg3b01/BHDtBrkumGy30ihXWH
         2A+S9HpLamJ71O/UGm2K4oFFct2OCvHi28GYLCdKlp6TLOqe//jU2odz1Bt9nYCmreiv
         5MZNL0mQClh5fXAG83yEMWtz6jAN0WOJ+n9LV2R8UJtGfOdcsSf44YFLUMZC3YeIah9b
         tjWQ==
X-Gm-Message-State: AOJu0YwCf87/8UEWRkr19HTs6+e0619EDksAfmcZU+TPROEhbUYDqidt
	AaifEp2ybBIvL58p0i42gHeMmJd/cKYfyfwQOQXMp4jWBKAcI9aq5bbTGR5JeQ1HRy4=
X-Gm-Gg: ASbGnctVnvpdjZ8VN0REG981FyIQXtZQuvxGxBhgbaeJtxVPHKsURX0Iq5vss9sAGEm
	P99+4rZVfXy7miiKt4K/SDVMS6hR+03bRdoMbkJUd9QAyFGZIzYrdUspe4RDz8KfAd1tgYoklT4
	P8r/XpZIBEiG6tBHZtwltj+ciw96lUj8wNti30rVJR+04Zvv+CjphuJ2/VcRwrlSCuEvCak3DY9
	SbRQj4eMNBan9Diy+wjpmKXh0sC/PLn9FSUOFSrcl+B66HroVq1I3GKDJISGAHZU6quFILHyg4e
	EPhC35EeN71MDkOZz/csKXZURPIWpLVXgEOTor+1xNtsGZcqx6Zm+YCRRSG4Pvq0uDjjTglgYZy
	xwaN+2DXmEM6NNeqBAoRztxYE9Ql/j1RZ1+2izI7BN/hcn0ReCGNci9FJ+UhgUp3rTrVtvprrPb
	fdo8zwJsN4zujNdES1upyWDYc4HM8=
X-Google-Smtp-Source: AGHT+IGxqQY1TKHhlv59jD9rXPj3NM3yoBtmJAbJOzQqYLTcCXhQ3w1hdyfA1R6qDfeGfCwDVofBBg==
X-Received: by 2002:a05:6402:35cb:b0:640:9b11:5d7d with SMTP id 4fb4d7f45d1cf-64105b79e3cmr4181740a12.7.1762445804550;
        Thu, 06 Nov 2025 08:16:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:28 +0100
Subject: [PATCH 4/4] gpio: zynq: Simplify with of_device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-4-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KyCK4WaX8DTPr8e9FQEpVrY1lPGKIUEEeXomozdcgIk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMnhaeYJvXX2uO3vKVe9JEZmeNPGFfrC9cmTl
 8PnkWe0SIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ4QAKCRDBN2bmhouD
 14SHD/0RJ4iQBsacOdNNfDcM2yGY5n7EhMle4k1LQGwzgE8xaJZd0bNJ5SuXB7KiK8M0d+ncBIG
 Vpgc5uJxPllzlkLTWU57w6XNurghRyy10l5bLnj3zVPqE8uDm8zaYb2f2KCLUY0ZFHBwC6ZZD0S
 EywKXF8tXCNuyHqUd/d2gc/hufQSKswUKOk0awanMijo9zIoPIAvdWP/68XTrDaJrUggH0VLWDA
 DirP1LDVncWKXiLonYBU0Dzj+E6zW9e09uUsKpYlzqLp9X5b0nZqAky4VSuFbrlQOTYP5qOQYI8
 6mcG6WQJGAQizQ5aDwZqz9BVLYC5A4wUFrZEOzZITZlVateMtaA36tFKB9ykvpXKYOtZbyDNzrY
 vF5L6KKkjCRSQMKv/97axV9dFeuK62nPFn6zCzJhtfuVW2X5gl/S7p4SKcVW+XzIb9B9Fd6UgWP
 xPUerlWtE7IzxdDyf5dKH0FnDkSm6SsqecuZaHZHyj1YvZOa8P+CK9o5BudRj9cUprLWEckBgGh
 vyk+OrhUR9i6hakDiow8oUA49HjhJCl3AAtwwFm9u0lRDlNi1XKdtGXrfZWUXbgT+BcW316eDTy
 c8bwP6f+3kHFzKoVOnytycrNZ1R3CfM400ReIYFDpY5ucGP37m3DcHa3ZSoiNYwzWaMPxuK5DhU
 Mad4nYQwDNFnyyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 0ffd76e8951f..26071ed1bf22 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -904,18 +904,16 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	struct zynq_gpio *gpio;
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	const struct of_device_id *match;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
-	match = of_match_node(zynq_gpio_of_match, pdev->dev.of_node);
-	if (!match) {
-		dev_err(&pdev->dev, "of_match_node() failed\n");
+	gpio->p_data = of_device_get_match_data(&pdev->dev);
+	if (!gpio->p_data) {
+		dev_err(&pdev->dev, "of_device_get_match_data() failed\n");
 		return -EINVAL;
 	}
-	gpio->p_data = match->data;
 	platform_set_drvdata(pdev, gpio);
 
 	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);

-- 
2.48.1


