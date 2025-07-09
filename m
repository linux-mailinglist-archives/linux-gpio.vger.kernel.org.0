Return-Path: <linux-gpio+bounces-22961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCCAFE057
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FBCC7B4DF8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C06426E6E1;
	Wed,  9 Jul 2025 06:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BrI6mA8z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750AE27F007
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043358; cv=none; b=p8JSLFRkfc4cTGFiSid/eQI50xKBSQog98x3QYIOOyfJUgImxYL5T7CueElC8jH0XGMOBO5hInYMyC3EyhIaAxRHzKNYsW+B34ZyEL00pgDQUrYURNy0iNaPSBd+BXwWti8f6E9V6uG3+yOKcL946RpSR7SeNJKR4XpPdwMEdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043358; c=relaxed/simple;
	bh=IvNL2P79tjBk5MhsaaEuGJrSohHHH0U2SLOhiwpzceE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJsJW8ONsTO6VeNTj4TpFjKLxG5UBo7zK6zbtR3O9ymC4umOEeC7BzN+3vMLK9616olRhLuoWo4ynyhaC18vBiKWRZhB+iXc6jZuJMTSqEPbs7NDHs48/PB3wKNa1qViuVzhbVpR65qN03NXeZNF/de85ur8gsvvfXF3O3eM9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BrI6mA8z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so349440f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043355; x=1752648155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9AA+Vme2A7tvOOtAYEoOThuPzc4baD44EpnxiBVar0=;
        b=BrI6mA8zgnFzjQ6+Kyqyrj4tdtGTD/4Ir/JY/TlNlyPEzpmPfMj5F7BlDEecSuU8ZM
         Hp1CEwFjgkwCTCTMF2W/C8lBQqloSkSj4cflsw/YZT77bCVBs+4hXmJHNW1b27so9q5J
         wqmvt+TeGZxRII8jPPNWHUJ4QPM9TuZHv7Z+LlmQHNZHCJ+G5YM3gbvO3TLil2Jit411
         BzcURuU3axA5qmB0kFQCA29Mvdf6Th8v6PGJcyac6++WMAzPsJzyw8YSNrzAnTklzInU
         HJhGsb9fgrP1c4Q3T/5K9jY9YumukDLurCBluUl4QC+PgxYpbRWBc1f5bEugdvn3Bry3
         rcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043355; x=1752648155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9AA+Vme2A7tvOOtAYEoOThuPzc4baD44EpnxiBVar0=;
        b=fJ0WRXTYJUcpPPodWbhnZFdQMC81E2EHsIvULC7g17nQOBSajJRJwk72ZpLwrDXzPF
         G/noKJAEAkUYB7xDJluV+Fc0rUQcRi1bTViZW+sdqSUmMLXrnYZ0MqK6QhvVEPlQEEoJ
         t5uokjQ1ix1oT6s98Hi5LWum64MBlRHpGoOGoR4hMxNUtGz9pe9IVufUM06H6jATe8s3
         wV83TPx7NTAmX3UOIRR3JiDaXTyb27Icbxvgr3c2bE5zoxQr/dMrJrk6F/vePyGPn8/I
         y339sa7gznf4bGXruaYiCapiPJ/QNkoI4hK5uxEFhewmru+upB5Zgm4C4j6glrJJdT4U
         3Png==
X-Gm-Message-State: AOJu0YyeqBDVcPugj6dllGVCQmmZSL86H4ZgH3tFvUKWViY/cTn9qTnR
	aTCBi3kj/x6qeo4FkQ7jQPDa+cAwcRTNeD1Pj2kGyRr0wmgj4s2xPUoMv4DGEFUaZWo=
X-Gm-Gg: ASbGncvTVAdQuCPRV+tgTvF0odpjMo+l/IK9nuQffJ+HNcFxpXtPPIp1RPGMQzYpVCV
	04SU92ZJSKlbv/Vx/IF7TMCUmpW4iPckCb2cu9WSzdvQx3CvMuxl5WL3FrWuHWWxEmmq3qTus3t
	xfywzcAKBPoDdfEbjHcciv8zXd+N1ZGyOyiVUh/BniQgPMw0Sv7q5UlkaMXRaiejxngLUVSvkMd
	AT7tdIsZaGbpe1BSkEjl5y7hliu1NamE9dE4g2HiS9hGS34p94OeoEwAO9VxZXk15RgGTa7y0t0
	FYWXrlvKpRlOjJrBnYwupkT4e/uuc4NazQ5HzVIL5ucvnvw0zY3n9sgr
X-Google-Smtp-Source: AGHT+IEvr05IxCN5A7HvgNfGFUMeS/mo5iKrHVFh/EJWjikMuh24rrQubvJ2gZPceVVSxyPLoIWjuQ==
X-Received: by 2002:a5d:64c6:0:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b5ddfb8af3mr4849741f8f.5.1752043354814;
        Tue, 08 Jul 2025 23:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:54 +0200
Subject: [PATCH 17/19] gpio: zynq: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-17-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Kh1qw8D2McTAX2snIyGAwdgPEv34+/OEjkqc/OAdgRI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9EHAVIz0smvBiUJ3rqZMZiSSik9MKt5LJIB
 NYuDZJIhXeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 chTvD/9olNPD1TmY0Vr47XhyqgN5kCjK3v8PeHWRJYjj/Ezv2NPrbPOdBdptbwxaGSHYdnyxFy1
 5CIWK6/isTqR3KRIFWfZK1uabv0nY7dzgvx3INHU1ym7GToGsNE4MLxJIKjW5unzhExdMYPvVNX
 akLDe5j3eGIjs3h+IDVt2A78pYcA5LDxVVTBkdm7hGMlIw/wuKoJhSNZH6KzFIIuEBnBqJi3NeJ
 1mZFlw9PUZdC6hkQQB4TgSNjZ3DAVpZczDvL9JWxYF5/6hwNePWjRCBZ+pS4foPn5oYYuHfAJ7u
 EVmJt6T/qm6gCnWVVHN0EV8RBi48TaPp0CYWlEZufjBv4BDbQWiAr7s3DDLENZD8JRP6CDrivLK
 ld8qgccCKLALrN0uqRRTFidcyB1YZBjrUmJ3fq0PIBCFSEuwXEb1NVxxTKO5zZK59E6m6yCcqYE
 fWuU72awwZd7nVCyBjrImj/+laSI+WNiNreu4Ym7JqRNCC2Mci2BN3MN3YY2B+Xw6pLnco/fHkn
 0tsvxc7fD2prK/xAvj8x4lFaTH9x2rNvz6JZHhMMJfspYWZKolhuk+YfPe3df27E2Fv6+DX6ym/
 5aYOtQltr3CDb87TRQbHmfTIKeH2YklE4iBvMrZIlZzimIa5q7xLkHnBm6SMo13z5g3EBDkrpA2
 2ARoAyvufzkNGXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 3dae63f3ea217780818ccb991ccba13ab18775db..b22b4e25c68dc19388dc2eb63504279e548c73b7 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -265,8 +265,8 @@ static int zynq_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
  * upper 16 bits) based on the given pin number and sets the state of a
  * gpio pin to the specified value. The state is either 0 or non-zero.
  */
-static void zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
-				int state)
+static int zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
+			       int state)
 {
 	unsigned int reg_offset, bank_num, bank_pin_num;
 	struct zynq_gpio *gpio = gpiochip_get_data(chip);
@@ -290,6 +290,8 @@ static void zynq_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
 		((state << bank_pin_num) | ZYNQ_GPIO_UPPER_MASK);
 
 	writel_relaxed(state, gpio->base_addr + reg_offset);
+
+	return 0;
 }
 
 /**
@@ -930,7 +932,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	chip->owner = THIS_MODULE;
 	chip->parent = &pdev->dev;
 	chip->get = zynq_gpio_get_value;
-	chip->set = zynq_gpio_set_value;
+	chip->set_rv = zynq_gpio_set_value;
 	chip->request = zynq_gpio_request;
 	chip->free = zynq_gpio_free;
 	chip->direction_input = zynq_gpio_dir_in;

-- 
2.48.1


