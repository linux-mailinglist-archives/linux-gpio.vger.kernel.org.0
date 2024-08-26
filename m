Return-Path: <linux-gpio+bounces-9176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 223DD95F49A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 17:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02CD1F21995
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 15:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1718C18C910;
	Mon, 26 Aug 2024 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UV6W6Cs3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218AB13BACC
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684918; cv=none; b=CpIw34yU9dqW0Zi4DR/LYi5qIPntSAmZPlndHlqBpcZRcs9Y405zd/92++Miris7rBbjHOGsMwCRUkZdkLy+uDIniIsKY7HcPDkimeQKMxQu5O2ALY5qSfLTMMj43hFVpWC3IGS0l3kOTRNblXRj7aOY71tIu2Ay1lzKKnRTmuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684918; c=relaxed/simple;
	bh=QRRzk6+mhsJ4JwH3MhC2Atvzvd4zaOnggwRIlTPhMWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMaPfeMRTplRP191hFJ6lQe8hXD0dHPhp4Y5+dfZHIWRPUT8ad1mt5QkvRrJ8yC3SGTOERQi25T1UYJtO7FaN/QtH10a1cf87D0MM8WJHlfsUjgJb0DKAXurfb+Qb/LoRccRIfWm5X37esdiCnnFul6uvXNpva8AYrGP7R3X+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UV6W6Cs3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37196229356so99526f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724684915; x=1725289715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq3MT2U3Bii1oMqcjLAXejFqk1AKEOqI5iAx/L7MuJo=;
        b=UV6W6Cs3RTnBWGfs0kfkqz5A3QTfC7xybWJbKYydkO3OS++3S09oqnFNK9VvySg/KI
         1XCeJdscNvULKmy9ABot1yxSTS6dGERzfel97NLs1lRnChjd/Hs+if6dfza1OiymeBxK
         UcgeTHyxYTXp3BpGtJvumTgEoIVrlCFKVeKS/cNutHRVuQNPxrsMNlLjQTrO8aQlVUBZ
         R3jBxvCcMAoSVhzkent3ZUw6YoVjtf4X6RzMMg5AA8KG7g5DwRRflb3boNvIjRoG7M+V
         z+xDJwvL8+dKG+gkdvsTLEGB7xYrtSi1pXd5BJrZHCtuEMuK8WLp1iN6HTuxu9x+VsX/
         On0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724684915; x=1725289715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq3MT2U3Bii1oMqcjLAXejFqk1AKEOqI5iAx/L7MuJo=;
        b=BdIkP85BBBfcQc/dAIYHYotq7/LwDbogoIs5GIRz+H5a2CmQUAdsVws4FKp7I9nbi1
         ZtPr0ufOOLp798OXl1VEYs2QSQvJo6ucoXmWfTBtQPGBUqAahpzcrsq+CQwjRH6kKIxx
         mRSbJRRTe/z8RCHHj1Vc0prDaIHG06SK30TT1qyQ01jVHMse89lpGKpXj3xXc5aR5JCM
         U5g0v+TDmdRQ5pV2z8t5pPSfnBvi17qxZPa7lN9wcLKfV4lkgsrCEHNDBuV0f1ghjC+1
         LRSwk7M980ZyBOsfo1qQojnlSyQ9vzNADRrVI0dx5Z8fxbWQTXP49FHh3yFeUaIiGhuV
         MzGg==
X-Forwarded-Encrypted: i=1; AJvYcCXDh7ocwLWJEQzUh5hsJMgoiSdham3dWry5znQqSWj0E4l9B0L2ToXphTGHW1fLYtTMeq5itweF4IAQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lUELmwHfw6rrBD36XGyc4zqFkb7fdP4qpX1CBxsRb0+0tkLe
	kl146ts4HGhZI5e1zQ/oE1ifhfCzHV3eIwF9jmH3fc4ybPIF5zaWE4KOYk3PmomrU9EfvIuYQT7
	w
X-Google-Smtp-Source: AGHT+IGp1HEFpKBlPzvGLdHjlSkL9VLALIn2mdOC9GkDps/j6o00dYXrlTi5d5CGoc1xVMCg+wJO1A==
X-Received: by 2002:a5d:5889:0:b0:35f:1edb:4695 with SMTP id ffacd0b85a97d-373118b65acmr3696789f8f.6.1724684915215;
        Mon, 26 Aug 2024 08:08:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162322sm155040825e9.24.2024.08.26.08.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Heiko Stuebner <heiko@sntech.de>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: rockchip: fix OF node leak in probe()
Date: Mon, 26 Aug 2024 17:08:32 +0200
Message-ID: <20240826150832.65657-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver code is leaking OF node reference from of_get_parent() in
probe().

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 0bd339813110..365ab947983c 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -713,6 +713,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	pctldev = of_pinctrl_get(pctlnp);
+	of_node_put(pctlnp);
 	if (!pctldev)
 		return -EPROBE_DEFER;
 
-- 
2.43.0


