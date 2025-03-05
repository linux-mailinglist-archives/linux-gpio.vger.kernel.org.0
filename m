Return-Path: <linux-gpio+bounces-17083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891AA4F803
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEBFC3AA26B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8804C1EDA30;
	Wed,  5 Mar 2025 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7vL+USH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D681C84BB
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160360; cv=none; b=F3rl7YxPdBrVdg+f3npuvLHi7+GDORoTT8SZPDF9Del21oeAMwaXzRPqPKXGYXQlaAf7YkgIS45AUgmQkHIr13SSA2z7bVcli0H5tBFsmIzWElzBKUE8LFTeEgqTa2nxm/CjDGKc9GdjVSy1aV3CrFErR6uOCtdoF7U0WikiyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160360; c=relaxed/simple;
	bh=DT9lmpA7KZjLSFTViglUBV0sYd/LKVM61HJ8c5dl6nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHny+Ca6mY8YeHwd+YVgm2FapT0wSTHAudWkon7r3x8mtqE5vyHF8YOs/w8kuWWqcLptDj/KDVnV2/2GaF5xi/lPfw7/1c9S+7BHV0d+CQZrxf2Pn6A2sq5oIThUOfbjpTrhr+oVaQj8xDyZ8h46IR6eztiiDpBDsW0JveQat+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7vL+USH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bb75492e4so30669201fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160356; x=1741765156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=;
        b=C7vL+USHKmd384VFO0abH8XsHw3t7qjNP64CX9rvlhoWJEIuYBw6Hj2mF1M6XjF9ys
         iGC1ilyy3LWkOPJh/gyGXEeWfpHo4deBhiLCulQu/tpBhxVfYfkyn+SPkykMdItCC4xq
         1SB1F3lEqClBZv8Lt7iBCLSwBqXKzk4tjiecr/uAQz+Th3Ysfs2E3GFJkp0qRG8udb75
         R1cCOjZGG43fPeI9rxWhghJ1n+cDAoCyhd6Jf/KBQrWLcLwGWzw54NbMDNIxBrCkp/Tc
         S6yPCzjxrR6hRRXCrkaJxP7ssRI6Kr/nNo/f/XeJ73WosHvCm7ypJNxGwuKtr6Mfl7Qq
         09Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160356; x=1741765156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=;
        b=uNMv7+F6I86Y/bjUUtTa0w5d7gChdq+tDOFJ17R/siNZBA/XUHqlWFaEKVooBKpYs5
         0/47IWXZXXNvaJGibx+JAvstz0cy80PzHdJwzY8tdfw2rKNXwCgv79kQWf97busEtAxp
         PAIqSD9BK3AQmemIqX0Ooy3+HxLOC1+91Quxz5DKoI/JvE12b93oeqqHtX8jK46tjle6
         GRe4MXWnN815KTX/uPDLmHdD8ri/8opzZz+mvqSL3FGTb5i3KwAepiLC5Qs3/8KKA0al
         m4wa9UymAqrDWlcFJ1FLa+Otj1wKzrXwj1u6ySE+DnMOLDh9MCIb4kk2u3Jb5gb7KLVo
         9lBg==
X-Forwarded-Encrypted: i=1; AJvYcCVITZTJGqh9D4vZET/DJ/sR06pi52RIl3FtNjONF7qWxhV0y0pH/tmyzE/DpOFu0WKIKsOPM/BEnh/m@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSSvrdVsuCAwhbCkBpM9enPIUb10+1kiv1fjOUVAi8y9cx0xw
	kUQrtCm31iMeDD8wl3y1hoifFyndLAk/JB2nhbajS48UkN/hAG33XhvVtbcQIh0=
X-Gm-Gg: ASbGncutrxJgjTeou0OpwUq/5NKar4naRYHhHz1h1XpKA0RJnuYLpzJkNqghssO1FlY
	NKoNIUCDkin7gx9kMp/5UwSC2T0h2PoiVMNwbpoGhLLFKrO9Hu61dhT63v6MM9Dctz+rrHsMXXK
	yo6fto9bWK+m3flj5ixjtbko0TSkf02oAHzwOrkR0UIr0Y06Dc7EV7Ib8vVuXNFuw3+StoRKJ1e
	4oBAplUiIaxdmYJgtEcLMD1Z0nCHM79m6cu69QwlrFP1dTv69f3qBGL8sxhHLL6zDAEWUHgdK65
	rhagDfCn+KKM+dMHxe+KQqWawNZzmgEpTgXGYhfMqLNg83r8OKoaE28=
X-Google-Smtp-Source: AGHT+IHPSQp1sMr7Rrf/l9lcn+EQseF/Qe+jZ3cFqBGhxMioF6AUDMWmKnx6hoowTamZYf5w+OgQoA==
X-Received: by 2002:a05:651c:508:b0:30a:4428:dead with SMTP id 38308e7fff4ca-30bd7af5f94mr8944781fa.27.1741160356428;
        Tue, 04 Mar 2025 23:39:16 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:13 +0100
Subject: [PATCH v2 1/6] ASoC: samsung: bells: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-1-20bc980c6445@linaro.org>
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
 sound/soc/samsung/bells.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b0746af07a5fff040fa 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5102.h"

-- 
2.48.1


