Return-Path: <linux-gpio+bounces-18305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA048A7D5C2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B9E21780D4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A1922CBD7;
	Mon,  7 Apr 2025 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KCJZJVK2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B022B8C6
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010487; cv=none; b=lwNuaZtPu6kPll2GRW5HrNQEyCGUNFIB+T7WD2hOq8q2TNLrvwrLLgb3M+CDz9A95KQwtCbmggs5osXDVfnwfqr3nkfVMXiKM2aSo+vmG3MNFK/Ev6jJ+63HTQGAHiJu4U9+z8wU1nQunHufaBDLD8QXDhg3xvL1oH57yX3DNqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010487; c=relaxed/simple;
	bh=NYalEJMMKkwM5Ww4yh68/Dbtgd+QTQUq4aOgUJNHaQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MAS2bbVE/AjxpjzO5150RMaWkWPeHteCj52+XgX8eLyGK1+ewHQULhyTmQe7o+jvUI7+Qf+KrKOpx5XuhnN5uM4W3imufPqAUAOblPPIM1ASyc5IOe0TCKQ2kJtkfFC67zLOlEEbgGhMiX9hbAC5Yip0ge+A8iqcY3Wa8k4bAio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KCJZJVK2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso4493339f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010483; x=1744615283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqYc0+h72+XOfzEYrjjYbBXS836lkHNvrPwnLM/zXmc=;
        b=KCJZJVK2/JA5wuwxf7A4bgN46RO/tJVg0A+Uaz7ym1swbuqoQ4pL+lJZnv+I00YWlV
         o3q6PY7iYklWmuys6qNRFXXuakEOit0y0WrFdjwbr8bd7Db9jqpeVZ2YYpvin8cPwTYZ
         a7uAFbJnu4sQrLwNQrGrm4HFiMTsyEVw4xGnrILEHinLeGH1cH+izchjK2mGGmZaEd1F
         vngJ3+x4U1L3kY/WHUrR/exNOcmTzFQSozKw7L20w6WAqQJW4qPDW2/RwREJjFewQyjw
         GpklP8fj8EGliZ5ELj0E7hBLsCnIi1fDbLh41ab+sT0liMiOP0wRIeEQZJe7DrYWCi/J
         cbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010483; x=1744615283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqYc0+h72+XOfzEYrjjYbBXS836lkHNvrPwnLM/zXmc=;
        b=gjNzur3vdFVq3KZdVDVnfxhh9rO/kH7Xgc11cMKGxUfo7pw88Gw2Faf0PmAvstlsgD
         /Jo59RUyAKu3m0ifVjjjGgiex7lr9NYlEV4U9edfd4UQrlk/2Gb+3OtnrM35nwlJv/mD
         WmtJvXbQaLb6D9H+nAA1G4XlbrXvM7ZvkM6MOmsRV4yLls17jkyU6fq5g8MJs/1bd5i8
         rM3vPEKPm7De81y4Zin0u2ThhrAme8bnmx0iIBZrWpBSddI9+YNtZOpL0zPyBhr9dwST
         FNGqHw2pRwPyvq42whtF4srmqapGzNegz1LIgWzy55dGImDKCXbNzB+qejIJUrbo00L4
         4zbw==
X-Forwarded-Encrypted: i=1; AJvYcCUNWBNAOF1kFAX3Lxx97hVBYw+rPfiqrhDeQu8+vDaov08i7nidqlQbwALB9tNuxGSuQH14vTB46rRK@vger.kernel.org
X-Gm-Message-State: AOJu0YxAYMKMztNvOGK8KQhRK9dcCl7nh0BmC17u+dPOD5G7VF08Ss2v
	CDSq1Q+bVeSltBMqGheZOo+/2hIRr3Cb5H6BKex3layMYAGmAMTwNbSS90blPu+C/mOrLKW1oRj
	Q0Y4=
X-Gm-Gg: ASbGnct6g/qmMO+ZSOYRhEyRIMbN3j0S31RIY1SKdapOMzgWWJ92qUfCJkJI0+fTq7v
	DrdMMewxleekmLoKJRmjTc2c7zjAQ4jFL2S2svSGRPs+ot/MgyP2Ig+/UpRTM7Ecr64XoCUCq6t
	fbzwLMeE1scqdXuYb5SlbXYvqSRhVNgzlcfQlL5ZoK02+X0LT5JxLkbKXqsHLP6X/j5YjyB5oVA
	6veslV3hwdcsA4yhALlRN7kISAaDyG9nE5oXBEd8JnpIsOqi1/kVmTXhwB+W9Sb3yaaJZ9mvduh
	jB1AZVGgfeRfTCP4zoiQk8VwSj3yZJ6leFr21A==
X-Google-Smtp-Source: AGHT+IEylLp0D01gBNPQYuFsaV4Jo8rU+Y22RzbkmwIC8AAPBDzAqbMk4wdqcSVUg+5yIspCNTHcKw==
X-Received: by 2002:a05:6000:1447:b0:39c:30c9:815 with SMTP id ffacd0b85a97d-39d6fc49b7bmr4954083f8f.21.1744010483553;
        Mon, 07 Apr 2025 00:21:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm119983655e9.20.2025.04.07.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:21:19 +0200
Subject: [PATCH 1/2] memory: omap-gpmc: use the dedicated define for GPIO
 direction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-memory-v1-1-5ab0282a9da7@linaro.org>
References: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W3DX/G7SfvWTY6yhl3JHraQx6MB7aIVZCQYoNdF4OR8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83zxJSSL5ijCrjtatIGOOA7cJetXi6ApKG6BS
 DnLE57D+cCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N88QAKCRARpy6gFHHX
 cmxyD/9vrVD45lvCtqQR34ByKLHJguNZHFOLXIsO/zXYrKeQptI54MwWfVo0VZbGTB+Cz8hn8CQ
 E+Sq2eaJbEk/2wKaoYlgYaQ733hwqdJVS0N3nFZ5wnYIOF0UFflwczQbn2mGZPIitpRA5zbD/ZA
 IdgBaK4+B15XnDyHzQNPRHhnnfE07WhC1sf2jAvTVDaAatpas0Qp2rDjtC6ND30+te3izE9vIyE
 IHyuw6JAWCBNQOlhQi8J46NuTc/wQrVQySG/SyOcNhaJifApA5ktHTceJo4QQqhWVdnKPEVgsSm
 7XAdvEzI9pykGIviK2Fmeiom112dSNFTc4lQdrBlEXiixe9IoB+oDHcfMkRjiiKYEIj9FFSSmco
 iGu7mQk6LiHwjxctfUdVJvV17lMxS5YP5r0xRT/aDNwCPvvqhBSg6uQC4CiMqmMWUXYbvZhpShW
 NHr8/oz0VVd6T3agK8Jvsp/dvejkqG/cEJ2WvNCGnQJ0Am+EQ9sZ5zcUe0FBO7fItwgZMBDx090
 57aX8JezFk0Fh18o9T5u/Kecs0O3ek+M61z0/LzScugP3nU9+xlBtwbZXZQcJ32IYRlZ8L0JlBE
 q8STH8oyRsAGXZjwdDioGPqBsRotEXT//qs+D0zqSYFXOySpKWF/ciM+usfQECZsEk1YseebFKy
 7Hy644u1zExqB4A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a constant defined for this purpose in the gpio/driver.h header
so use it instead of a magic value.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/memory/omap-gpmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 53f1888cc84f..d4fe4c5a57e7 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2376,7 +2376,7 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
 
 static int gpmc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	return 1;	/* we're input only */
+	return GPIO_LINE_DIRECTION_IN; /* we're input only */
 }
 
 static int gpmc_gpio_direction_input(struct gpio_chip *chip,

-- 
2.45.2


