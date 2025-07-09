Return-Path: <linux-gpio+bounces-23009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E25AFEC35
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 717954E36E0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C3B2E6137;
	Wed,  9 Jul 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CmINTAlJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B052E6104
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071953; cv=none; b=qFCCZijTB7BSCMDPPq1ObMg7LyAdP+5tQkEeTi7WwU7M9uRL1XLRxrDGXwOLUqpCf0WovH3HQq2ubBTZbodcyHWCCxFucXpi0pXtWBJb1zb7xNHp3Uh0ac00JEzJTWJQ0pdHl7CanYakI3BHo5MW2bfG7EtUx6b3ACyvYTIKjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071953; c=relaxed/simple;
	bh=YqmGAvzAOASfZH1PuFc7yGx93ma3f4ZWVblOGJYHIxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAIpYDJDe2xigttzzLWe+UQMsmQEmd7yUtWimnSFBowp6Sl5RXjCA4t8wfliG1wVayH6b5u2LTcC1Yg3oS8VWhIrFfJI7uznSAv2TY2uWlO381n3VurSJI06su+gu9dqXb4ppiYemZenzcf7CnqK2HTgzYhEJzzRCbwdxB8A99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CmINTAlJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453647147c6so53393675e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071949; x=1752676749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=;
        b=CmINTAlJbKlBofTZbF52xfoY8MDoJhyggPRyrcpzOhYmypncKYDjUjgQmh+F7AXb+1
         806a+HfLx4/d443qSVJ/gw4jPKpwDHvYbuS+3o+uOvF8q9YlLJBiZTOI2bHFUwwMM5y8
         4V5dc1ByVGOLrSqCqcxih8i0W7xZO9noSbJZ2odA4Q5GtdZjdy5La3IrGEsXg9C19q94
         lohCnggFU42JroAH+ktxkanDY8PRpnMdsTCUWd78m4kD0k9iukL0Xp0OFeOx5zFtaP2B
         gPjmAHl9NGc2nbpjM26NXMX4YORMA5O5hxq3my/eKdDtjdlytYcS3xQ1vz/0MhZGyNbh
         ojgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071949; x=1752676749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=;
        b=pec0Loq8M2Dlx32tcW7RAVLsp1CWX2LGJ8OC+NsUWKWddoAReG/myYV3nqb3cBbDJK
         SsWoUH1tWcqybJwTh0Mn9N8z8wEgNRsfnxZEZDFSaZG5efV/T9sHPxfS2TPwXs2dor+R
         CabMDOcUBoSlxCoNHybNJ0+tZuqHmPC4AhrGJOnyLV6GBFgC3qOy5NfrrB65nXB4Remd
         KNTH9lOt0CeXILpWteEl6FSYOuPQ8z1yA8UCKdTUmSIEa/1YxySkFBmt3slfs5F+QjTK
         K22dTuzjc4J6I520v9i+yNBOavZeV39pOnDmwOLQKQeGLXyTtQrH1ip5h4TcvwRM8kyF
         4lPA==
X-Gm-Message-State: AOJu0Yy85KoSY0fQX4pTzQD2TOPve6mB0OWntApoHwgkkirPMcmIYyoI
	PjnjfVSfVsil36gxiy6sqe4hXZoQaWVCi916NodylwIH/kF3yvrNOzCJ4iyTsLH+yaRR3UZr16F
	43ToIXts=
X-Gm-Gg: ASbGncu3cVKA0/SOwr6W8dcbY3dvEO2m0Yoa/+hEe4eeDJCyiMi+QvOlLlbn9nMGXAZ
	kAOc5utonrAbIWQPTJVzayoy6ji1xgvlEoeCSLQGmjDblZ1qMsh9txcYzlKp2twwCUuvAip53UD
	esJY+a7SttWuZ5EormeiqAo4H//JBOyO2G29ZzlyvW4ygC95EllL5LjES6PGGoh5C0lTdbmb1cX
	AGa4KTi+pLP8nW6uMK/jojK5RS/6OLpWpsb7agUBxxcG0t7F6Ap3TDBaVjf8KJCeWY4hGYsYWnu
	UispHkjWmXvOTUa+qmztO3vwq3PfxjiPUwtSIZioaimwEX6jTsU0se8=
X-Google-Smtp-Source: AGHT+IE6NMT8AU0DhDolK/XWo53eQPrLka/DfBqPNyEAMgaeJcAfEF6E9CWaG3DlW1jsKrQJbwuC7w==
X-Received: by 2002:a05:600c:8283:b0:453:58e8:a445 with SMTP id 5b1f17b1804b1-454d531e30dmr28684405e9.11.1752071949388;
        Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:00 +0200
Subject: [PATCH v2 04/12] pinctrl: airoha: use
 pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-4-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rKcKJn1Qx0kHHaw1VaKCekJy/+IGPmyQ4RvXCS39j7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GdTl5YXFsCeDYLha4gAdNaEX6nu2Jc2+H3
 AtDWXgcKYSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 chDJD/4mFFQSQ3h3fx9FaKVrlxP9+ULMx1/F21EFQ4FbWcejHkUr+A27uUbvjD0SeVotV2hsEwl
 y5eIU18s7rqRwmHfv+ity7vh7q+f2/CsAOliBpxT/VulCk9hCOOXYfUAiu0T+FY+OzmHcrFljRc
 V9Xw7/3NElwuW9HnubydN6UfIjfTzl0hUTI5jWFEcZJa8D8/Aj2Whjyqxe+xADQ/nNsPgqv37hb
 4R4rUW5SrsT0GtwFWe4K0Qx63TvQaCaE7Nnr5X9KJEgz5T043avHKO8Ba0y5/3xzyLlay8anlOt
 ojnv+CFLjFLurfsNNsQh8g8hFPSMjCwsSO7N56kFi1zcMmnVp49VrX45Q5zpKEjj7NFZim7+Ijy
 PvjJBPnFKnqtQKIwHzjuD/5DgMq8/z++68wSKuQtNYpvd7qP1xXbzgYV8DMTpnhN2EpJUrfI8TY
 VU57SI29Gcg7uzB4RKWIpSNVccHWLQy4/a2/2br5LXlDiCb7psNrtfgFl3HUNNSViDYCP5PbuTg
 wJtJTmj52RnDKV3r3BigVIEWtIiHmmS+muBgJTekYUkNNELPCArpk8SWwrUOC4k4sG5VnXHZZL8
 pmTX4FU7AJ2XMg7cFQCCcD+00kOFH1Ptgyz8b9Kv67RhLqku7NPnmvE4SmywsiVG9GcyJxaScau
 jL8/WRSxmtcknhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index ccd2b512e8365b3a5af0bb223329f39119bc7078..1737b88530c385644a360e8abe583416bd6d3fe9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2907,11 +2907,9 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 		const struct airoha_pinctrl_func *func;
 
 		func = &airoha_pinctrl_funcs[i];
-		err = pinmux_generic_add_function(pinctrl->ctrl,
-						  func->desc.func.name,
-						  func->desc.func.groups,
-						  func->desc.func.ngroups,
-						  (void *)func);
+		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
+						     &func->desc.func,
+						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 				func->desc.func.name);

-- 
2.48.1


