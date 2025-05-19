Return-Path: <linux-gpio+bounces-20283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD5ABBC12
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 13:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC67617B1D7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 11:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610B427511F;
	Mon, 19 May 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dqDJ1rw2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBE274FE0
	for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653052; cv=none; b=pGD6EpWwr0u+YwxAarCa15b5DWhOAM2mvCPEFnGuFxhfn5Jwf/rIKmjp1FTH4+M5qYWEyj6KisqVXaQlfUKg7XK2tpH1rr3+XDM2+z14FQ/PZO+gVABsTNwtk4sECqh/whYwGlG7BCm8jlFzwCTlhjc+8XxCYpCiAEbzDqFxX9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653052; c=relaxed/simple;
	bh=+MErdg+V0LPrf8hytuQxFuXkZLlvEoQ0xdUCI+ffAyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lE/JDfQaQFZMH1wAnj5EF0UDhr87Y+nmu862MAZz5k1yan4pZ+fjWKS/Cs3tNkPndCbgvJMFkluTHYH3uFhgslpVt9OnZLGuU2t69fTbZNySM7q09R32r9P//zx/2rYE5VHspowtAPL044+VWumuM6+GIUqGJ1qtdcequzU5A2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dqDJ1rw2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a375d758a0so273520f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653048; x=1748257848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQesA0mAGw3TzpZuibjNO/Bi3DH12rgsDcmFFieVgcU=;
        b=dqDJ1rw2VVdLnJRixwKhrIi3DNSfH99kcqHvuzaYMt3MAgM9/xGj6DzuzUwqIjQCSK
         vYm9yzscjZdXpH6zUMuRnbUS8gaRajprEWvmTeJTI4jmOBANENPeE7MXGaOPdztNa+A/
         37MEK4EbIkTQ1/gr/Z7ol4/5JP7JVOunQihpTB61l67B3AMPVZZHG15O1m31IpgxdmNv
         q9huOuRDebNXf1E1k9Vtm+nPppUMdZDpPI5iv4Winljw9bqFMxFPeaJs19lhOisdUDhM
         2gHKQdVI9C18K/Pw6ut17lzd3PFL29U3K28P9ZilGPE0fR25N/i5rss8ct9FVpvv9m+T
         oxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653048; x=1748257848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQesA0mAGw3TzpZuibjNO/Bi3DH12rgsDcmFFieVgcU=;
        b=ocrydNhuZBDknXxwOkpSxlvqDQ/UhHvUsPFByKsVVwb1oR7k/9gJP1cMDoMP40duyR
         bNknsfLDIKEmQfadG3dKsoahDBTLOL/Yhh2gUaKj4OAjVCt6lrVB3/Q5uvLrvlGnPKga
         VlJRuVrsikExEg+1nq056JY1ddeDXikXODP3dgk4gRsu4R/rvaPqgyUacHvMY7z6sKFz
         mGlC43drAEgK2y4BPqd7Vl3azCYjGkh+mksm0Qpct2v/iiEQ4PIuLF187hHuy2/ZuWH1
         SwTtVLe+fjmVbSLMp+99H94chYrafUOoUdNoLzYnoYwFdtNT8DVIIPn40tlcBKFIt+84
         IddA==
X-Gm-Message-State: AOJu0YzA8tcz+Jwa8XQy5Yw9EHZflXozJNgh8kiPB2VRDPJfByUsK2CC
	YDcnWLNm0L0Hdp/DC8GSjaSB20B07vWN/t9hoYzO0x3FCHm9jI3c7j63pVOtZiW3WlBKU3Bfu64
	PfEWl
X-Gm-Gg: ASbGncuhj4BfPB531FoW+2yOSn+yUq9n/NYArmtN2ZtXZcir0YOV7ivv/3y2p+De2pT
	KlYcl7LEhXa0csBgEgcI7MUmLYg/I0+c8NyeSHWXPjQcdhTDDhgTh4kxPXqtgrhNe4/v8u4iXSq
	B+KX3UKicd9u81Fs1Io0no+3Dr0UvvTKaC8T6CNQKNmX4eqDFAi1uHa6qfNkTX665m+9ZbDX72O
	749+6jy8DMpdTpg5hALHjXagWCyHC5la4wbhi2VMVCMx8bHql6BPpCWsyPN5aaexRygkFeJL3mI
	iIJZfqPi0H7WMcr9wPCwMZ7i+9cjr3eLmnebUIzJ1CsF
X-Google-Smtp-Source: AGHT+IET05zvHkOV63pi/1VD2x0QeOMR2pHpNGp+mVy7MBqburyggfJ9YRtAFd2QdvfCP5pxswOGuQ==
X-Received: by 2002:a5d:64c7:0:b0:3a3:64c2:2a8b with SMTP id ffacd0b85a97d-3a364c22c3emr8563184f8f.49.1747653048157;
        Mon, 19 May 2025 04:10:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm12290575f8f.75.2025.05.19.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:10:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:10:43 +0200
Subject: [PATCH 3/3] gpiolib: remove unneeded #ifdef
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-irq-kconfig-fixes-v1-3-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yYiPlBaEHgEo7p4NSvYYs0UMewOB0XRMzl6SDZKp+LU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoKxG0mpnlCt3t57MVRfjNXbYcrzSdyQfNrDru8
 jIJmXElMemJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaCsRtAAKCRARpy6gFHHX
 cm/IEADdNNMCXARXJYttQUnS8MXlhS9SgrmBBMyuZTYTrU1Q16XIAqRc2ioQTgjiY6Q09VklP7E
 aji4xP1K0+b2UF9ZRYndiNI/drl8LE6FK8+YC/n+LdDY3o7gAUsPfGeLu77J/kk2zk4pTtzHOnJ
 DXraoRRo2jRCu6HsUHUECatSUIVmhM1yJ7Bnoc06APYY4zxROoieJsCrx4by6oOX2JMmSuaaxWG
 IBSUtDQxL/24kT5eNXvRFQ7VrNN+VUm4icTkbMdR8UdpVEeubFMPUz22ygOw5jG1zPoUoG5ptl3
 uTbqkdqbJFKnFSxrVuSIBsAcBgRn2mmkdcwRMMu5mFzo192tChCnAHsxkPrHVDl+rbvNyO50WYt
 Pa3VwSOlfjLYr9zBf+F08+q86s4tv/XYL0BsxHEM53NV30NTanBE665xgg+xaUdHTwoIuMNBzVE
 drrLEVaV2EqYJzismo9908xXk9hNwGFUCfG9cz9Jb4UMb3yLW2m+FRKV6RAigYrVrGPrgtT0ybz
 FTQYzQkfnHeLbhTuKW0u25LYUErmwFwWGR+LaJgTr3LG3Eunhtcm6KxZWFo0iA8WF+NllOzNoxm
 ofy81ZpP65OSKstvG818mlXhrALZovdsH1aL9DqK/GxFp8cF+FsG6AE+J0aXwMhSrjOJi/AxO3F
 fwpcJBMTrpq7dOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We are already within another `#ifdef CONFIG_GPIOLIB_IRQCHIP` in
gpiochip_to_irq() so there's no need for another guard. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c787c9310e85af4c22ffc9bb8e791931fd056c89..e4d4c8507ff9e9ad3e02f8a985300fa1e1056dc6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1888,7 +1888,6 @@ static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct irq_domain *domain = gc->irq.domain;
 
-#ifdef CONFIG_GPIOLIB_IRQCHIP
 	/*
 	 * Avoid race condition with other code, which tries to lookup
 	 * an IRQ before the irqchip has been properly registered,
@@ -1896,7 +1895,6 @@ static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 	 */
 	if (!gc->irq.initialized)
 		return -EPROBE_DEFER;
-#endif
 
 	if (!gpiochip_irqchip_irq_valid(gc, offset))
 		return -ENXIO;

-- 
2.48.1


