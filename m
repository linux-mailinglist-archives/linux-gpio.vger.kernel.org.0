Return-Path: <linux-gpio+bounces-16903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59376A4B99B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43BC3A8D9C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF601EFF92;
	Mon,  3 Mar 2025 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnmdzQQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF118C937
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991309; cv=none; b=nnPdqvkCg4LRTIbofUWdmVggOUFj6qogOh9B1eh58YZdyo/HIZXdXZwcAVIxlGfW8NxUfs9Z+GHpN1yclPVJAaeB684Ovzm5hxW0tLFL+YK+T7aMpkw5FT52USx4S8LWs90gZSvFYQDYzvhtGjgO1rcpsw2Hp1dhpXXTEecIDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991309; c=relaxed/simple;
	bh=4vhEEoeMcqqpbYOyn6fRj5QySsM+/GSxGmFJbcdx1QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuREcXaANjhunVq3rMKQ80gnIYbGV3y2Yl/vG7/YlDCr/OMlIPvy0zAK0EEobr2TG7Y7TZ/7DR2/Q7ySdx3G8w7tLEXkqRQGxLTJEHZokY6hY8dH7LyIY9DcZ12FkhFyqd2nI7xqj+e6i4v8SpjI/Ynq6+b/pgOu/RWtDeIweCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnmdzQQh; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30ba92c846eso15199481fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991306; x=1741596106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=;
        b=ZnmdzQQhoOhwmH/k8vfx1e+CChGOcKlaFrL0/nR3wY4yuuaVc8OPBZczjVfr/0g1Fh
         PSeJhMzMeB7ghtyEGndCb+bNF3oJXlO06pxdHNm5ECrATq9c3XbYzExIvajhsCByPkTY
         b4pdJBzfZyBgAhR+UqslqF1I9rmWBV9t3OphJFu7cKBny/RC0jtomtobTuAvfc3vgOiR
         osCHSw0F2cELp56+yAXHu0wJCklpx4W9Z/It1eOZagLS+M6E7BkHKFaQnC99U5q/6G8i
         u4XkModtQDxnxpYotyl6/Y50RCzzWGEhD4+gDNvprbUrJaK+XDt+Gfg740PixGWHaCf/
         Kh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991306; x=1741596106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=;
        b=RI36CT0VpSglOUFNpmUw/spdXvT4QF6mIEU06eIMyzcwqYdKQsfOELtAxFRoyDkgY+
         GL9dXmh/JCc9SZD1M7Dh7KeB3q4IFHPw5wv5Yk1Kqp43FXjXBU/5EnowfqMPfR3YYgqW
         zD0eB9Esa9X/CIrGm6hIRAugr0TGm8sC2CbvQ9X69a1n6cvXjsUeBfRIoiGhfAWEDL6d
         nB6uoJaE18nzse9iyql4R9RrVgJp8Zn8ieUy7bUJMmwGxqfK20x+4WBRNOkJozIh6+fj
         gm3vfHB+m/8qTUHdImM/tqQon5GCrpbXov/Ur0Gfn6OPh/dJm24plZ+TBTFAl6bW2sZr
         bVXg==
X-Forwarded-Encrypted: i=1; AJvYcCVcBUK3khRXLr7640Z5wcjINXLnxYv5Bc9djrOOxc64Zj7ppUTKnuee1diZhrbIqQDfzo3VknBpt94j@vger.kernel.org
X-Gm-Message-State: AOJu0YwKHHZ8hDrkp/iMkUswfHtkpD0zlhWakr0E3x3ZH+k0fBYe5xqN
	JdbjSgN7idZQaM2GgQo7W/u2bDlK4JdYxVpW1SWtxTWSOoeHwN0N6MDglQa7B/o=
X-Gm-Gg: ASbGncv/VvZ6NNAdhog4BLco9eg9fySrAfFzw7uasrvrVIQXXWXyCYyRG/E3SBBUG7J
	geRG3L1wn51mhTn8i44mtltZEsOIVlqbVCLKd1OxJ3kcEZZn6ee0vWl0AmOazj5T4N9+FZMlkC6
	F5UZr8+7yRyvc7TXhz5Pycj9ycqNm5LgeANuAoNi18w0bhTPRiBtDSBEPY6Njt1imWvc6vguA4T
	9GJSludgEz018TiTBjumKVztqP6vQRDm1HRYG850AHKfFip8/pD/YHvZ948SaQ1KVE0dKdnyaeH
	Kpg3v147g+XAGdcUXlYiGWYwloQ3Og7RaEyRFVoymOJ6UsLYmW0Rs/E=
X-Google-Smtp-Source: AGHT+IE7d1s8wsnrWzBD67JSiku6358hpjkfkoPXJoyaB/3LYLJ1ZI/ks6pTUv6jycEvlm+SBkMXxA==
X-Received: by 2002:a05:651c:b29:b0:30b:bf4e:f6fa with SMTP id 38308e7fff4ca-30bbf4ef932mr8626391fa.17.1740991306166;
        Mon, 03 Mar 2025 00:41:46 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:43 +0100
Subject: [PATCH 3/6] ASoC: samsung: lowland: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
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
 sound/soc/samsung/lowland.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d850197f8b9eac50d7120 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5100.h"

-- 
2.48.1


