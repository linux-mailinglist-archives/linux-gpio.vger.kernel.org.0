Return-Path: <linux-gpio+bounces-16905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7323A4B99D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46F7188DFFC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E594E1EFF9B;
	Mon,  3 Mar 2025 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppmC12ei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D41EFF95
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991312; cv=none; b=LbTy1EwbPjrdPlQLPnksYZmTty8QeXKN3mWtkL3HbInvrj9G3tlRGIK4APlw8aEgCtDRbvJ5V8kPLikqaBh1AKxnNH4l67MPYYQQexNbWJ57z/oR8CG6QsLRF6dwGTfdE92vad6U+iA20/ZDPNzZIkDb6BDBceDFJojFJaz7XvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991312; c=relaxed/simple;
	bh=F+mgVQLptCgK1s92YNI7Glhvg+mIjTHO8I7tL0oo6kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuLiqDZ2Xcl0NLLO+bcMKmFD43OhC2XPDgGBlcd4Ukd0KKPCdu5mx1Re/PhiZGkVzPuMlW+89UE+c8ljIobMrtGWg7CW/e7e4ZKmwwrpke1BMmQqVxxjndg0lheXLyc5lF4wAsR/dNqy9AlxwIz5lIJIhqOo+NlIzAhpmn8jkn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppmC12ei; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5494e7ad57fso3107814e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991309; x=1741596109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9claMY/sNtDyulRMPNNacKp+7WCrxALqvfdJWL7Clw=;
        b=ppmC12eidsazA+JxU+M6fWssp/rJ6asP0U7IJGQqGf+TDzOxRnSfYlGDwz42rXM9Sy
         6CZIxjTOcFCC2/2CvA7OmvSGWcD/h/j6Axj9vl8Bad2w2Y5Xv79q5Yh9T7Wo9rlsKSge
         dj2K0TIKphz2lpTKYLDlRqEyYS5+hFOSY9THOJw5StMnoWa4XiCVmWIT479yyloOc7mM
         XKOklvsQn/8lfqOMSbSeB260lbTOSQ/pIbyyRYkLpiYulrjFZIbiZ4wStkt4tFXXy46m
         YwWjyJsahXW64r6EoEjptrWq81pn0Xvaz9J4WLDFoCFZyk/lfbGXAThXlni5t/+k7/ZB
         JlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991309; x=1741596109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9claMY/sNtDyulRMPNNacKp+7WCrxALqvfdJWL7Clw=;
        b=cML6MS81XGdik+3+ii51Ax15WnKvJiNK4K32f31hFXqpLty+8375yM/HRhUkv8Ene4
         AF82IrEdTaYS8RPmGB9O3dOyebhIr2OumVQaI1eLZDYU/pBl+6MQC1+IfMeNZm6HMQn4
         IxfgUzuAGsD9yPqF1OgdNvacUDaciT9YnmOHOhehbCfCsyfwH38IlmOmR8IBD0bW2Jhp
         RUHCKu04jOewTb6KsMJRI5y62YX5JqcpscZ+lJFcLSN62sEM0KXOe4CV0nkCY3kQt78l
         9ifO6c7ScfUFBuAcqX/Y97/ZaMI5N7vP3B5JRG1NDsR/KdNxv5g3RRK4c6f++Z1MpAP+
         IHZg==
X-Forwarded-Encrypted: i=1; AJvYcCVM0RcXe+VejImtmAVPHnbE7zgcDDRIANvSGUCEqmMl5ajwrZ4qaffH3VVQG/822U/WEHNhUqeKBWww@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+UBmV5OW6b9idnvb+g2wOVL+ymBWc3AAm3kba8dfzCihxX7o
	+zRtMPm7vkBtPJglOgwOYSWcEpDtnOUVI6fvEQXd/c1nYsfm3WUJkprsQpC+O8M=
X-Gm-Gg: ASbGncuae6wdMriynmCyqaMdCWcFtY6HuCdTy486dlgGssPqpZBXBuq3EUdHwSqfTx2
	PHE93JSUbEn0z5rci0jLQFvn6r2FHj98AG9RWgZwmOr4wjEKqQVKX5tkUo9qUDrkqaT1DMvCEoc
	0MHj+fSgJ/z26JRpgXqPFlocHzBW26kBb6UbBLjDU7YSyxEmiNpw5D/oN2up8mbmJvXOSjn5ni5
	cekmSxSuETH/M2HpkvKPrxA0rxXGYI67k+W1QdyAmoraaA0cQ/qgCXUaU21sd4Wsp/oSsWi9sg+
	cbuKtsXH0M39pH1eYcBK9D2i/xfJLXBIWGPu7UyyyrHIv6hWWUH7PPU=
X-Google-Smtp-Source: AGHT+IFlG0cFLlp/U+9q8TUe6ZVM05em2vtvWiVqlg2cfGZLyTmw4b771FRJAKQSUOIVLv3jJxlrSA==
X-Received: by 2002:a05:651c:19a2:b0:30b:c6c2:43bc with SMTP id 38308e7fff4ca-30bc6c24656mr881241fa.19.1740991308967;
        Mon, 03 Mar 2025 00:41:48 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:45 +0100
Subject: [PATCH 5/6] ASoC: samsung: tobermory: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-5-56a2299dd928@linaro.org>
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


