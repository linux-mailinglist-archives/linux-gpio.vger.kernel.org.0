Return-Path: <linux-gpio+bounces-18308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32BA7D609
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F87177AB0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752AE2288D2;
	Mon,  7 Apr 2025 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zwfhe3/t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB8227E9B
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010662; cv=none; b=sbGp/V3YpdeGG0mb8hJJO7bZzTnyUHh0OCQ+1fRZdHNYnCVQ7Bo2Jqa8cP2nq2SRkwSUi9eOlzymcUueFSqAZG2bEIB8zuFEKXxs+x+2GWharCsC1gdFHr8W0JVkiQofSim8qYX2eDldl3MKAhQbqg4sxSrOmUZib+FrRuKKE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010662; c=relaxed/simple;
	bh=fbiFpoKOI6m0aGhXZxUUnWSo+VxgAzN63GELm8iUQWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sypjQTcsyvb1f0wKzLRzWzay6BAl1S10CDp1vdR+FzsNYKvNevoj3H1BmgWYIQWyJ5aooj7b09tGGeE09rM/2izIvEcX44JbuNkpd/yO9lM22yQngHZ2kGNFDGaUWv/cc3rXyb7ICP3/nQO86I1JPluNw2EMtiOglxRRfMqOWXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zwfhe3/t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f2f391864so2177351f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010659; x=1744615459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+RnWOfN+6w+LxNXEEpLHTyc1GC0ngIrO3mLjHzJr3w=;
        b=Zwfhe3/t9Zy1LtS7jFTBMhXyAayqqgL+8FpiTY7cvbtcPAKE4vOHWxatv7EeMWSCZ0
         gb/q6MOtYum8d9GhiZzU5mu0UAr1VJ6Ih5EBVPO8n4kswwusBXeDyMNiODdM2sSWicmP
         fsg6hYbweaIHULg2GCfQpCN8wWNxXyvde6nMqo3x7tqTeK2uj3a4f1VdDwdybsjRIuU/
         KYhX/cvUSv9KQ2Lhp7erJ8+PphcZNUpS87TmtuY80mzQmHIMfURj+d0yCpkDAkaLRR6Z
         IMXEpCKRyHi+bHH7qszKxOtDBZEr8jiFjwXNf0+OSPx4YcSekFqP8dwm2ExULCGHg9cx
         WZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010659; x=1744615459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+RnWOfN+6w+LxNXEEpLHTyc1GC0ngIrO3mLjHzJr3w=;
        b=Bq1VpQn2UPGUE9FgSTao8553+E3Oa6JcVUa7jPvWorNOXwLOAOQxPmYDBv1rF9/w7s
         lZ9y+BrU1AbYwsbqITSzbzw3C/7TfqOyvyW5df7jZGdrt1xAKJCLJMGU4oTv5hv6rv19
         Z+YkBYJoxV7nCsvK3BECK86KvQYvVdc5oyPo3ez6dwmAK4+Mc63XloKxUlBGVWJ0rYKw
         y8/TYqk7uPrWOmQk6eLpiVi6lzv+74ZKdgb1rj/vsndwSbYBKwi3JtgFWCldBnMKPi7O
         heWlTKfRAL1QXgDN8qnPkil1Pxpf9zspBkk69K0aqxf9IdFEqkUPJLZ2r6pCIOQu5D8w
         rFFg==
X-Forwarded-Encrypted: i=1; AJvYcCV1r4G4Nj5K9E6ha7jiRFOU8gu9hjbdjfc8cE6RS9n+Zw+V/0Wt7/Nkg8vSObqsCa48IGVcW9bxjYvi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DZjPH24xASiiHy8kjTu7kFw1mDIucfYjpqrAv6LdITHo5YgP
	s1W4xqytQOou7XebdHsHiAAJgRpYp6ZN9OQWSYoEIDMkaPj/OsGflZzMAr7yUn8=
X-Gm-Gg: ASbGncuxsLGPbuklJHQdiQnVGalIUv7D13wXcLK57PJi0LqvOl1461g/p4X1X+foEbl
	mwrECfUYs2wMku6U5VZLCuqhA/C5UoLctwOtl2Wh/Ilvvp5kqLqsSdg190t7U2yD1/YJseJF59x
	2kUELDzW6oMJsseRB7hvkD7iBlJL670cAIU6/1DDi245Pm2EvojUJe1Gn12/jLcjvq/l4QqmPg6
	U0AnU5v0pV4R20oACnAjhyoBmH8se4Xaajnr+Ng4ZEFjeZ/03jYqoxNj4SpRfndriQV1cEzDCKw
	oFOmQ9rtPpRPxorDrhNN4QLEKMcgY0whNCuWhw==
X-Google-Smtp-Source: AGHT+IH0WVOZefAecKZx3yQl9YAZCMB9bf/Ht2dPIj0bpt8N2XaYatpp3frOJwP1A6hIsok1pk6i0w==
X-Received: by 2002:a05:6000:4304:b0:39c:12ce:1052 with SMTP id ffacd0b85a97d-39d07bcd00dmr8845154f8f.7.1744010658797;
        Mon, 07 Apr 2025 00:24:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm119855255e9.24.2025.04.07.00.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:24:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:24:13 +0200
Subject: [PATCH 1/3] mfd: sm501: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mfd-v1-1-43f4d86d01d1@linaro.org>
References: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZmFHKHzqAXVJSMQVt7pCMXflJb5/olwuDA9LZzUAsr0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn832g/KG/gKXEdDnf+bAangWkItxLhvzuqK6MN
 2aDaYEaDsWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N9oAAKCRARpy6gFHHX
 ctJyD/9FEyEXjvhBJ4Wuy+oAzYXLRAq0L4z1uQ/V7dTc3/hsbCbH4O5y91ktPwLly8Q28+bgJXb
 ZTUOhk3fEPrsfGQJmPzp2X2dYLNFRyKbYAsx2hDRtbI8Mj1CBZn7ISNMusP9JLwG2Ptrm3siuhr
 W4eO9wZTo9SqXi0P+r0uECdeQGFSrefcnXihqQ09HuL+cfsqTKzI7op1v5bMB/F8yxrtpIzB78v
 akQCNDoiWpQvb0dE4rzWNuWlTo/95jKewIc5d070rLF/PTMawolx6q04OpcdwY313ryyEMXFhTx
 0M57ec11SnzlTMyMkJ+ZhwR2BiGgLfMFAbFC7G20CUq64sKHD5PJVyL3ym6z5Sy3I8o9d4xtN3i
 tAsW3nYZ5I1x6VlTuL75PXp5CGTkMCmWgI0l4WZPh3rQM3xsc0zAmtI4zbEdbhhofFHH16M9sKI
 0ucqhYfU/K7N3dsX5l5bXyzfHFXRIdpO/NrrEP5wR4Cb3z9NuDD31RakxMRkACCfRW4uKM0x4qo
 5IEEqSq/pBH3EYGbsW8YYUwefuXkOsI8AdIir44w/b+OYVwOM/y/AoBrDMQ+3eq3sIqbTKRgm8T
 J2jqQq19s1M7llpziJgQ6rmB/vyNkXlZEjiZxfCIxrT/0fpV6ZYpj6ar9zIrNAcmZvGySGG6R6l
 JXNy8fplywgLXXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/sm501.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 7ee293b09f62..94ad18b52b83 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -915,7 +915,8 @@ static void sm501_gpio_ensure_gpio(struct sm501_gpio_chip *smchip,
 	}
 }
 
-static void sm501_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int sm501_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 
 {
 	struct sm501_gpio_chip *smchip = gpiochip_get_data(chip);
@@ -939,6 +940,8 @@ static void sm501_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	sm501_gpio_ensure_gpio(smchip, bit);
 
 	spin_unlock_irqrestore(&smgpio->lock, save);
+
+	return 0;
 }
 
 static int sm501_gpio_input(struct gpio_chip *chip, unsigned offset)
@@ -1005,7 +1008,7 @@ static const struct gpio_chip gpio_chip_template = {
 	.ngpio			= 32,
 	.direction_input	= sm501_gpio_input,
 	.direction_output	= sm501_gpio_output,
-	.set			= sm501_gpio_set,
+	.set_rv			= sm501_gpio_set,
 	.get			= sm501_gpio_get,
 };
 

-- 
2.45.2


