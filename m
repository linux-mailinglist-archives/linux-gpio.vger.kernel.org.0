Return-Path: <linux-gpio+bounces-21183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4FAD3685
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E880C189A41E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0818298245;
	Tue, 10 Jun 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xmAZ5KL0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F67D293B78
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558816; cv=none; b=oMUuz7s8xdWghGmi//+81yfItHRRo2afDL11CbSlF3lyh72RRHUdTKrQIDSqvTUru8/IMqbbIzKn9JhHbdjJBA7AAS1r8/Xj/f8RTtb7aucQWjr5mnfJd8gInc3z1eBsek+gZS/V56tvZvZQcF7xXazP8BiGDGvGl3nhiDbHFi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558816; c=relaxed/simple;
	bh=PZhBn1xIuX3piPV0sigQffEqzYcuLXEK3ObYbTHxcOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrdvSrqqlv0ThIB8DpAw0PCNAskGmG3OKHhInKL3VmH1t+Ji6WHOobSxZXgoR/M3xxufZpI3zeomepa7qbt+5hZqiY4aTFhrela31umZmSNLK2bRXTSeNVBg3YeDkICHsUUSlfQVWbyJrSsQOp/oioEp7oR+uduXdUnT+CNTpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xmAZ5KL0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a375e72473so2741997f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558812; x=1750163612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=xmAZ5KL0sslxXJJ7bHglKZMrqn/XEBUs0pcj7LzLr1nupVAmuNY593Ft2qVM//fM4z
         7DK/lMwi4ezdm9qdMQWIyYwf0vDQ2cTe3lLCwfvmbkJaOhX8ZWyD8Rzgf/x+tJ/RbfwB
         uYJMwl94xwCScQv8EU/lMkHAmTD5nLcLiyyjX/hcqHYu+PRLakCiThCTb3ZanLWQ/zRl
         C+N+DbFKY7jJ23YDMpX4gqHzYYeGWqdHvzSj1hNCJne8EyJOejNbV4m+NBHJTfAZ53qj
         LA4zdVEotChLol+fnQ5SFH9a55rUpyVD63KJeqi9Cw7BKWlbV/UKwUpEIhhBwd8BIxbF
         LfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558812; x=1750163612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=K9N5iz4SCaKtz4S5G9N/pBH+deTnxrcQr3vcAk6NZY2EktS8udgAwGs3gnUjWsDydZ
         IIIhocJcDfH04G7UgznyXCBz0FoFa42VasNXY41hbykgsGzz0Sf82bhcD9V9X90GgL/i
         t6BRXuv6tlEUEqdqN9ZRpXsE8xFpSo2xL7ngzWcTqCAVJdApsH/nu70jTooJObA70rB0
         CPmzXh8SwtUo6GU9/iyjoszIn/q34db5zYoejr5HfdNyu5ShEG7jmlW8l18mvO8eAxXk
         5F9kw5ufVYvB6oJsy3i+ZfIvhGhrX6rxWmXL1xqxIAAeAZQJryjmqL3ou+ic0tNJN55q
         c/sQ==
X-Gm-Message-State: AOJu0YyxANVRNBrImOs3tbJoiNv7XitctTiEIj0wP9/txYt6qIN4mQKP
	QsS0OqNBQWrEFopOM5GZbzFlzAL7LwRHjJM//7vYf5MI/2yPUZxttuEjqlPFh+6z+hTUUAZlA5h
	G3cGD
X-Gm-Gg: ASbGncv0h622dHL4LjdTDAw9AppOW5EVjS0isogN5TGyZqskSj+rEZa6iAFAMSwi8p7
	EcO+hF+Rk6osW4/zCOCJBHOhuM+Ge3axBUcE0EbOUntonCII6wZQTvxfsAOT0E4Cf5GxX+qJP4H
	cngPDzV6oh2rt88AC31olRvfQsTRsvKJ4Le1QcGa/RbVx+g/p+TdmWEKupxQFop1+gQfi8cc9ug
	iX+ptrrcqUO/p1Uee7w1RS5NT0RNYlph9UTS50jpqOS3aCvXeZgQtMC1M7bnLHoaSsa4A5F9cAR
	zHZMvyKIAbH4/ReL3IiJllIahcRJxQRNp4E46EbY0NxB1A6lTaRyPg==
X-Google-Smtp-Source: AGHT+IEbu/ISHzm391WeAgpZgQpxCQMU7l5sRhpe0Dp2uNZQ9BZI4WIWzmuf7o2/3fpe+9gfV/kFtg==
X-Received: by 2002:a05:6000:40de:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a53189b56fmr12109336f8f.18.1749558812389;
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:19 +0200
Subject: [PATCH 09/12] gpio: npcm-sgpio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-9-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i/xwhpR2l/6SdoE5H3/TW1iFI1pUsif0v71k7JJeqSc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQx97BIIpnbWW8Jl0scOnlXA7m5aZIgz1E2
 ednyGv/bMaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cq0GEACXL/OUOB5vGKp6qF7twwq2LopBjxJ+a5zMR6wQvdYfBG9QBDMmaPSjuf2kmkUtUbYu7HA
 Z1FBKLRGSyx1X3/aaozewD1qjyFA6BkSTZNtKnHHfFciGdkPfYwzAX9dewnRrjYmGX2RAk9ab4e
 VC9jF4zGQI+ngGuFjOCR9B0GScsixBBssQZWPx/+mzwukpk5PSJhpPvOSlfJzvaG3S7/9LenY3i
 pIK9rDUEeMNityyi7CSMetFo905zRiQvyOHu42Wn4GMCKaJgXg/wVA2eFw3JOFTg1S9deQKieKa
 LE2ed9MQ9rCTGm11TRojU7n44J9uERZp2a3XOuVBWzzyL7woBfFsFkzlB4IGf0whMN72a8zT18k
 wvRyZKhQPTk9EDwIQrqjDA+BhifztuHVUog4jPZq4XzFYBhGmE3SjABwmAdeoJxLCO/vbmNhLPk
 843qnKqNHnzQaryTQggkzqEB+E7vcapL8cNvyCLhIP3Tu7PPt0ucxtKA/gTsjLQ5BCoy7qvv6md
 4ZAH+iSl/g/8OCXIpZ8susfIxxvVBcI+FtWCvNWRFB3GwFz/GVm0eZC4SYWn+8kzCc2tvzN7mHq
 f4OvLY1WFa2WQtksGlajI7JxVWIJlosIN7MPl/2Fh1XVD9Zl+evDL2mc6wIWcMGBUyCJql3EvIK
 KZdOoABhp/23yRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-npcm-sgpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index 26057061454348d383129267e8bb0b8c506ea5c1..b3953d1ae8af45f4bce9b799434547cd8770d9df 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -226,7 +226,7 @@ static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
 	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
@@ -242,6 +242,8 @@ static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 		reg &= ~BIT(GPIO_BIT(offset));
 
 	iowrite8(reg, addr);
+
+	return 0;
 }
 
 static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -546,7 +548,7 @@ static int npcm_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_output = npcm_sgpio_dir_out;
 	gpio->chip.get_direction = npcm_sgpio_get_direction;
 	gpio->chip.get = npcm_sgpio_get;
-	gpio->chip.set = npcm_sgpio_set;
+	gpio->chip.set_rv = npcm_sgpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 

-- 
2.48.1


