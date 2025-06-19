Return-Path: <linux-gpio+bounces-21850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C7ADFFDB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3A819E2141
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F170527A45C;
	Thu, 19 Jun 2025 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W3AhiyfY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A14B279346
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322019; cv=none; b=SAg2YBVTuPn60fp/fomH0U0aJ92S5mLOASQi8n8ZOoQ2eB9hIMeDrMzjpysG2gcP9JkZIZYEEO5QI8+yp/KQaDiuT1hx5nTCCON9HYs7qRCB68VgqfwOpO4V704eumB4w2h8Lx/6QU8wP9N4yWDDmLh8fTmz6yV0zPt719llw6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322019; c=relaxed/simple;
	bh=cKZpAhtifR8xk5RPiheRH/GzBlWm98s/1BZyILH5nuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAoRgHtvCiqpe9GOCC3QCGUD7uGTe/bh0M7wGlr2aYJA4f/r9fXZ0NCsJdSmBAjSz1gI2qsoYIYmZgTFh/gr9cMnkTV9TMKRxn4xpdTznWqDAFqPDabZ47lqIRyVp3NztK8YbjhX91e+HdwY0/Ee4ujZDZkF2D+Fle7O8PBZn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W3AhiyfY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso4004975e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322015; x=1750926815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SDdps11Q2eLdePG5stsUwakF44A60m55NMmpcUnFIc=;
        b=W3AhiyfYGjsT5PFZIldrXTCm9McBxYPYEShpu4ls241Z6hdb8sR3bcxUGqV0bMER2I
         9XMoZgiGgFIU7lFFjLAFK3/1RqPB7xKg3HPCHyOfDF31qQ4o7icdVE2q/itjGqlZ0YCW
         xrQw09EUZE8Zksm2vRH79xYwkKt7bms6yA5HgWimdQbCGc84T1ncAsn2xa2kTZZ55r3G
         fdQ6sL0UqaUE+/02Az6wcXg5QvyAfIxXIDhRYcOhmBm6grD/pS8DyakZOgpy3gbEatfg
         jBWNHhznHsoftuVHlWBPyBCLBjGixwlZAVXDtZzLwQ5Rv4r2cCf7w2rcz+rwetu++JYT
         9LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322015; x=1750926815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SDdps11Q2eLdePG5stsUwakF44A60m55NMmpcUnFIc=;
        b=nb6ZZgqe3X9kOKPDtdO8phzsqnO/0J5myT6LQbpA6DCQnk/Uytw19sFlUfRV2+O0wX
         ToMviyCUkad/fh7txDcGE2HJMpz/eOcbYxtleZdsbr/YJ6I/8S971vwzW70VN7euCjb5
         hoaPbw5ExwktASyir+vp3lN9J0atSWYjUTJxi0GDXBg+2+Rolc0KzZRXSOxAQqrLRLWJ
         qXwVtcJnpI/gMThaxKZkqOOM1SkRZsf1sDNE4s9RxvVeeYt6eSgOduy81WWQnc1rTIP0
         TnZFtnSZXjJR8XPcebG1Nv1LXAcWapUCQRfT1Iax5rOsLYMFZ9tejqkcuKQk+PDOiNkh
         kf9A==
X-Gm-Message-State: AOJu0YxOjvXHDGVIBAmtVRNoQY9IoCteYlqfGZT6yIYEO7CzGIyVQsLN
	Lxked+MmgFX4ctGbwfXouEwWVOHtg+58hWW2+jgEPqvjxM7OFz8Cs4i2FR/flp2l+bQ=
X-Gm-Gg: ASbGncuQUBx74cjARz7yRYSedTF1XUEULCgXUe7BeraDbJBrNhdShHYp9nghH9gYj9/
	1jXt0F0UaZKuuEuIU2CYDbjsYjYExVVZLshl/ZLucrnKmovhBzf3+9fUDwxI00JffsRs7wrOSdt
	xQhXcU8HRrNfYgx/MjQl8N+xxheYnETLJH87gqTB1gkOxASowVeAeksUhcBIM1hPFB9PINeTnr0
	gxwSmarifm/F6cajBuV1+z0ZEgse+YMwqFuXiWHRhV5GPTG2kDNONdRe1TjKoGdX5sDDbeOT5U4
	qCECZpsPOSiP9jYmva8XrbDzSyrBEHh9wyvr1s70bj9Q0mHO2sFOsTDxbLOvATTMb4U=
X-Google-Smtp-Source: AGHT+IEYlToyOJr+R8YXFkFhSULjEkR2OowLuJCLc5w/3XKdZxLCXJx6NMKNblG+ZhhHv+GOy+JYng==
X-Received: by 2002:a05:600c:6207:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-4533ca76ff8mr219841245e9.15.1750322015343;
        Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:22 +0200
Subject: [PATCH v2 09/12] gpio: reg: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mTukrDx/R865Eocr4BQInw+yzkmSNTUOuezPg7apBCo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tT9TjfCO988cJoPpaw0anioCZr5/SZzCR4/
 DPRgt1RWO6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cqwAEACHem9z95tLu2mdatXQMsbEwEicFLRuj0CKjbLo6ddh0GNFaOmHiWL6TYjpWH5luCWeMji
 qr1REYJYG2+rMFPuZQPUyuhA1rjAiCsrWtl/bG1cZELYCCUs4vTIYgeEp2/NsoHpfOHN+1aAb+Z
 cxfAS9JLi0BgNAH5ji3H1LEoyTV5WC2TEAZjv90mZhXYbKXVgC47+jmunaleDfmjku8MT8/8Orx
 uU5pL9dxB99qCZeNNZsNm6K68r2sEJoEjTAVe7aRTyI/GTM680rIGfT1+rWSHaV762HhWV9xM/h
 XY943W99sLzAtIu/+fEObsJOpIgMARGHIv/73HK2929fx+Gni/Kuy8WaRWYnDUONLxu9Tr0bLQB
 KbfvyCCWvxqlNvkm/dWG7MOV73RahG9L9ihNjZPRYXra5NRXstQ/xRttFCsYv7zkLnb6tJOa0e5
 z+1mU60ZwoOB+XoH6XvWBCGVaBfR8gh+GA1IfVSnndtvh7Q2H4ZYUniBVwnaRsS2pxLb32R+4iq
 zX5AV+tgLtdpL3yOnU2jfRaUkXt5MpQ+3r78F5PqiamJZzDRD5PbZP1uj3HOHYIHZLa4gtP6gWd
 yEYw21OVubU+lwFvfM3IHdUhbQFiuc+J41nWd0vt6pmrx3LdNUX70dveJQRLfE8MtZESyFB9BB6
 4sqwsUIoOUevrKw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-reg.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index 73c7260d89c083a702b1d914ddca7a573a37de4a..557dd77ce30bbca6174babbcabc965cdcec57896 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -46,7 +46,7 @@ static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
 	if (r->direction & BIT(offset))
 		return -ENOTSUPP;
 
-	gc->set(gc, offset, value);
+	gc->set_rv(gc, offset, value);
 	return 0;
 }
 
@@ -57,7 +57,7 @@ static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned offset)
 	return r->direction & BIT(offset) ? 0 : -ENOTSUPP;
 }
 
-static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
+static int gpio_reg_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -72,6 +72,8 @@ static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
 	r->out = val;
 	writel_relaxed(val, r->reg);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	return 0;
 }
 
 static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
@@ -157,7 +159,7 @@ struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
 	r->gc.get_direction = gpio_reg_get_direction;
 	r->gc.direction_input = gpio_reg_direction_input;
 	r->gc.direction_output = gpio_reg_direction_output;
-	r->gc.set = gpio_reg_set;
+	r->gc.set_rv = gpio_reg_set;
 	r->gc.get = gpio_reg_get;
 	r->gc.set_multiple = gpio_reg_set_multiple;
 	if (irqs)

-- 
2.48.1


