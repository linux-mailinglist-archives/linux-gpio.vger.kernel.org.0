Return-Path: <linux-gpio+bounces-17085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DCA4F80A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E29607A5B9D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233901F4178;
	Wed,  5 Mar 2025 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKLTZ4pV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CA1DE4EC
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160362; cv=none; b=ATAO25FSVMWW8MRaMfNPNFDoNyzHv+0aJhsAFRfPt8xZH2xOAAf/sZcIOpKKmszWjLnPGVXoRixgNDznvV7pIcliMtu1WoZ/qe5N7rOZmW3dm+f1ecMrpeQxfsms8DP+tNWHmHbEensisZ0r86PDDxl3K8MH2TVVlPxTZ5LxAgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160362; c=relaxed/simple;
	bh=7FxqJsPjZ1UH5r8Irq/KUdbcSb20pe39nWC0xAotRmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvEF74A7ndDbrXaeGECS/Xp+CWSujAoacT62vFfeIR28A7gpeq9U3s0Ekwvdu9cxt8NWX4xa7GNMp2nbpRfyODpbc+qIxW2HxjdeJ1ZiUSjZ4AM/3mQwyoh9/c7G4sj6/qoCpU7SajK+m7hfqoiKnduq8MHj5RnoaAugiLZ8kKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKLTZ4pV; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bae572157so35903451fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160359; x=1741765159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=;
        b=lKLTZ4pVzeZWP7hpaXZAZwWQ8/xHAH3Sitee3ewj2zAOR21F5e1ZilGCAgUFfc2aCy
         oAfoBq5tulSXQ6dP4FKGDSWcievz6uYo7CDZ54fUOAIJjAL8YTblt2/KSQlG3+33bhX9
         BcyNw7rAhR8g84sAr/ehLVIoAQ4hunxr9JG6ib4BMDXZiKpeswYh3+00ZuU/WNqGig0k
         gIDvGQQ1m3u2VOtxTMiI6g8CHX17i1uCepnwqkFuxbLtWp8jkVDJcbcP0H4cf7OfRRqm
         htTTzy6okH+M2sBqf1MlWI9dgfr7CeBAxqltk2+gqqQyTx20OREm4t0pzHhhDeGwiUoq
         Vqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160359; x=1741765159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=;
        b=lwIkGYI9vRrhILD33n/Y4k5Tol/nQz4vpE9wk0ex53zPi2oYU0FcehnOwQVoysIkSq
         /MI2iA7g4u2RN2QmMSYbs5IWTn6gVbOiEkdot8VuLeI3K7iXIOSz71zJldKnIpxJJrrn
         yNu/RdtphpwtHbLEhLSVshSnF95s3SqpKgeZWAgS2pJpqUA2VLKVVs5cAR87fY/uRQL0
         3q1S2RPi/4L/jtUXOiTS0Z4rr3IE3I6CMhrkTHWy1vho9VyfUz9JqT4hidPKJr3QEF9R
         RYCWt1kTciWqTIp6ApUySJyxxs40+H/R2LygKv2cxNO+btjrLX/f1zm7naLoFDTPvKrp
         t2BA==
X-Forwarded-Encrypted: i=1; AJvYcCVnwbyYCWCeu3Glau8xQYkC9nS0s4ZbQVZ4V4/Oj5zcMaYxvPo6B08eqwN0A9bO6pjlfF9W8XU6ggz2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt4VRzHpeLkA5SyWMhOfY7WbfpiQHqscAj8iM+12OuFLdjYOpD
	/Lr5I6ow1kPKRdhKdt9piM0ERv6K80AYTq2gacre+cyAEk+YEYOiIz9C+DLAktUnQ7nfFTyNgc1
	j
X-Gm-Gg: ASbGncsjgXIrN5SQp9vuhwWiy9lVXazoBQ8pkxIbVJBZ36ViCdCVEuUPjW4RHv5wvkf
	x6XO2mXBIcQW2+rw17+jJjoRalDbB+4YJFcUdBZhF/f+au4aqUC3y9Dua0NuQxFC7PbCK6rc1Hv
	VGW8rNsE1HHPLqES1LyipkSuDTgFXdyANiqLrNm/1ZhSEC0+ubGfOfR8gz/petAgnzGkpHPWIE6
	R6pGIFzwdtyoh8L6gts06OJqsgynYw3gLwwzQz4DXbDJQ7IhOeaQkdGzEm/R2ygmSMfdYl4x6CX
	O7HKOExgCJ7iTyGoKC/sJwqZkngALzjE19z9FeH++wsRQUGI4pa/imA=
X-Google-Smtp-Source: AGHT+IHja8Xqz27pMBgC+ctDlcXS+7JRihmA5ZDREPfugVRdHY/NUOad9X+cPrSfCkKGb0fC7sHjrQ==
X-Received: by 2002:a05:651c:220e:b0:30b:b7c3:ea71 with SMTP id 38308e7fff4ca-30bd7a65e82mr6645381fa.15.1741160359096;
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:15 +0100
Subject: [PATCH v2 3/6] ASoC: samsung: lowland: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-3-20bc980c6445@linaro.org>
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


