Return-Path: <linux-gpio+bounces-10932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503E9925B3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94B1FB230F4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB7E19340D;
	Mon,  7 Oct 2024 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaUmcSHM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066118859E;
	Mon,  7 Oct 2024 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285001; cv=none; b=TH3vwopM6N73M5mkLcO74NvIQu1SirAm7b048AWLhY81DdTjUCtU5P5OAeaN5Ajf/t4iYoRgDXFp/cNT25ws/W0q/WADBlxuC2pp8jBlCtrxw3ohT2TmMGEieG+TJdOawx5I9LO0+4ZlDCPfsepWQuRn8EltafihGrDHePxztls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285001; c=relaxed/simple;
	bh=gOIYZwKs5vSSMo8w/33L122ipvlInRPHjZ+qfpm97rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9NOWYJnD7Mj31y+UCaoUUmtA29ri0eaTyDG+WM8W90/1YUNx9+EQ+C5Ty9PWtg+hN7Gn2xY8YAFCqX8quUnbQt2FndbiSBc9G2Rm5NT8q5DXLgrTIf3AQ92Zdcw+FsGPlFflj3aeiq+yPlxeIrIckY3AuPyUkEAsoFc8yWxfQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaUmcSHM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71dea49e808so2139636b3a.1;
        Mon, 07 Oct 2024 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284997; x=1728889797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sl+TVhC32f8EoGwSrPtlAtdvqsYDggID9PONiLSLJU=;
        b=UaUmcSHM6vUX9w1q0Hx/bld2EnKhPamqEC91oeUJT835FWwL8M7w4ksKSVcr7EvJ2i
         P0q+8PSdGTfgqPUeCzwiuRuL7ZmlYU/RyHIY2SWaR++VkkRvCJJ5VeRX1a8FzjATEwb5
         2x26hWCp/s4PC8zW6nrZh/16nEU9Qccl2DGJDYL8Sr01kplSS8Q7/KnSB9kb+er2/9NA
         xSUON0HUsos8eYAM8oco2rw+LAnU8OvbvdL6i19HCYvG4ZEgg0UhWlcnVAojkbD4j51I
         kDpblRXUxv1XBNzG/K22o51qGAJ2xN20Cc9/bXZrctxVVBHWFataEgKsvpM6DI0TSnqe
         Ib4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284997; x=1728889797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sl+TVhC32f8EoGwSrPtlAtdvqsYDggID9PONiLSLJU=;
        b=c24fBHloZbSGMWlidXhIrh8ePROJ1fDyrllYSoua8BpRrPBOLnvy5q0c2XaNyOR6WK
         QXuY2CPG2JLletDvnrYkwYwkhsuiOrVDqes3BaOTdyZjoC6KX9XzHxKN6NFrgiW3e70n
         GE7EEP9i39pgOY3I0GZQvtDhnsWLj8t4dEdKfTYVUkDP7bkGSvM9nHrr2RCZ7ObvbhQv
         XbDG5AvqJwhB3Pb74yWHWOakgrRxUZiLawa1r6jIxOqx+2k3FcrNAPRj/g6wNeCWMHVj
         QlQbMunv9tDBsPHpue+8LcR6nDTt/GGPqJHDWZT2tJAWYgebBpPllMy2O/GOdQ2EImOb
         IUMg==
X-Forwarded-Encrypted: i=1; AJvYcCVVG6jUwhyfeT4G680xC+QGmzEPAvilNfTHvONgp3Xuok0ry0pL61q1mUBUtsjyi/iEXhQnKXRcIdg/mGUNJyw=@vger.kernel.org, AJvYcCXWFZpdCJSF1cEAlRtYKzYivCyJygvgAcpIr9V/UBXRuYmJedZ9+7g9iaO6xX0ZO+7XtmvLDSryKqSWus+z@vger.kernel.org, AJvYcCXrKVqEnIqYeJzemAGDsNXfuHIWl0PjSBPDHGHylg/9LPvXb/zOtFO+WnM5j1iPy6DzCjYe8vso50ug@vger.kernel.org, AJvYcCXvSyk2WuP8UZ4dP2FzzzMggDXS1Tz7nWu0HaqyW7QOkcLkVkU00EMNN/5ASkMHM/07Ub0zkyhuTUgqmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6MegSgjGcLcku+nfnypcFPuoTe8WOd86qqh3ekKvqbnvuWsm
	zxlb+LxO0Xo0DdBtplndEcxI260j0pmMMvaXUnnjtCwXDXUsPX2B
X-Google-Smtp-Source: AGHT+IHEB+F8aJWnrf7tJdvve5iKKeFFLsk0wfcezmGTmPflpzDSthe9TaZHGkrglHA/LCrpyu34gA==
X-Received: by 2002:a05:6a20:438e:b0:1cf:3461:2970 with SMTP id adf61e73a8af0-1d6dfade021mr18357432637.41.1728284996867;
        Mon, 07 Oct 2024 00:09:56 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Mon,  7 Oct 2024 15:05:45 +0800
Message-ID: <20241007070758.9961-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple's A7-A11 SoC is now supported, so the original help text is no longer
accurate.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42..370a9d2b6919 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,8 +37,8 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	help
-	  This enables support for Apple's in-house ARM SoC family, starting
-	  with the Apple M1.
+	  This enables support for Apple's in-house ARM SoC family, such
+	  as the Apple M1.
 
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
-- 
2.46.2


