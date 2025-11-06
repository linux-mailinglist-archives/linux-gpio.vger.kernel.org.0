Return-Path: <linux-gpio+bounces-28212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09146C3C66B
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842633A3A76
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CAE34F27D;
	Thu,  6 Nov 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJD8B4+A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0C34EEEF
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445804; cv=none; b=PEx9HaLc0CgxgwjWPML2+Tgd5LGS+HrF66K4rSTSEFwEgIdcAc/gVi266AK1PsSQ7EasRf9wiKYwLjWX2VKjRAE+zg7uFh1kl2gC1KHTM4YgR9mlmB4MVPdgw6vZQXQg3z/om2WoxTbpiO2XIXu7Xq7C0fpVA4hw6cMxhYbJAyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445804; c=relaxed/simple;
	bh=ZT2hMJMzDp444RtFAMt6NxeIg8ehhxp6qQkq6o38pVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsXjDjh1x84A+T0fE0+jNFdHGvz08766bW1qwSRMR0Mjd7vJsnwJsB9xbauWdOpuWEfGYFtmpTWCMHq1fSnTWszSfkkvMmQXMm30qX6uLztGcYkJUDzAKLj8pkJCZOm65oWjd8k/wiYl7aDO55pnHyFluilkOdM85k1ekwuSkXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJD8B4+A; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64094a79237so162695a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445800; x=1763050600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fnpzlv5TqPyTNVopTKhYQKTQxoXkISz35QRtVU9Hac=;
        b=qJD8B4+AnmymLzyCk5PXjbQ1MNcfSmC1/d6kt8V0d+to2YxDcLNuk7sUkHf3Rh/QKn
         PVlJK1ycCTejvmViENrubKKBXCmCWpvCeRw8EzkZHhffeuIXsDC6Ckz0whCR8YLO84z/
         UFwIcCyc1+E0zwuzqqtnY6F9Nhd3E9wB0/hT4D/C3UMAx1HFgxm3Dzc4W4onJxvEjMEn
         J+78stNEUs3UzjQLGwtpDrvK53BX4m8Hoq+URajD5u12v0bVL7scWaVkenizQLsdfVYz
         a9VvQ30nY9ngYbjwkmIPIPE+MrJiBOMo/UWB2wRvzSOD0MAtewD+7b1rvkMD+ReZTzhS
         fUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445800; x=1763050600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fnpzlv5TqPyTNVopTKhYQKTQxoXkISz35QRtVU9Hac=;
        b=CwboQKqKrK61eS90jga9wBWFR7Ad/5mqABiJeG2fAbVbtaR5HCOkM61NgG2Hr6Gsz9
         LqQoVMB4yhJGFHlViFlNe5k45aOIjurzz/acZIONBToVayLlpRkoKkkniYiK3YkSRxCr
         DyRrVAuWKACtUJVNYrc0fW7rcgtQYhqEQXFhgea/edmucglMQwcM6Ws5PxVjYDxPOmx3
         1TP88CymtKzXcdErQ+LukWg+cwZn/ztU65fONdy63vLixsoN0JVNs0ESDcZlD5JJVn3t
         b5qAogtd4egNyfZip+YDlInM9rlVXyvCKl6IJJaYTSyLFSfRcRjh+zswWw2yrSYMND2t
         ZN/g==
X-Gm-Message-State: AOJu0YzOyMN4taxu1kGTmL4fobxrFHIAvauhVI5sjPu6MwulojG8IhPL
	gq42FEHNnr9EK6dOZKAGOIm+V0LtJLQGzFupWkrAJfNhI/7wiVvLS5cBxA7H7URqG7c=
X-Gm-Gg: ASbGncvAtR2I2zWGJ4dhhH/MrojeIf/3qUVAXiXVE/AzE0IJH8VKhMuqn2AqHKjQ3qG
	hHL/YnWBlEioG9kZXnduYsQ8VwTwnoiyYdg5dbBRqLWoA6KlwVgDjUE+YBjAmIG2XzHFb08AV+7
	5P1UyRqhFnn8XVQk/STfvHD3SQP4m4rGbPsQR8ukta2fTWD67uGzRDeF+d+SUi46Qrh0RLiviqd
	UH5zpzpVbs5r5sU7kVUcAqL9w+vXRue0uX7ahNNRMEupq22OOmshYXc+OxoN3svL5SXnAGT1qqZ
	NDvjdbUliWokcDU1BoWryWc4ILOFuUh3h8JjIzj/RG9oFSULVZPuOG30k//zAKHo4he21IbakBm
	d+UqOLeXu8AHyJT9r0plii799XHVVTCvHhUsk4yaAWYAjQsVlnIRkisY0WZkv6ZilMypVETkI1j
	GCT2cABtIeT5Y2CD1fU7lhOw72Lt0=
X-Google-Smtp-Source: AGHT+IG/5tTc7ZxspWUa/B8lb4VJAe+mwb5eciTvDLKhw+fK6fmt5UhwDE0B5Na16xt3VKGSskNthQ==
X-Received: by 2002:a05:6402:234a:b0:640:9aed:6ac4 with SMTP id 4fb4d7f45d1cf-64105a44b67mr3713567a12.3.1762445800269;
        Thu, 06 Nov 2025 08:16:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:26 +0100
Subject: [PATCH 2/4] gpio: aspeed: Simplify with of_device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZT2hMJMzDp444RtFAMt6NxeIg8ehhxp6qQkq6o38pVU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGkMyd/IHnLxQ8aaVNi31HhlicsroQ2rUZcgWUqQhqbqfNgTz
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpDMnfAAoJEME3ZuaGi4PXQc0P/A43
 VlDZbJcd8JJgzif8Kxz45G85Cei+azNOhCDEWH00UmdsmhkuwJmwLV+Ajksw1M4M6mgS80zGzly
 5O02OU5dduEuqs5AZNvaL0cVqHiVZhq+YhmANDSBQ0/E3jRTOOR/y9Kzpb9wIJ9YPoNJ2Qtyf3m
 9CiCBFsHGxIT2Asnc0bw2xxxIXDfLJkc0ru5+Hzwr5y0OH6ips03STdfYXBGn82p0xsT4abiVXr
 XW38qszaEhKlyNt/SNUyEhOmddIAXFWNGLymNcCKEUrXEsNJFmCMEbC5SjHYcBkmHthI7LIIAF+
 Xxpmjh52IS6RfKOOLmJEVlRlayLX80kQ9FsGDef3p6FtQEkX9tJPerYMs4SFtxopCN+HF7MixoY
 buUncg8Cw7RYV6DswaMKg4q01FNFuvYAVMAmOTAO1apdaWDsQi40ET5rYH0vkJ1fL7gvPByVP3L
 /uyg6aZubCZd8D55phWmbVsC0kW8hgiZKvjuR7A1zzIhKIxGrx8bpIgiEMaUbxsDIl5G4qxqIh8
 tcABibfodCZr+m12ITCbUUoCgEfmSwcoE57jaZ6Cf6Y0wwzIEnqqP1h0L/smNhts94gcsIoTZMG
 edD5iw8glo6+FCxSFKYbaOvyeqrRYLGb6SNZPRh9N0GGlO3Cch7OoaZuBlidPfbXhcC/r6xtUUG
 VRHv1
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 2e0ae953dd99..3d675b63936c 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
 static int aspeed_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
 	struct aspeed_gpio *gpio;
 	int rc, irq, i, banks, err;
@@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&gpio->lock);
 
-	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
-	if (!gpio_id)
+	gpio->config = of_device_get_match_data(&pdev->dev);
+	if (!gpio->config)
 		return -EINVAL;
 
 	gpio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
@@ -1334,8 +1333,6 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 		gpio->clk = NULL;
 	}
 
-	gpio->config = gpio_id->data;
-
 	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_get ||
 	    !gpio->config->llops->reg_bank_get)
 		return -EINVAL;

-- 
2.48.1


