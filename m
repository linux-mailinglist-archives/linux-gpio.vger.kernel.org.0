Return-Path: <linux-gpio+bounces-12650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46039BF8E2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 23:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18498B228FE
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 22:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150BB20D4F1;
	Wed,  6 Nov 2024 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv2OjaGf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B64020CCFF;
	Wed,  6 Nov 2024 22:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930741; cv=none; b=lNf3X35QLFZdi1+DydN4HJa6GXuApuajn6YeIKmCmnxsB5vtn8SZ3NxsWcN/DXgm1ROSSvkhR5XFFykrQ1YWRcC5l7vm1to1DV2TouBtH5DnK5vGb+E6TjmnRkPkSbXOVbpRyb9Oq0FCVcslMRQi3t/8f1NqvEp7UEuZFmnjJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930741; c=relaxed/simple;
	bh=oY8Y2FrGBH8KQICCKj314nalJMZPuXPc6PykZh8Vt1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT/D9CkZ/LUaZxrTL1wu5D/giBcKJ5ZNqjZJ5ARdw1fTdW462hFCmbKjyCCo/re60amkAVLmojelKgBP80pyKNt6b7I+baVRaGwLxe7lV76DCj9UxcJLnw9zb4cmmidb8ZZcOmSZDOVIrcCPoVKGua5wfynPkCskQ+TwBGCVWxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv2OjaGf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431616c23b5so2109795e9.0;
        Wed, 06 Nov 2024 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930737; x=1731535537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEXdF7FgDobr4S8P4fiJnbBjvEddi/g16he1qCtIfY4=;
        b=Jv2OjaGfmnD7VBPqbvx+M/oJmy+9/B2BH7hIem6OHqxtTWnaC5ju2Aotfx1QXKU+qq
         UvnKyF/qFJesrttk94vOat1t68pPtbU4mZa72po2Lko19+zCFMLV5NTTsFHR9uMhArMx
         uqP/ISIUle19i5WK1G3rAFHQ4b6ivBo8cdx3yWQ5+tyQ4wCbYy8vUcOd/IrPz1w2Oevm
         r5Oy2jeVbLlpen+zM2Sra9KX0hFpqXn4qsIqi0wjvTf6Bvz90yMdIoQY2jPPf6ouexPO
         QWRxzLbgaP2Yq4ZESsDNZr+9N2jPNuZiA/lOqI7pwrrf1eV2H5nqM6YGFlOkm3VM42MF
         rDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930737; x=1731535537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEXdF7FgDobr4S8P4fiJnbBjvEddi/g16he1qCtIfY4=;
        b=jD7uq/gbiMY7A98FkkrdHkHTLDVmwr33YJxkoG/WFvBLfb7kypt9RarRndWkcvNzXD
         Tk0NIJ3WBtOOYnhyxVBIlNENpXazi5P8q4rb4tCwzyuIYxZsYlrVKA6bc0zCErW3eCSr
         dlGeQ3vAweq1XbL1RXb90oPvNDBpt8qoz2C9VeroSqPlM2sAvvBj8d5XyLS5fltooOBA
         CnoX/aiNi4oJoKIqKir7cmfJhx1Whaf1eTxCuIxcDGmowf432bcKEAqlsEXF4i59zHdi
         XOLMVs07N1jX33pQkhdSIRmxZ1u/E65k2yTMvhy9uT4nr6CvYW3pEQyhv3mo1/6aJyYl
         WE+A==
X-Forwarded-Encrypted: i=1; AJvYcCV+iEBYk1VloIWyVVqI4L5w2yXprG6LtIqBymUOQV3+dRLP2h/hHIvscw/sTrWI0dmNfoaUCUPsw7IXNTWxj1DmJ0A=@vger.kernel.org, AJvYcCVDUzvo8QxVz04gzTolf+Rx38OiQf2s8RaCUVdbUCp/n3EIh4GeGPCz4UV6wP50DsLmppQPdIP1@vger.kernel.org, AJvYcCVQr7FOmjHfIgpu6vWJdPIVbm5HPLfyrvwvVwSs2QVqYisFtLqrjm1LdblMhwUFMBojPYhX6kuqImY4Z+ex@vger.kernel.org, AJvYcCW1/R9axqCGXofDYg/OiRpkht+eQdBMn4w3CIgtWTO6CusOa6pAFUwOWJ7b8iJrnKFN763SwEhlX34m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf4QezSw+ORHo9laNFzLhmv4bAiJ5PM7QqQURGKb2jVv8dvq1e
	7aPGc+EgcuIGTE20r7qLHKAxkJPQ2y3GLZPEls08s2xfBJOqw2TquBPYIQ==
X-Google-Smtp-Source: AGHT+IEDrfx1of1AMxp+HK64trdwGdT2xN20fbWPf6OXOXnfs1FmyB2Agr58LJjAT8gJWmF3VJmIyg==
X-Received: by 2002:a05:600c:4704:b0:432:7c30:abf3 with SMTP id 5b1f17b1804b1-432af3239camr6500915e9.7.1730930736603;
        Wed, 06 Nov 2024 14:05:36 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-20b4-40af-8ae8-9c61.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:20b4:40af:8ae8:9c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm20288493f8f.106.2024.11.06.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:05:36 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 06 Nov 2024 23:04:39 +0100
Subject: [PATCH 1/2] pinctrl: samsung: fix fwnode refcount cleanup if
 platform_get_irq_optional() fails
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-samsung-pinctrl-put-v1-1-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730930732; l=1350;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=oY8Y2FrGBH8KQICCKj314nalJMZPuXPc6PykZh8Vt1U=;
 b=U/E66BB9zFwfVf9lehclFknC50UuSS6b689jx+tQ1wE2/UOsLHRY7qyHAYqNxUflhSm5d6Ezy
 LuLJxM23r14BYZPI1Bezt4jPbCrMxGUQ5ym6t5L/ilC4tqfFmbwRyWR
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Commit 50ebd19e3585 ("pinctrl: samsung: drop pin banks references on
error paths") fixed the pin bank references on the error paths of the
probe function, but there is still an error path where this is not done.

If samsung_pinctrl_get_soc_data() does not fail, the child references
will have acquired, and they will need to be released in the error path
of platform_get_irq_optional(), as it is done in the following error
paths within the probe function.

Replace the direct return in the error path with a goto instruction to
the cleanup function.

Cc: stable@vger.kernel.org
Fixes: ab663789d697 ("pinctrl: samsung: Match pin banks with their device nodes")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index bbedd980ec67..3ab5878b69d1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1272,7 +1272,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq_optional(pdev, 0);
 	if (ret < 0 && ret != -ENXIO)
-		return ret;
+		goto err_put_banks;
 	if (ret > 0)
 		drvdata->irq = ret;
 

-- 
2.43.0


