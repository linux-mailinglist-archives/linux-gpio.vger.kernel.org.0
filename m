Return-Path: <linux-gpio+bounces-21435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 104AEAD7040
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 888FC7A41C4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8270B23BCF5;
	Thu, 12 Jun 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D+wNhCCy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF7223A9AC
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731076; cv=none; b=f9ayeDEK5stwPqeaoxIJHnqebVN5D5+BBxib1nnZxKF5Sa68hLkSUimTPU7pCeWbp2G1+bykPDNWAX3SkXoA8Yqpmjl5ecRXbHZFQG1i4ZNrUqVL54zQBahNCGGWapQ51+Zx2R6K5k0StkT17pb4ffGkSrvX4yuSx3RfXZH72+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731076; c=relaxed/simple;
	bh=y+bh8BPMBHHMNjtm7K1UiUX7kBcjD9lD6Evc80+fka0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNTEz63zxZDQHz9MJtG9if2sWUGD5vQ4YI3qbzbSDUYQTBjKfad0ypXOT7GvwlqP0y1BQko0E8eGoTiv5Ps+xgkDrLL0tKYrLs8DTqe3TkgbeiX+RhV2HzkSNvMZMDukC4wJ6pUrlh9FStKxgXs4lSgyZ6ft8uPjBmE3XHWf6Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D+wNhCCy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso7662295e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749731073; x=1750335873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQqZ/cBQ3TNxAJ5LvSpQ4Du5rx4hhqDqLvQoKIszu60=;
        b=D+wNhCCyQ1VrFVlgX851VmI2Ly5uIUTabQtwh7nZG5NC8xenUTztkEh/h73LNgJVpQ
         DvrvyQIRLjeHIMa6gujhO07GcEnquKYVP2mfN0chahfOopOc9nh2bTxMQHOf3Cx8fjE3
         rstNS0i/GdYWfT13XWfEcBn/Nq4GUki0IjZZtdvQwC8gpKmf0u63QABE4vttyfeF6V0d
         rYvNxcH1l2yh//gkDsa9IGqlO7YvpPgnOaj8FttJ+Q1EGxFLUXWgqeEsO9mWF+1rF1CT
         2uJPCauESOkXFTSLqNq3nQeBhRIsSpRjUbR9h559VaBcP8WlqrBK5crYrF8q7/BkV45B
         dAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731073; x=1750335873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQqZ/cBQ3TNxAJ5LvSpQ4Du5rx4hhqDqLvQoKIszu60=;
        b=CunfD5xSV79IRcRQlCmwO4i3CS8xITiK5tJJYWoTFT0EiPBjRJJkCFBAcwxpvwEVBQ
         srsUaCoWH/4xfRRhPaBWmYdrLB3fFlhQ3i4G4z/s7j8vzoQ/mCHnEsspI7lEmA3Mognr
         eBokfegsR2xVbG9bDPZ8/lQSZ+t51MJeyvbIEqe92NppBobbA+J6QSrY74uip7v9jx5F
         SAC2WZmSm1iXIhM4JDhi2Q8lyRfoULgyt5J3wDSaHbdknuQfWGFm8eL1NWqtwdzr23bY
         BXCXlcX3+kKwSODXkwfcnc02i0xCOrHnHUbXdzWhSC8chU46Wt9LFKZv3ObIgnTjx8OY
         0ZMQ==
X-Gm-Message-State: AOJu0Yyq/ArJKK0qFsrOkYhLD5vUic8bfWUAE6C80gRTEUGRwZYWIxvP
	UPIKVybQwXirm3gv9S9eX4DqXeCnAJHO7C14L3pkZtEQQUMm0sM38E/jdkpctvAnkVY=
X-Gm-Gg: ASbGncslUzR+c2p798Ul/uoKbMXRll3hMg2uwIvGu6OrJpF3fe5VcEAd/UmWalCM5Kc
	wMYERSonzQ64fAQDgmlKewUC0YczoK53HPfr7Vgj/VeVe8e0GWkyD61SkqNOyEeJ69DWQqqAtbz
	sSNMQMXa7oURTxwx6+SDYFIL+dsJh+py0gOEAa1SxeW9O/Ny4goTxw+xDsQxvdShTgELoJPBUMQ
	u4JLfef9zFppeNQbhs+1kBAZjCU0pXuhmiUMHDGivDLGR+No+kvxsRbMQEXXECnzrWycZGs+MPh
	2EYbZYzVIdknpXK1fQYnG5N76q8WHJ7+UULSyswOEo/khIlTjo5Wc8X+
X-Google-Smtp-Source: AGHT+IGQo5WvDscPcMM/js8gEQ73yo2PcdEApIolXxZdIPyS7otvLFCw0z18KI5lBlrzRdEiSOhbSQ==
X-Received: by 2002:a5d:64e7:0:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3a5607c990emr2685517f8f.30.1749731072906;
        Thu, 12 Jun 2025 05:24:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e176d30sm19140765e9.37.2025.06.12.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:24:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:24:30 +0200
Subject: [PATCH 1/2] pinctrl: starfive: jh7100: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-1-8507b46516f5@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1938;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v4slgrQ9je9LSaEHoiCmAQ85/8doTtQ4MhOxtSsJA4Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsb/C9JmoqoHq2FbHuL9vK/Dz6g1dkENfElfv
 voXsRrlLjeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErG/wAKCRARpy6gFHHX
 cnsQD/9sz09OjBZ9pPPLWHEqdrVRoXg0IFOmdNzhdAp7rqud1iuRtpqnTfj+EhCPy3X6xKNOpL2
 5WCHA5G+w8lMCbEnWM2ydYeGCF92pJsm3/YJXyZxwB5blkXk4PFnPbGoQPSlgsnuLEe8MyfKsjb
 QvHQHiWvc+Bp+66EIou14Yw8zF5GqZRgYiokHWLu+aV4rxoVGoa4CHvese1gpKXyMb460UFaVLm
 xwQZqK/fmt+5jL8WgeEluYtjLYV8gS2yiKWVUXaK6lb73ijxLG9H6BLSZ5K0UTQeE6duaevpiet
 HIkYHok/s6KvgIQArmp2FRvPWt67EULVT1S+c8dwA4hVs48covEXv2ujxWCJbgQORSROoO+EfRQ
 yOmQCgu3kElJsstsDbjmvrw2MWKjy3RqZiTQzzZVMBSgi3C20yCQYV5vtAxjjI85xxaT1Uvymo+
 V/Zls3PoB5Y3wY4d7f/R8q0xhqZ9z/0LLTLqoC9UPMHnR5C7gYHfHgJJUk9QcpaTTmEiHjYcJ/I
 oTzYzwkD+aI1Oz/SOB8cH5TGAGbY+xa/jEcg8q7aIzfgsVuB3HnjFFOnAvzDOAKs21dqGFEiqBA
 cAIoCgdOzMdfk08c29wQwwKraky11uLRbAeMCxmlapTtNZGy9Yc83t0/sBeWvpo9XYOaNxJMsap
 ++J0cSw1ruXwoGQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 27f99183d994dccb92aac81ca42228bdb9225e87..78952523e5b62d2653f057fdb985438beba269b6 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -969,8 +969,8 @@ static int starfive_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(readl_relaxed(din) & BIT(gpio % 32));
 }
 
-static void starfive_gpio_set(struct gpio_chip *gc, unsigned int gpio,
-			      int value)
+static int starfive_gpio_set(struct gpio_chip *gc, unsigned int gpio,
+			     int value)
 {
 	struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
 	void __iomem *dout = sfp->base + GPON_DOUT_CFG + 8 * gpio;
@@ -979,6 +979,8 @@ static void starfive_gpio_set(struct gpio_chip *gc, unsigned int gpio,
 	raw_spin_lock_irqsave(&sfp->lock, flags);
 	writel_relaxed(value, dout);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return 0;
 }
 
 static int starfive_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
@@ -1300,7 +1302,7 @@ static int starfive_probe(struct platform_device *pdev)
 	sfp->gc.direction_input = starfive_gpio_direction_input;
 	sfp->gc.direction_output = starfive_gpio_direction_output;
 	sfp->gc.get = starfive_gpio_get;
-	sfp->gc.set = starfive_gpio_set;
+	sfp->gc.set_rv = starfive_gpio_set;
 	sfp->gc.set_config = starfive_gpio_set_config;
 	sfp->gc.add_pin_ranges = starfive_gpio_add_pin_ranges;
 	sfp->gc.base = -1;

-- 
2.48.1


