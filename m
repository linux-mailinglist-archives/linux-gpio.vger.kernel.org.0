Return-Path: <linux-gpio+bounces-21843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD1ADFFCB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01F3F7A4E99
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1492652BA;
	Thu, 19 Jun 2025 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iBvyDpcw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E22627EC
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322011; cv=none; b=Q4cRrIk6KUzp8afIvNs5RhcKMpyp0sH18r03hhaAIJg37LRV9wqNGkpz9o2Jo9Xxn1o05YhN9zK0OyCknqsDz04P6pHsnKxgAIw6Zanqsr7A8PIuijkM3Pu+5PkjtYKRBBHs37+WY1MarFT+sUtgKFbAFd9/MJPuvhze7JajjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322011; c=relaxed/simple;
	bh=r8YR0XSxpNQwUjB1snBTCh+aO57h/fzpJl+JXwgznDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FSFUWwOSaY+6Cw7konzi09kseYO0MpHmOEZd0v2ZEjK1nNlcdoyqczEI+A72SL7i6SvEsBn/Br0jzmDAcD2wMEI9m6Z27Xj7fPpKlLcCSnnHXOP718posxSGvtP1IW8C3+B3Q1UNuovxz5+74D4rFBkzbb/we+VoeGRgW/Zj188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iBvyDpcw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a36748920cso510331f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322008; x=1750926808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoNSIKbOdd485smFmBnHl/Mm0pNj2Y6zx1eXoO1wxPA=;
        b=iBvyDpcwy0z18HuPayN0oSEHq9x2OAmDWQktAfa8rMIkVP7hofvhDn82PGr8QoBRA6
         5uM6USqS2Tg1fkWMckAC/LUxZfY8tfnGu9+sFNPvION1I0GSi0s89sZClBQ+qo9VyVAu
         e76m08zEIewwrl4MoDZqr+KUn9GEDsP3wwUrUYta6Hv64KvUmdb3qrGKpgUilBrHBqBR
         MT3zMz5bAff6r2JHXLnq1oBf07XNeInfNt/3UKBNWZyzn6YH37CMk8kbwZTQ8sTykXCg
         9xXBFp3l8UJTkvQhcEQ81gNhmQXVxV4r5kUPNuUjyIaPfUtMyWD8110MvMYcstYharPc
         +/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322008; x=1750926808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoNSIKbOdd485smFmBnHl/Mm0pNj2Y6zx1eXoO1wxPA=;
        b=R1uJdK9Xi2DoK/NKlfQHhpUJ3ZgrmV+X6lpEKnEW+N5/DLQbSJdzY/6C7cJMPaTBjM
         x5RXkaIxJOeVw6CnNEdb9WDPiN56DshKrmtQAHk+MDgAQtczJDLcU32Fz35AIwX1h43B
         bx+XoN6Z0NQdk/pnEZpDlXIxRXgKZaG5boucAtv8iYsdZmohDS+DJUFXD7Kia9UKkwbe
         ZFxDZ85z/sVNqqSVCVdwl/g7lyXwS08fOU4nkrx6ov+t7DB09ct79Ta2Bx1+qg5bJRZF
         GMYlkXKARpED4lbNp56NKTJUQWeq1nRaFaFdUa3kIUBS+LpSHkJWiHAanRWqHySE/Z++
         w0fQ==
X-Gm-Message-State: AOJu0Yw0yr2gCEbxdQ8ZHWpypsFp+y9HcQh4ijUZbyG6Wclfq5DfsRQn
	/QtKObUEHBoGrwcV2MbjpGPIdyHmu62baEU/9dEziGDCNx4PPy3f8V6WUfQf5/Hywl8=
X-Gm-Gg: ASbGncvQudJjaGe2LLlrmB5Rs5VhNUiTT9RfwQn1krtISLSidCkY9BJegDl2D55XSTs
	7dTYmyo3T/BDfyiyQIdadGMEKbXj0V/p1FX8Dz8ORcLK7HcYbjgrdt3B9LdCHcxL1Wc9DG/QUjH
	atig262TCew8kUmDUsPRUgu4y4J49mdMwlQl0W0+4Kvh01jbJwKDuBSdgg4QzektJ/2bnU0HHA2
	VCObGFjH+FMoDCH0YNdyDRnoIkhgut0SweKbaEkseDJ4WWn1OcOR8hI+BUjBQvJ8l8DPcqguVQY
	C9IXcPBJReIZLgJn3ADG6QOdjK6weNdbVh8/W3w7WdMRdqTuX2C/pXhT
X-Google-Smtp-Source: AGHT+IHe4d+B/hxUOK2bnJFDnHeb97EwrHtnkLvTycjD/SAz+yoFSaaQYQmyOZJ3t+SenurZC+RZOA==
X-Received: by 2002:a5d:64c2:0:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a572e562abmr17981536f8f.52.1750322007770;
        Thu, 19 Jun 2025 01:33:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:15 +0200
Subject: [PATCH v2 02/12] gpio: pcf857x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-2-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UjdVhHBdj/MT105x/Q2pFxBb2AP6k98PFv96j+C3ycI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRUaVjYB8TCH13E8mcMXqkCPZfRtBR4qqWH
 /WUoQsvQ8iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 coGSEACHErXifEnqqKpybQk8gmcrD11FOI6ZnQC3xR1I1k7gBjHsTrsAjYbi1LE8fZKHMWwo0/k
 lnk2USAJIOjDaSZNWlaynNQIEUCVwXFmrWv59D2ceVNX+veJh+sri3z66LQYoKQu1Ay9Vno4ujR
 VqBQm3VrVuWWhfTqPgaHS0nk9tAd1ABJZBTnpfvvG8JQVLmkW6HRnuIdmSpjFZb9XdQyZS4rNhz
 I3C4BGnGt0/X5kBcVbQcYJCRZw4A4iHOXR+U/BWhAsULDAiSSNISKyziUj/v9zOUi1qEQYqGXer
 WtKHJgZbLTB/DTZF+KEPI7MU2cDMDO5qfMzLCHqmLwZmdbCM5m/LAAjJ1281UDkrQbuThv883ow
 9AppTsR/koSlX8YaZX09dkZW3HE9U8YRRAZmV7xkMCG67CW7l2K/viC6O+umZlgTwFN0YWjpKxN
 EKEJeL4rZrJqT41/WsCmnPE3e7xoZIEDNf1viV2O2QgapMzLmKLhCbZL3tAgVGRGaGvJFPE75I6
 nfyEebW2KfZU1XPbwL84kSd2+iAXvmOMmj23Z/rpcsmFPXZqHelBfIra2Ei4bs2JEXaMmxHxjbI
 W+rgA+Y+lzcjQyj45sI19sIvRzuPUr3OyAdpVYyiXD6DISVH0BUL86iT7yIkuoReDqqdohECXIL
 d7uhlxLNix+8Agw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pcf857x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 2e5f5d7f886598318b753304e7e0efca54ff8b69..a042036803336439d8e164fcfbd0263b0e84f3a4 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -171,21 +171,24 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value
 	return status;
 }
 
-static void pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	pcf857x_output(chip, offset, value);
+	return pcf857x_output(chip, offset, value);
 }
 
-static void pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				 unsigned long *bits)
+static int pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				unsigned long *bits)
 {
 	struct pcf857x *gpio = gpiochip_get_data(chip);
+	int status;
 
 	mutex_lock(&gpio->lock);
 	gpio->out &= ~*mask;
 	gpio->out |= *bits & *mask;
-	gpio->write(gpio->client, gpio->out);
+	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
+
+	return status;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -292,8 +295,8 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.owner		= THIS_MODULE;
 	gpio->chip.get			= pcf857x_get;
 	gpio->chip.get_multiple		= pcf857x_get_multiple;
-	gpio->chip.set			= pcf857x_set;
-	gpio->chip.set_multiple		= pcf857x_set_multiple;
+	gpio->chip.set_rv		= pcf857x_set;
+	gpio->chip.set_multiple_rv	= pcf857x_set_multiple;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
 	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);

-- 
2.48.1


