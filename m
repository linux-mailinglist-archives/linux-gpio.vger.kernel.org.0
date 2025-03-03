Return-Path: <linux-gpio+bounces-16929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA3A4C1A1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE25B3A91DC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD22139AF;
	Mon,  3 Mar 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OsmyM+T+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F9212FAD
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007926; cv=none; b=tc9vcx7F/tL1JGl+ZF5WbjEVGtuYGQVdB9ab/s/7NKCA+HPzot6uZg2l7MIMKG72EoAhdBPK8Rel5859BBSEj2Tt8lMrcn6XIaBMfal8Nn6xeK++CgmTY2edv3rtocNz4CEopVG58sZAlAgN4A90/zGl+cOH3F46P1DDnUqkyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007926; c=relaxed/simple;
	bh=HP8L4PGgf+KVpN6Z70+uun5kKVaoGZCKt//PfEDJsaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0ELDW0d3AL9+uxmY9cnWeeUjW/usKo/hwrVgjwFRYoR/EAmeSj3H2rae+td5Dbt0IxXIGA8LBbFH4sHOhXXt9R0QUJiqsTSYtXu42Fqhc4tkBWnwDneHgpMVB9fEn1g9mRFoYNbl5tY8MWDRy/kepSUJbOkpkK41xm0+EmAaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OsmyM+T+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so40593165e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007923; x=1741612723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNPL1a6roW0ZZry8Zwf4bxHUCK/ikUGMkO2GYygkBZ8=;
        b=OsmyM+T+aF87wruhdN9itFsRarH+C3rhqPOlid8jYumK4ZkE9rFsPS/wYiBTQ/upxa
         3jVZYmz7IVw41XVvPTKZ4vlwzdp5ZthSbjHBKwpc+Qk4xAbIR5Lgo4JzcTWFv9itmcuf
         ecec1OoBPvVbBx61dbhVMdnaz9MNvBzq4Xj8P77/WudJJrmCC7q76qy9ylHmhXAb7SbG
         sLjhIXUUjgou5uACT5IR46jSFRfaN5wiJreBirqgvhsV1f56/DO8PFr13Qwje8sHbjV4
         Qu337aXTBQ9gMjSlC0Ij4ADVcdik+J6PAn3SjlqeXGCijWqxOfqhglxieRQ3X27E6wgO
         0eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007923; x=1741612723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNPL1a6roW0ZZry8Zwf4bxHUCK/ikUGMkO2GYygkBZ8=;
        b=aB3fN7JR/ghwDJvWOL6wmue5NJFWlLuUg4xn4QJvvK+ISQ4wJikEl1LJBT1Z8jw7CN
         npGQpJr4C5a82lMY0NccHOiDkvx43cYhs8e7r19oLi7PJfazeXjkxrtraXwQrdQZel6d
         /HBungBiJB833a7NXnWYdb4lhYirYW+1NwICcMRuQf0eiBz9vknvOHrfhaMAQz71pJfq
         VLPiPOk5ansO9ZpQUr42x7egVdx8WcprnS0cMvU86qnEK46lkpw0Nh5HCUttDTpU8ABU
         L1/R1+RqYSNg180hLa2B2R/zhRWZO6ZbxpKsuIIsfTMKY5Yuk4wokiFTUbibjU+cDZd/
         aeag==
X-Gm-Message-State: AOJu0Yz3kxjiqmaAv9HKa1zibunV2vzpsMJlYIKrA7ATSCIFa1Z91CJF
	htVKj3yeDKF7QxFq87KbL+U3gT18d1SB2JTuAaewBH5ZSHqAUpJpWokil2rmyoI=
X-Gm-Gg: ASbGncvx4ydvTd0BYbYDCwTsUpCkb5QTqW0a/W5UGJT27q/czc7Hs+Oh61RhzScJVy5
	N0+tTnK5r+UZs7GvaITmvIyy1VH3mSG/BhGZdnbeviV7In6rlSNJlboE5j7OwtVjaSP4MO9LBOW
	ew1KNCSAElMVPitzmOTqfM4B9z//o+ekQAjY2NAarATxuklsuXFgTmE+BRdMIe9nQVWqIfDRalf
	2etRkAJMx+RK3fw4FYVlTaibnHMvH0eZ6ZZqnYDLNjq0odcEj2b6WPBOyRU2NdFmG4M/6ooJmTO
	SV14xVr6KwBoz5v3xa5R4FyXau/XsS5kBozcpw==
X-Google-Smtp-Source: AGHT+IHbszq+vMxzQMr31b4yJpnsrbZ47M8sVQM15El+wQuWQDwBK5/Bpb/PIWwe1VCZA2bf3aRtzw==
X-Received: by 2002:a05:600c:4687:b0:439:88bb:d000 with SMTP id 5b1f17b1804b1-43ba6a83af1mr92775155e9.25.1741007923152;
        Mon, 03 Mar 2025 05:18:43 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:30 +0100
Subject: [PATCH 05/15] gpio: adp5520: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-5-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SunsCTO9F+EWaLdjYQiV46KnQmX+82e2K+lprMGFRIU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqgKKxH1y23tQzCweLRSEGjaAyGcRFDUeq/
 rVWsBlWpxGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 ciKKEACBBk4kHvWvq9gEzt3a5+c5/x2eJ9ofpSxc1k6scdiEyfuTckeG0jNwsnuKnmWGVcZt5+z
 8OPcjsT0+csJp3FzC6PGpCSMfbZUtw03JIQJGM8TWeI9ulmBka8MlineJCR5DOERPeRx34SKzD+
 BQpvZfcQJngxK3LC+jkQZe5Z1vNINnA7BDbxaIFOcrweYjO+BgKJjE5TmPfdAlBSGC6BUuR1iMj
 +AhL75DSMv1bbaQ353KeDSeKhL+y1Ze29bKW5TCbzJMdU0kIsHL3BsklC1xldNZa0+Nl55J70Qt
 X8NPXyh6+Y/YbRI1lA9rrHkJ9XmvP02lU3Qsurs16hAgBT5TtxSHmp/ax0Jm+u3mG6t0Cd1EB4U
 bEiGB1Si600EmbxI/UWyIyLFISxpvQ0aHnSdL/MplN69ZiSspnqIU1gI3ZbgGznyy5hYAClZcKM
 5Gh6uws7oGhlSL8ETakeFWliTxMEZj3T+TyK2r8NHvLubPVo5c4IN6eRulRk3upWDvAhnK8n6Aw
 7hl194jwWCTYD+4ao2kfFKnSMSf6scU7P6tKw7vMRCW2aW114kU8SvfGV/Yf29RiKRL5db1W3vW
 ljM/LPc8eoRpobP5W2hQn7HrIohEw9zv/cYH3w41EC2Ac6mfFQetDtaT/UQXRPoAI2yR8rIsbd7
 V96KA6HPqQ2Ei1A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-adp5520.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index c55e821c63b6..57d12c10cbda 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -40,16 +40,18 @@ static int adp5520_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	return !!(reg_val & dev->lut[off]);
 }
 
-static void adp5520_gpio_set_value(struct gpio_chip *chip,
-		unsigned off, int val)
+static int adp5520_gpio_set_value(struct gpio_chip *chip,
+				  unsigned int off, int val)
 {
 	struct adp5520_gpio *dev;
 	dev = gpiochip_get_data(chip);
 
 	if (val)
-		adp5520_set_bits(dev->master, ADP5520_GPIO_OUT, dev->lut[off]);
+		return adp5520_set_bits(dev->master, ADP5520_GPIO_OUT,
+					dev->lut[off]);
 	else
-		adp5520_clr_bits(dev->master, ADP5520_GPIO_OUT, dev->lut[off]);
+		return adp5520_clr_bits(dev->master, ADP5520_GPIO_OUT,
+					dev->lut[off]);
 }
 
 static int adp5520_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -120,7 +122,7 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 	gc->direction_input  = adp5520_gpio_direction_input;
 	gc->direction_output = adp5520_gpio_direction_output;
 	gc->get = adp5520_gpio_get_value;
-	gc->set = adp5520_gpio_set_value;
+	gc->set_rv = adp5520_gpio_set_value;
 	gc->can_sleep = true;
 
 	gc->base = pdata->gpio_start;

-- 
2.45.2


