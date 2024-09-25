Return-Path: <linux-gpio+bounces-10438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F712985415
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20F5DB21D6E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F8715AD95;
	Wed, 25 Sep 2024 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhJJcwZo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA13158205;
	Wed, 25 Sep 2024 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248940; cv=none; b=pQ5ik7+7y/gNyxLou+3M4iYunZuqUp3K4im7/SMeY1RHUqgCfQe1dbCrH6REFSR4EuYc0Faaf0Wqd+F/5D0zmqYJmN+ZiTcAJco09u+lzBBoPoPUUw9jqK/4ofZb2WbwOSpA+JlX0uSix8YQq/SPVGaOeU6vajBPQxej/nCzSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248940; c=relaxed/simple;
	bh=kG58CaMEoU4DdU7bolt1bzjzFH1kroT8bMnpYUKuuXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO9f3LIsRhBKii5IRw1PHvEHv/3J3oxlEMH0J7eHSwbOzaw6qa2ZsZTBtHHNB55GhEn6tweihOzBB+YW4DNfWrAbRkA/mfWmA1KEBZE/Or+wDDz2JJSF5mFOb4Z+j9lSQhEhEK6s9kuqyu8NWWjeuFeVdd4owDOjGTvTMKBv3C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhJJcwZo; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a1a90bd015so4254255ab.1;
        Wed, 25 Sep 2024 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248938; x=1727853738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRLCqNetYnYWyPf9J2UWD3fLwnbXhpstWw/tgUw9xEY=;
        b=WhJJcwZoUG9wbqAk1R5HBc2R1U7TlF/SFi+cgAIRzUjeRQ3z/XHP+oX9xXTH9v0/PQ
         gTK0rWCWdQ5If+Is81M+T+UcKEoj9X988lJNk58yJcAjG/gedngzT5ssLoxDHHUdD/q2
         NO3K4V/ycAO24cllC+gJ+xbNl04ggBqWy4mpU/N+5YarUQ4yvsCkvy3qWBNsuITxsdM2
         1JoTbIBlgbWs7K/mUdCTe1ayrfMrCMhpq0Rs0aI/UyEFairxoT21twjEjRiQwFdAIkVr
         uFsMn7ol1eri5JJXXhh3p/dzRudl/54tWCOz1lF1Fg9v8bgp+b+JaxCiLA+8PIkB2WAM
         7U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248938; x=1727853738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRLCqNetYnYWyPf9J2UWD3fLwnbXhpstWw/tgUw9xEY=;
        b=VdBZE0LSLgD1t49NVpAuJWw/jJOPs87rfrnR1bZQRScRwwn3Ypm8ytencuIDlSKDCA
         LNS6iU9y3xAk3OcDP75FkgKLmikbT1+ZQnuHIAxppp9AYSveaoEhlWRoo7AjLyL4CTq4
         CBu6adQWe9gfhHaRZUpkk/mA/Fu3BZJQS4GhYXayU6D59y3Lc3kVkzavpl3tyQiz89c4
         IAI0enX6cFR/faaFYbvqervu2I9ubSq0GY9XJlBLCAxC9DGlJonUUWNdKAJWyDqQNzTF
         SKHye6LJrNaOUhIhQkGVceA1SPUF4EOCDYQnNOb/2Rq1O4DEfLMt79WGCLsCyT5eZa/r
         JWWg==
X-Forwarded-Encrypted: i=1; AJvYcCUdWv4+2Y8ZCB8j4W33O2/wqRR1PVktZemeh55TdxQJ5ePXh2o8eCgRmKKEsbL+nV57HqR6QIUf7FS0@vger.kernel.org, AJvYcCWDoAZOZVq/WT9VJNYbUoMcrZz6v0xKShsU0nJ+ySOaB9BrS6/xO723sqVJ+ErwIglMWx+AMQOdzrIr+Q==@vger.kernel.org, AJvYcCX2b/Jai9511c9CTclXWy8WDpGRAv8ODhafxqWemYxUm3EdZcqq696OEDAfUzA7MzB+ZL6ZDDYISeNMvnB/@vger.kernel.org, AJvYcCXXLJ3I4ibFZspcVGt2OMg7Ycu//kRasIcHd94CccFbuIF2B9WBNSOJ3g5NYhpzPdtdly11OCjndtDok28OlaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCh+KM5jcb++F7bVPndbd03ATNjjVRW/RTRCjlLyzVm9NpJCtR
	bufDBbsSTtdl1G/y6cpPTW8s4g9neBMh8YEP8dtaoH9QZztnoDYgye3iQA==
X-Google-Smtp-Source: AGHT+IETX8CWefdc0Nvnm8SysF1BFeNutZGW8jfx8k39aP+OdRQ7xmONHsOel/oUKonVTdqxPqZEGA==
X-Received: by 2002:a92:c546:0:b0:3a0:ab86:928f with SMTP id e9e14a558f8ab-3a26d7f49b7mr18789925ab.26.1727248938543;
        Wed, 25 Sep 2024 00:22:18 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:22:18 -0700 (PDT)
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
Subject: [PATCH v5 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Wed, 25 Sep 2024 15:18:18 +0800
Message-ID: <20240925071939.6107-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
2.46.0


