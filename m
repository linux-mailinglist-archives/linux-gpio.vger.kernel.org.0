Return-Path: <linux-gpio+bounces-13460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB909E296F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 18:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B54A0B2BAE2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 16:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E8E1F8AE6;
	Tue,  3 Dec 2024 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p2/hedTi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9F2BD1D
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244111; cv=none; b=UdSdC2UiVL9QjNBF+Hsx9FHGYACyJ6zgzDlNQNc9+ZfKaSFQjdmVNMMonSg+XGiVfVqbdKSYllLHLwpYh6KKQx5kC8i8waiMZajsNGhTZ5q4aamg2nC+9SDZJ0Q0lNt9QFt902daChqw+oxFfDc8AiUHU2Nukt4AKYb2BMG9/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244111; c=relaxed/simple;
	bh=mi8ZKLBkRBFPTJhG12a+AsfcEAOw95iD8h4NMdD5Mqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hqr71y5H9RiursoAYbapvcsWUBMRh2M3WtEGUmoADjuk829bvSqLKas8568hlvC8NPLPjPmqQPsR+zgpGYg+grfQNLhLEU9pqUvY3v6vOX6d86kd+R8ANU3B83nX7xyvPAa8ACxTgyNa9MN5Yid5dygZDkHvYW9SZPxIhC6gNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p2/hedTi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffb0bbe9c8so67086591fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733244108; x=1733848908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79YYTw4OLJH/nU0R7kGinztAGDupZuTEGxaRjZIufcY=;
        b=p2/hedTi8rDsVJJskes+AiopOS0/VYtQ/i/AOwxPp15OZ4tHLSCotBBY6j5K+PMxxa
         BPumUU1Ah+VfNIajsgwoUKR70qnLgkgbhMyNsiF3qgYB6JXCxzF4lFnDQ7M+5A7U2whI
         nWmBhlcYqkXAw4XRmhGoRloFENx+LsdPapjHoyfzcGSe7xXgDUaUW048vCd4OCeFEWm9
         WF08kkx/A8bDGsLjzXvLosM02sLLiA/wLYBP1/Xk5xmJUijt1ewfW9Shw3lSOsZXKzBJ
         7Dt5TWbJhMQASkWzY3RV/bFgLNefN8LZdmfjoDJ5qu17GD4Oi6J6Cxe6Il0O7IjQFZsJ
         9/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244108; x=1733848908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79YYTw4OLJH/nU0R7kGinztAGDupZuTEGxaRjZIufcY=;
        b=HULbbBdCKl1/CikJxb7k0NmNOuxyVvZJgMcGgrwHvmElmv4YnqBWYfEIoeCBwGnLSd
         2LkgycKPgWin8ugogvdWkf0QLOEgZ0NhX3yNQJTTKdMuh5Go3n4ytAoRERwPNjWV3sWA
         iKV4mE4Xhww+Ql1X2dYlInA7icwGtFisEEpqq8wfylckqZgOuVQS4mX5d5NHEBpvJQ2U
         2pNWr1+QFEVocUvfgEBg4D5+ocICvt5z71Xs1SwA7sQLj8AXRPsafEJbseVVZmGGbAjK
         jdqppoU20PaOikzf8qndKrxuhpCc4QJ/SgK2wKWzjS30AJSAnXojp2neLau/dae2gQmL
         C8Lg==
X-Gm-Message-State: AOJu0YzemqO/4E+BDIYIeZ76V0JZD8WSA40q6NgCJphJIqvQKgFq95Vd
	PkxwwBvaEYTxhYm09KGmIVTyxVAGxn+RdLdQo4aGCp1ZEI/YPgPCW32d2iCOmgA=
X-Gm-Gg: ASbGncv7KSsQHzT8rXlyycqYgBGStqxfMon+j7pzQXEUxSNKEsyrJA+CW6oQPdPwuUy
	18mcMdbe2Q9ASBsPPmdjKGokqw32072lhbULPQLCh8HtXmBKC7KIQnMhrpdtzwk/EWZqWQw7euV
	sYPPcjmMNVGAndJwASP+m1qlyAHdoMFciDg4hCRrRShQtU+Dvk8trAojeO3l1dHj1ThzV0vD4Xm
	JOSAst2zGr5rbv3sY0C32EZ+5dzLG7F4hEGuy09JKgZkY0QfUiatDVSO3dvXQ9eN2NexmZwupaF
	PLMeLoR6Su8+/g==
X-Google-Smtp-Source: AGHT+IESQkBNm3NGGmpXD3R9iAv+O3VG3UIwtvPMrzNoDzrMyo0u4WNNVUXmqMJ3+hGaEOr2LUgDGw==
X-Received: by 2002:a05:651c:2210:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-30009be4929mr19048471fa.14.1733244108166;
        Tue, 03 Dec 2024 08:41:48 -0800 (PST)
Received: from brgl-uxlite.home (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3000b262f32sm2482161fa.4.2024.12.03.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:41:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: omap: allow building the module with COMPILE_TEST=y
Date: Tue,  3 Dec 2024 17:41:42 +0100
Message-ID: <20241203164143.29852-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better build coverage, allow building the gpio-omap driver with
COMPILE_TEST Kconfig option enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56fee58e281e7..fb923ccd79028 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -530,7 +530,7 @@ config GPIO_OCTEON
 config GPIO_OMAP
 	tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
 	default y if ARCH_OMAP
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB_IRQCHIP
 	help
-- 
2.45.2


