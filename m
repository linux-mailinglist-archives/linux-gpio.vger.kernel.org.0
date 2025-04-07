Return-Path: <linux-gpio+bounces-18302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489CA7D5B5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F8917593C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D85225A3B;
	Mon,  7 Apr 2025 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rJOAdTAC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FA23312E
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010371; cv=none; b=U7msJ51q7ZyO6zgGvIosfNVgMSJzFBCSAdi5FRf4DT1ZbN2Kl0RdKQ4zE0wquxsYNdqRcsW8Th7BblboolDS0KJsCvAhM6vOaaIDJwGR4On9VwC0GQ0u4LEiRE/z/VCx9BeyZdyPJHVKEvTX8Yw0z0Mlq6FvINfQfUeXX1UcCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010371; c=relaxed/simple;
	bh=XdR1F1d24wz4tnZ/+4ZmFiOQGGu2evq7oEPt90HJ6QA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVI/QPX2KvouVk1xC0Nx9mUdtcWm3GggqIH1Xt4vr0kseYYcKXNOvpLnKKj5GHSI31tHfdWm1TQedhe+wZQaTHuAWRYV1xQOIrvPw7OHnBXwxmHlAL2gQFSVPHQesEyYqqKRebyy35R3l3uXQyFhBKIz1UsPQpcnrCRkPHUtGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rJOAdTAC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso20135725e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010368; x=1744615168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHa5+3Xv2nYSlmM0R8jZrZyFIIPzDhCPSeCMfkmkG+w=;
        b=rJOAdTACv6nIl8vAmK0QoqFjqe5Mz7vziOcJ6fyJ4xLtFF3u7i6hAXLwLlxFYuo6IZ
         i2EYmjc7kcwUjrEc5Z+XkUIzqeanQkrQfnfedFmD+C+OmumD8lWWHZ8PhexIg3mUtmhz
         +ZEqZYia7tqpHwGOaDdDm3fIBc0vNz/PpKI2GY0GpEYRBL9jx72Nu2Hk6sRDGaXxV3gw
         gvGHYGXsiGkUyvC9TGlMJB+i9KbepoEomr4QEH9x1P1nf+J5GCJDSfxJioFmEXlbO8NN
         CdQIu7s/f9+z2nWEA4ySLgSG0to2UA6P9/4CZpgBstVszkhCihiYpRqlje0bR4r7Ylt3
         +xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010368; x=1744615168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHa5+3Xv2nYSlmM0R8jZrZyFIIPzDhCPSeCMfkmkG+w=;
        b=fuSMHjajiXfkoL4rDB+/qlQaXr+UPPc7zWvJH4EOrg1lOnUl2e31btTyEtZGEvKCEr
         16XYBmP9DbBl1ngYGcfTFLsCqPx5nTAU7AoUxwj5THTO0gS2g7nj90HDWzEnVnPgb1NT
         kMn/uYcVGHQK9bSqMyVPM/3lr904DlUYlqp5eUMQBhK8ZsqIX/Jti6n2+1Aie8e27XK5
         SnhuRymZCdq3qRCWJ6AJ5j6YKDsudIDE2qPoe74+DlOuLP8b6KtWTUMv8AujEw9PBL4K
         pGV1BC+Of48FXabnylFAnuw1+OrhSeOK2C73mRClQgpIULNrMuz4EzH9SI4x9fQRqck6
         P58g==
X-Forwarded-Encrypted: i=1; AJvYcCWXmuDfxmepmoH/fS7ZxwOvznWnoCmSlPSF9QsDBDvtxOxQKjTZK5CAUH2UsXbbhwVUemEExIfmbWIw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwq0xWro+ZeNVx7fcvAhpsxDuQ3486QkCiTB80JvHNk3zJA+Nt
	zHBtrvmlfs6Zb4UlhbqxsmeA7GUfM1Wb6R2n9UiJ8HYuAwS+frErEHeAfLns2cQ=
X-Gm-Gg: ASbGncvB7kLA4fArslj0ToAGfqW03ynynmKye7V0n8UuEPjkG25wWtVKKNvXpqP5K1g
	6IcoJrUKaJCtKM8Xm1z6u7R7tDq01h4KA0IKQV5fsSxtey36y8ccN9YuDLogArHstVAoUVRAaDN
	FPyqFTcLVPLbePoovr3i3b0IUiDhGGbcwr67zxgZqz7G9XtttY8aQE6u8h6Zw6b+GBZMeVQBuaY
	dVgD7ttMMhq4zUaevKyuIfjNEuAQh6QsikDJ+TsFp7UQEEdqK7D4NfRdEd0v83DHj9iSFHFAhdS
	PuDeSjnBt7vU/n0oY+WjCAoKsW9XUgqI1uOXcVAjthzBgANz
X-Google-Smtp-Source: AGHT+IEC4uRQ9XNMmKKpbID7+2W+G955oGmEj85gPslrlwXGh/J5f08lBKYmki24DDnHeD1PZLDfuw==
X-Received: by 2002:a05:600c:1e23:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ecf81c304mr101899695e9.5.1744010361163;
        Mon, 07 Apr 2025 00:19:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:12 +0200
Subject: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b1mbZ9+luKGaPZMmERJAiMQlHQJ363cz8LumGJPcpTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvW12rx8RkPQUSxweYOqwmmE0p4xrJnqauq
 fSmi5ZJlsWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 csOwD/0TeLStBON5XGpuhq0sT+tGYEAXHhUsDfBm+6vTRWA8DAPj8UvyoWIJpVSXHhJ14d+LF9/
 MPaJf0IY5KUNyBNefLcPapsbPwWG4ThYyel073Xq/8IP/P5hzy8HdOzgYem0VzpGSgS22YGPsSY
 PNI3icdfVpBrtblUKN1kOpsW/DvAvjkrayb74UCZVoeQAftbNnswVMBDT80aOyEZx/VCcBAroae
 0JrqhW6RnTqY5eCZmkEzuLOeSpwHcd9Sh0PzKcR/r+9BMVBLesPLi50KL+yvJtk2CZDkH2A6DRR
 /EKjKEg7xJdPho9+PiPV2yfsyrb5DM6B0El7Mdn+tRm4C8VDd2by7PeXD2cdumvIELOGxwQ/9if
 MqC4/wLoXqsxumsw4FSiok/CNfk/XlVXp+mFazMOpHVobIWqRxd6gbU6QTuWsRuy4tlPq8KxPdO
 8A0318xTNB9W9mLoM1t7jRSh0rFsKuIyV8b/z/aOaHxYvXaVTklqSw941hlG7RwODDLWoArsuyj
 6DOlSS4wIAgFuzEKbO+R10JTBsNZcnQ61h1rbpxpA1gjpxN070eGsllW6ZgVxGcRtJeMoeesB/W
 fB4CUGLxl5ZUdXR457F1R/jgRWnleYoFvOLMcH/FZHOppGLoXtg/PCyHDYb2w1zI0STYpvzds81
 RaKAUPjWTuQTCiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 81d0876ee358..986a789f1ec3 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -404,8 +404,8 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	return !!(val & bit);
 }
 
-static void adp5589_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+static int adp5589_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
@@ -418,8 +418,9 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
-		      bank, kpad->dat_out[bank]);
+	return adp5589_write(kpad->client,
+			     kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -520,7 +521,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.direction_input = adp5589_gpio_direction_input;
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
-	kpad->gc.set = adp5589_gpio_set_value;
+	kpad->gc.set_rv = adp5589_gpio_set_value;
 	kpad->gc.can_sleep = 1;
 
 	kpad->gc.base = gpio_data->gpio_start;

-- 
2.45.2


