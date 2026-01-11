Return-Path: <linux-gpio+bounces-30388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26840D0E157
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 06:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AD7930123E4
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 05:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FF8221554;
	Sun, 11 Jan 2026 05:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7HYoGP4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6776712B93
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768109436; cv=none; b=qaDTR63+mM9/24po1vTn2Dg15ji1RCeUx5XnEj7RANwPtpYkNLuWe03Z0zdKtDaDqKufr1F1d294yMLMei8852zSQdB7LDP/xsNBsNSXKKAuHfjIH/YQ2wnDCL8W7LsKZQvTdXym5yemdvsLXBqVo6YF2iNFBAc9sRO9AMVmlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768109436; c=relaxed/simple;
	bh=E9Zv43RDnG7a7WWFS9AYZZifb6Z/1YRxPshyMBRHny4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPM58gHOWW1BYa9dEpRHVcAPdawLIXSfm6Kxlqq/Yuzoz7wi63J80nrQU5igUu7dpOGP68tVj3EPnWnu2NHZpuY+I7uihoPz9QXvMeQgPAmGzUZIJ9uSfUmaBIQNthdNzAs0M1WHb7S9w6MDSfgIk3/sHTA8Aw+01WNhDv/V9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7HYoGP4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso837815b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 21:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768109435; x=1768714235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=;
        b=D7HYoGP4JGb3qizujcukHAFri8S63u7Xv1vUdlW93jiXmA46ku72O4QMGDhKHUOvwG
         pUkszkegOOfzBsWY8PPVQUZ8NuC0lMtmkFGNaFPqI4jvLmyK0bevXStUmIHW6/Ugbl12
         k4/hQR/jkDHMXhc1Dr17aAiorRkQlz+C3nEvzwvgUfjgyuSLOSx/dxW1ZWAuVjjPI8RD
         ox1FOtwVDCRdgGBt9W4G+sIlSahEkTSvyWHis6zqbXi2MLy4ti84FvmfhL9lW1JoXdV+
         eLx/RPEIbgUR1Vjyj0TARZOg2i+WOOvFCS8wjVN4jTe87KTomNkfN9ixF5uO8GZpEtCA
         SnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768109435; x=1768714235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tU5Y032ehNBm7uCb7qJ1LdfjRktwX5kqC//2xMt1wE=;
        b=DC8cYzwyL1/QFj9QS+mcxQsPO4mo731fB3kWiy1hJ5tsUgkW8uzBskE2vxRDiOYJ4o
         ic9653XuPwi6h6uGR+bzy4xToucrg32O3rtJ+s7f02Hg/DjdHhF9fnw7noa9lM/Tw6bK
         stSSTdGy4v6NFKYAYuepTIoNv3IIZDbAkb8MAIuQXfeRhbwfLTYkow4dM+0euwx22POl
         AQwxdlNeOYXLeKNEzA1J1hMqWBWBc2X+OrZD29CloPL2mRU6fzBJTc/SMeqTQAosakFZ
         paa7oJUnoj+UH5KIxBYaMmQQNbJEglxjz5Iu9podvNtZFSW72Y74y03Z9BAljRKZf6My
         7/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwD72OUjg6+CNQzbxgU0P0zL3VKRZrBjkgmZPnSImmy3JoLpvghSEiuZP2XjDuPX3+FQrNvxmXQhKG@vger.kernel.org
X-Gm-Message-State: AOJu0YyuIglW0ZmRBU4iiNLOTw4D9Q/jESOYapqJYIqmuCD+1q2DNAEE
	HkbpP1OmzI3INpTjiLG1juu90SYO27XRRQhVSDA9FX16/C2mpsH6qytf
X-Gm-Gg: AY/fxX7logyQyADdvvdCy2S2FpC3uoPNVp3tNdr5xLIpgWfVAK3pliCy47V/AUPpQNY
	sUEke/v5h1rN0o7sJhMBMbkR0f8jHRjDHeHfWSkUiIQ+Q0i8CB+D29/HEQTdAIDkzbW74uAIH/f
	fhxvRG+qqW7PeC2f+tlpZ2O0l+vshZtFCTkbzM5DjuaaYEN3sJE0j8YNNzPqYiV/WDDilZV9+ZX
	1RRD9fPMfmQgx1Puzkv9SK0Ifq9r9/+i+GlAbuBGFJIfTiveDN/BhdvgPjEzv5jLG7ygqMvk43f
	R5GnvbRmV9+WNhgmE0MLJ7Yj0SFgcaiQ9WfEHeUFS11i2EYjdDKFVMTICXvPAQ7/WlmA6hR+l8z
	RnlUGkuRgoGOBFY4kshK/sCfVdESO4BDEH1Eqy8XzSD9e38NGZyyuB5Fdk0/xwEde5Rrvg7ZJCS
	vHH5Q2oQjmTJf4C38GKzlxTIvJn9LAOH2kLZIk/RuKCg==
X-Google-Smtp-Source: AGHT+IE9IHiQq4TCDxDRjV6As4aVF857MZMsEhTnrigePlGm/VD2v5ON2VzITLK2WPgiPhdmveI4qA==
X-Received: by 2002:a05:6a00:bc91:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-81cc98cb603mr11097939b3a.7.1768109434679;
        Sat, 10 Jan 2026 21:30:34 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f36f88f4bsm3503490b3a.36.2026.01.10.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:30:33 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: sean.wang@kernel.org,
	linusw@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] pinctrl: mediatek: remove unused drv_offset field
Date: Sun, 11 Jan 2026 14:30:24 +0900
Message-ID: <20260111053025.251983-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
since the driver's inception. Drive strength control for MediaTek
pinctrl drivers is actually configured via 'pin_drv_grp',
making this specific offset field redundant.

Remove the unused field from the common 'mtk_pinctrl_devdata' structure
and its corresponding initialization in the mt8365 driver to clean up
the code and avoid confusion.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index e3e0d66cfbbf..c20b9e2e02dd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -456,7 +456,6 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	.smt_offset = 0x0470,
 	.pullen_offset = 0x0860,
 	.pullsel_offset = 0x0900,
-	.drv_offset = 0x0710,
 	.type1_start = 145,
 	.type1_end = 145,
 	.port_shf = 4,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 11afa12a96cb..3b96f3dd338d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -263,7 +263,6 @@ struct mtk_pinctrl_devdata {
 	unsigned int smt_offset;
 	unsigned int pullen_offset;
 	unsigned int pullsel_offset;
-	unsigned int drv_offset;
 	unsigned int dout_offset;
 	unsigned int din_offset;
 	unsigned int pinmux_offset;
-- 
2.52.0


