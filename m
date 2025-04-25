Return-Path: <linux-gpio+bounces-19304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C77A9C302
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55AC3AB29E
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E96239090;
	Fri, 25 Apr 2025 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bleeBNnS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0672C238C25
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572120; cv=none; b=CRaO4o/5Tn+tUvd5CcbrSSX9TkBzLtZitAaEv1j/7FyKqbDa5v9wmERxkahc0/7ITI3OTackEATBvk3SPLlO5hyrCh+tXhOLTKr+p8dTonSjjvqpthvYcJLn8RUcTmhpQRiXjI8UAO9F5ioeyTfnt6I2oufkgHkI2fZRAwhFM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572120; c=relaxed/simple;
	bh=7S2gc7URb0PsBGnyXfc3DFJmPNy7b/D4W8R2OlvjVzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOlCJai4yiHCNC4Sqc9DAV75QVAKGYt1DmdLgdOyjpXVVlyxuBh6qPJIsumBJZRUBxuEsqi5UkSZgBSYppXP9gl43ZHiFfRffa90+i+7kbR3ckNVkUejz+8zA6XS1+HOL/XgF1RRR5lgPxfTj0Jaw3vU/BU676KjM+CgdQTyZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bleeBNnS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1537004f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572117; x=1746176917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=;
        b=bleeBNnSBR2zpbd/GXqXLkA8MjBbnecuVfbJsdF7sqfjetP4QKZhGsqPkXLpMYE7RK
         EQELdh7ryuoMcwXvq952f2uGBH6Pb3RU7I8I2fVov2oYzzgdPrTLDzaYWuZ6QvJs4VOJ
         KhOtWvuwTlSBchPMC+mZ383Np88Nz48Rxr6+ocrp313A4wgVUVKcAUj/BCjXHrdwxZ0O
         0ZY66EvksaWLK84MzkXAd0lOu7JqjLvLpHuZpa0Y0XFLFwtXv5maRcxe78NRghdhxmvh
         ffLRPsqIU5gT8PmFG/2DhhrZ+e+OXcKexKt8UMOimlLYqBanrwzvY8CDafVezxCw/zRy
         9XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572117; x=1746176917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=;
        b=NXMBbiqHco4IiwEbkBU7d3BKKMwMe5xex5RJW3vx3Vnu+DPL5TBb3OEUwrx5EkUp/+
         5EqLvDxig0URkSIqk3a3TYC95ofNgxNsRFA9x97osp2qCjrWJ7cF6YByVKtdBxdqxrLN
         lJMIk6FOkHmKD6ULX+X1EnQserd5447j24BbQ3GItSb5IC0rsTqvnxZkejhADruvj6gB
         l2QDdRbaA2HYm5PnMrvWYEWVXbaGjbSU56G3xKoX+DBHeRBPAEvAq2OTlvzOFKAYUmCM
         oYkSvPyo33UM1ByJLmwToEH5XqXxxYZSN50FaGxH4mowtTGgg12vcRfQnRg8LC8k1J9t
         4ucA==
X-Forwarded-Encrypted: i=1; AJvYcCUF49UQVN7kDm6tAMQSdGXyww//DBFid2iGwJjuKYg/EtxAqUhn/lxfcMeDBD6pq+w5E9bSV5p4SRjh@vger.kernel.org
X-Gm-Message-State: AOJu0YxMtMgPT/KDXNJO77L0FwhYUv+loUhA98f7gVRSrSuP9FXAeizU
	ydbI58NpL3HnIOK4g2gFszU9O3K1SjG6XPTmiy4sJ46OZJXPlbCM0VbgyeqAtog=
X-Gm-Gg: ASbGncsg970dZFKb0EuNRvtu2n7KWqm+lJLbF/3bBODsxB+5s7mYoxcNsOCGHj2v+L3
	tCeY6dgjMN12pbAyJkjSTdhE4PtjrOPU2EU0tVMAMOEfChbKIhOfGtE0LKjmNncpH4X6R2xu9fg
	dGvtQGG+TtyKPV+kLiPkA2ecqv0TSxADDDfXFgeio9GQDSCB/BQ/cPw2GPCmW2448jQTIspeWVO
	l2o4bZaVLladGzrfXklYoCQE60GjKxUnqVX8rHpw554BtSr8ATsuy1GIQXQfamT/t0V3AvFmw1F
	8o+W3QgJ3e0cAhAT+owbeHlx7v5mhbdVcg==
X-Google-Smtp-Source: AGHT+IHCuNyR95UNYI/0izXIj1LRfHaEgDOIQ/KPvSJKLbV9AkvjEqEphDC9iCD0AWLDlHAVDkvOOw==
X-Received: by 2002:a5d:64eb:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3a074e37904mr1224414f8f.27.1745572117165;
        Fri, 25 Apr 2025 02:08:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:29 +0200
Subject: [PATCH 1/3] pinctrl: bcm: nsp-gpio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-1-6b8883d79b66@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N7w6ShEtcDx0natQtD0HEUwZNrRzhk1g4hjaD5jLcAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPQG7Og0taBdL06rmp2Qd0XqgRcsFeRFXYf
 fe9a9gFLc2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 clLhD/9631+iD3Op/0JhcmhzNPwc36GbPSCVaPf9M9MHPdntWvM1bDIAYa23+LE1y7HKaCnoA2C
 vqCHsaNy2PZUwRuPg7M6COErn7z7+BXKuGLRHmQoabLd366zB8+maN2WdoAZfUOjpPEBrDvuv9D
 ckhVkzuRNCuVd0LbqoXhFKtJZngA0GRjBXgbN/bBF0+ewM3B/zFdkBZgizZwaATSNjFzs+8WhKa
 ahubiibF7/JrllxjeyvJHhvwRbk0itwqtmCT5XRLMvTnZZIidHv3EAF1rdpVcD8sLq2+IM1/sj2
 9aBJteBDYzOLrxAN67IU9ZOHHmWhwdoOHR/85ADJeF8eyrhtZdOwcmenqwoF4u7KfSndhhaRauA
 Jl20Z1Jvf97+mOJMMV9T+tcVaWNYe9fuK3HUgZatheNov9YjPrdalfdLhEzcsDlv3vnYJNWgws3
 wr98ZphmsUhsXhTK2PdTDPp4kNJnj1jAo/xxd/8wEubhn6rP/vVKvE2YKjLPbgCnsaO2KYqvMNy
 Ee+3d6aWvp9dq5Q+XNLbrroMe/U22i37w5um5akrVDwUmnwMdJQ6JvVG2ql9sKmBo7zIgjZDv9H
 UeQ8p2ve7Q+VDL8EdifOCZ/+MzdlHrDHQivPB50M7JsPuQA2b2gPsmcyKG9j/rHlO13W7+MKKmZ
 COdKenIJr/yyboA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index a96be8f244e0..b08f8480ddc6 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -310,7 +310,7 @@ static int nsp_gpio_get_direction(struct gpio_chip *gc, unsigned gpio)
 	return !val;
 }
 
-static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int nsp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -320,6 +320,8 @@ static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u set, value:%d\n", gpio, val);
+
+	return 0;
 }
 
 static int nsp_gpio_get(struct gpio_chip *gc, unsigned gpio)
@@ -654,7 +656,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = nsp_gpio_direction_input;
 	gc->direction_output = nsp_gpio_direction_output;
 	gc->get_direction = nsp_gpio_get_direction;
-	gc->set = nsp_gpio_set;
+	gc->set_rv = nsp_gpio_set;
 	gc->get = nsp_gpio_get;
 
 	/* optional GPIO interrupt support */

-- 
2.45.2


