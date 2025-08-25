Return-Path: <linux-gpio+bounces-24904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA54B33BA6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8277E7B0C43
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABC82D0611;
	Mon, 25 Aug 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k6dW6CjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B72D2385
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115338; cv=none; b=VBRB2THCL+aUKhNMrSy2tT5Wg4vN1I8mny6HiNoENGwQoJcnKRXiTq1aJqLLshuJGSYTPOuYrIhAXzpSBKIemwte3nUIPYwi8l3s/6LT+mglYSMrUpA2CEw0h45gmr7tr3pUB21dOzGL98Ez0zQjnWnhzxxZRM1Y2ULkEiFMAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115338; c=relaxed/simple;
	bh=1thbdLmTFudV7ob9RYvrVsAtyDB0jUXy5XVU1fSzbt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRfV/LErWWyqMRIDi2Ny3StDdZcTVi90u6kLlGwdWE6V8IJCzVAgTm7aUXZ0eiEqtUu2QF01YSZ0rT2BbJotO6BTDeq/rvCfthJ51M9tJGEWgHY1ivmBEh6GEcyru2EQYFZnJOFJ0of8V4+R/TA2PF7BtHInks0dskl2J7+uahg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k6dW6CjB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c7aa4ce823so921077f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115335; x=1756720135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=k6dW6CjBSNb2ZL0QVpBAspnd360AMN7hY3DlInKyOkaQY2Yft+jiznAEchdStvOLgS
         CPSF+veT3GXLjdWfVwjZfWGAPmJTITqZU+ms9g2ocZHkdnMd+wzc1S461MUxrlza+UFG
         FBH9OoaKEH5TPcJpaaWcwThBHt22nbNYvJEEPM6LsM0VqEl9HRLVyiUcADCQYXNqydF6
         +XU5i8rA1yYovcb1D2ZI0fb1F3nPevcs/nP1vIwGs5TLoTetYKFlgLUEJ0/m5yfKKaR9
         /qjSWYWWflfjVPKC5FNmtqUS58G4vRC4g6ABVPAYvJSugrQT27NwH1uPJTXZXyx3kBoc
         52DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115335; x=1756720135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=VSS04iSd2s9iVswDoeadYqdtBwPAGSLEw+AdX560RDXM15tEK3/33f5uK+QhQgiJf5
         c0uGDizoh+M9GurGanX62oN1y155URSwnJjljpqKIWUvQKnw3db4+SPyllObeiZXqhgK
         /kEISby7D55+3par1JL3Xd8oDZE2tumagsIvFjsNeI6UP5f7mTEooJFPVfTFw+GdR+FR
         +A0Uoe4QKYDUft8mzWrOpkcIrPPLTb0oauuyHx9NK3NfyJFPDCthw9H6wnVB603hLgsn
         XnDGyyM4aD6eMPNCzjfCRhHzJACbSEDmy+pl/d6nDByirIAH4KDSpgV+lVol1SJfYPL2
         Ox1g==
X-Gm-Message-State: AOJu0YwngnWg3i6zBLQgdO3dldLNnUiEvPg5X7uVHZVudmnmlmjhe8Sj
	cKCPIvt1l4uVRapqBX22G7ZLXcr0S8a/LO3r+eoLU1GE7YUBByt6KNfstyxYFRrNRLRXepCD4y2
	W3P07
X-Gm-Gg: ASbGncttUZ6oBu3VVnipjr5zDZZ9ZkrZUmdMhRtKcWYVMo//3YRDn6QZpZyn89y9hSN
	I+vu27ESja+QF0nwO7JGAk7DikpOyKyCewlPSvo8fhR+lhB/FYiJ8A3X/8dhcVleT6OxTHZYopz
	rk55HmgudlEjGHvVOzxgxm2F1Jz1J5RhbGySWHIPVe2bQ6s0+SAFBzrBrKHugIoGOe7+1RRCulp
	HexGqaK/Ga/0rKbCKeDfxDHl3PpIff3GqD9gyT3ucKs/sI8umirkg9aCchyH03u1jz8XsL7k3sV
	DLPn+SZ8ulNLm8kujSrZSHlsRH/ddYwkuNESu285Y9F3hd0rnzqMCeJJUWf/p1G8wbX2+SK+ssW
	pjNf3YaxlX2YMc9VJ85yz3sGUtepX
X-Google-Smtp-Source: AGHT+IFbF1QkRyFdeFIpemljyVtx1j4nGrxdAWd7UTjvbIZ/NucsIqQcYHn9FKmS3KUU/3Oc/4PNpg==
X-Received: by 2002:a5d:5f44:0:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3c5dcdfabccmr8075233f8f.48.1756115335456;
        Mon, 25 Aug 2025 02:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:46 +0200
Subject: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nK9pJAlcVqEpACXDhaB9m0pP1KYR56NEQPbKtHUMK9c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+zSvsNgnA4MkSV214FMk4hgTfqPRZk/vzh
 JSKtylhcNCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 chIpD/wODQ6RNrQ10R5exK6P3KwuVo4VF97VRbQIzI1f+A3TIWDad/BmeS36AyNp4PwuRlJMngB
 6mJjEWXcBfghlW9QAkHy9WMA/4Q8SaJ4KiDclJ5MzJUcJlzmtwiIHBlD0/MZWneUYbuHYFL//vk
 5n/yTd52sg3WX/EN6FM8eQ3quntJ3iWRcm86AXUTkEQDu1StFteUN9bbgC4AooFBvf9W/tyUhmy
 AxBDLI8N2GVwrTXbzuSyQHK+lgpFd5eAOUAu/8nzM81wIYyhYl+dc14rbs/GrN6Y0MEsdVfqPlD
 MUIsrMEkb4zEyOwFPouMX0fsxJzDxAjZMRH9+D88u6O3s3xGckD7++1W2RvQQmiLGxSBjn2hArD
 Rok/kMi0DZmgIbzMACspy6cYCLVvuyROJdWWmqtiCwzG8xnk76qjUq6xacuWbrF/aetGfDsi/8y
 XsBLHSxCWYkct+BjW0f7s7whUn5jLdMlFvZ2vrkjX5I/6HtSJPL5G5IqooATzbdiEG7VcF49VvN
 2iExbHcR5HkWTn02XrtoxBNBhIGnYSGT2q/K5f22PoLADna2Nt8r7FvJVJWICNfFF+RuHqSdj/q
 rzspBevqVhg8+l5TIY46YAe9YJ3UZ9fJpQcGu9smfxNXqeZwdLIg/U78tuOh9PuPro8joDK9ddk
 GSMH+QtpLGoLslQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Avoid pulling in linux/of.h by using the generic device properties.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 86f7947ca9b2d23292c1e6660fe93c611e0cb837..f4ae87325393c909c66eda3bb7b2f849e645b7a4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -7,8 +7,8 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEFAULT_PIN_NUMBER      16
 #define INPUT_REG_OFFSET        0x00
@@ -17,7 +17,7 @@
 
 static int ts4800_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node;
+	struct device *dev = &pdev->dev;
 	struct gpio_chip *chip;
 	void __iomem *base_addr;
 	int retval;
@@ -31,11 +31,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base_addr))
 		return PTR_ERR(base_addr);
 
-	node = pdev->dev.of_node;
-	if (!node)
-		return -EINVAL;
-
-	retval = of_property_read_u32(node, "ngpios", &ngpios);
+	retval = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (retval == -EINVAL)
 		ngpios = DEFAULT_PIN_NUMBER;
 	else if (retval)

-- 
2.48.1


