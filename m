Return-Path: <linux-gpio+bounces-19537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E95AA6D69
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E23C467FA6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 09:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB45246790;
	Fri,  2 May 2025 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="REuEnF2V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A122DF95
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176398; cv=none; b=H/MUH/MpIMins8d/Vp9z8xX27PzGfnL5tSEPtXeAMTH9+F/AgfyZafszNVNST1NIxbw4po8IIgW4FyNWEopvMKJ3TjzTE2VmTPS6fGPQRkErJeytGHVpGxfULSXSq6fYl/aJlTX1D81zA/G0D0fURIyrxjFVJhL4cZPYXpICuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176398; c=relaxed/simple;
	bh=GewjN5JZ5QEnNVyIalTXmzdJfxf0mZMpZbF1p7s74so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEYhSKzD2YNWB3dB/67/SECTYuKx6tVpqwZSzhkxT9QXkIqOLKp7hKV+QeZWZaanAWd00/G2lnagTUlPFe2tlUE3GJoBeG0nW/3foY/wc8lCAGQ45VMOatSyyx4f3UXuOX9XYUA2y8sWV2FqdU4R0Biv2QM5LcuCvkKtAAacz3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=REuEnF2V; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1053730f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176394; x=1746781194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VQVpAhnQOcCRYJ0IuR7EAkGj4zu20WsPxA2gwCBLx8=;
        b=REuEnF2VypvMkvCsuQvZLIVtpwEXX5V0zZeg/7JuTVidAnc88naKfiLWQ+Ie3zPwEt
         a23z7OBwn1bZLdwB5prwjpIE0xwJHsLSz+NriKN1niajVBNvK1Dnb4RB2cTuEfqyMYqd
         zXchpMNyTaipR0qwHaMFXQRrLvsiulEG8ytZ5gE5uRJFfuLmxqlUmjKid6o9QgPHDNwZ
         91+1bjxFX40wqzw4XyRMHjy8R35osChnN0YJ2N1uPlOtf098gcc5SqOCR14bQ7X6Zses
         pOpu6gvbF0GM3Gvy305yloHcTsdYyqOHWlgdQoOV8NQjYe0WqWXPPc6lewoXS/R4dV83
         GpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176394; x=1746781194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VQVpAhnQOcCRYJ0IuR7EAkGj4zu20WsPxA2gwCBLx8=;
        b=g9+g+LjIt+smB9DvhYIKO0s2yvZXDyDOVqR+7vZQH1MQtU0loBOjvievUeu82vu7h8
         WosuZEY/Es11qzsFSnfcDB8n7BgKwe2Ow/iBviDIG3r8099pvRF8D5fnJ2oxQZRHtTzD
         Zm84jMaFN+ZrEJCRoAu8hDXSkOMpbWUA5yMItUR3l0RpFye1DiVunYmI0WJvYPEeBxeQ
         gKDUWK/DB1bcy1NGPjR8bSxW0MaGBdku41aYVqgdWxHS9dNy8kTjeLZzRDTZscECJ3Ye
         bDmt2aQRNS44bA4je3qzA7o7bBH2K8lvivuNAJgYUbSsQe0lyUjfH4IxusMRlAGyX4qy
         C56g==
X-Forwarded-Encrypted: i=1; AJvYcCXw0+/Am6jz6/nW9tj5VurXitn7oeWle1K0iiimTmtHW8LWqix7ZoJE+F2xVGmGH+9r9QzetmQAHA5f@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEu2tGo4Tmabxs85/WZzvnXNODNUDBYYi+jVyJvybrpsUOCib
	qpxWORPY0qvPL+5YZWebXfMA+sdlX3lSvb9ZDSkOxksFMlHIodFS8mETEoxsNnXSc9mvCfPA6SJ
	FmfM=
X-Gm-Gg: ASbGncvAu2YPqXyTr38BCIosmARe1qQJ0anh/YdQR4ugzOmcHXLhhQWfSrS1+2z/ivu
	SWQq1grwopRbSmana+/3WMuDqDl1g/6YRtV2AHG1TqO4y/wudg9JqkI8ZUKuKM0+6SZJJ7Wg3ZD
	qmVYXekNsQ70Vj40f+BzoiPGOs1Pc+4l7NZ7fI3yF30ktkWPjiVsLv0WRlmkm1fjEjZ676OsYne
	1YVTv5SUzmhkprlt+MRhBe+woAIgC3btsSmZlraJhRVc+rTArF/WL/XIi0olowr9dnVVvI/zO7p
	jIkC3xXetUQdcKHbjj6AGLVBI0/72MpvkvTnLbdDa4bErQ==
X-Google-Smtp-Source: AGHT+IHQBxxYw4TPkCVhivNKZQXWIM25Cnsq2fJIJFroZbvmM5OL56pj85WS8b3cNucOQHIYyCOoQw==
X-Received: by 2002:a05:6000:40c9:b0:391:b93:c971 with SMTP id ffacd0b85a97d-3a094058683mr4162100f8f.20.1746176394370;
        Fri, 02 May 2025 01:59:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:49 +0200
Subject: [PATCH v2 3/5] powerpc: 44x/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-3-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=E7Ff3/1EcYz2Nw6QSP2p8LNuROZlM9cH/LUaLu34ItI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFaUc3gwNuye/ggncACVXaJIT/sGhSnQxG1
 k8BocsYj+eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 cuKeEAClIackuAKdOU+yl0nzsAvzc25o+JND+09tQcnbWh3AsifpuV7rlyzUrzurd+n71xUXbBh
 awXQhZPFM03p2pHjU8sSoe03IWWl/P/iUQFGfK3UFx/dFs6zbSSmvCrUQR43C2zLhN8WmBOwGpD
 vOa4MEAW+pXxdy/M2U8w2OQDBYIknSvZr8q+QNpm3v2aTlKJkXmxQ4s1m8HnsYd/KxgQ5lZ/ooB
 RgdkMP1NOrVNSASt0s+QJVYySccm/6xFXSgfhZPF4QN87mFgRnVxEW6ZMOzJ4SENiWPrKxLGmpz
 tQpB+JIWIs5aOa4fuWDe98rfWqUpHnxJ0jWKMmb1rdmjR8R4QYQq3ygwJXhP6HSxJs0om1niN4/
 SrrDwUSyhNNIp4EicjN3o15Sj8wJ6pIbQ5oDNgSiiiQNq8kTSa6apDB9p/SbZPO1IYe7AgjPtUR
 Finp1+Ml4Xqh45uqDF/rpvHaIdjVuAorJXbcNbLRYJ6MW8cPj6se5CVDixKrvgYH+3oC8MDkxAQ
 wHyyy/EMl2ZtLXCot4mdnb8Da5Nn/0zXT8j0syLnFlsgoEASpOqTT1V2/RYp15J+Oc412XmMnrP
 4qvzerCJIicUdBfX65VXU1iM2RR5zud6VbTmAbqQvm7x4RZyH497DL72cGrNKnipgTI3q1iTaxs
 RutDOCWUZ+MhTSQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/44x/gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index e5f2319e5cbe2..d540e261d85aa 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -75,8 +75,7 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->or, GPIO_MASK(gpio));
 }
 
-static void
-ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -88,6 +87,8 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -179,7 +180,7 @@ static int __init ppc4xx_add_gpiochips(void)
 		gc->direction_input = ppc4xx_gpio_dir_in;
 		gc->direction_output = ppc4xx_gpio_dir_out;
 		gc->get = ppc4xx_gpio_get;
-		gc->set = ppc4xx_gpio_set;
+		gc->set_rv = ppc4xx_gpio_set;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
 		if (ret)

-- 
2.45.2


