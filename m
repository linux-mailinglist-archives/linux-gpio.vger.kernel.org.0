Return-Path: <linux-gpio+bounces-15104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E714A23292
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 18:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D32D21674D0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 17:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F891F03D3;
	Thu, 30 Jan 2025 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifyUwV8E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE021EF0B2;
	Thu, 30 Jan 2025 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257053; cv=none; b=swo1hJ3yeH4x1SnrKp8/tYOBXAnbQckA/R8jOUMrgWYbXDaPuMXhMrxzNBLvTFSO37Y2x2NXYQu7t0dLAegj51TwCUkkW89UYzS1k4PplfBBQ2aR8AERMtgV+60Ji8UAf1bAy3KD+fawL0RjoX7vZetHCHjVBcg0RX+a4WdYI0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257053; c=relaxed/simple;
	bh=o70Fr1kCif6HdIhJyZPg+2LV/xA5phJjLyuIF/yrdgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cv+A6U2p7D5nLp9LJVtLuI2sWxUiVoKTtH01fwKA9zhNcVMtX93cvTNxsk9PWcndkD2M1OYmFMmvOc5/tWmbUHJ3tH6qLLwRuSxz0urCe7S+gB5c/ac+KHAx8+NTIUDc6/2LO2+0V3CwgyxyHrhq77Exhy2k7db3fW+hCh1xO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifyUwV8E; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso1425001a12.0;
        Thu, 30 Jan 2025 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738257050; x=1738861850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XvlM5yaUG/XEWadsYu0DyB9VDs+irAd4NAYgXsjiXc=;
        b=ifyUwV8Eg7zogHArf19z9nNiU9tqfkjf8SLCoubGlHVHHEYSu+6FV+Pu74kpNV3eCD
         b1DPCKaQVbjF9bDZ8YC6OYT6fy2DJ8ZNjcVfquJqAtg9N6QB+z/UBVcMxYpl49jvglsI
         q1qJ3HuHAUP0x+RVqNZmHRMalbtK1ZkfM5geL2wJUgL+ag97NJaGiG1DBoms5QSpW0Lj
         rRS35R0GyFGYwUnnXKU1BHhyLY8cTlU4RD3rrlVKlf+KqsVqo6bdwYBHI+P3vR3rESc5
         nzWj56r/DtnyVTZTLfvvJ1roVWkmselAlzxufvZkFERunpCETXZPzlM2HBvqbEmTeQLK
         gTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257050; x=1738861850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XvlM5yaUG/XEWadsYu0DyB9VDs+irAd4NAYgXsjiXc=;
        b=uXrgAPoV4WdjUPIpwLtyjRYPhq07Y9B8hsIls5zydoXjGZd6/QhQVC8AKJdRuR/tvq
         /sBXmr//6Uzl3v9AZPiHZgQgQEnh9+oovIMLNpW4cjDhnIyifSKI+Fm8H7N1jJBHGBmE
         TA3EvNg44OiCkxDbFhuBQQ7poSIJAa1WgEJqhnKgKkPAnX3szBHHKov79UA6ixe3UDoi
         mx+a2f9YEFIP33gmYSwr6sy+W/4fFC1tIhO4oPYTtbdpCWLjXkIjWqwGz3jKU3ZVGMRa
         /oDjlnHjxzL1hczzRGOQIyGV3zBi8QNXzT2jwOg5sPnqRJ/L6yLcTSAazl79CeBr/5YM
         yzmw==
X-Forwarded-Encrypted: i=1; AJvYcCVPKvhQSWcrmMMMgDRhLVct1clfuEo66vbz2mhZHwqemW3o2Y60HJsinsux+rauyaSKa6CRr9mYOyzHInI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxO0mfa5GbY1D1bEsLVraFzRTswSqzVzQ1KSUrhMrtKMy/Aj0y
	Y9dfBTOL/arG3isaY0EVvGjIrB+GZJAuGHfwrzxVSVsc18ju2iYF
X-Gm-Gg: ASbGnct54eB2xg8bHVHaNG5Rxs7Cxr2z7r+EIbiguRIG0JZ7RXOottlH/IorRPyoOcv
	/I1Fhh7W0T7AjMv/hn0m2fEgDWQ1cLXNdf+APPvybOj7xDwHCIZy7OmF9S48Y6sMy8JZXuo3hVg
	gU84qB7mJTe8t4Y+Jk4spB8sKUhYNMsVMt3tymUSElR4+O74zSyj0vYYVkkOhxBNB59oa13Cwqp
	Et2ykUyk3rFPIGH/j4kaDvQnoVO42ZChaUmMgTcu0JoYc25HKXK6pOs8yE/TuqJqSxba6EiGbom
	vs0VvKoJN0HibNRbSqscQRgU1wmPe0ZSiz2zf8WICF5lfd6OavYPqrN0RJo+Rw==
X-Google-Smtp-Source: AGHT+IFnBcXXFgYguNK5JEoR/syq9ZqTDEOnCsww97RSiyQvXLA6mTR4V/mTrkIeWSBawUy0kgZzZg==
X-Received: by 2002:a05:6402:1d4e:b0:5db:f423:19cf with SMTP id 4fb4d7f45d1cf-5dc5efbf1b3mr17141214a12.9.1738257049980;
        Thu, 30 Jan 2025 09:10:49 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm1349021a12.79.2025.01.30.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:10:49 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 30 Jan 2025 18:10:39 +0100
Subject: [PATCH 3/3] gpio: bcm-kona: Add missing newline to dev_err format
 string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-kona-gpio-fixes-v1-3-dd61e0c0a9e7@gmail.com>
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
In-Reply-To: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, 
 Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>, 
 Christian Daudt <csd@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738257044; l=907;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=o70Fr1kCif6HdIhJyZPg+2LV/xA5phJjLyuIF/yrdgU=;
 b=DZ+D6MTjjkV4K+aaihfH6KKOzGs+wHqN7dVsCb+Hb+UiMbpMsljqdsmuLMXkb7pnYKvtcM9jz
 mE6h8UKJqojDFljQhGthYglXiAM7F7AQ1ga2Evq39vC7J5UxYvhirW8
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add a missing newline to the format string of the "Couldn't get IRQ
for bank..." error message.

Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index eeaa921df6f072129dbdf1c73d6da2bd7c1fe716..724db3434d277c5f9ea36b0d050e34c451787e4a 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -661,7 +661,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 		bank->irq = platform_get_irq(pdev, i);
 		bank->kona_gpio = kona_gpio;
 		if (bank->irq < 0) {
-			dev_err(dev, "Couldn't get IRQ for bank %d", i);
+			dev_err(dev, "Couldn't get IRQ for bank %d\n", i);
 			ret = -ENOENT;
 			goto err_irq_domain;
 		}

-- 
2.48.1


