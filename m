Return-Path: <linux-gpio+bounces-19305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F9A9C2FB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8FB44C47C3
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E40D24169D;
	Fri, 25 Apr 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zsK6zUoz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B223AE66
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572125; cv=none; b=qBD/HFSGVm5v8+EsrMOymJh5qO19A3nBE32JjVueVIO8Yw2AE7K1OQ8n1X0jlQrh1W81edJbuRhu2KOVabdjL6htR39NXrCAJIldWQ8dShOLuNBmk8M1Y6e7mMVhWp06zyTlGZB8DQhwwNAktTtPi8hRyY8noxr4uwiA2uRSHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572125; c=relaxed/simple;
	bh=EulgghYY9EmhroqWoYb5VtIek8zQSwFJqay015WfuEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AuHRhgW4Jl56PYawcYS3Kw9/iOrWsPR01UTzUIfs1JXRxaTzGiEsrHLbN3ypjziAEuhQZqj8sSONlYrIX4dCdAVIyODuH/a63Cf2bu0NZAMesK3Ae0V/yPspFtF8+Yept0bkMVTaIX+A4fYo2VWPLwje7XegWdHCumds543a7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zsK6zUoz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1796001f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572120; x=1746176920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=;
        b=zsK6zUozVmJ9/TzYyWWuW3pE+QnJogQLOwddHjZAHMMMH5+Hq8o1OgolIDnGci6x02
         8QDCgKXcHt4F5pZyQtNVmTHVUKW0aXLwfdJwnVq93f7pD1fVJvZyiMz/oLv6BgT05icK
         /Jq0KTdg3yk7cMvO/gQ7yiSinWinym3cCOo02K5TE8xPGI44tTf7RXdqcgc0Jg8BIZli
         V3ju4YLzlO7j6keGVZj41xhRKA+6SPDbqkBBERJt2WYxxEiLZGaoA9DRxBCBo7eYrC0a
         obntM/IoH0nBO4ggIvJFTcdSQfzsriwjqwrmfKH0OWu+Gg0iBNoVazZioaMTJMtG4CPK
         GUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572120; x=1746176920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=;
        b=kXnuf2D/cvG3M/8Vta4ejP9KTaOtki0ys2vC5TSWFe2Flbm1FpqxmmK3QeWabHRm5T
         mVZv7lb2HxGR3m3oM3YfaN4aOEWzaB41bSilffbz6LcZvMbvsLuoxZ2e8N+jvjtyLYJk
         X0RHkbEuhTKja9pCaQhFoizvSV4FmhpQq+0XYcy8uozDmnMiYUk2k7ciVkY0pvTp3f/O
         aFD0XgEgWPZr0g15U08WPPF8znibh3JZeIYsXLIHzKWBWtN03XFrXov7Neoyfufqu3qc
         0vhqYrNZRjgNoJTix/OTAoRsw2lTuhVauu9Uc15sDSoG8TnCFO8itEAaV93G+zhmBTcJ
         n+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIgxx3Wqah/Pr7BmF+5vs2U/2zx43gfbXYJphd6RbCc1nb0JhMHPSy3kofjT0F056h2XgMJs465dXh@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZOp2pbXw68PGcn7maWiEQnXrpKVx47R5dLT75STSXgMnBiTu
	P1ZdfoWKXecmfPhx7lwvn839W2DYlpq3Cna2FreIFPzwbL2PoPDM5NxZWE1Hmgs=
X-Gm-Gg: ASbGncudFzO/WVzwZth4cKL2mNkrUSpe2/CsukgFwMxmcg6a49SJJ672tRrni9J3JvX
	wVZoW1rmIIQ36G3w/dkumaJ4Q88Bw9QkHwVE0314IfHzUzFAvlYyWw/cV5CbCaIBZ64kd+tp8x2
	g60NYlgbhazAFeS18RFcTxSi0TpTyvJsyLlY+Xql8XWoLY72I/XdgRD70zmoUD3drhF+6f0RYXB
	bW6mywKeKXiljI05Y0WP/RyUG8fYWmnasgKMSdEmKSWKLb5cnYMfNGeOm4XwDZ2wFAS0uDX6Z61
	uTTc8Rcl2XrrSy9thoyBKRCJ8+I7QY4YQQ==
X-Google-Smtp-Source: AGHT+IGN/vWTOOdJRbfqbsJsmvKshGEv6l4OK38T6XOXQRPgrvaijj8/T19lKBfroHc+Nolpyh8Jqw==
X-Received: by 2002:a05:6000:258a:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a074f154f4mr940261f8f.41.1745572119738;
        Fri, 25 Apr 2025 02:08:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:30 +0200
Subject: [PATCH 2/3] pinctrl: bcm: iproc-gpio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-2-6b8883d79b66@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AXQvvsX8aRsrH6IPjREq5g+zCKjZWUt9eQLSBi8qPzM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPM33kYpK05MSkPsmYPi2ni2pXZtF3jM//c
 +NOmi85KW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 cumND/9NDhDagbohLKHaVpqHCjYGMLprtLl0fswvDQm6vOrfMCMczKAQ2yKRl7wy5ssQj5ExYFe
 iiVWum+9hVvTsheYOoQLoLDOjffUKPtRs9ottEeT7W6B6aZkqLgvgEPKEtHz33pDMuV7Vl8LPBy
 +Tl++w9ixP4DS+7Pgf4Fb+DnkSHy54Jb471i+LP/buYQCS6/WaR/a7xY9t+dSvlJiF7aMogsWs0
 8UIS7KUOTGNac1pMUj1vjNMbbazqmx+yi/LUGMuF9FaUTo95pxr/ngMR7h6P2l/ECYWoqxx4HeO
 InOzcRHBGE3WSpGP+5Q2nedWWs2+J7hNaQZPDgPSwMPcmnofz6CIkOonLbAg1MQsqUU0flDVYER
 cZlwX7FIMeJFNWN5SbyAsdz3z7rtBBdO/0u7GHxvTyKWVZCd7cIsTgiCqQPdE2HwexPtMMRux89
 /QTTBhM0/BB5vXgdwxJTfF8FahYkc03S08Ew3ICCKoXjMsVZ5xrN+JOdnkacZLCMcJ1ftqpBwLJ
 jnb4yRvayiA+5ErzzEwSDs+3zgAGe/AAWkB8Uz/hjvTELKCMVeT/4vwIBgJWUPQgTHdHgwF1lci
 +FJVQIkoPiUp9l17NDejpnFAFqgHqY7LXJ8VA0Pvpo1JYmdQdLWOQbTmsdU4uoCXKV299Nn9a6f
 GRikUNE+adMm9qA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index c9a3d3aa8c10..1d08b8d4cdd7 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -390,7 +390,7 @@ static int iproc_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int iproc_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -400,6 +400,8 @@ static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u set, value:%d\n", gpio, val);
+
+	return 0;
 }
 
 static int iproc_gpio_get(struct gpio_chip *gc, unsigned gpio)
@@ -863,7 +865,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = iproc_gpio_direction_input;
 	gc->direction_output = iproc_gpio_direction_output;
 	gc->get_direction = iproc_gpio_get_direction;
-	gc->set = iproc_gpio_set;
+	gc->set_rv = iproc_gpio_set;
 	gc->get = iproc_gpio_get;
 
 	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,

-- 
2.45.2


