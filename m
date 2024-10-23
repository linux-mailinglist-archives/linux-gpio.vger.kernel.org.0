Return-Path: <linux-gpio+bounces-11817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DA9ABD76
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 206F42853BA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3062157472;
	Wed, 23 Oct 2024 04:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBFhA5jF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4714A60F;
	Wed, 23 Oct 2024 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658786; cv=none; b=PEQswpLEwrm9YOwJi2tJlZsXTCcwKQdLoIM9un2BbIK/BQ6H8XA8cFRvGXuyKVWyHUFnAp0W5Pcd5L1kPMCWxIbZHw4or7L/RAzQ1Qw7Na3qE02hI0RXksKVEUgDg4ZIkK9WaMWKj+sckAaa62Y+mKDz9wq53T1z+sbW6v+cako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658786; c=relaxed/simple;
	bh=ct2YcdcBOxSZ1GCGb1LeP2FaYCRJZl05xZd1vf0mRTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC+zQ/gJWZEO5D3wiGcAkAsWiEM2EBoL1LMn/2Xp3s7jV+npfmH15XzPesmNKT9iCDseKBTRmwJD2OOlOSM8ahIPqjWrHNpMLQdbUYCpH42W3Cxf6q6GWQRGKdb3diHcSev5NVraeq/p+hma7o6pMu/EFSXOnPPbGU2CGLyf3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBFhA5jF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cb47387ceso57367375ad.1;
        Tue, 22 Oct 2024 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658784; x=1730263584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLcv3ofcVGTwufnm7xv48GbGD0iBXCtvjDAqDevq6/g=;
        b=VBFhA5jFgkJAb2vvF/7KyJpxqyYfYr+cNxphtFYxwh2JZpSuN+2RSUKY4YgQIsORlI
         umg4cV/8XJpfUCMorXg8zvibvtX0uEquP/gfduHlVfn/rhcli4GJ+P620D4Mn97JbOlc
         njUEgiD7G/r6ipwWwTAjebOH30AWWM+5pVoyo1q4HjF74oqFVn6grVEFd674YyGv1stJ
         sqbA8yN3mXWcFZ3rSPogMqMnL6V3P1OhsziBwNckYPXQ9sxm9oR4VodvWM+8YLx5laQv
         VgDBHBuasaqB+dlFkF1DUAX8l9ulReLv7GvSekZr+xEX3MoM2sIi/NlZejbWjcORK1K9
         31Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658784; x=1730263584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLcv3ofcVGTwufnm7xv48GbGD0iBXCtvjDAqDevq6/g=;
        b=agC3etwBtOhL6N7LHDmLQ92i812ZBebvIXsFeqD4Wa6MPKIwyDa4cnCREc9tCRocCN
         LDADhw0pT/DmpUt/0F0OUcYKMg0n+YB0OZR1xcr2Ne8p+CKsVzNS0wjY5dh+CXN0kCQQ
         7XR+P8I4tKIX9FBaDA4qUqzilQ7vGgBjDnZoBfWo+OQd0W5wtOSL5Q9lOpnoYrGlezQx
         eyvSW+SUCRWEFU70V+Sj2nWRf8D7yH6hdaXj6AJqixwZYKY7ObMXlxnVZLBiOIYCKkYY
         aDiuaeMLlJvowz0v+Bo/RufkDQcfX9K3pzKiTHX6D+FxR59S3+LsUjrqCir/2+aJ6YqK
         8ZUg==
X-Forwarded-Encrypted: i=1; AJvYcCUzlFbG9gMYYoMLMOf5yU1V7LJoZ7sLWOiNjHacstpKGVN7u3XuRE8MZzkt54cmxU2Ybprg/VZcoi9C1Q==@vger.kernel.org, AJvYcCWMBoZojGuQkQ6ZxQQKKP/ziPzsOvU94/cdT5kUj9F6VtKCvv2opsU55VCIMJTjWEm0Tb+Nk4oKUe8f@vger.kernel.org, AJvYcCWMOXjCGKf20fvOsMcbnIVc5L0uCDRsUUUI/zmsnxdOITyshAyyq9epxGFLJozkQB9ZE3R00fj3sJz8EtU6vko=@vger.kernel.org, AJvYcCXsgvgZDi0iiOz1hAV8kfTBOtSUtRN3vfqnYbhmYQoHoVZbrJKJ+krmrBZi2owPjM0LVueZskhFW42Pem1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdmXDZrEcaowj5WPAhNx++c9IEcuuW2QSY4sUVgY9SUkx8YNl
	x4nG8R0gmMad17Zy4lpMh7yqdoUf/rfZjl72IPu0IjlSakAPtRnc
X-Google-Smtp-Source: AGHT+IGJc9K6+XAyG7TzhnIXUf/vOUd+gEXzWdOW3q7WEzSqw/gm879hGuoGPWC3vS6E2GXg4chNXQ==
X-Received: by 2002:a17:902:ea06:b0:20b:cae5:dec4 with SMTP id d9443c01a7336-20fa9e4b216mr17874595ad.24.1729658784493;
        Tue, 22 Oct 2024 21:46:24 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:46:24 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Wed, 23 Oct 2024 12:40:55 +0800
Message-ID: <20241023044423.18294-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
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
2.47.0


