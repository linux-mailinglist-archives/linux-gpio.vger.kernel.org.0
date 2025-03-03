Return-Path: <linux-gpio+bounces-16908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8BEA4BAC3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 10:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E99170725
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D633B1F0E38;
	Mon,  3 Mar 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEVa/RxL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C84AD27;
	Mon,  3 Mar 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994143; cv=none; b=XZfNcY3dyR4pHbxRgX0WLHKLQOZ7mI4c8T8wxOR69wuE+yP2pRIyzyzK6JtmeCcmFOrVswJYv+yvFocjpRJN2ser2SVBWPvPhQLt7wCkYPVX1Iq32wxNu0eozbHYSMHDzunN5g6mjdF1Mqn/aFzwKFHtVVL2da+jh/UV63zaK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994143; c=relaxed/simple;
	bh=ui3R14myRdZwTTXue/QIbtIVVhsxfritmC1MAYwUXZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QSh7Ju8zWbKeBFWaHnrubJdRk1iv8pBERHFMDGGGy+lzGDDH2G5ICwmXsyvuiHFG74tXrZHXeqTvDkxuuoKUmqBcWBOhlcYPjaOquxz0ES4sHmNFdOOSfN+W9cGmSYKl2SMg2OH9x9WbHDCu5anJ7C5SXQj3IthNzdziR3YqpKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEVa/RxL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439946a49e1so26154345e9.0;
        Mon, 03 Mar 2025 01:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740994140; x=1741598940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjzg0yBHDp5xJiHuoo+8NOoe8pSEpfgs6lM2e2fa2dA=;
        b=cEVa/RxLioFyRDgXGpUPiPoARTJWRwGXwUC5Hs/m3TfuerTrWCEzc0ai8F4njvBXyY
         WGXukGD3qtM8h7MWIQnq9UeVf63wDP5P6M7YAc4z6FVEPwgRdZbgo5txGjXZ/4V4hv5N
         oCznZXPhbklYMZVYcF2w6+w7b8nxBCfysZQCsmzX6XItAwAr4vFwwh6k4SZQDsVbTMpG
         52rpiqxJvT+74nSOIf1bQsuTRL2Uk0+So/g1RHHuA9D4M/j2HxsdV0N6Jktn2I1aG9da
         POmCxYNTqXwEUJ8J3O2XgsizVa71BilDbBJuVcgvCkAk/FAVkOBa1U/KzK9fUDId67+g
         EMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994140; x=1741598940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjzg0yBHDp5xJiHuoo+8NOoe8pSEpfgs6lM2e2fa2dA=;
        b=AMA/JcI0gQOGGSwjrCcuZqaTgFvJhBB2MUTHNgeKV8pD/bgCPT6/E4FY4rsjlXbPm0
         wcpGj40aZ0bA2QKEv2stjb/1P+OS9DpVhib2uITK7lu9M9vZKx+mgkrLyjqtdlKOFmyR
         SPDOVTe3MxWdfZlMSQnQODVv+28ETFchohIB5cBqpkm1997IB4hwcwP2ldP6NWdBjWJD
         pNO1uHM8Xg3F7Sw/h0ISOx5su34XnwR1QGhrztJdmPVIl4HFbv6QiHdgkgGxju0o137w
         bkyyxZI30EczEetNrAxT7zA0HS4D4DAEZb4vYN4BDNCjqD70A+Ulu2x/87JqsvHw2oIw
         5LBA==
X-Forwarded-Encrypted: i=1; AJvYcCUx9Xde+sCI/dHgSczOOf4NM2OI3zvq2u4OO67JnUwZtUnHgD/mDGyQZ8jbnH615uUPVDEwh4gZ24iL@vger.kernel.org, AJvYcCV65LLrOtRotzCn8usiP9yw445UAwZ+T8XJBoN0HDgM0G0+Neiuxxa3ZeS7mEo0ywbZCh1mYicq2+GU5iMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3svnNPSxZXOL3YAvH8XfJ3RoDz6BxPYEFMLegIfgjNWZSJr+
	yB3pG8xtXSI7O6GTfuekhPvcrN4imginBp+p8orKDpmKamzD2Zra
X-Gm-Gg: ASbGnctVdCNtEebzBwP5lI/noVchQ7iO9kceJCQk5iqmRwiC9whqFCC0BicVZ7z10ET
	7ciwwJLrUDYC9ZT4Q2relWI2gcbOG8Ez6F2V+iNEbd2QI2mjzGiik15A4BSL+CycgHeU++q+hG1
	2cjrUv2YntVs2sV0XIXi4UV4FIVtPRsHDFE9paYkaV97XLDEq+r2SkUq2NjmZb/5uK5bb3OyZen
	jVZGJo96Spz/J+3cL9lRvafpwYhlZBia9AvX2y0TZlMQTqcQhNtr/N9x3QrFKingVY3LBslQFBu
	Ux0z5IRjckM2bEmEPQVAFK17YB5iNrJu7AuWPJSxrw4Cjw==
X-Google-Smtp-Source: AGHT+IFOvnLknIuCVa048FB5fDiu5+2tclMleviAhfjB9S+evUys8Sh8gS6S8nWHU/unGvITK9WJWA==
X-Received: by 2002:a05:600c:3505:b0:439:8cbf:3e26 with SMTP id 5b1f17b1804b1-43ba66d5659mr95783095e9.4.1740994140122;
        Mon, 03 Mar 2025 01:29:00 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bc1b5db02sm30694895e9.19.2025.03.03.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:28:59 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: pinconf-generic: Fix spelling mistake "paramers" -> "parameters"
Date: Mon,  3 Mar 2025 09:28:26 +0000
Message-ID: <20250303092826.318638-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pinctrl/pinconf-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index ecb7bc175283..d67838afb085 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -262,7 +262,7 @@ int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 	}
 
 	if (!pid || !pmux || !npins) {
-		dev_err(dev, "paramers error\n");
+		dev_err(dev, "parameters error\n");
 		return -EINVAL;
 	}
 
-- 
2.47.2


