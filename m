Return-Path: <linux-gpio+bounces-16902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE1A4B999
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76CA53A8850
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FFE1EF393;
	Mon,  3 Mar 2025 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KewAEEBl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889C41EB1BF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991308; cv=none; b=p8065E8m66LK12Pt09kSTrLMVoP92TiLucVO6yjfiyUZfBSEuaf6wCAJXZ10Hekx0Q9IlWft4HVjN2h56FIuqplSpUOmTurXpX+4REy10v7J2alRiDmbFpC2mcSulodp1vb94iIeoy/W1ZK7E+gbM2Aj4mGKczTlwbbRdzES78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991308; c=relaxed/simple;
	bh=6JNx0BB+Ksp62N8jJzh1xiCfoZC0GtwmJruh6iVryAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iia24LRYawyqcnncSzjxPLl85NX+mdiWYZ5PokqOuwgA5SWs3603zHhh3zT04ZXn0c11orQ56BMi0vPtH0S0s/++RxJNZGUvyF7DsM1bqC3MJGowADvgj0lBwZTF/7SYKmNGWOaiwttqQQ5Bo4LrIavdCRBnEC6eSDY+glLH6BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KewAEEBl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30930b0b420so34749231fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991305; x=1741596105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=;
        b=KewAEEBlGbVkSfph2mLtXA9JaENPAIUXe9ZdSNORvX73kUpo9fEFfq1zGdW8crwRIb
         +5YpExCppVdhg2+GpI2MmgsweH3InJuSrN5ksKpMTwNSr85PPpN+wY4ZcFZEfRAl89+P
         xLNaquJSq/k+Buu8Z04Idddwh8uAJHfvB5IxJKC+kO9lje2OZbRsewjhH6Nalr239U6f
         VtreFATAJRrZvJzSCw9kgFHSKr3YlRo206KlK+CcnXYUpKjOFj5Z+giCuhL9CiJnF+HE
         QwG4ktTggtvkqzwvkYiO/Ka6WKqGdH9tGYHQgA2yEZQsgLj9P6CUO2TcNPaCvVggL0W0
         I36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991305; x=1741596105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=;
        b=sxP+ZUsQhbxS3BOACCyQgDOsgBFB4YCLTzdjHyzHyWk5amZRZwWYgpeCUCjchxc76+
         Moh64N78v7iOAxKVAQ7M5hespHdP12IprSj1TUlX2TykeED2fOGELn8RN2zJq0JxinLj
         BT8kzv/xaSW7Xntz/KGNn4LXuBSQAtkr1AV0/SDxmO697cBgAuDhC6yTXd3RRrbJOzpb
         lAmWNftjE26Ca+r5/aUxesNewfVSgMKASYhHoTj6EBz8SEOiLMzavyVWXW4/xb+akN2e
         xZ9G3FXxpLmD/lgmeSpn7cpp0Qb3mBrydlQOPpzeyd1AnGNorSxZg2O6JCA1VCVNIEbV
         22QA==
X-Forwarded-Encrypted: i=1; AJvYcCX5r/tCobP1wIH7KhzWeJode2Ci+wfFVUqCQ2f9QxwRhOZukfaEhz1t0zv5dwhqF1EJRw5hBYUXLrOP@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5/NnHOtFBN3rHkAtO6TNlaNsZhdEWfEuaC2GaV5VxsD0r3n/
	J5ljO6NS+dAODvlrp6JCTKsfeUangT11zT30FU4vp+Bgcu3ukKbbih66sV4gO0E=
X-Gm-Gg: ASbGncuy2DMaHddr45pcbZXmEUR5jlmJQDaaYk/HU2X+XMf4S6RXh83gmSFgtbDIEIW
	JbJ3m4jnugcKJ024aCCqt/PSJvmEE8ne7Pg8udxYKKRBSVU5+cX+SmP+UVNIDxhTLewl5dxapk7
	cUcXOCYsglgjBsVpo8UPIP5vOmP5rXD2g8vhH/KUxLI9mO5qMSp1IusImHd5Pouu/g6VkXPto+j
	QRSpufGSK+pIk0+DQb33gv1IJGnaL3zRnaerqeMfklXaZmjYPkJyX9cl4UvCaC+Z5S0P6qXK2iw
	zPIERUAoHsyFbUOIiL+5y0Yucu0qypLDGu7LnuiZWom6Yu2depic5FY=
X-Google-Smtp-Source: AGHT+IEf+WBH4U7D1mLtWBRggy3cAAJWEZH/7SBq/nZSNOR1wS6qXstBv+1295UUt712TMSOJEx8AQ==
X-Received: by 2002:a05:651c:400f:b0:306:124c:69d5 with SMTP id 38308e7fff4ca-30b9345fd1fmr33846181fa.34.1740991304639;
        Mon, 03 Mar 2025 00:41:44 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:42 +0100
Subject: [PATCH 2/6] ASoC: samsung: littlemill: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/littlemill.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ffdf499a3eeadfbaa 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8994.h"

-- 
2.48.1


