Return-Path: <linux-gpio+bounces-11889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0FC9AD7D2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0A81F25CDC
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294BD1FF5FD;
	Wed, 23 Oct 2024 22:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NADfjKs2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821B20400A;
	Wed, 23 Oct 2024 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723049; cv=none; b=XTgrZPu/MATZF4IYKoMToybdZSDkdeQq/L/ad8fz3sf6p9wOzNIPQqhRQTyZ/asfYlLyXOffAtrVpiGFfheU2jKan1Z6V2fDWIuAcBCUCdXNiyne0dhSjQ9mvCBnHsg1i1h9cAM0QorBASwAnvVM/DRs5SK4ibzxg/7Px5R5rbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723049; c=relaxed/simple;
	bh=PUZweYcqklViBmb8uZ/IJuwwHuTmJtgh5ndkO4UYJyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbS04LmKXC7dApEEvLEYj6O7vivBB5hZL005GFeuD797aJaFdkW0lahozCHdhF/YaPAsaLU0WkJy3btGJHlDrjOUC9NrJILln233YHThWv+2+7squKq3tD+B08oCsXxTkp1Ba5II9pJQPth8gWu838GYTH5ChkeNQmih5JM/WY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NADfjKs2; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c9552d02e6so342590a12.2;
        Wed, 23 Oct 2024 15:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723046; x=1730327846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy3J14myK2azS2Bw+TGbV6O6B2X8yTfWnYRpx0z+kQI=;
        b=NADfjKs2vHe/4vkiwKKBb8m9mwHtIsU+3jTMK0WZR5Mcq3EGTQ/WDYJ1mIjbhHL8M+
         TI1dwjlfb/GP2RmvN92JDWDUpQaVL2qqarrzYdcoP0IKYMneVdC0zwDZiqQbubcXwBgH
         7WvcmL0/NfX+cYIuhHO3ksI1tbXVP4G4otkWhm8GSrkC0kCbVhg2Fbj8Ai7WnKGV5cpI
         tNtN/vtciaFDWLkwNuF/TvxE3ruu3jBFrnnyDKmWoM3JFIcD5O4FWFP3swsf3biIdMuO
         fyKctrVQiHO7oKi0jJ09YTRdbxDHIA4P3hN8RLI7d0rZ7D51tcC0ADyVvNcXrSdWNdQJ
         JBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723046; x=1730327846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy3J14myK2azS2Bw+TGbV6O6B2X8yTfWnYRpx0z+kQI=;
        b=pCOzBIkftP8WDsW7AF24eGo0PcK7kqHcoSYLJoPtgLclgdTqiSWXNlJb8ov3gD0pYE
         GxDPL+VjemGfUxzew4PZaLb+JKYaGTxIaICe54p3+UL7d7hFeIbuQpBPfk7HpEo+XZDw
         H2jOxAEuPQapohZ8gGXCe7s1idHJOVLe6BpjB06zD7n64vWBahoHKnQKdLj05pAa+mLn
         gdYVIJ+ZOIwmC8sVZoJYnnD4A9AQ2GPxm6HJzDG4f5QB4foMiFR43h7f6+6ytKVUalsn
         4OcDTQg5uOQnPkNl68EzlUABRLv+Be5rVtJBdfb+0E8EdE2RhGNYUkVakvN0mALP7rMI
         JYTw==
X-Forwarded-Encrypted: i=1; AJvYcCUWFzo4JTmT9Sn4gLkdjTG8UlE4hjK4rFE5An2OGrSnRpWaj6pUDfsgHQXbIxXVu8sGW3mTUx+YwO05yfMGQIIt02c=@vger.kernel.org, AJvYcCUkXradsck1Z6Hv7e5fOmkxDMMV7F1x1ms1/BxGNQ6WtkeChwLVUX+XEslpSt3oEVHc6XOmjIhu0eJAKRvf@vger.kernel.org, AJvYcCXfcCw3YSbl/2EmQ1IlZ3lXWRgDyszQCQ9A1v5M96KULAVCHONYSjOuf4vMjNVAEQSlq0a4h+HZ9a9F@vger.kernel.org
X-Gm-Message-State: AOJu0YxEEKOxeqC6tFalOB1XBIDtH1Ad7dlt7oV3wpOYngJ3wL92Bn/0
	h/0IFuhlEQQrVKREkolKkQJLqb03j5U1uXtav8sFB2Vgo40nETWi
X-Google-Smtp-Source: AGHT+IGBz17FxrPN/rCHV/WwziIBuQiIF5Ruh+1l6Pbr+Er47DLsPPDKhznyybTHabaFp3fkM6oRVw==
X-Received: by 2002:a05:6402:2086:b0:5cb:674f:b0fc with SMTP id 4fb4d7f45d1cf-5cb8af74aa6mr3518069a12.23.1729723046065;
        Wed, 23 Oct 2024 15:37:26 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:25 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:40 +0300
Subject: [PATCH 09/12] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-9-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=882;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=PUZweYcqklViBmb8uZ/IJuwwHuTmJtgh5ndkO4UYJyg=;
 b=aA65zLsbn/4MPOMDsOlrN9HRxwQ62r9xMLoPkCXZlYFt12trsIitbpJJEy9YAUBoQHqpYyUog
 +MZ9ldEdyVkCIZ/kDvOl6e9ll/aKott3kKtcXOIRwAbErCVivTpWmAP
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


