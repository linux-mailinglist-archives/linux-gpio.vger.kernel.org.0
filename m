Return-Path: <linux-gpio+bounces-15102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E53A2328A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 18:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B71BA7A2230
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 17:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B506E1EF0AF;
	Thu, 30 Jan 2025 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOyRhy34"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2621EEA3F;
	Thu, 30 Jan 2025 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257051; cv=none; b=nuEKfZ+IQQMsIwDXT4TSJqAL4trOSZ2WMs+00nRreaDmBg6JLF6l8vr1PYcC7VtNZdJz3XIazOdzfoA0odau4mk9K60zqaRuB1/ie6RHBg+iSMVPYmivzZKM79dcqA5ZbLHeoxqBKTLZjbbQTqS4C2+jSCy0lcWNkguKtzcfGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257051; c=relaxed/simple;
	bh=JT5PMWvOc1OiBlvRmWtYsT8JQYiQeChh0Su4rSIlFcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdUnlEhCfyEyhZOajTzY7w+b/i4ZhhK37H5mD6xCps/9sqA/3wCPKry2yduNUc1WAt7fqKBDOhqdW94VpCWgADVZhWjMkpz/Laby7vQHkElh68svqqTxYDSmflJu7kYn/jcXWtSYwIzNF2kjYd4s0Uo0ADefYmbPGdou+t1utJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOyRhy34; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso1786832a12.0;
        Thu, 30 Jan 2025 09:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738257048; x=1738861848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kulAWip4ZlHHwRfhKGEJ8FRAiYRQZnQazda6esJBCJk=;
        b=bOyRhy34Kc2ez4fv9VUEEXEs1237o00eeMHNOVYrVQq0cyXAje+TerIXRHXumicVVL
         v4jgiXHFF+2Zd1/qw8ies+0vTNapP8R5H/jcyh1zGCLtvwgd/QrbwuflFhWKG+r2fSBz
         yYKb8w/lwBOskVR6E0M6eANr4IRj6whXECgNUT5qPOH5JFmq5A0jbgNkZ3u5MtkWGXjv
         YYLZElqVXtqdzawCDuvnwm9vZYVx8FK68rtq41Lcf7Snu6frgREu1B/HW3oGOIZ7iKSz
         hqfW6QQO7FjlMFsKrgVz6W4SxP7CY9jzVzpBugISAu0shEM6EdL1uADi3z/Fyo9AHmgg
         2Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257048; x=1738861848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kulAWip4ZlHHwRfhKGEJ8FRAiYRQZnQazda6esJBCJk=;
        b=LuhCBUOwBbawBVslZQygVnqvuCLyH7DfB6NiyBM6Xo1K7Q4ZK6IXn0jX2CQjzKVa44
         VUb72kkVQYPa1JSMJ/Cu76LEXrpeTKLBnzr5qj35ElnLVKczloyIT7RnEfMGQyONg0ef
         BoTGv6jOWwL1DB7ZLiIclxhBnCmVmBQCOY3utinAXZZNt9lxNDHYy7Eo8spYfVUGzTSV
         4X8QW676ojSRDTLTm92zvc7i+vm40vj72WQkG7VF6S+2v8XnCTjmcmYFADk6015sL7bQ
         ME3yS2vB1fRH2MNgWe7iOrfFWsMoyMaECl3KtFw9KPdKsRQm+jjakIhiHK2PN7n8e7Ar
         /AQg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Xs7imUX1gCCYMBMwOll52rVJ/iGIitJ+WNABjs9QPC2+pE1G3KjP3AWbf4Ztc6IzSHOnzlQlR7YT9EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzntmDC4S8Yc/I/b+rUOqCmg8xtBQTrM4DJKRBA5XNIveUrOf0F
	pfjC/uAQFPT1aOLcafRVt543PGBNIq2oa7QCPEp4SUR3co30sW1E
X-Gm-Gg: ASbGncttmzQhYgO2NTBvzqA19FOXXlO1jim6tYlPkHPrZqiGgIS9WGJAo2ag6YWSq28
	9jqIA+iQ7EAlaT90upynnAbLeeWQoDSKvVGgYfHzRSaGcU/roAU5nG3tUkB2V9gcR1BCSPyGyNv
	Zu1AEiNTRzLv3uIR79g83o9GDbT/te0LMMGojngEpuImn/Sds8U088jekaOOLrx1PlyrIRaozPk
	AcZHFjQg3CYBkccR6bNump7xaglKm30CzruNNC8meQ3dPmn1vEq8bQlOYd+MSfjWO+vGaH5sgHR
	TYkp9vPqjWnEYOTt20K4nSrzq0f2HRjF8hDSz3M/7o9hUi6BLhhggPYrCteI5g==
X-Google-Smtp-Source: AGHT+IEfyIe5zTJ7hxCMCdic2+HmPlF7CfAh56bQUUkLHHnV9EMfds8FOth+Z9cKKJKismCy3UeJ7w==
X-Received: by 2002:a05:6402:5022:b0:5dc:57a5:c414 with SMTP id 4fb4d7f45d1cf-5dc5effc37fmr7664575a12.30.1738257047686;
        Thu, 30 Jan 2025 09:10:47 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm1349021a12.79.2025.01.30.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:10:47 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 30 Jan 2025 18:10:37 +0100
Subject: [PATCH 1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks above
 bank 0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-kona-gpio-fixes-v1-1-dd61e0c0a9e7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738257044; l=1830;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=JT5PMWvOc1OiBlvRmWtYsT8JQYiQeChh0Su4rSIlFcY=;
 b=IV7I1hGd1yHoOy8ehZ2QFaZvbucCKs0GwlM7tsyISQPGvm+DLN/AS1vuD+giYOUaGGrPwqn0h
 R6NwgLWtit9AmU3XYUrFczX7T8vXwf/Lyrw+Jbx4Xtw5HwIxwZD5Kyt
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The GPIO lock/unlock functions clear/write a bit to the relevant
register for each bank. However, due to an oversight the bit that
was being written was based on the total GPIO number, not the index
of the GPIO within the relevant bank, causing it to fail for any
GPIO above 32 (thus any GPIO for banks above bank 0).

Fix lock/unlock for these banks by using the correct bit.

Fixes: bdb93c03c550 ("gpio: bcm281xx: Centralize register locking")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 5321ef98f4427d004e62f71d00df6d49bb465ddd..77bd4ec93a231472d7bc40db9d5db12d20bb1611 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -86,11 +86,12 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 	u32 val;
 	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
+	int bit = GPIO_BIT(gpio);
 
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
-	val |= BIT(gpio);
+	val |= BIT(bit);
 	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
 
 	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
@@ -102,11 +103,12 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 	u32 val;
 	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
+	int bit = GPIO_BIT(gpio);
 
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
-	val &= ~BIT(gpio);
+	val &= ~BIT(bit);
 	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
 
 	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);

-- 
2.48.1


