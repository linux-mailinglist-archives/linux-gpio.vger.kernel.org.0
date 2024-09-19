Return-Path: <linux-gpio+bounces-10298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B397CC72
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334221C22B1A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AAD1A08AB;
	Thu, 19 Sep 2024 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="debNizYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5071AAE1A;
	Thu, 19 Sep 2024 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762627; cv=none; b=IL9RO8iUHqVo+p+cpylzLZnhnDrsa11eaW1KcVK4PtKKeu2z//MmiXryg3P9DxO8b2psU6TWKvgrAWjooksykA1Dpp9RxXNQM24+30Vylw2Z0yC8QLSpZqXvXjkh6fVgTcXuA6pMibFAWygMcnwbe1ykTywGo+dhLKAsIPpIZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762627; c=relaxed/simple;
	bh=IlwfpKeYG1A6lmRpl2J8Js+0dUrkM33rNMIVVPeLcso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3eEQ2cTnYrppNxOrx6xvG6WEdmuz5s6X3btBDalO9mH7p9S3X/l1s5QoI4wqLqXCgPBbWEB1Kd2WmNbmCBFZ1ZrcoOhCGLBo4NPTRoIEYpqR8pa9e/L2R5olRtusdyJidf1lv1uU9clfEU3U54YKUEjK8Qa2dU/SHaSOg5/OQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=debNizYv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so752281a91.1;
        Thu, 19 Sep 2024 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762625; x=1727367425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=debNizYvgO7i/uJMevdLLyqmDBnsYmkeyv5bz9uw45LtMOZIzQJzfZFNoWqR5o7N1g
         PeMMUx8+S/2oyqcObDkWsoauyZEdR/GKvF/pPuryzreQ3B4iBRZ19Xd3fGLsj8QlhRwQ
         h639yXY6bEIG5pP+AXA9BME2M4xv6v9V1iGFywEvxiJvFPfWsQnMA7ohLL+NpOdilf0v
         w1XeCzcX0uJ4WBbF3capIDiWks2ir0JI4YYJN86ZK1jPFKJhqKVj9fjv5wuEZ2fTTlPh
         QR7VD/JFoOg7iEsmbqmaeLzzwNBUjr4dnA3c/eAO7gRaqMBc/O23vMnCDKOW9QlXvXRE
         wPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762625; x=1727367425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=kE3fLUM1+TZC9P0X/BZK7sGdctPR/ga5Jk8N4a1LeL4DnrC20h+oxHLZmsVknwsTJF
         zHw8MLy5b09/uq8fbJxzuOGRnVklX3aKBjpMEmjIvJV+uDiEngrb4ijYam+i2j5BWjTI
         BaJcE14ki9mi1HGcZjDaZSnXMCsDRGiE4j+MHoUZz+zgZgFOA7SJnh7wXFaVYUkeBQ4i
         YeJWRbUVFaxUQz7e1Be9bq4zMLxAwLyqnTRCS61wdkBTLYxOhg6wpH+MDjuXXmvCdyBy
         FPwrsU75CD502SPC5so0SeNtS75AbQck3597Obug0R6y0P8Mvb2R4++fsYbMjlVi/X7x
         HL7g==
X-Forwarded-Encrypted: i=1; AJvYcCUcztaeAW7BtdsS0mswMtZMb5dJOIaL6slnN1UPUK4slWIv8Il4Y+vxCjBrAuczN/aALJz9VF08absR6Bad@vger.kernel.org, AJvYcCVGOOLiwiJT8apetcyM0E7DQ3uM267VvIxT2cjP7Dpp5kkq4xiO6kgPRCwrBfuDKlybTE/H2wjjD9JO@vger.kernel.org, AJvYcCXBF6w5LB+dZlhZTu9Esp6UajezLi4gH2tq6Z0VbbypBINHZtpiwueGGKN/tkTUcQr+g8AoaMX952W91x/RLaE=@vger.kernel.org, AJvYcCXcySVEB7KGTmSVNDPEOdJwHmREDc+/8y1Yc67pCVZ36gFB6g4mCbhjdr/sBbyWXccwJYQOSal+pUS9MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfMVxvO6bsVYC2LvOX+kyuV7dUQEABVDxWXdbJOlxU4ICkVIM
	ahREtU6tl1wk0i/GmqrMelnwFazcSmEwYYZg/xvz899y9558oSboDxXQ10ZF
X-Google-Smtp-Source: AGHT+IGRF92p4WUX3sebubNh4Ll+ZX5ut0xjvjFQrZyc8PPhy8mSH/poADCmKduZBnqxmWGKnJBn+A==
X-Received: by 2002:a17:90a:68c5:b0:2c9:6cd2:1732 with SMTP id 98e67ed59e1d1-2db9fec89a1mr30095674a91.0.1726762625354;
        Thu, 19 Sep 2024 09:17:05 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:17:05 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Fri, 20 Sep 2024 00:06:09 +0800
Message-ID: <20240919161443.10340-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple's A7-A11 SoC is now supported, so the original help text is no longer
accurate.

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
2.46.0


