Return-Path: <linux-gpio+bounces-16677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EEEA478EC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 10:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B5897A573E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C4922758F;
	Thu, 27 Feb 2025 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDUx9zDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50728225762
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647893; cv=none; b=qHZiLybmiYwA0a/tclazvEiL8XvlTwM5Vw2eu6XV43T93xJdHagdgfax+o/l1HmaTBFMyvXDCmt6n/K35ZMsmHB/V8bpirVsbGhOQxUL/skmZwkGV83CR58tOSkQBs3J2C9J+KaLEkFbvbmzcdIS1d+V+JAmylPntMLHyRm1+VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647893; c=relaxed/simple;
	bh=IrDWzI/36WiayOyQbq+hilJGcIpyWD9fYDbKg5sFiwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hjj6v3NyUpGZtjME950bFFj+cNWu63Hg8m28EBw53Ki3wu5cOiuRh8FKlQXvLsh97CiAGmVOfk+g3XA8Emnwy8I3FHCfXMKpya7mDj84lasaz1mSbaVNO8jjPrW8sVL2N0WBwHocSlxb4drYPt1uzAvh2Z8NSSq80SqtIQ9V4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDUx9zDt; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-309311e7b39so7734911fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647889; x=1741252689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meXK9zoO/tCJ3hLaOZHRGvTF7SusK+eXZajc8oPjuEY=;
        b=DDUx9zDt6dzQ1Ml3xhOXIhDKRN7yfcP879Op2Nh/ivLVbZRm0p/YKeR6Hc3TMC6LAQ
         NgpgAtm8iFSleUAXQ2Lo02ULQUbSlG9z4GN4yy344WlXSixM2mU5exfMekQz2RH9hLl2
         36crfaMC1rrIqhwXj/H7KlXuo0EtO6YQNg9fTevrwR/YAcuBP4zPOvgMCBsVn5EqMOG1
         qSNhVV1jRSmx0768srkg7EZZZYx/3CFiHB+CG62h/2Q5887YU/8IXXfH/fW2oFz5tQPm
         GJ4L+Huv88OgZAu5OcUV1zA31xkVh9PyBpS548yJtUyWyscaxW+LPuhClh14uKfSRnKd
         UlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647889; x=1741252689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meXK9zoO/tCJ3hLaOZHRGvTF7SusK+eXZajc8oPjuEY=;
        b=IaI1gw6pR4B4qV04nIpnpuVcpl9FKo4EVkw4fedCK9heLpiUy2vFdsQ2w1PynODqhA
         OnIP43DeaUo3NNcueHqu8g3mL+zIdFVBVoRA8RW5BuTPtVh31/iw7pDNgJkh564BEbpa
         K3ZYQkNItg3Ut4xcYG5ifuGl+U1yu5K+dV5Gr2V3wxT5Bytja3cClYApCof6e54Ywgp3
         wlqxtH0vqWsI2fy9IPmmHtH8K3F1kDFynplg6w6Fgu0XDJITUP5RBfX6/qeYAuh+yYz/
         k6AIHyjisUCOzj9XAevx3ibskwOxP8DS4A6D50x9ojraUvNzA6HBLxQyrxI/KU+We3mk
         9j4A==
X-Gm-Message-State: AOJu0YwnwI15kWm6T8fj0HH4wSrGJey3RUUKuEbiNXfYOWmQhteVxFFe
	uX65kwFrRieRgErCjpdSNS7WFiv616zAXe5Bkdg7gF8q7DoiCBiFiqiVtvlYcE0=
X-Gm-Gg: ASbGncuUr0yrOwmZkNUeE2hIHkyI6FofFIX1LoDAPddq3Uh61fs58ZaN0QxGajDj5dS
	eHweSNWSc0Z5llZ0J/EHLZ1wgVx9LpBZDqRBcBcZfl+6dj4Jgs5w4wKvNWFd6Ze5uzbVh+ZWXmo
	/fwvXPQOQ3BXluN2+AXU8TslHGTChnhC2uPwO7LRuyWImAwbTJ8Ma2q8M+94p0IkQfgmA6X76wO
	K6TIOJlRWs8MwixQ3ikaAhUOnpt1cRqo98oXb2X3I9n2BkBHcTjkwspHJ435pTkCiFO5vD48eRN
	r6ALka0ouD+CVqKR9t2i56cpAwY2Tm0mbWQK
X-Google-Smtp-Source: AGHT+IFL67ma33msV3JeCJGIPd7yYQJ3dUkBFoufWW3y1IqbuaFxP88sPg03deGF7tUEX4p9wq32pw==
X-Received: by 2002:a05:6512:2384:b0:545:1104:616a with SMTP id 2adb3069b0e04-5493c56cbb3mr3712404e87.2.1740647889327;
        Thu, 27 Feb 2025 01:18:09 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742d3sm111136e87.34.2025.02.27.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:18:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 10:18:07 +0100
Subject: [PATCH 1/3] gpio: devres: Use devres parent if undefined
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-gpio-mmio-more-v1-1-0ea4ad43d304@linaro.org>
References: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
In-Reply-To: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

If the user did not pass a parent in the struct gpio_chip
then use the device used for devres as parent.

This is quite intuitive and can help avoiding having to
assign parent explicitly in every driver using devres
to add the gpiochip.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-devres.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 08205f355cebe57e9f61b3947b71ab08ec1d9fc2..3473aae0db7310711554059e86d51b7e0c2b093e 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -388,6 +388,13 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc, vo
 {
 	int ret;
 
+	/*
+	 * We are passing the devres device here so if the user did not pass
+	 * another parent, it's this one.
+	 */
+	if (!gc->parent)
+		gc->parent = dev;
+
 	ret = gpiochip_add_data_with_key(gc, data, lock_key, request_key);
 	if (ret < 0)
 		return ret;

-- 
2.48.1


