Return-Path: <linux-gpio+bounces-18431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F00A7F61E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC9E17DFEA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1AE263C74;
	Tue,  8 Apr 2025 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JNH6rl3w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E7263899
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096880; cv=none; b=tJ3GYDvoohwHT75aJh4psVTXa0gQEFIQv1QoTY/yrFowx0K3c8QHZpLdBKTRlroelhMM1xVBBF/Du8YP0mSmw3vQTfiB8loS44gbyvXRMcKW3DEcalPYJhjPe16Q3XLS7s9b4OIRGfPqyPJZIzi6hQXPRen24s+nChjsNvoYfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096880; c=relaxed/simple;
	bh=ExeqpQJOlBzFpXFbPqDRMvjXumW+0LAUpb+LYyPognM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLzz3qlmGOBVNmIC+YqE9Ym8eZyVZNhicFKCiwutcqJ8JlY04yDPOaWSWrc/D3s0lrtbEzyLrRsf3XFE1n4jYRYlpKBSuCxLTrqp8I7OUE7Mni2RZGNnblMUr2vyXAek46N7kLSxNtjPTKcNP4xOfxUIrjBLvctuPZjad2y643s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JNH6rl3w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so32327895e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096877; x=1744701677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0cSllrBnTQSAVrux+ZYY4miSWlQmvTzHbS9nTbIcjU=;
        b=JNH6rl3wpXBzqJuRUubAYjikI/sm9g6SS/hAVsu95KrCDbi3kR+2dfoD+Lu9Dij6Dn
         pfLChDRvCd06mEvUalceCd+OTgaNwY3J/U1t4CxL3MTUOY9q5eRINszhUeSOGdSNqEq6
         45IKKIXNZEdQRdDLv86/rPmIcumPSGwXkB2YQf2m4OAF2+4NAzWiurzLHm6Q8lsm5eiK
         sHx03WruXnpXjMpP0S5og/JQa91HA1N+O+8dsEvukNUIy+zy6wpy2OfAvPUf21RFgH+O
         Krgx7zrHiOcJvhMS8N+fJSsYBz42nv2fXzI1LC57QGNxvdz3mHgQ6QORodhPdQ5JNK4z
         +t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096877; x=1744701677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0cSllrBnTQSAVrux+ZYY4miSWlQmvTzHbS9nTbIcjU=;
        b=l2MVD85pvHulI2a1MVOGTYotH6lTmiMvYiz/5+DnuaysKrEcyiuQoReJ+Z3EAeOtMz
         m+7D8vOqLM1dW6bz1Cr7x9gc13CKa7XdNGs7esVVkHQQZ/Fg+lh0FfJEeYlz+J2X3p3w
         GkgrM8zrJ7FjCPqmSjxlOl/DhLuSIM3DVy6UPRDoSHifLF+Tdx4J1t+7CQ6tNz/6koMB
         sM5sMvCUmcetNjdLLjUIy/a/FtSP8lJPNpFtNmPfzUmk6aHMJhuWsThUBb2xYm/dG9cW
         y4EPkkZ+DcNTfsRhy3FY17KpKCynMRB+hspq4f8cs4W7Hg2sPA9bYp2g/HhNf+332/nZ
         YQLg==
X-Forwarded-Encrypted: i=1; AJvYcCWzN00eJuxD8JvOqCVGsKgWmPpQQV3cuhqgaTPpVqkVxkTrv11bVdMj/Pvn81arCcfufuCfJmZc0Eqr@vger.kernel.org
X-Gm-Message-State: AOJu0YxauhDRLyTRPWSlbS7HsrpmsAAEWEw0EFq+DFCp6+uwJOsfXV4n
	rBYgjoBtOjtVyVMfzds9BKEMEd0UCsQEX+Tdf3dTzBuqtC534zGuyo78obaLXto=
X-Gm-Gg: ASbGncsUOw6gcCabwN1CMn+C5ezHgP6ZVFaLkY2nESyKmIs7Ae9TSRpCIErVqqa0HAu
	CTI+YA44reToTjIMcnxGyjmPmn/dJOIGPNLOSB3tQrvuf1S8nRF9vUgDkBVQvWYBJJX+6XrdYvr
	psaNwYcsSh0jTz8Rc7qgo0fbAilJ8fGRIKwOL5y6kh7OWmICcp9hHYd131luBsShFAUm39+FYio
	TLh3wS7U7RIEpsSVjdMBgq0EBU8kQdtGHkcklwh+Frv+1b/7qwAAcO6Vrw6wVxVGT3MFf4Mz5B2
	I0nNrmYBepW8mbXBuBtqQbdJKWFuUqmtmKC0EA==
X-Google-Smtp-Source: AGHT+IHxFkxaFTSuHg6XALBk3AAm7ho5zuZR9ashDUFieaG7O18TykGWwZO57XfJMNPuLDY705cc5A==
X-Received: by 2002:a05:600c:350b:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43ed0d6b07cmr111746535e9.20.1744096876732;
        Tue, 08 Apr 2025 00:21:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:12 +0200
Subject: [PATCH 4/5] powerpc: 52xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-4-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bkSnAWn1tiNFi+Tzj5ivTeMtlGuzsIZFtgns6Zf14Mg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5nMXBRd9uglf1v9JiIXSvv4QhJX+qgqtx4m
 oLBvLI77c6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZwAKCRARpy6gFHHX
 crylEADOeJxsWbM8Qlpy6KWQ5pDNGZ3Sy1k7KSHEPtibqX4pDvTT+rvmj+q5af7AgQhGAUKw60n
 LoN2ym6kJ2RXpauVosz5GOIuD6As//tXeflYzn4L4q7tSQ1ZA6iCGZbGotMwSu8NwBHyXTh7iGw
 p8nDWS/nYvlDuiCHYxbe2WCCbgybgMj3XcjObVtwCetpjsE+CoTEj3zOrqTngJegY0UbSin12eq
 HVwyU7f+GzY8meh7nWc0FgPtjEShmVm8VVoumvIt/q2ZxUFoHRFLJEGd9MfiGlbKxV1T+bg8nbD
 9YWAAOGffBxFue29AEjZ0S0Ciw/B1mdJZ6/1E+gGLsmkOv5QL/olUtd3VKu0KHupILfFpI7ShzA
 DY3Z8pr4rM0WucQgr3md7/4ypm8sDejAmXmQxYioeJBqzn5ZGltf27cA2fKUUv85ErtlArU70dc
 JZVpZGrzOGFpjN7DkjE7ooUKnLrJOdnupdTN9vttPO4e2wmkOrxUci/Uz3v/bFK9oK68mRF9TxY
 V9Vx9GoLXc/b328iPklYO+jI3w94HroEu9u1NozvlDnMhdQ84NGOqO0s/pP18LzdQYUofYogx7u
 ysTM4W+pb8qN2owxenJroMDNUulxqeU/BQIJSEUv9vrmVSjZlU0jRwFaf/GsJpgZeEIR3RpQf/l
 49lOQDFjVUPv1kw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 1ea591ec6083..c96af6b0eab4 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -280,7 +280,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return (in_be32(&gpt->regs->status) >> 8) & 1;
 }
 
-static void
+static int
 mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 {
 	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
@@ -293,6 +293,8 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 	raw_spin_lock_irqsave(&gpt->lock, flags);
 	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_GPIO_MASK, r);
 	raw_spin_unlock_irqrestore(&gpt->lock, flags);
+
+	return 0;
 }
 
 static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -334,7 +336,7 @@ static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
 	gpt->gc.direction_input  = mpc52xx_gpt_gpio_dir_in;
 	gpt->gc.direction_output = mpc52xx_gpt_gpio_dir_out;
 	gpt->gc.get = mpc52xx_gpt_gpio_get;
-	gpt->gc.set = mpc52xx_gpt_gpio_set;
+	gpt->gc.set_rv = mpc52xx_gpt_gpio_set;
 	gpt->gc.base = -1;
 	gpt->gc.parent = gpt->dev;
 

-- 
2.45.2


