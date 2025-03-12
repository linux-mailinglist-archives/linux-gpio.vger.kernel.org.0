Return-Path: <linux-gpio+bounces-17503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA3A5DE04
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 14:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DB516C425
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 13:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703C8245027;
	Wed, 12 Mar 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsA9tvEg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474A12FF69
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786322; cv=none; b=V/aUx7ozHRfPntwVlmNwlh8aNipKqviBvngmNdDTF7D5Apc92PESsNavKTyQFyR+Z3po/WcNQPm4LzuGVr3suFPWH4JpLT7Ou+DcIdigCUP70bFIAIYuzAlo+XwfwlUXictLbMeZpjBskc+pzngL5542dm+fabh0IDuZ55MMdDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786322; c=relaxed/simple;
	bh=0lBofCX6g27h8ZYIWlpX5XDIcclfdXbqFe5axN5qaO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9Jf2pY4srKzFP6MZDSL7eSrKpGMjcrQviK0EHgnq3raTO1b7AP7Hs6ac1Sx1s/Xibr3sSwt0RNMU7zr+vOipRmxNvPCXfvLK6njDD+0y66rY98D4wUZBo9lJdzOdY4bdP3xYPCXK+uK8gQAi9mAq+SkW0mbqvzPOu6WcRGmTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsA9tvEg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549b12ad16eso1219261e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 06:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786317; x=1742391117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCSC23yZBDagGDh6Umna2avJcVR5NE9Nb/Nl+uRoktk=;
        b=KsA9tvEg2fq02W1JLAZy/pNW9pCbZN0+pIlcpuFBOPLkf6mLJpOz5t5jRIn6JMLm0P
         LISJfh7+GbqfP9JmBOxkd8w+sLyzBviPAdbFYQYibsUI/DQ11Ynm0z9EhqV5r5cwqwSf
         TzmGR/btvwohCQhEp2k5D0knl4y75Gbnl64WDdGKKZ2tK6M/HqmWEWn0PE6gkysTgOG3
         sI5DL3C3dC6QksrSgnAefFzSBdYz+Ip6IscLP+09FwYfIVoY4YCJdAxPzEhlOYsiZNg5
         G8WA18W54lIGlfiH5yp3RAVy57jdz6pCxuLQumNjQzpXL7ofQLibPppvQvUJf/LCNM6w
         rBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786317; x=1742391117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCSC23yZBDagGDh6Umna2avJcVR5NE9Nb/Nl+uRoktk=;
        b=K/tBQfIRrO3KW0zfmZsgGR6tgXYj4iAvGFIGWqMzW8c+7T39CjY1WhKQloXPdbotI+
         vyIGbcRXJG6+8JAO+KNBmLLghRS14z/V/fQp1WrhhaEw3xldItuyyW6kwb9Gzed4rPpf
         sKKSyV6inpYaIacrql7HDw5zIWM/r3nTZAOYiHXKDZN+HrFs87w+0scQCVM7qUiTSWx9
         2zPKMl1sVn4XSM2fso7K+KZgCg+ep+hVBw1Lt5WeSM0EwQ/tIcUlqrBOayEfV52+yNYv
         wLtQNYv3gJJaF4oO4wbRg4Bm5Ydm2kPfkOFu2uECTlCOlyE148FJ4D40F5hct4XDLHBt
         Kn7w==
X-Forwarded-Encrypted: i=1; AJvYcCVCrOKsc+tWH6/AQ6MkA7ExTbJBGzjlg8KP7D1vZGWVcAmqGXh+iPP95PKShRC9KV8/ZMkEbZNs4CAd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/A2yVltj+87P9hQ7vKy3QmvGyvJ8krbDJnpw7CvYDZCfBqfZ
	SStIH5HiyYRpsnuXTr8k8FWq817heyFbDorAIP36vekU0lX9koR5M5z5Yv3S1Yg=
X-Gm-Gg: ASbGncuE5wo2iBnRXP4AZ1XqQK+jqqD/iXdXQVdokGHC5jiXDLfoa0tNWV7jPljAL5T
	eUpvP4Z0niI+ZrWNilLlgpv3jVjqOUByG78JwSl3bx5cge+wN71/PY+d5sGA/3eJacrMyvrtRaD
	kYUojZWsoAZsJAherR+DThBkSrbBEgT7j7Fj+Fnv0+1wVgfPf62WHc64+tiernrrjs41nXiSiCG
	oUjWNIfiubWSr3JdUlS5jG4MaaI+rAYgwHrOeLDGlDqfoPThe+3NCyJViU4hf7pBO0mY9uGjlr9
	qc7QinDJAARPVE+5gqsUtiimJDfwjwNVMhdiWce9JEv5FZ6rpyATMMs=
X-Google-Smtp-Source: AGHT+IGkeuRFRrDQUVjbYY2DOOImsP2qePYqpHH0bQIKsDXf3iZf2a5DWrTYE0cLmP5HctIa/Xg+1g==
X-Received: by 2002:a05:6512:ea5:b0:545:2f9b:7584 with SMTP id 2adb3069b0e04-549910b5e7emr7273720e87.36.1741786317099;
        Wed, 12 Mar 2025 06:31:57 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae460desm2121858e87.24.2025.03.12.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:31:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Mar 2025 14:31:50 +0100
Subject: [PATCH 1/3] ASoC: pcm1681: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pcm-codecs-v1-1-41ffc4f8fc5c@linaro.org>
References: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
In-Reply-To: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This driver includes the legacy GPIO header <linux/gpio.h>
but does not use any symbols from it so drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/pcm1681.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index fc152496d5dc53dae527a537146f18a44387222c..a1ec881d70841ad10cbb65ad7d59419ebb6f7722 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>

-- 
2.48.1


