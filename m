Return-Path: <linux-gpio+bounces-17087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8CA4F805
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E6C188A7FD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286601F419E;
	Wed,  5 Mar 2025 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgxWM+sD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C11F4179
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160364; cv=none; b=QFYmY4an+xVH0qGcUQ9tRQo288fmse1SKChAXzTuMHCr5PjXUd/Tp47PtxcjKnsysnfEaDmZ3jIgFc2P+CAhjoFAlOoxdGRd2X7jXWzjMK1BtOTQpj3Mq2SlE/myV8OSUSp/Vx8MW1v53D/GFUtwW7XzzV5ogj20xPD4KcfdjMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160364; c=relaxed/simple;
	bh=FPsods1okZg+2n7K+5gdrPCN8BRbmue2zxfh3ZvNi1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUIpL5NTbDuHh6e0SXgKDlcC55fEkMOoOA3xQEHgatD+XNTCaP8mwsImTizhjoXpLr2xhDxj5ADwpxh3Z5Gshe/j7IH8AWN1DcgyJP4TzvB8ptKFFL7p0YGC1yXnzjQtQ/R6YS/9kjdXX/V4DWsmwvTGvII5lmoqiOtqLJ/6H5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgxWM+sD; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bab0ad5a8so35605521fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160361; x=1741765161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=;
        b=VgxWM+sDsDwsJnNDnGExVEdpXMDcd6389U1FynNVaamph3p1LmBr8igzB3mvFYwzkq
         dfg9UMZdMfHIg+run73ptoNtMeOXaCTrEh+bGM7Xo65Tm692Q4s+NrTyiDoCJ6qNSenh
         dqRud9nPW445OwCJLRQr3Rn9lTa22qpdYxeSvDI4CmfqlTmjaOhcj8DDUr1HUWXhzrB3
         c9O1W+T9zipFMUOY9UjvtRY/70HgsFm4YfcBkGojbwHZA6N8G1YBwMBNRU5dkCZ2KLex
         pPzRHSsG6vLp+c+N0mrlFm5Z5dMpfZxi7YNVkEFo8jKtHVvKAVMVrWvwDX7waxVg+Bo2
         8D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160361; x=1741765161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=;
        b=cuA+lJ9BpWgGzRjpzeXgaKcguQOsZET6W3gE4BPp6Ho1PRmGVIwWitSKeVPEhE9oYc
         uNfY5xbFTPSSRBsF/Ci3s80+THLABn+rZpBeFYAaqBWpAGt5is8SJFKXSmEPsZbHxG65
         8zBTam9qp0o65lha59mGjKLJiIF0BzGrIHGUb0dhsrAWOMCKnnxqq4PKc+cI0bbsp1FW
         itsmQYTK/ZelQyRCwm9XH7BQZRnDzPyiSYghPgcooQyxYXsyrz9Sb1rr1Va09zYzuSyd
         3LBHcyhafbhDDci5mno+hrKtxwDx6281hDanqkq8RrpTmy4UHHi7JFipJLgcbUId9du2
         94rw==
X-Forwarded-Encrypted: i=1; AJvYcCUjZotTI6fs+QD+EhhWsIETaRuuoQ5Sd3c/Csd/rM6AbgENjA8ldniiH8XNPBMkL58SFeKQVPOcVpWi@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNWo9p1xrD6P5uDbihpH7DvLszxACPeAi449GJpDF7KZqmObx
	IEEgY4VJMIeWAhmGpoEF6Dx8o+Cu7KpV4fy7vNvakw8IRdvwq82OC0jPgInEt1Q=
X-Gm-Gg: ASbGnctnOLMXfmo4vJIUvHL9LE4MyjEDDAFFeAH2CnuPzjqIwi5+wLdqpKHwTf2kopT
	3AAp0PV6kDT/CGFpliiAsWjsRu3OnA3DU1L5EXcIyqfKTGN4HKNEVKENOJQ91aU87TtQwA5E6GQ
	y43aMt7UQB5LREkzNTJaqFUrnbt7XlBQZHtBAMf4Tf/+O+yhNGX5A1Ad0YUufUXAcRVuv3TbzgH
	tpprAUar4U9qR04aJ2FUwXDLqNTti5j5m7nLTQZgwilIEqxiTorsJxaSznEcuCyQKB+AynfeymN
	iGL/agYvDaIbmyGWOqaUoXgrhDXXpjhf5eEi+dXHuIlMX3bX53/xVWQ=
X-Google-Smtp-Source: AGHT+IFuOFGm7cWUgm1XubEB6Y5DzlSM0d1dNuDSjZteOLgYTKgJYxkyoZBk7U8n5a+V22Y4944yLg==
X-Received: by 2002:a2e:b888:0:b0:30b:cd68:b6c4 with SMTP id 38308e7fff4ca-30bd7a4f493mr8310471fa.13.1741160361110;
        Tue, 04 Mar 2025 23:39:21 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:17 +0100
Subject: [PATCH v2 5/6] ASoC: samsung: tobermory: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-5-20bc980c6445@linaro.org>
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
 sound/soc/samsung/tobermory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 2bdd81bf821a5b9bdc56479bb2cd5d0089fab339..bc2608dbaddc4feeb9af77639699fed89540b44b 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8962.h"

-- 
2.48.1


