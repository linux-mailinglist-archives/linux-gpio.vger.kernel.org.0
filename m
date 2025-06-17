Return-Path: <linux-gpio+bounces-21693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6082ADCB50
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2602D1882F0A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5F52E6D09;
	Tue, 17 Jun 2025 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mxySF/Tj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A804E2DF3D1
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163089; cv=none; b=Xj3dkcGir5naYTpMbcubJH3ff7OK2Z+pvPVdOmZvbfIbnF+E1QvZMtvfhKuDWqHYibyuZgMem+MQSrxa0c6qUyY9w7uclPoyum0I+lIKcpfHQk1ALqqLpbkv+VtL0vGIyhgsyXk9sJxMfNLuXsqsp3L+fZJbp+AcFw6KgiU51hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163089; c=relaxed/simple;
	bh=bxD8Wln+1c1gwTOx2BtC9yxuB8rPQnYC6Cyew1Zz7wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj39BoOqYv2VSIKH6S+Nbs0FZc1oHoFKKn4nyVFN2xrTcn9IFBzD3VUaHpM0E3av8DOMRiFWZNLYaPws4lInKEE7CkGcz1ATnv2gSs+zDZzuPd2c6/KFdsWXyD35bA4pAwd0ea5P/OlWutx6z+slMsuYJYC2cROT6VaOHo2ZRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mxySF/Tj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so37415135e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163086; x=1750767886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=mxySF/Tj82NdWyaYtRcuorlzqeisO5os3ZX7XakLbdXKbF39dWaeNFGV90x5ZcuUXd
         3n+oCu1fOL+SlAQzkiJ+0euql7huwZrWBtNHsarIixiWl80ji7kmsg4y4Y1EKAzZPVrZ
         aXsALG+//gQC6CdplZO4B2Dec5mcDNCSQcMPgK8H0MAprxscgX7v3xKmEZd9AkCLq43t
         QKcEhnaWnNsNbYLFh+oK6aYhzluwnB3/d28C8cuHg71V61EqmqFZ5dRaLuCL8q5m+J87
         FgsrOBVv9msRQz0oWohoABByvZF/v9Ba128Lk1go6nnJjnBaOvSvjUuxQaU6nSRYcVEx
         Hgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163086; x=1750767886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=HzYtak6lpyutzA9K+cwqLqz/8Ef6bSjuvhhO2AbwKPQ4HKc8HcZA8DYnhy8VpSwBgH
         U+zdXMUmemaa96GPfR3SeapgwXnX7lbA9P+r5fcFG7WlIZ5+mwKYgXsWdcSB6xkWRhvD
         AVLrJK56s0TfWt/629XJjfjhRhc8waw8HhvuO4iXWjZDSsyfpOAt+dL6X1C+dzNhCpW7
         jbC0307F8HtEl1tDvSQGN2Zp6+uOAHcN0C31mRbRrCubzWyxsA8Dx7nez4gBN1a9hh4q
         0mE90SwzpqwL+c+NshUx0CUzC2J+9GCsR7FroX7hHdahXSpcKs0PmNObNREdm+F6ZUt7
         ceow==
X-Gm-Message-State: AOJu0Yw35jLuy/ZLmS8QXMRfWFT6FYPp0riaxZWOX7JgJ+uXosPO4F/U
	pQGktQs5ura0DQgMRTQhgdfOpr2Dw7rHoKirabl15yb0CVWBm/LguNeMr46FOyGZ5WbMPMTqnXw
	7RI0Iw3Y=
X-Gm-Gg: ASbGncvGK1qjCDm7ICfoikPfHgjGJEfOozby2HebC8hNT+6yVZZTdXLh/bD+siy4kla
	zdJwTBqv7yUV1fXV4XXMunnIxzU+EiJP8O5rPXlWvR2VpbBV4zfseWQ4q2CgEyv0wcwPZ8BGjQS
	dNZnCYqOpAoQPNHRMQjIH3lsfxlLJAHA7XsLMg6HN/J/GkMtxLR+J7b4G+w69gbD5apT13s2j+d
	9ViVHIDx+RGpym25zhUayD9EKQ40sByJZ5L607lMs4PUGdMZg+4YnGdnfC/dam+NYkVWBtzqaLO
	xLX9Z42B0J6ingdmCoGg1977dUYSzmciAGuDlsg7Q5OJoAAr/nVLGf8I
X-Google-Smtp-Source: AGHT+IFEY3qQ+Fglb9jg1ZhkUiIqMjijlbm8dxytbSflltEzbMtmudgpYXUBSqKCL5VsPPsVFxCG2Q==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr117448275e9.29.1750163085919;
        Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:26 +0200
Subject: [PATCH 04/12] gpio: pl061: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=a1x5aRsn4kpz4DTuXQ3tdXS/YzbAV4e8kj3b/qk6D/4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GIgRCEm14nPNHr3CVnIwUGcS41bLz59WAs
 TXEwqwLAcCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 cs0dEADc+nUolHMR19/mMV5qvmdBmtTJhRhknvVpHeM0XbGqpCZ7wGj6z0n8OFOGOBrqIN3vXbi
 0ZGL9wl2G1YDE42b2BWtFDJSjYhKoMMjx9KePbUSulFNhC7pb1fAxR+N3v31drUQ2jUO8Q/ZVI9
 I2fdKO60nm0ExTLDeoJZfaQZoy7/3sTkNrVWW/9YtP/1hvw/QwqxGc3nq+BWozFQPcHoK7mOvew
 ldZBEzrS5qqC1a01nuQAgIEdB7DeeCvSo0EXDrrXutqcYNK2afxhfYZeUTriuhbXdp4qupp9err
 i0yEmM76PTVq5zfZD0xdQ4bKxH09NwMcaTZ4hwl0n3N8G1aFf76HGqY7INud5TBW/K2ana5kYb+
 wEBuCD+sOThcDNDSc8TwqvLXb22tImhUfaKKr8ULqAbPvCE5YWzH7SkPBabm5T0VSJIEm3ugyC+
 M37yUgz2E6jHwiJ04F9U4aZYLId1h/UfRoLZrOnSQNeCY2oyz2olOiCpwsH1Ctuxk6On6FQIXc/
 SOK95xbuw0JifvRteSfWF9wqQjzNDJ6Lf9VoPE0AF8HaieKhzHW5BoTbsDo8nWpazpjGr03WvA/
 DQjWBu7sHs0vgHmXxbyGw5kdDpzysV/vFPtzli1F3wl9G/irY+PTVBcR7sUbr1rmWTdNOmc7UzD
 sfNnPEFJzOHU+Aw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 1c273727ffa3ac54d0f1e66bd6efb784d2a8604e..98cfac4eac85295915b801a62d62c8d78f6cbc4a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -115,11 +115,13 @@ static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!readb(pl061->base + (BIT(offset + 2)));
 }
 
-static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
+
+	return 0;
 }
 
 static int pl061_irq_type(struct irq_data *d, unsigned trigger)
@@ -328,7 +330,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	pl061->gc.direction_input = pl061_direction_input;
 	pl061->gc.direction_output = pl061_direction_output;
 	pl061->gc.get = pl061_get_value;
-	pl061->gc.set = pl061_set_value;
+	pl061->gc.set_rv = pl061_set_value;
 	pl061->gc.ngpio = PL061_GPIO_NR;
 	pl061->gc.label = dev_name(dev);
 	pl061->gc.parent = dev;

-- 
2.48.1


