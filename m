Return-Path: <linux-gpio+bounces-29026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B24A8C81115
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9D8E4E75EA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 14:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F8727B34F;
	Mon, 24 Nov 2025 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzW2eGbX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19861271456
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994921; cv=none; b=gzbluh8mSzfle2lq0jEEiuFTE48PqJICBaTREV2l6PmovlVQRNM/SAcjRH0Qj8ZMie1IV+9CxX7EzaP41u+3W/7PmvATabnmAeuDi1XFN+iVBZ0/3KjlJTOMMk6AC0xsfQMLx5TOCKQpEuFQnQ2Dm0VPgKr6d/TzWZOm17s1IPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994921; c=relaxed/simple;
	bh=FAs5hoIeYauhlce+TwEGGMlQzr0nfFfkWSFFTazeXzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Szh/X8WTGKodHIqxm0bAR54LLBLWyONuEmridMBnNAx8sTFajahSIZAdkEHpeMmO7kDEzqrHHQx0BM9NqOh5WgjhGts1Pi7AQmgXUGq+oA2DzNYoZhjfkjpLWrdcL2fzmTiWSs66dUP1FfifFavY5AKMpb9Vp59QWSPCufd6/M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzW2eGbX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a48fc491aso37666491fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 06:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763994918; x=1764599718; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9e8orAXiAFlWcxmub8EpzK+aYUs95qkopN7xCRgvlE=;
        b=PzW2eGbXEGm0pUSVZTukVXNhV+OZ1jcRV0ElxSoA3GJPznVbupLgnr4O3xupLKddto
         tw0Emmfjd3MeIMpTG6KpkavEakvA1XHGhL96loHtUCCEVtD1CG7+uuORsbr1ecxx4vee
         vX4T98qgxGLSuCEDpWM5T5ZVGcHDBzZKIoTpcEpNuQS/U0g8JHZXH0rLgWisvX0dsGDo
         cVOQb8BmRhFSyuNcWKEjqkgC120v3Wo8zxEAu992Gi6BLSitGbVId/GdmD3NNTURljll
         uolEXeqrTeDFL7uQHpQ37g2HxzHsCiJq6A3G/Q4Qek16OTBd26k4oi1oTNaPAt291UY9
         7Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994918; x=1764599718;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9e8orAXiAFlWcxmub8EpzK+aYUs95qkopN7xCRgvlE=;
        b=pqZGYJ/B/hHzQCQduBzrI4ZkEFtwzikLlZjcD3+AX8Z/06bbftNhV+NGCYL1wXZ/+a
         kJZ8HhcBvjKAlJSiF4E+UDKcYsGmUWYJ6AP0yWAlGCfOFGDpR1vVwXyGQqA4ALMe35IR
         TyXy3x+yKBdkLOvBwVTI/yry2suxLoTDNLzjPx1h8huqCYTci9dwXb7TsTQ25qBsKPde
         tBVlQAbM06uru+MsLE758sbh9/+5LKThOdvBTomK9OYyX6+ZMzaJ87tjmEjLNriD0vzL
         rHxGR/An1xbiyXnNO2W7HLUxW6J73kqdNyQ9KjR/UuBa/td0I9e085Zczjxtg8SQQF5p
         eM9Q==
X-Gm-Message-State: AOJu0YxbTvO60IjjaIQVpaOiEGPLW/0iHUESQRxmgXElKRwViHXkidV/
	aBDYJf/Nk9Ng9ACPKcnJlhyJ9SHhoit8RQEhGe/3/HKAZR8bvKkXG9GgGP3AKPyx+I8=
X-Gm-Gg: ASbGncudJ9zKMdUXQFCFCMc4pRgGN9XyNYE+s+0Dl/VK9uiHyBhBiCx/Y3b692blpra
	VUvG8/0pTCQpEM6XGWGHaKV9kE9SJ0IWmCPC15yHzVQ9OwEhOMFm8JKQenkEg8AmYIuf2SZX1ea
	7qesQpv/Cx7BxsPzCKk2A54pcXk/6ii3TTtSK7YJLSX8oSIAxvGgywX+xsFM52cc4s8exbUAbdd
	V1oicJSY+1UEvNJv7/LCBm0mEBCc3kkjkiFh53zQnyPjs48oyjJE+/DOp/LM2dF+1Jy4vajYlk1
	RTEh58v8xKYE3//6OUlsIwfJmEvKHXGIwcX8UhNlFUL6/ASacBc9vP/w8tk/kfVc+cQkYBIRdTY
	FCzzWEj8NBKW7MbqNtBkMODe9XCc1qC1aC5Af90KZEcyLSjw32qHsda9BZUtHNTeJFsfkv1Xsba
	edzg4GP9hKuJNPK/VGRWDe2w==
X-Google-Smtp-Source: AGHT+IEY8S0N4musyt8cjPznk+p5lg16fKM4FotNsTysgVZnMZweuZWQfdYdnaSXgFdtVWzE5B03zA==
X-Received: by 2002:a2e:be05:0:b0:378:eeab:bfa7 with SMTP id 38308e7fff4ca-37cd923d6b8mr32723101fa.25.1763994918083;
        Mon, 24 Nov 2025 06:35:18 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bafc06sm27379831fa.23.2025.11.24.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:35:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Nov 2025 15:35:16 +0100
Subject: [PATCH] pinctrl: cix: Fix obscure dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-cix-deps-v1-1-fe603dfe86ef@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMT3eTMCt2U1IJiXbM0SxOj5OQUQ7NUYyWg8oKi1LTMCrBR0bG1tQC
 /vbG8WgAAAA==
X-Change-ID: 20251124-cix-deps-6f942ccd16e3
To: Peter Chen <peter.chen@cixtech.com>, 
 Fugang Duan <fugang.duan@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 Gary Yang <gary.yang@cixtech.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3

When compile-testing for UM-Linux the build fails because
we don't have IOMEM.

Add an explicit dependency.

Fixes: 920500c5fe66 ("pinctrl: cix: Add pin-controller support for sky1")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/cix/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/cix/Kconfig b/drivers/pinctrl/cix/Kconfig
index 455120dd7318..1529b1af6388 100644
--- a/drivers/pinctrl/cix/Kconfig
+++ b/drivers/pinctrl/cix/Kconfig
@@ -9,6 +9,7 @@ config PINCTRL_SKY1_BASE
 config PINCTRL_SKY1
 	tristate "Cix Sky1 pinctrl driver"
 	depends on ARCH_CIX || COMPILE_TEST
+	depends on HAS_IOMEM
 	select PINCTRL_SKY1_BASE
 	help
 	  Say Y here to enable the sky1 pinctrl driver

---
base-commit: da53dcd54cc35efa7a8236846bb39d40deeee034
change-id: 20251124-cix-deps-6f942ccd16e3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


