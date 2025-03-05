Return-Path: <linux-gpio+bounces-17088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B683A4F807
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A50F188A7DD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177B91F4188;
	Wed,  5 Mar 2025 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ol0Jotkt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C971EEA5D
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160365; cv=none; b=DQ6CRNBpTU7/y15jzt8jtHtrXk0FEf0uL21MjB0Isg9jDycPUddarzuBYsOIKyC1GiJ3SZhuCaHeUXAoO2AjamTJ9yNrpq35r8Cr2wADE3fM+H3ujcAgb73QdCP5ueH6KPhSG1u2BnKWhD5VN/SqU4w/MykdpWQOO7QW4TfWypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160365; c=relaxed/simple;
	bh=ewfArlmqqehACvR+E/gMTUfZuilJnoCWWDdT+IMsluA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMiTpkTWo7DRweYefyxHXCR4yRibXX0vV9e3nhGquCwod48+PFADoeIC5LpTvAN5pN+Vdpxw1AECEGQncApcnSMjuX0JTVxv1X7QjVYdOmux/yJBwXJN9eO2TCoPXO80KCkHhisu3jV95ovMYMjCepCzBrxVYfsCI3nR6VyUbo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ol0Jotkt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so442253e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160362; x=1741765162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=;
        b=ol0Jotktgxsd8WCPRshqhWCfvRWGLBZFqVuFrlHNAJtewYdrlOcXb8hJcl0Y2PjIJk
         ckpZIAIm3gOu7VmtOp7qeYQAQmjZKEcXmppSiUMh5UYKBfnNqE0svy0dry7d1wDJM4zS
         HUN4b6DRO/ZFlXgG28YrQj3Yqhk9cjSYaQwRnBkRNRhNxyPUFMK/wB2eBIBsfmqlRdWj
         MVFm+0+DGaKhM1artB5UFvDyIJsnQhNl+GB71aEtc9choG3N5etBDPMtjaziwievkTRW
         otItmPQwB/loF+byn67vFk0STHM2PxNTyn7AdHDkM8ak3j0jfmx5JDWomyhReve4xRDY
         BcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160362; x=1741765162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=;
        b=skN0rV7wos5yxW84fhlvNKDyX5guab0tSAYSEMWw0h1+ZUOU5rs7Hc4QYY1N3jkUpG
         m3JO6/D7c5L/mpjIhrq0+m09Rnf5OT8LZ1I0Wb3VyrdTCZrbyBQXIHq7z+4NuUj8xwjV
         9tLJVJnFxp+g+LBLoSFrwLSOaReu/wPb0psdusU2BXEWzKdVUgaJNq1wTstkZNCYnV6b
         MTl/2q+DITdrTdiKmRCQit1mKlXEhmufYZMl+auDrR9nXbrSOCSl7gM6iYEyCOYY8imX
         tNUALJH+oT+iQyqS6vK6M2pLgUKNUmqpVKWoA0wSRhSeF44+WcMROstsvkCogu1ryutY
         cqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkoI8MU5o8UX/5Wt6/7GSXHDRE/Pr0FRemMTOxczJ79Z0831iJ7TtCgEJ9vY5yQ7mXEPWkokGBmvkk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4C3x7/ftZSwNq/XBW8dw39jYRdewYGmGR40q/ymrsfYQRMq20
	+f9Jmyjudc+VJSyczdxatE0mZaCi8/xOJIsMnCcL6CxblBfJg4nxUWYsiOrP1/2sXEqocSqGA6D
	3
X-Gm-Gg: ASbGnctkAmfeq8Km/Y6Q4E8YGtY+DhD63oB7QqTrJOBmkBAEJvFXhL4Nvr5a/TD7UhV
	chzs4+qutSLihsuALgf6QTLsU32+hIYEx5sD4z1iofTeWsLVYJftk55VBHeVqZY/KkALee8eik8
	BwH9qbgxVD73ReofDkxCvDKAOypr0VRVttswgt7jcDBX3r1br/FLR5HSzJZc37s+HAzK5TsBvq8
	KolMGV0lrVDom25KWKcPU7z4ln0ZHv0MSnHexuggPpZeDTrdgZeW2cacWjjskwK+VJI32+X5/h1
	+0qjxm58CgI0EQ7aiRl3k79KF9Fr0cHzydxXwDh6tcfKr/WP9jsk5EQ=
X-Google-Smtp-Source: AGHT+IEtLI5nI7Bn3OrfjpaA3Uhj2NQz5pnTloc8Oo+6GBcf8NHxPSUkm7UW17xx2XaVIcFRKTemtQ==
X-Received: by 2002:a05:6512:3ba4:b0:545:981:1bc4 with SMTP id 2adb3069b0e04-5497d3776a0mr644805e87.38.1741160362095;
        Tue, 04 Mar 2025 23:39:22 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:18 +0100
Subject: [PATCH v2 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-6-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45acf9a28720fdde158 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -6,7 +6,6 @@
 //          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.48.1


